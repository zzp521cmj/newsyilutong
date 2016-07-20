<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>客户车辆管理</title>
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
		/* $.extend($.fn.datagrid.defaults.view, {
		renderFooter : function(target, container, frozen) {
	
			}
		});
		 */
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'margin.do?method=getSourceShip',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			showFooter:true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		//	fitColumns : false,
  		/* 	remoteSort:true, */
  			/* onDblClickRow:function(rowIndex, rowData){
				  			var pid=rowData.custom_id;
							dialog = parent.jy.modalDialog({
									title : '订单查看',
									url : 'orderC.do?method=getShipOrderInfo&pid='+pid,
						 				 buttons :'#addbuttons'
						
									width : 1100,
									buttons : [{
										handler : function() {
											dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
										}
									}] 
								}); 		
  				}, */
  			columns : [[
  			{field : 'ck',checkbox : true, 		
  			},   
  				 {field : 'create_time',title : '协议制作时间',width : 140,align:'center',sortable:'true',
                    formatter: function(value,row,index){
                        if(value!=undefined){
                            value=value.substr(0,19);
                        }
                        return value;
                    }
                },        	
                {field : 'agreement_number',title : '协议编号',width : 100,align:'center'},
                {field : 'agreement_type',title : '协议类型',width : 80,align:'center',
                    formatter:function(val,row,index){
                        if(val==0){
                            return "班线";
                        }else if(val==1){
                            return "配送";
                        }else if(val==2){
                            return "转运";
                        }
                    }

                },
                  {field : 'agreement_types',title : '协议类型',width : 90,align:'center',hidden:'true'},     
                 {field : 'car_number1',title : '车牌号',width : 90,align:'center'},                
                {field : 'transport_pays',title : '应收运费',width : 100,align:'center'},
                 {field : 'all_money',title : '应付运费',width : 100,align:'center'},
                 {field : 'money_cha',title : '毛利',width : 100,align:'center'},          
  			   {field : 'company_name',title : '中转公司',width : 90,align:'center',},    
                    /* formatter:function(val,row,index){
                        var de='';
                        $.ajax({
                            type: "POST",
                            async : false,
                            url:'company.do?method=getUpdateCompany',
                            data:{id : val},
                            success:function(data){
                                de=data.company_name;
                                //$("#ndpid").val(data.department_id);
                                //$("#departments").append("<li>"+data+"</li>");
                            }
                        });
                        return de;
                    } */

            
                {field : 'car_name',title : '司机',width : 80,align:'center'},
                {field : 'phone_number',title : '联系方式',width : 80,align:'center'},     
                 {field : 'send_date',title : '配送时间',width : 140,align:'center',sortable:'true',
                    formatter: function(value,row,index){
                        if(value!=undefined){
                            value=value.substr(0,19);
                        }
                        return value;
                    }
                },          
                {field : 'number',title : '运单数',width : 70,align:'center'},
                {field : 'remarks',title : '备注',width : 110,align:'center'},
                				
  			]],
  		
  			onLoadSuccess:function(data){ 				
  			//添加合计行
				$('#dg').datagrid('appendRow', {
					create_time : '本页合计',
					all_money : compute("all_money"),
					transport_pays : compute("transport_pays"),		
					money_cha : compute("money_cha"),				
				});
				//合并单元格
				var merges2 = [ {
					field : 'create_time',
					index : data.rows.length - 1,
					colspan : 3,
					rowspan : 1
				}]
				for ( var i = 0; i < merges2.length; i++)
					$('#dg').datagrid('mergeCells', {
						index : merges2[i].index,
						field : merges2[i].field,
						colspan : merges2[i].colspan,
						rowspan : merges2[i].rowspan
					});	
					var datas=$('#dg').datagrid('getRows');
					 $("input[type='checkbox']").eq(datas.length).attr("type","hidden");
					
           },
           rowStyler : function(index, row) {           	
				//合计行颜色
				if (row.create_time == '本页合计') {
					return 'background-color:yellow;font-weight:bold;color:blue';
				}
				if (row.create_time != '本页合计') {
					return 'color:blue;';
				}			
			},
  			pagination:true,//分页
		    pageSize:15,
		    pageList:[15,30,50,80],
  			toolbar : '#tb'
  		});
  		
  			document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};
  		//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");			
			$("#startDate1").val("");
			$("#endDate2").val("");
			$("#ddId").val("");

		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
	//累加
	function compute(colName) {
		var rows = $('#dg').datagrid('getRows');
		var total = 0;
		for ( var i = 0; i < rows.length; i++) {

			if (isNaN(parseFloat(rows[i][colName]))) {
				total += 0;
			} else {
				total += parseFloat(rows[i][colName]);
			}
		}
		return total;
	}
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
  	//回车查询事件
  		
		$("#car_number").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "driver.do?method=getCarIdLength",
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
		})
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		var startDate1=document.getElementById("startDate1").value;
  		var endDate2=document.getElementById("endDate2").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		start_date1 :startDate1,
	 	 		end_date2 :endDate2,
	 	 		name:$.trim($("#ddId").val()),//协议编号
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				driver_name:$.trim($("#driver_name").val()),//司机姓名
	 	 		car_number:$.trim($("#car_number").val()),
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				 //name:$.trim($("#ddId").select2("val"))
	 	});	  
	 	
  	}  	
  	
  	//导出
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var array = $('#dg').datagrid('getSelections');
		var charray=[];
			if(array != ""){
	  		for(var i=0;i<array.length;i++){
	  			charray.push(array[i].agreement_id);			
	  			}
  			}
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="agreement_type"&&col.field!="send_fee1"&&col.field!="adorn_fee1"&&col.field!="send_other"&&col.field!="trunk_fee1_c"&&col.field!="take_fee1_c"&&col.field!="born_fee1"&&col.field!="adorn_fee1_c"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 
		}
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		  $("#charray").val(charray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#startDate1").val("");
		$("#endDate2").val("");
		$("#ddId").val("");
		$("#car_number").select2("val","");
		$("#driver_name").val("");
	}

  </script>
  <body class="easyui-layout">
  	<form action="margin.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>协议日期:</lable>
			<input  id="startDate"  class="Wdate"  name="start_date"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  name="end_date"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    		<lable class="divlabel">&nbsp;车牌号:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="car_number"  name="car_number" >	    	
	    	 <lable class="divlabel">司机姓名:</lable>
			<input type="text" class="search-text" id="driver_name"  name="driver_name" >
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'"  >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	 <lable >协议编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  name="name"  style="width:150px"  >
	    	 <lable>配送时间:</lable>
			<input  id="startDate1"   name="start_date1"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate2"  name="end_date2"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">
			<lable >发站:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="send_adress" >
	    	<lable >电话:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" >-->
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="协议费用信息" ></table>
    	</div>
    	<div id="tb">
    		<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		</div>	
		<input type="hidden" name="method" value="outSourceShip">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="charray" name="charray">
		</form>		
  </body>
</html>