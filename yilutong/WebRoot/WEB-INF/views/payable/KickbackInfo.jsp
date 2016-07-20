<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String change_fee1 = request.getParameter("change_fee1");
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/surmax/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>回扣费核销</title>
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
	var editval;
	$(function() {
		grid = $("#dg").datagrid({
			url : 'kickback.do?method=getallkickbackorder',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			rowStyler : function(index, row) {
				if (row.kickback != 3) {
					return 'color:blue;';
				}
			},
			columns : [ [ {
				field : 'shiping_order_id',
				checkbox : true
			}, {
				field : 'shiping_order_num',
				title : '订单编号',
				width : 120,
				align : 'center'
			}, {
				field : 'back_fee',
				title : '回扣',
				width : 80,
				align : 'center'
			},
			{
				field : 'kickback_write_remarks',
				title : '回扣核销备注',
				width : 120,
				align : 'center'
			},
			{
				field : 'kickback',
				title : '核销方式',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "刷卡";
					} else if (val == 1) {
						return "现金";
					} else {
						return "未核销";
					}
				}
			}, {
				field : 'pay_type',
				title : '付款方式',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "回付";
					} else if (val == 1) {
						return "提付";
					} else if (val == 2) {
						return "现付";
					} else if (val == 3) {
						return "货到前付";
					}
				}

			}, {
				field : 'send_station',
				title : '起运地',
				width : 80,
				align : 'center'
			}, {
				field : 'end_address',
				title : '到达地',
				width : 80,
				align : 'center'
			}, {
				field : 'custom_name',
				title : '发货人',
				width : 80,
				align : 'center'
			}, {
				field : 'receipt',
				title : '收货人',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_name',
				title : '品名',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_num',
				title : '件数',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_weight',
				title : '重量',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_vol',
				title : '体积',
				width : 80,
				align : 'center'
			},{
				field : 'updatetime',
				title : '录入时间',
				width : 120,
				align : 'center',
				formatter : function(val, row, index) {
						return val;
				}
			},
			{
				field : 'kickbackpeople',
				title : '回扣核销人',
				width : 90,
				align : 'center'
			},
			{
				field : 'kickbackdate',
				title : '回扣核销时间',
				width : 120,
				align : 'center'
			}] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
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
	
	document.onkeydown = function(event) {
		e = event ? event : (window.event ? window.event : null);
		if (e.keyCode == 13) {
			//执行的方法 
			searchCar_owner();
		}
	};
	function modify() {
		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var pd=[];
		if (array != "") {
			for (var z = 0; z < array.length; z++) {//表示可核销{为三的时候表示的未核销}		
				if(parseInt(array[z].kickback)!=3){
					pd.push(array[z].kickback); //注意修改你的id列 
				}
			}
			if(pd.length==0){
				for (var i = 0; i < array.length; i++) {
					id.push(array[i].shiping_order_id); //注意修改你的id列 
				}
				dialog = parent.jy.modalDialog({
					title : '费用核销',
					url : 'kickback.do?method=updatekickbacks&id=' + id,
					width : 500,
					height: 250,
					buttons : [ {
						text : '<input type="button" class="btncss" value="核销"/>',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow
									.submitFormEdit(dialog, grid, parent.$);
						}
					} ]
				});
			}else{
				$.messager.alert("中转费核销", "存在已核销信息", "info");
			}
		} else {
			$.messager.alert("中转费核销", "请至少选择一行信息", "info");
		}
	}
	
	function qxhx(){//取消核销
		$.messager.confirm('费用核销', '确定要取消核销吗?', function(r) {
		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var pd=[];
		if (array != "") {
			for (var z = 0; z < array.length; z++) {//表示可核销{为三的时候表示的未核销}		
				if(parseInt(array[z].kickback)==3){
					pd.push(array[z].kickback); //注意修改你的id列 
				}
			}
			if(pd.length==0){
				for (var i = 0; i < array.length; i++) {
					id.push(array[i].shiping_order_id); //注意修改你的id列 
				}
				var did=id;
				$.ajax({
					type : "POST",
					url : 'kickback.do?method=combacks&sid='+did,
					success : function(msg) {
						if (msg.flag) {
							$.messager.alert('费用核销', '费用取消核销成功', 'info');
							grid.datagrid('reload');
						}else{
							$.messager.alert('费用核销', '费用取消核销失败', 'info');
							grid.datagrid('reload');
						};
					}
				});
			}else{
				$.messager.alert("中转费核销", "存在未核销信息", "info");
			}
		} else {
			$.messager.alert("中转费核销", "请至少选择一行信息", "info");
		}
		});
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
	function searchCar_owner() {
		$("#dg").datagrid('load', {
			shiping_order_num : $.trim($("#shiping_order_num").val()),
			receipt : $.trim($("#receipt").val()),
			startDate : $.trim($("#startDate").val()),
			endDate : $.trim($("#endDate").val()),
			kickback : $.trim($("#kickback").val()),
			custom_name:$.trim($("#custom_name").val()),
			goods_name:$.trim($("#goods_name").val()),
			goods_num:$.trim($("#goods_num").val()),
			pay_type:$.trim($("#pay_type").val()),
			back_fee:$.trim($("#back_fee").val())
		});
	}
	//重置
	function reset() {
		$("#shiping_order_num").val("");
		$("#receipt").val("");
		$("#startDate").val("");
		$("#endDate").val("");
		$("#custom_name").val("");
		$("#goods_name").val("");
		$("#goods_num").val("");
		$("#pay_type").val("4");
		$("#back_fee").val("");
	}
	document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
	};	

</script>
<body class="easyui-layout">
	<form action="shipOrder.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable class="divlabel">订单编号:</lable>
			<input type="text" class="search-text" id="shiping_order_num"
				style="width:150px">
			<lable class="divlabel">发货人:</lable>
			<input type="text" class="search-text" id="custom_name"
				style="width:150px"> 
			<lable class="divlabel">收货人:</lable>
			<input type="text" class="search-text" id="receipt"
				style="width:150px"> 
			<lable class="divlabel">是否核销:</lable>
			<select id="kickback" name="kickback" style="height: 22px">
				<option value="2">全部</option>
				<option value="1">已核销</option>
				<option value="3">未核销</option>
			</select>
			<a class="easyui-linkbutton"
				onclick="searchCar_owner()" data-options="iconCls:'icon-search'">查询</a>
			<a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<lable class="divlabel">核销时间:</lable>
				<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> -
				<input  id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />	
				<lable class="divlabel">品名:</lable>
				<input type="text" class="search-text" id="goods_name"
				style="width:80px"> 
				<lable class="divlabel">件数:</lable>
				<input type="text" class="search-text" id="goods_num"
				style="width:50px">
				<lable class="divlabel">付款方式:</lable>
				<select id="pay_type" name="pay_type" style="height: 22px">
				<option value="4">全部</option>
				<option value="0">回付</option>
				<option value="1">提付</option>
				<option value="2">现付 </option>
				<option value="3">货到前付</option>
				</select>
				<lable class="divlabel">回扣金额:</lable>
				<input type="text" class="search-text" id="back_fee"
				style="width:80px">
			</div>
		</div>
		<div region="center">
			<table id="dg" title="汇总信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="modify()">核销</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="qxhx()">取消核销</a>
		</div>
	</form>
</body>
</html>