<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String change_fee1 = request.getParameter("change_fee1");
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>中转费核销</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/function.js"></script><!--命名按钮方法  -->
	
  
  </head>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'payable.do?method=getLoading',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  			rowStyler : function(index, row) {
				if (row.write_off4 !=3) {
					return 'color:blue;';
				}
			},
  					columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'custom_name',title : '客户名称',width :80,align:'center'},
  				{field : 'car_time',title : '客户发车车次',width : 80,align:'center'},
  				{field : 'adorn_fee',title : '应付装卸费',width : 80,align:'center'},
  				{field : 'adorn_fee1',title : '实付装卸费',width : 80,align:'center',editor:{
	                	type:'numberbox',
	                	options:{
	                		precision:2,
	                    	validType:'adorn_fee1'
	                	}
	           		},	formatter:function(val,row,index){
	           		
	           		   if(val==null){
	           		 		return row.adorn_fee;
	           		   }else{
	           		   return row.adorn_fee1;
	           		   }
  					}
  				},
  				{field : 'loading_remarks',title : '应付装卸费备注',width : 130,align:'center',editor:{
	                	type:'text',
	          			     options:{
	                			
	                    	validType:'loading_remarks'
	                	}}},
	                	{field : 'send_station',title : '发站',width : 80,align:'center'},
  				{field : 'car_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'car_type',title : '车型',width : 80,align:'center'},
  				{field : 'driver_name',title : '司机姓名',width : 80,align:'center'},
  				{field : 'send_time',title : '发车日期',width : 80,align:'center'},
  				{field : 'receipt_time',title : '车到日期',width : 80,align:'center'},
  			{field : 'write_off4',title : '核销方式',width : 80,align:'center',
  					formatter:function(val,row,index){
  						if(val==0 ){
  							return "打卡";
  						}else if(val==1){
  						return "现金";
  						}else if(val==3){
  						return "未核销";
  						}
  					}	 },
  				{field : 'zhuangxie_date',title : '核销日期',width : 80,align:'center'},
  					{field : 'people_zhuang',title : '核销人',width : 80,align:'center'},
  			]],onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },  
		    onAfterEdit:function(index,row){//编辑关闭后
		    
		    	$('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'payable.do?method=updateShippingOrderf',
           				data :  row
           				
           				,
            			success: function (data) {
                		// Play with returned data in JSON format
            },
            error: function (msg) {
              
            }
        });
  				/* $('#dg').datagrid("updateRow", {index:index,row:{gain_total:price}}); */
		        row.editing = false;  
		    },
		     //双击事件
            onDblClickRow: function (rowIndex,rowData) {
                var data=$('#dg').datagrid('getData');
           			//最后一行取消编辑
	            	if(rowIndex<data.rows.length-1){
	                //双击开启编辑行
	    				if(editval!=rowIndex){
	    					$('#dg').datagrid("endEdit", editval);
	    					$('#dg').datagrid("beginEdit", rowIndex);
		                	editval=rowIndex;
	    				}else{
	    					editval=undefined;
	    					$('#dg').datagrid("endEdit", rowIndex);
	    				}
    				}
                	
            },rowStyler:function(index,row){
            	//合计行颜色
				 if (row.custom_name=='合计'){
					return 'background-color:yellow;font-weight:bold;color:blue';
				}
				if (row.custom_name!='合计'&&row.write_off4 !=3) {
					return 'color:blue;';
				}
			},onLoadSuccess:function(data){
				//添加合计行
	            $('#dg').datagrid('appendRow', {
	                custom_name: '合计',
 	                adorn_fee: compute("adorn_fee"),
	                adorn_fee1: compute("adorn_fee1")
 	            });
 	            //合并单元格
            	 var merges2 = [{
                    field:'custom_name',
                    index: data.rows.length-1,
                    colspan: 8,
                    rowspan: 1
                }/* ,{
                	field:'pay_type',
                    index: data.rows.length-1,
                    colspan: 5,
                    rowspan: 1
                } */]
                for (var i = 0; i < merges2.length; i++)
                        $('#dg').datagrid('mergeCells', {
                            index: merges2[i].index,
                            field: merges2[i].field,
                            colspan: merges2[i].colspan,
                            rowspan: merges2[i].rowspan
                 }); 
            },
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
  		
  		
  		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#phone").val("");
			$("#address").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
  		$('#cc3').combotree({    
    		url: "depn.do?method=getTree&&id=",    
    		width: 150,
    		onBeforeLoad: function(node, param) {
    		
                if (node == null) {
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
		});
		/*
  		select框
  	*/
  	
		$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "income.do?method=IncemCarid",
				   data: {phones:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});;
					});
			        query.callback(data);
				   }
				});
		    }
		});	 
  	});
  		function modify(){
		  	var array=$("#dg").datagrid('getSelections');
  			var id = [];
  			var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].custom_id); //注意修改你的id列 
			if (array[i].write_off4 == 3) {
				a = true;
			}
		}
  			
	  			
		  			  
		  	if (a == true) {
		  		if (id != "") {		
	  			dialog = parent.jy.modalDialog({
				title : '费用核销',
				url : 'payable.do?method=getEditCompanyPagef&pid=' + id,
				width : 500,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="核销"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}
  		}else{
  			$.messager.alert("中转费核销"," 请选择正确的信息","info");
  		}	
  	}
  //累加
  		function compute(colName) {
            var rows = $('#dg').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
            	if(isNaN(parseFloat(rows[i][colName]))){
            		total +=0;
            	}else{
                	total += parseFloat(rows[i][colName]);
                }
            }
            return total;
        }
  		//查询
  	function searchCar_owner(){
  		$("#dg").datagrid('load',{
  				
	 	 		custom_name:$.trim($("#custom_name").val()),
	 	 		send_station:$.trim($("#send_station").val()),
	 	 		zhuangxie_date:$.trim($("#zhuangxie_date").val()),
	 	 		write_off4:$.trim($("#write_off4").val()),
	 	 		send_time:$.trim($("#send_time").val()),
	 	 		receipt_time:$.trim($("#receipt_time").val()),
	 	 		car_number:$.trim($("#car_number").val()),
	 	 		driver_name:$.trim($("#driver_name").val()),
	 	 		aa:$.trim($("#aa").val()),
	 	 		bb:$.trim($("#bb").val()),
	 	 		cc:$.trim($("#cc").val()),
	 	 		
	 	});	  
	 	
  	}
document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};	
  //重置
	function reset() {
		$("#custom_name").val("");
		$("#send_station").val("");
		$("#zhuangxie_date").val("");
		$("#write_off4").val("");
		$("#send_time").val("");
		$("#receipt_time").val("");
		$("#car_number").val("");
		$("#driver_name").val("");
		$("#aa").val("");
		$("#bb").val("");
		$("#cc").val("");
		
	}
 
 	function del() {
		var array = $("#dg").datagrid('getSelections');
			var id = [];
			var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].custom_id); //注意修改你的id列 
			if (array[i].write_off4 != 3) {
				a = true;
			}
		}
	
			if (a== true) {
							$.messager.confirm('确认', '您确定要取消核销吗？', function(r) {
					if (r) {
						$.ajax({
							url : 'payable.do?method=editZhuangxie&pid=' + id,
							type : "POST",
							data : {
								id:id.join(",")
							},
							success : function(data) {
								if (data.flag == false) {
									parent.$.messager.alert("其他费核销", "取消核销成功",
											'info', function(r) {
												$('#dg').datagrid('reload');
											});
								}
							}
						});
					}
				});
			} else {
				$.messager.alert('取消核销', ' 请选择正确的信息', 'info');
			}

		} 

  

  </script>
  <body class="easyui-layout">
  <form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable class="divlabel">客户名称:</lable>
	    	 <input type="text" class="search-text" id="custom_name"  style="width:50px"  >
	    	 <lable class="divlabel">发站:</lable>
	    	 <input type="text" class="search-text" id="send_station"  style="width:50px"  >
	      <lable class="divlabel">核销日期:</lable>
	    <input  id="zhuangxie_date"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    -
	    <input  id="aa"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 	  <lable class="divlabel">发车日期:</lable>
	    <input  id="send_time"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    -
	    <input  id="bb"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 	  <lable class="divlabel">到车日期:</lable>
	    <input  id="receipt_time"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    -
	    <input  id="cc"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 	
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	     <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
				<td>核销:</td>
					<td ><select id='write_off4'  name="write_off4"  style="width:50px;height:22px">
							<option> </option>
							<option  value="0">打卡</option>
							<option  value="1">现金</option>
							<option  value="3">未核销</option>
					</select></td> 
					<lable class="divlabel">车牌号:</lable>
	    	 <input type="text" class="search-text" id="car_number"  style="width:100px"  >
	    	 <lable class="divlabel">司机姓名:</lable>
	    	 <input type="text" class="search-text" id="driver_name"  style="width:100px"  >
			</div>
    	</div>
    	
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
   	<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">核销</a>
		<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消核销</a>
		</div>	
		</form>	
  </body>
</html>