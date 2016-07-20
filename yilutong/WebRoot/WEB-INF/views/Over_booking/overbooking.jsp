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
<title>客户下单</title>
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
</head>

<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
		grid = $("#dg").datagrid({
			url : 'overbook.do?method=dueselects',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			rowStyler : function(index, row) {
				if (row.shiping_accept_static == 1) {
					return 'color:blue';
				}
			},
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'shiping_order_num',
				title : '下单号',
				width : 80,
				align : 'center',
			}, {
				field : 'send_station',
				title : '发站',
				width : 80,
				align : 'center'
			}, {
				field : 'end_address',
				title : '到站',
				width : 80,
				align : 'center'
			}, {
				field : 'send_time',
				title : '发车时间',
				width : 80,
				align : 'center'
			},{
				field : 'custom_name',
				title : '发货客户',
				width : 80,
				align : 'center'
			}, {
				field : 'receipt',
				title : '收货人',
				width : 80,
				align : 'center'
			}, {
				field : 'receipt_tel',
				title : '电话',
				width : 80,
				align : 'center'
			}, {
				field : 'receipt_phone',
				title : '手机',
				width : 80,
				align : 'center'
			}, {
				field : 'receipt_address',
				title : '收货详细地址',
				width : 100,
				align : 'center'
			},

			{
				field : 'send_type',
				title : '交接方式',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if(val==0){
  							return "客户自提";
  						}else if(val==1){
  						    return "专车送货";
  						}else if(val==2){
  							return "送货进仓";
  						}else if(val==3){
  						    return "送货上楼";
  						}else if(val==4){
  						    return "送货上门";
  						}
  					}
				
			},/*  {
				field : 'transport',
				title : '运输方式',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "普快";
					} else if (val == 1) {
						return "特快";
					}
				}
			}, */ {
				field : 'goods_name',
				title : '货物名称',
				width : 80,
				align : 'center'
			}, {
				field : 'goods_packing',
				title : '包装',
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
			}, {
				field : 'shiping_accept_static',
				title : '是否接收',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "未接收";
					} else if (val == 1) {
						return "已接收";
					}
				}
			}, {
				field : 'shiping_affirm',
				title : '提货确认',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "已确认";
					} else if (val == 1) {
						return "未确认";
					}
				}
			}
			
			 ] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
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
					url : "overbook.do?method=inquireName",
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
		
		/*
		 *查询收货客户select2
		 */
		$("#receipt").select2({
			placeholder : "请输入发货客户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "overbook.do?method=inquireName1",
					data : {
						receipt : query.term
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
	//回车查询
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
			$('.easyui-layout').layout('panel', 'north').panel('resize', {
				height : 92
			});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display", "block");
			$("#phone").val("");
			$("#send_address").val("");
			$("#end_address").val("");
			$("#perpole").val("");
			$("#pay_state").combobox("setValue", "");
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
	$('#cc3')
			.combotree(
					{
						url : "depn.do?method=getTree&&id=",
						width : 150,
						onBeforeLoad : function(node, param) {

							if (node == null) {
								$('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
							} else {

								$('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
										+ node.id;//加载下层节点
							}

						}
					});
	

	//查询
	function searchCar_owner() {
	    var custom_name;
	    var receipt;
	    if($("#custom_name").select2('data')!=null){
	      custom_name=$("#custom_name").select2('data').text;
	    }
	     if($("#receipt").select2('data')!=null){
	      receipt=$("#receipt").select2('data').text;
	    }
       
		$("#dg").datagrid('load', {
			shiping_order_num : $.trim($("#shiping_order_num").val()),//运单号
			shiping_accept_static : $.trim($("#shiping_accept_static").val()),//交接方式
			custom_name : $.trim(custom_name),//发货人
			receipt : $.trim(receipt),//收货人
		});

	}

	//接收
	function dealBack() {
		var checkarray = [];
		var num = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				//checkarray.push(array[i].claimsid);
				if (array[i].shiping_accept_static == 0) {
					checkarray.push(array[i].shiping_orders_id);
				} else {
					num++;
				}
			}
			if (num > 0) {
				$.messager.alert('提示', '您选中的运单有' + num + '个已经接收！', 'info',
						function(r) {

						});
				num = 0;
			} else {
				if (checkarray.length > 0) {
					$.messager.confirm('确认', '您确定要接收选中的记录吗？', function(r) {
						if (r) {
							$.ajax({
								url : 'overbook.do?method=updateunqualified',
								data : {
									shiping_orders_id : checkarray.join(",")
								},
								success : function(data) {
									if (data.flag) {
										parent.$.messager
												.alert("接收", "接收成功", 'info',
														function(r) {
															$('#dg').datagrid(
																	'reload');
														});
									}
								}
							});
						}
					});
				}
			}

		} else {
			$.messager.alert("接收", "请选择一行信息", "info");
		}
	}

	//删除
	function deleteEver() {
		var checkarray = [];
		var num = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				//checkarray.push(array[i].claimsid);
				if (array[i].shiping_accept_static == 0) {
					checkarray.push(array[i].shiping_orders_id);
				} else {
					num++;
				}
			}
			if (num > 0) {
				$.messager.alert('提示', '您选中的运单有' + num + '个已经接收不能执行删除！',
						'info', function(r) {

						});
				num = 0;
			} else {
				if (checkarray.length > 0) {
					$.messager.confirm('确认', '您确定要删除选中的记录吗？', function(r) {
						if (r) {
							$.ajax({
								url : 'overbook.do?method=deleteTravel',
								data : {
									del : checkarray.join(",")
								},
								success : function(data) {
									if (data.flag) {
										parent.$.messager
												.alert("信息删除", "信息删除成功",
														'info', function(r) {
															$('#dg').datagrid(
																	'reload');
														});
									}
								}
							});
						}
					});
				}
			}

		} else {
			$.messager.alert("下单", "请选择一行信息", "info");
		}
	}

	/*
	 *确认
	 */
	function affirm() {
		var checkarray = [];
		var num = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				//checkarray.push(array[i].claimsid);
				if (array[i].shiping_affirm == 1) {
					checkarray.push(array[i].shiping_orders_id);
				} else {
					num++;
				}
			}
			if (num > 0) {
				$.messager.alert('提示', '您选中的运单有' + num + '已确认！', 'info',
						function(r) {

						});
				num = 0;
			} else {
				if (checkarray.length > 0) {
					$.messager.confirm('确认', '您确定要确认选中的记录吗？', function(r) {
						if (r) {
							$.ajax({
								url : 'overbook.do?method=countersign',
								data : {
									shiping_orders_id : checkarray.join(",")
								},
								success : function(data) {
									if (data.flag) {
										parent.$.messager
												.alert("确认", "确认成功", 'info',
														function(r) {
															$('#dg').datagrid(
																	'reload');
														});
									}
								}
							});
						}
					});
				}
			}

		} else {
			$.messager.alert("接收", "请选择一行信息", "info");
		}
	}

	/*
	修改查询 
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
		if(row[0].shiping_accept_static==1){
		$.messager.alert("修改", "已接收,不能进行修改", "info");
		}else {
			for ( var i = 0; i < row.length; i++) {
				var shiping_orders_id = row[i].shiping_orders_id;
				dialog = parent.jy
						.modalDialog({
							title : '运单修改',
							url : 'overbook.do?method=gupdate&shiping_orders_id='
									+ shiping_orders_id,
							width : 680,
							buttons : [ {
								text : '<input type="button" class="btncss" value="修改"/>',
								handler : function() {
									dialog.find('iframe').get(0).contentWindow
											.submitFormEdit(dialog, grid,
													parent.$);
								}
							} ]
						});
			}
			}
		} else {
			$.messager.alert("下单", "请选择一行信息", "info");
		}
		
	}

	//导出
	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			if (col.field != "check_type" && col.field != "send_type"
					&& col.field != "shipping_order_state") {
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			}
		}
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}

	//添加
	function add() {
		dialog = parent.jy.modalDialog({
			title : '运单新增',
			url : 'overbook.do?method=getadd',
			/* 				 buttons :'#addbuttons'
			 */
			width : 680,
			buttons : [ {
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};

	//重置
	function reset() {
		$("#shiping_order_num").val("");
		$("#shiping_accept_static").val("");
		$("#custom_name").select2("val",'');
		$("#receipt").select2("val",'');
	}
</script>
<body class="easyui-layout">
	<form action="shipManual.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			height="60px" collapsible="false">
			<input type="hidden" class="search-text" id="shiping_orders_id"
				style="width:120px; margin-right:0px">

			<lable>下单号:</lable>
			<input type="text" class="search-text" id="shiping_order_num"
				style="width:120px; margin-right:0px">
			<lable>是否接收:</lable>
			<select class="combobox" id="shiping_accept_static"
				name="shiping_accept_static" style="width:120px;"
				data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">未接收</option>
				<option id="" value="1">已接收</option>
			</select>
			<lable>发货客户:</lable>
			<input type="text" class="search-text" style="width:120px"
				id="custom_name" name="custom_name">
			<lable>收货人:</lable>
			<input type="text" class="search-text" style="width:120px"
				id="receipt" name="receipt"> <a class="easyui-linkbutton"
				onclick="searchCar_owner()" data-options="iconCls:'icon-search'">查询</a>
		</div>
		<div region="center">
			<input type="hidden" id="shiping_orders_id" name="shiping_orders_id" />

			<table id="dg" title="下单信息">
			
			</table>
		</div>
		<div id="tb">
			<div title='已接收'
					style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
					<span>已接收</span>
				</div>
		</div>
		
		<input type="hidden" name="method" value="outShipOrder"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
	<form action="shipManual.do" target="_blank" id="printywm"
		method="post">
		<input type="hidden" name="method" value="getShipManualPrintYwm">
		<input type="hidden" id="checkarray" name="checkarray">
	</form>
</body>
</html>