<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>车辆选择</title>

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>

<script type="text/javascript">
	var grid;
	var dialog;
	$(function() {

		/* 初始化页面 */
		grid = $("#dg").datagrid(
				{
					url : 'shipManual.do?method=getCustomerFahuo',
					border : false,
					rownumbers : true,
					idField : 'driver_id',
					fit : true,
					singleSelect : true,
					selectOnCheck : true,
					checkOnSelect : true,
					striped : true,
					columns : [ [ {
						field : 'orderid',
						checkbox : true
					},

					{
						field : 'customer_name',
						title : '客户名称',
						width : 80,
						align : 'center'
					}, {
						field : 'customer_teltoo',
						title : '客户电话',
						width : 100,
						align : 'center'
					}, {
						field : 'customer_tel',
						title : '客户手机',
						width : 100,
						align : 'center'
					}, {
						field : 'customer_address',
						title : '客户详细地址',
						width : 300,
						align : 'center'
					},

					] ],
					onSelect : function(index, data) {
						$("#custom_name").val(data.customer_name);
						$("#send_phone").val(data.customer_teltoo);
						$("#send_shouji").val(data.customer_tel);
						$("#fahuo_address").val(data.customer_address);
						$("#customer_id").val(data.customer_id);

					},
					onLoadSuccess : function() {
						var carId = $(window.parent.document).find('#company')
								.get(0).contentWindow.document
								.getElementById('canum');
						if (carId.value != '' && carId.value != null) {
							$('#dg').datagrid('selectRecord', carId.value);
						}
					},
					pagination : true,//分页
					pageSize : 50,
					pageList : [ 50, 100, 150, 200 ],
					toolbar : '#tb',
				});

		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchTruck();
			}
		};
	});
	var submitForms = function($dialog, $grid, $pjq, $mainMenu) {
		var company = $(window.parent.document).find('#company').get(0).contentWindow;
		company.document.getElementById('custom_name').value = $("#custom_name")
				.val();
		company.document.getElementById('send_phone').value = $("#send_phone")
				.val();
		company.document.getElementById('send_shouji').value = $("#send_shouji")
				.val();
		company.document.getElementById('fahuo_address').value = $(
				"#fahuo_address").val();
		company.document.getElementById('customer_id').value = $("#customer_id")
				.val();
		$dialog.dialog('close');
		// $grid.datagrid('reload');
	};
	/* 查询 */
	function searchOder() {
		$('#dg').datagrid('load', {
			name : $.trim($("#odernum").val()),
		});
	}
	//重置
	function reset() {
		$("#number_search").select2("val", "");
		$("#cc2").combotree('setValue', "");
	}
</script>
</head>
<body class="easyui-layout">
	<form action="shipOrder.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			height="60px" collapsible="false">
			<lable>客户名称：</lable>
			<input type="text" class="search-text" id="odernum"
				style="width:130px;margin-right: 0px;"> <a
				class="easyui-linkbutton" onclick="searchOder()"
				data-options="iconCls:'icon-search'">查询</a>
			<!-- 	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
			</div> -->
		</div>
		<div region="center">
			<table id="dg" title="客户信息"></table>
		</div>
		<div id="tb">
			<!--   <a class="easyui-linkbutton" id="tbput" onclick="" data-options="iconCls:'icon-input',plain:true"style="display: none">导入</a> -->
			<!--  <a class="easyui-linkbutton" id="tbhuifang" onclick="" data-options="plain:true"style="display: none">回放</a>
      <a class="easyui-linkbutton" id="tbgenzong" onclick="" data-options="plain:true"style="display: none">跟踪</a>-->
			<!--  <a class="easyui-linkbutton" onclick="tbgongxiang" data-options="plain:true"style="display: none">货运人共享</a> -->
			<a class="easyui-linkbutton" id="tbreset" onclick="reset()"
				data-options="iconCls:'icon-reset',plain:true">重置</a>
		</div>
		<input type="hidden" id="customer_id" name="customer_id" /> <input
			type="hidden" id="custom_name" name="custom_name" /> <input
			type="hidden" name="send_phone" id="send_phone"> <input
			type="hidden" id="send_shouji" name="send_shouji"> <input
			type="hidden" id="fahuo_address" name="fahuo_address">
	</form>
</body>
</html>
