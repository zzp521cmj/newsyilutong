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
<title>单票信息管理</title>
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
<script type="text/javascript" src="./js/function.js"></script>
<!--命名按钮方法  -->


</head>
<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
		grid = $("#dg").datagrid({
			url : 'incomedp.do?method=getIncomeInfo',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			rowStyler : function(index, row) {
				if (row.income_style == 2) {
					return 'color:blue;';
				}
			},

			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'shiping_order_num',
				title : '运单号',
				width : 80,
				align : 'center'
			}, {
				field : 'end_address',
				title : '到达地',
				width : 60,
				align : 'center'
			}, {
				field : 'receipt',
				title : '收货人',
				width : 80,
				align : 'center'
			}, {
				field : 'start_address',
				title : '发货地址',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_name',
				title : '品名',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_num',
				title : '总件数',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_weight',
				title : '重量',
				width : 140,
				align : 'center'
			}, {
				field : 'goods_vol',
				title : '体积',
				width : 80,
				align : 'center'
			}, {
				field : 'income_time',
				title : '收款日期',
				width : 80,
				align : 'center'/* sortable: true */
			}, {
				field : 'land_total',
				title : '落地费',
				width : 80,
				align : 'center'
			}, {
				field : 'changes_pay',
				title : '中转费',
				width : 80,
				align : 'center'
			}, {
				field : 'sends_fee',
				title : '送货费',
				width : 80,
				align : 'center'
			}, {
				field : 'car_number',
				title : '车号',
				width : 80,
				align : 'center'
			} ] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});
		//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
		btnMoreSearch.click(function() {
			if (btnMoreSearch.attr("state") == "close") {
				//主要代码 
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 92
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("收起条件");
				btnMoreSearch.attr("state", "open");
				$("#searchInfoId").css("display", "block");

				$("#start_address").val("");
			} else {
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 60
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("更多条件");
				btnMoreSearch.attr("state", "close");
				$("#searchInfoId").css("display", "none");
			}
		});

		/*
		select框
		 */
		$("#carid").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "incomedp.do?method=IncemCarid",
					data : {
						phones : query.term
					}, //传递你输入框中的值
					success : function(msg) {
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.id,
								text : y.name
							});
							;
						});
						query.callback(data);
					}
				});
			}
		});
	});
	//查询
	function searchCar_owner() {
		/* 		var receipt = document.getElementById("receipt").value;
		 var goods_name = document.getElementById("goods_name").value;
		 var carid  =document.getElementById("carid").value;
		 var start_address  =document.getElementById("start_address").value; */
		$("#dg").datagrid('load', {
			//	receipt : receipt,
			receipt : $.trim($("#receipt").val()),
			goods_name : $.trim($("#goods_name").val()),
			car_number : $.trim($("#carid").select2("val")),
			start_address : $.trim($("#start_address").val()),//
		});
	}
	function add() {

		dialog = parent.jy.modalDialog({
			title : '单票新增',
			url : 'incomedp.do?method=addIncome',

			width : 1100,
			buttons : [ {
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//删除
	function deleteEver() {
		var checkarray = [];
		var del = [];
		var array = $('#dg').datagrid('getSelections');
		for (var i = 0; i < array.length; i++) {
			checkarray.push(array[i].tatal_id);
			del.push(array[i].shiping_order_id);
		}
		if (array != "") {
			$.messager.confirm('确认', '您确定要删除选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "incomedp.do?method=deleteIncome",
						type : "POST",
						data : {
							del : checkarray.join(","),
							deletn : del.join(","),
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("单票信息删除", "单票信息删除成功",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("单票表", "请选择要删除的信息", "info");
		}
	}

	//修改查询 
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for (var i = 0; i < row.length; i++) {
				var id = row[i].tatal_id;
			}
			dialog = parent.jy.modalDialog({
				title : '单票修改',
				url : 'incomedp.do?method=getEditIncomePage&pid=' + id,
				width : 680,

				buttons : [ {
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("单票表", "请选择一行信息", "info");
		}
	}

	//详情查询
	function xiangxixinxi() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for (var i = 0; i < row.length; i++) {
				var id = row[i].shiping_order_id;
			}
			dialog = parent.jy.modalDialog({
				title : '单票详情',
				url : 'shipOrder.do?method=getShipOrderPage&pid=' + id,
				width : 680,
				buttons : [ {
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("单票表", "请选择一行信息", "info");
		}
	}
	//修改
	function updateUser() {
		var myform = document.forms[1];
		myform.action = "car_owner.do?method=updateCar_owner";
		myform.submit();

	}

	//导出
	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去 
		}
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}

	//重置
	function reset() {
		$("#receipt").val("");
		$("#goods_name").val("");
		$("#carid").val("");
		$("#start_address").val("");
	}
</script>
<body class="easyui-layout">
	<form action="incomedp.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable>收货人:</lable>
			<input type="text" class="search-text" style="width:150px"
				id="receipt">
			<lable>品名:</lable>
			<input type="text" class="search-text" style="width:150px"
				id="goods_name">

			<lable class="divlabel">车牌号:</lable>
			<input type="text" class="search-text" id="carid" style="width:150px">
			<a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">

				<lable>发货地址:</lable>
				<input type="text" class="search-text" id="start_address">
			</div>
		</div>
		<div region="center">
			<table id="dg" title="单票信息"></table>
		</div>

		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="add()" data-options="iconCls:'icon-add',plain:true">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="modify()">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:true"
				onclick="deleteEver()">删除</a> <a href="javascript:void(0)"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a>
		</div>
		<input type="hidden" name="method" value="outIncome"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
</body>
</html>