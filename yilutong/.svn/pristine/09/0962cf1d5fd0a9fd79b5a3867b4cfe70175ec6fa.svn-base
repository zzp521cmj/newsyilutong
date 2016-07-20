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
<title>应收款查询</title>
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
<style type="text/css">
.subtotal {
	font-weight: bold;
} /*合计单元格样式*/
</style>
</head>

<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
		grid = $("#dg").datagrid({
			url : 'receivable.do?method=dueselect',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			columns : [ [ {
				field : 'ck',
				checkbox : true
			},{
				field : 'shiping_order_num',
				title : '运单号',
				width : 70,
				align : 'center'
			},{
				field : 'custom_name',
				title : '发货客户',
				width : 100,
				align : 'center'
			},{
				field : 'receipt',
				title : '收货客户',
				width : 80,
				align : 'center'
			},{
				field : 'take_fee',
				title : '应收送货费',
				width : 70,
				align : 'center'
			},{
				field : 'adorn_fee',
				title : '应收其他费',
				width : 70,
				align : 'center'
			},{
				field : 'total_cost',
				title : '应收总运费',
				width : 80,
				align : 'center',
			},{
				field : 'ys_unloading_fee',
				title : '应收装卸费',
				width : 80,
				align : 'center'
			},{
				field : 'receivable_ground_fee',
				title : '应收配送费',
				width : 80,
				align : 'center'
			},{
				field : 'upstairs_fee',
				title : '应收上楼费',
				width : 80,
				align : 'center'
			},{
				field : 'deliver_fee',
				title : '应收直送费',
				width : 80,
				align : 'center'
			},{
				field : 'inspect_fee',
				title : '应收开箱验货费',
				width : 80,
				align : 'center'
			},{
				field : 'seized_fee',
				title : '应收理货费',
				width : 80,
				align : 'center'
			},{
				field : 'destination_fee',
				title : '应收到付款',
				width : 70,
				align : 'center'
			}, {
				field : 'trade_agency',
				title : '代收款',
				width : 80,
				align : 'center'
			}
			] ],
			//双击事件
							onDblClickRow : function(rowIndex, rowData) {
								var data = $('#dg').datagrid('getData');
								//双击开启编辑行
								if (rowIndex < data.rows.length - 1) {
									if (editval != rowIndex) {
										$('#dg').datagrid("endEdit", editval);
										$('#dg')
												.datagrid("beginEdit", rowIndex);
										editval = rowIndex;
									} else {
										editval = undefined;
										$('#dg').datagrid("endEdit", rowIndex);
									}
								}
							},
							rowStyler : function(index, row) {
								//合计行颜色
								if (row.shiping_order_num == '合计') {
									return 'background-color:yellow;font-weight:bold;color:blue';
								}
								/* if (row.shiping_order_num != '合计'
										&& row.write_off != 3) {
									return 'color:blue;';
								} */
							},
							onLoadSuccess : function(data) {

								//添加合计行
								$('#dg').datagrid('appendRow', {
									shiping_order_num : '合计',
									destination_fee : compute("destination_fee"),
									take_fee : compute("take_fee"),
									adorn_fee : compute("adorn_fee"),
									change_fee : compute("change_fee"),
									total_cost : compute("total_cost"),
									ys_unloading_fee : compute("ys_unloading_fee"),
									trade_agency : compute("trade_agency"),
									receivable_ground_fee: compute("receivable_ground_fee"),
									upstairs_fee: compute("upstairs_fee"),
								    deliver_fee: compute("deliver_fee"),
									inspect_fee: compute("inspect_fee"),
									seized_fee: compute("seized_fee")
									
								});
								//合并单元格
								var merges2 = [ {
									field : 'shiping_order_num',
									index : data.rows.length - 1,
									colspan : 3,
									rowspan : 1
								}, {
									field : 'change_remarks',
									index : data.rows.length - 1,
									colspan : 1,
									rowspan : 1
								} ];
								for ( var i = 0; i < merges2.length; i++)
									$('#dg').datagrid('mergeCells', {
										index : merges2[i].index,
										field : merges2[i].field,
										colspan : merges2[i].colspan,
										rowspan : merges2[i].rowspan
									});
							},
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});
		//查询收货客户
		$("#receipt").select2({
			placeholder : "请输入收货客户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "receivable.do?method=inquireName1",
					data : {
						name : query.term
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
						});
						query.callback(data);
					}
				});
			}
		}).on("select2-selecting", function(f) {
			$("#receiptid").val(f.object.id);
			$("#cname").val(f.object.text);
		});

		/*
		 *查询发货客户select2
		 */
		$("#custom_name").select2({
			placeholder : "请输入发货客户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "receivable.do?method=inquireName",
					data : {
						custom_name : query.term
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

	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {
		    shiping_order_num : $.trim($("#shiping_order_num").val()),
			custom_name : $.trim($("#custom_name").val()),
			receipt : $.trim($("#receipt").val()),
			close_recheck : $.trim($("#close_recheck").val())
		});
	}
	//导出
	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			if (col.field != "check_type" && col.field != "send_type"
					&& col.field != "claimsid") {
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			}
		}
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}
	//勾选导出
  	function putgouxuan(){
  		var checkarray=[];
  		var checkip='';
  		var colName=[];
		var fieldName=[];
  		var i=0;
	 	var array = $('#dg').datagrid("getSelections");
  	    var allRows2 = $("#dg").datagrid("getColumnFields");
		
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 			
		} 	 
  		if(array != ""){
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  			}
  		 $("#fieldName1").val(fieldName.join(","));
  		 $("#headtitle1").val(colName.join(","));
  		 $("#checkarray").val(checkarray.join(","));
  		var formout=$("#formout");
  		formout.submit();		
  		}else{
  			$.messager.alert("应收款导出","请选择要导出的信息","info");
  		}
  	}


	//重置
	function reset() {
		$("#shiping_order_num").val("");
		$("#custom_name").val("");
		$("#receipt").val("");
		$("#is_settlementyf").val("");
	}
</script>
<body class="easyui-layout">
	<form action="receivable.do" id="outputform" method="post">

		<div region="north" title="检索" class="st-north" border="false"
			height="75px" collapsible="false">
			<input type="hidden" id="shiping_order_id" name="shiping_order_id">
			<lable>运单号:</lable>
			<input type="text" class="search-text" id="shiping_order_num"
				style="width:120px; margin-right:0px">
			<lable class="divlabel">发货客户:</lable>
			<input type="text" class="search-text" id="custom_name"
				style="width:128px">
			<lable class="divlabel">收货客户:</lable>
			<input type="text" class=" search-text" id="receipt" name="receipt">
			<a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> 
			<br>
	</div>
		<div region="center">
			<table id="dg" title="应收款信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				id="outputCar_owner" data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出</a>
			<!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"onclick="printYWM()">一维码打印</a>
		  <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="isArrive()" id="tbru" >到达</a>
	      <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="isNotArrive()">取消到达</a>
	 
		  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick=" dy()">打印</a>		   	   -->
		</div>
		<input type="hidden" name="method" value="exportunqualified">
		<input type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
	
	<form action="receivable.do" id="formout" method="post">
		<input type="hidden" name="method" value="outShi">
		<input type="hidden" id="fieldName1" name="fieldName">
		<input type="hidden" id="headtitle1" name="headtitle">
		<input type="hidden" id=checkarray name="checkarray">
		</form>
</body>
</html>
