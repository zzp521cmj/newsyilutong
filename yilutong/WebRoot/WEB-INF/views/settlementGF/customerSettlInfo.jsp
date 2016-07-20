<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<script type="text/javascript" src="./js/function.js"></script>
<title></title>

</head>
<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
		var da = "";
		var fs = $("#functionname").val().split(",");
		for (var i = 0; i < fs.length; i++) {
			if (fs[i] == "添加") {
				$("#tbadd").removeAttr("style");
			} else if (fs[i] == "修改") {
				$("#tbmodify").removeAttr("style");
			} else if (fs[i] == "删除") {
				$("#tbdel").removeAttr("style");
			}

		}
		var btnMoreSearch = $("#btnMoreSearch");
		btnMoreSearch.click(function() {
			if (btnMoreSearch.attr("state") == "close") {
				//主要代码 
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 85
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("收起条件");
				btnMoreSearch.attr("state", "open");
				$("#searchInfoId").css("display", "block");
			} else {
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 61
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("更多条件");
				btnMoreSearch.attr("state", "close");
				$("#searchInfoId").css("display", "none");
			}
		});

		grid = $("#dg").datagrid(
						{
							url : 'settleDaiskgf.do?method=getCustomerSetYf',
							fit : true,
							rownumbers : true,
							//singleSelect: true,
							selectOnCheck : true,
							checkOnSelect : true,
							sortName: 'reality_yue',
							remoteSort:true,
							onDblClickRow:function(rowIndex, rowData){
								  			var pid=rowData.customer_id;
												 dialog = parent.jy.modalDialog({
																				title : '运单信息',
																				url : 'settleDaiskgf.do?method=settlementDsPage&pid=' +pid,
																			/* 	width : 1150,
																				height:550, */
																				fit:true,
																				buttons : [{
																					handler : function() {
																						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
																			}
																		}],
											onDestroy:function(){																																
																			 $("#dg").datagrid('reload');																	
																			}
																	});
								  		},
								  		
								onSortColumn : function(sort, order) {
									$('#dg').datagrid('load', {
									customer_name : $.trim($("#customer_name").val()),
									customer_num : $.trim($("#customer_num").val()),
									js_time:$.trim($("#kuhu_date").val()),
						 	 		js_times:$.trim($("#kuhu_dates").val()),	
				           		    chayi : sort,
									order : order,
								});
							},
							toolbar : '#tb',
							columns : [ [
									{
										field : 'ck',
										checkbox : true
									},
									{
										field : 'customer_num',
										title : '客户编码',
										align : 'center',
										width : 90
									},	
									{
										field : 'customer_name',
										title : '客户名称',
										align : 'center',
										width : 100
									},
																
									{
										field : 'customer_tel',
										title : '联系方式',
										width : 90,
										align : 'center'
									},									
									{
										field : 'customer_address',
										title : '地址',
										width : 200,
										align : 'center',
										formatter : function(value, row, index) {
											var content = '<div  title="' + value + '">'
													+ value + '</div>';
											return content;
										}
									}, {
										field : 'allnuns',
										title : '总票数',
										width : 80,
										align : 'center'										
									},
									 {
										field : 'seetls',
										title : '已结票数',
										width : 80,
										align : 'center'										
									},
									 {
										field : 'notseetls',
										title : '未结票数',
										width : 80,
										align : 'center'										
									},
									 {
										field : 'transport_pay',
										title : '总应收金额',
										width : 100,
										align : 'center'								
									},
									 {
										field : 'reality_sum',
										title : '总实收金额',
										width : 100,
										align : 'center'										
									},{
										field : 'reality_yue',
										title : '差异',
										width : 100,
										align : 'center',		
										sortable:true,								
									}
							/*   {field:'user_name',title:'修改人',width:100,align:'left'} */
							] ],
							pagination : true,
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ]
						});
	});
	function searchRemark() {
		$('#dg').datagrid('load', {
			customer_name : $.trim($("#customer_name").val()),
			customer_num : $.trim($("#customer_num").val()),
			js_time:$.trim($("#kuhu_date").val()),
	 	 		js_times:$.trim($("#kuhu_dates").val()),	
		});
	}
	function reset() {
		$("#customer_name").val("");
		$("#customer_num").val("");
		$("#kuhu_date").val("");
		$("#kuhu_dates").val("");
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
	<form action="settleDaiskgf.do" id="outputform" method="post">
	<div region="north" title="检索" class="st-north" border="false"
		style="height:61px" data-options="collapsible:false">
		<lable class="divlabel">客户名称：</lable>
		<input type="text" id="customer_name"   name ="customer_name"  style="width:150px" />
		<lable class="divlabel">客户编码：</lable>
		<input type="text" id="customer_num"  name ="customer_num" style="width:150px" />
		<lable class="divlabel">制单日期:</lable>
	    	 <input  id="kuhu_date"  class="Wdate"   style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})"  />
	    	 -
	    	 <input  id="kuhu_dates"  class="Wdate"   style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> 
	    	
	 <a class="easyui-linkbutton" onclick="searchRemark()" data-options="iconCls:'icon-search'" id="searchId"   style="margin-left: 10px;"">查询</a>
	</div>
	<div region="center" title="客户信息" >
		<table id="dg"></table>
	</div>
	<div id="tb">	
<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a> -->			
	</div>
		<input type="hidden" name="method" value="getCustomerSetYfout">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
		</form>
	<input id="functionname" type="hidden" value=${function}>
</body>
</html>
