<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/surmax/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>配送费结算</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<!-- <script type="text/javascript" src="./js/function.js"></script> -->


</head>
  <% String flg=(String)request.getAttribute("pid") ; %>
<script type="text/javascript">
	var dialog;
	var grid;
	
	$(function() {
		grid = $("#dg")
				.datagrid(
						{
							url : 'distribu.do?method=getSettlementYf&id='+'<%=flg%>',
							border : false,
							rownumbers : true,
							fit : true,
							singleSelect : false,
							selectOnCheck : true,
							checkOnSelect : true,
							multiSort : true,
							rowStyler : function(index, row) {
								if (row.claims_state == 0) {
									return 'color:blue';
								} else if (row.claims_state == 1) {
									return 'color: black';
								} else if (row.claims_state == 2) {
									return 'color:red';
								} else if (row.claims_state == 3) {
									return 'color:purple';
								}
							},

							columns : [ [
									{
										field : 'ck',
										checkbox : true
									},
									{
										field : 'shiping_order_num',
										title : '运单号',
										width : 60,
										align : 'center'
									},
									{
										field : 'custom_name',
										title : '发货客户',
										width : 80,
										align : 'center'
									},
									{
										field : 'send_phone',
										title : '发货联系电话',
										width : 80,
										align : 'center'
									},
									{
										field : 'goods_name',
										title : '货物名称',
										width : 60,
										align : 'center'
									},
									{
										field : 'goods_num',
										title : '件数',
										width : 60,
										align : 'center'
									},
									{
										field : 'goods_weight',
										title : '重量',
										width : 60,
										align : 'center'
									},
									{
										field : 'goods_vol',
										title : '体积',
										width : 60,
										align : 'center'
									}, {
										field : 'send_station',
										title : '发站',
										width : 80,
										align : 'center'
									}, {
										field : 'end_address',
										title : '到站',
										width : 75,
										align : 'center'
									}, {
										field : 'receipt',
										title : '收货人',
										width : 60,
										align : 'center'
									}, {
										field : 'receipt_tel',
										title : '收货联系电话',
										width : 80,
										align : 'center'
									},  /* {
										field : 'receipt_phone',
										title : '手机',
										width : 80,
										align : 'center'
									},  */
							] ],
							pagination : true,//分页
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							toolbar : '#tb'
						});

	});

	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {
			agreement_number : $.trim($("#agreement_number").val()),
			custom_name : $.trim($("#custom_name").val())

		});
	}

	//详情查询
	function xiangxixinxi() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var id = row[i].shiping_order_id;
			}
			dialog = parent.jy.modalDialog({
				title : '运单详情',
				url : 'shipManual.do?method=getShipManualPage&pid=' + id,
				width : 680,
				buttons : [ {
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("理赔结算", "请选择一行信息", "info");
		}
	}

	//导出
	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		var checkarray = [];
		var row = $("#dg").datagrid('getSelections');
		if (row.length > 0) {
			for ( var i = 0; i < row.length; i++) {
				checkarray.push(row[i].agreement_id);
			}
		}
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);

			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去 

		}
		$("#id").val('<%=flg%>');
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		$("#checkarray").val(checkarray.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}

	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}
</script>
<body class="easyui-layout">
	<form action="distribu.do" id="outputform" method="post">
	<input type="hidden" id="id" name="id">
		<div region="north" title="检索" class="st-north" border="false"
			height="75px" collapsible="false">
			<lable>运单号:</lable>
			<input type="text" class="search-text" id="agreement_number" name="agreement_number"
				style="width:120px; margin-right:0px">
				<lable>发货人:</lable>
			<input type="text" class="search-text" id="custom_name" name="custom_name"
				style="width:120px; margin-right:0px">
			 <a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a>

		</div>
		<div region="center">
			<table id="dg" title="配送费结算"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				id="outputCar_owner" data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a>
		</div>
		<input type="hidden" name="method" value="getSettlementYfout">
		<input type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle"> <input
			type="hidden" id="checkarray" name="checkarray">
	</form>
</body>
</html>
