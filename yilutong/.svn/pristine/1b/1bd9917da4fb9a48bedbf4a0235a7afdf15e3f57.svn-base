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
    <title>应收代收手续费客户查询</title>
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
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
	
  
  </head>
   <% 	String dd = (String) request.getAttribute("sl.getWrite_id()"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'Handling.do?method=getDestinationFeeCuctome',
  			rownumbers : true,
		//singleSelect: true,
			fit:true,
			selectOnCheck : true,
			checkOnSelect : true,
  			sortName: 'chayi',
			remoteSort:true,
  /* 			rowStyler : function(index, row) {
				if (row.write_off3!=3) {
				
					return 'color:blue;';
				}
			}, */
			onDblClickRow:function(rowIndex, rowData){
				var pid=rowData.customer_id;
				dialog = parent.jy.modalDialog({
					title : '运单查看',
				      url : 'Handling.do?method=getShippingCollect&pid='+pid,
						/* 				 buttons :'#addbuttons'
						*/
					fit : true,
					buttons : [{
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
						}
					}] 
				}); 		
  			},
  				onSortColumn: function(sort,order){
									$('#dg').datagrid('load', {
										customer_name:$.trim($("#customer_name").val()),
	 	 								customer_num:$.trim($("#customer_num").val()),
	 	 								js_time:$.trim($("#js_time").val()),
	 	 								js_times:$.trim($("#js_times").val()),	 	 
										sort:sort,
										order:order,
									});
									},		
  			columns : [[
  				{field : 'ck',checkbox : true},
/*   				{field : 'shipping_orde',title : '详细信息',width : 80,align:'center',sortable:'true',
  				formatter:function(val,row,index){
  				return '<a href="javascript:void(0)" onclick="CheckManager(\'' + row.customer_id+ '\')">查看详细信息</a>  ';
  				}
  				}, */
  				{field : 'customer_name',title : '客户名称',width :80,align:'center'},
  				
  				{field : 'customer_num',title : '客户编号',width :80,align:'center'},
  				{field : 'customer_tel',title : '客户联系电话',width :80,align:'center'},
  				{field : 'customer_address',title : '客户地址',width :80,align:'center'},
  				//{field : 'car_time',title : '客户发车车次',width : 80,align:'center'},
  				
  				{field : 'all_nuns',title : '总票数',width : 80,align:'center'},
  				{field : 'zongpiaoshu',title : '未结算票数',width : 80,align:'center'},//未结算的票数总和
  			    {field : 'closes',title : '已结算票数',width : 80,align:'center'},
  			  //  {field : 'close_fee',title : '未结算票数',width : 80,align:'center'},
  			    //{field : 'pay_destination_fee',title : '应付到付款',width : 80,align:'center'},
                {field : 'handling_charge',title : '应收手续费',width : 80,align:'center'},
  				{field : 'handling_shihou',title : '实收手续费',width : 80,align:'center'},
  				{field : 'chayi',title : '差异',width : 80,align:'center',sortable:true,},
  			    {field : 'transport_pay',title : '费用总额',width : 80,align:'center'},
  			   // {field : 'back_fee',title : '返款',width : 80,align:'center'},
  			    
  			/* {field : 'close_recheck_state',title : '结算状态',width : 80,align:'center',
  			formatter:function(val,row,index){
  				if(val==0 ){
  						return "未审核";
  						}else if(val==1){
  						return "审核完毕";
  						}else if(val==2){
  						return "审核未通过";
  						}
  					}	 
  			}, */
  			/* {field : 'close_recheck_state',title : '结算状态',width : 80,align:'center',
  			formatter:function(val,row,index){
  				if(val==0 ){
  						return "未审核";
  						}else if(val==1){
  						return "审核完毕";
  						}else if(val==2){
  						return "审核未通过";
  						}
  					}	 
  			}, */
/*   			
  			{field : 'close_recheck_time',title : '审核日期',width : 80,align:'center'},
  			{field : 'close_recheck_name',title : '审核人',width : 80,align:'center'}, */
  			]],onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },  
		    onAfterEdit:function(index,row){//编辑关闭后
		    	$('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'collect.do?method=updateShippingOrder',
           				data :  row,
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
/*             onDblClickRow: function (rowIndex,rowData) {
                //双击开启编辑行
    				if(editval!=rowIndex){
    					$('#dg').datagrid("endEdit", editval);
    					$('#dg').datagrid("beginEdit", rowIndex);
	                	editval=rowIndex;
    				}else{
    					editval=undefined;
    					$('#dg').datagrid("endEdit", rowIndex);
    				}
                	
            }, */
  			 onLoadSuccess:function(){
  			/*  $('#dg').datagrid('appendRow', {
                Saler: '<span class="subtotal">合计</span>',
                TotalOrderCount: '<span class="subtotal">' + compute("TotalOrderCount") + '</span>',
                TotalOrderMoney: '<span class="subtotal">' + compute("TotalOrderMoney") + '</span>',
                TotalOrderScore: '<span class="subtotal">' + compute("TotalOrderScore") + '</span>',
                TotalTrailCount: '<span class="subtotal">' + compute("TotalTrailCount") + '</span>',
                Rate: '<span class="subtotal">' + ((compute("TotalOrderScore") / compute("TotalTrailCount")) * 100).toFixed(2) + '</span>'
            });
            	 compute(); */
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
  	
  	});
  	   //审核
  	
  		function modify(){
		  var array=$("#dg").datagrid('getSelections');
  			var id = [];
  			var shpid = [];
  			var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].customer_id); //注意修改你的id列 
			shpid.push(array[i].customer_id);
			var shp= shpid.join(",");
			if (array[i].close_recheck_state != 5) {
				a = true;
			}
		}	
		if (a == true) {
			if (id != "") {
	  			dialog = parent.jy.modalDialog({
				title : '费用结算',
				url : 'collect.do?method=redirectPage&id=' + id.join(","),
				data : {
				
				},
				width : 600,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="结算"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEditCheck(dialog, grid, parent.$);
					}
				},   {
					text : '<input type="button" class="btncss" value="驳回" style="margin-left: 10px;"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				},
				],
				
			});
  		}
  		}else{
  			$.messager.alert("费用结算"," 请选择正确的信息","info");
  		}	
  	}
  function compute(colName) {
            var rows = $('#dg').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return total;
        }
  		//查询
  	function searchCar_owner(){
  		$("#dg").datagrid('load',{
  				
	 	 		customer_name:$.trim($("#customer_name").val()),
	 	 		customer_num:$.trim($("#customer_num").val()),
	 	 		js_time:$.trim($("#js_time").val()),
	 	 		js_times:$.trim($("#js_times").val()),	 	 		
	 	});	  
	 	
  	}

  //重置
	function reset() {
		$("#js_time").val("");
	    $("#js_times").val("");
		$("#customer_name").val("");
		$("#customer_num").val("");
	}
 
        document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};	
  			//详细信息
  		function CheckManager(pid){
        	dialog = parent.jy.modalDialog({
				title : '费用结算',
				url : 'collect.do?method=getShippingCollect&pid='+pid,
				width : 1200,
				heght: 700,
				
		});
        }	
  
//导出
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var checkarray=[];
		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
					checkarray.push(row[i].customer_id);	  				
		  			}		  			
		  		}	
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			
		} 
		$("#fieldName").val(fieldName.join(","));
  		$("#headtitle").val(colName.join(","));
  		$("#checkarray").val(checkarray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  </script>
  <body class="easyui-layout">
  <form action="Handling.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
    	<lable class="divlabel">制单日期:</lable>
			<input  id="js_time"  class="Wdate" name="js_time" readonly="readonly" style="width:135px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="js_times"  class="Wdate"  name="js_times"  readonly="readonly" style="width:135px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		 	
    	
	    	<lable class="divlabel">客户名称:</lable>
	    	 <input type="text" class="search-text" id="customer_name"  name="customer_name"  style="width:100px"  >
	    	 <lable class="divlabel">客户编号:</lable>
	    	 <input type="text" class="search-text" id="customer_num"  name="customer_num"style="width:100px"  >
	    	<!--  <lable class="divlabel">结算日期:</lable>
	    	 <input  id="kuhu_date"  class="Wdate"   style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	 <input  id="kuhu_dates"  class="Wdate"   style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />    	   -->
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
    	</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
    	   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>			
    	    
   	<!--    <a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">审核</a>
       	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消结算审核</a>
 --><!--      	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="del()">审核驳回</a>
 -->		</div>
 		<input type="hidden" name="method" value="getCustomerIO">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">	
		</form>	
  </body>
</html>