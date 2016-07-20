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
<title>手录运单信息管理</title>
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
<script language="javascript" src="./js/LodopFuncs.js"></script>
<!-- 	<script type="text/javascript" src="./js/function.js"></script>
 -->

</head>
<%
	String function = "";
	if (request.getAttribute("function") != null) {
		function = request.getAttribute("function").toString();
	}
%>
<script type="text/javascript">
	  	var dialog;
 		var grid;
 		var yuan = [];
 		var shi = [];
 		var bai = [];
 		var qian = [];
 		var wan = [];
 		var yuan1 = [];
 		var shi1 = [];
 		var bai1 = [];
 		var qian1 = [];
 		var wan1 = [];
 		var functions='<%=function%>';
	$(function() {
		grid = $("#dg").datagrid({
			url : 'shipManual.do?method=getShipManual',
			border : false,
			rownumbers : true,
			fit : true,
			/* sortName:'transport_pay,check_time,shipping_order',
			sortOrder:'desc', */
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			rowStyler : function(index, row) {
				if (row.stocks_predestination >= 2) {
					return 'color:blue;';
				}
			},
			/* 	remoteSort:true, */
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'weituo_time',
				title : '委托时间',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'weitoudanhao',
				title : '委托单号',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'shiping_order_num',
				title : '运单号',
				width : 60,
				align : 'center'
			}, {
				field : 'fhdanweiname',
				title : '发货单位名称',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'send_station',
				title : '发站',
				width : 100,
				align : 'center'
			}, {
				field : 'custom_name',
				title : '发货客户名称',
				width : 80,
				align : 'center'
			}, {
				field : 'send_phone',
				title : '发货人电话',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'send_shouji',
				title : '发货人手机',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'fahuo_address',
				title : '发货详细地址',
				width : 70,
				align : 'center',
				sortable : 'true'
			},

			{
				field : 'shdanweiname',
				title : '收货单位名称',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'end_address',
				title : '到站',
				width : 55,
				align : 'center'
			}, {
				field : 'receipt',
				title : '收货人',
				width : 60,
				align : 'center'
			}, {
				field : 'receipt_tel',
				title : '收货人电话',
				width : 80,
				align : 'center'
			}, {
				field : 'receipt_phone',
				title : '收货人手机',
				width : 80,
				align : 'center'
			}, {
				field : 'receipt_address',
				title : '送货详细地址',
				width : 100,
				align : 'center'
			}, {
				field : 'send_type',
				title : '交接方式',
				width : 70,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "客户自提";
					} else if (val == 1) {
						return "专车送货";
					} else if (val == 2) {
						return "送货进仓";
					} else if (val == 3) {
						return "送货上楼";
					} else if (val == 4) {
						return "送货上门";
					}
				}
			}, {
				field : 'goods_name',
				title : '品名',
				width : 60,
				align : 'center'
			}, {
				field : 'goods_packing',
				title : '包装',
				width : 60,
				align : 'center',
			}, {
				field : 'goods_num',
				title : '件数',
				width : 60,
				align : 'center'
			}, {
				field : 'goods_weight',
				title : '重量',
				width : 60,
				align : 'center'
			}, {
				field : 'goods_vol',
				title : '体积',
				width : 60,
				align : 'center'
			}, {
				field : 'destination_fee',
				title : '代收运费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'freight_fee',
				title : '运费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'picking_fee',
				title : '提货费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'affirm_value',
				title : '投保价值',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'rates',
				title : '费率',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'insurance_fee',
				title : '保价费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'adorn_fee',
				title : '其他费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'receivable_ground_fee',
				title : '装卸费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'upstairs_fee',
				title : '上楼费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'deliver_fee',
				title : '直送费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'inspect_fee',
				title : '开箱验货费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'seized_fee',
				title : '理货费',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'transport_pay',
				title : '费用总额',
				width : 70,
				align : 'center',
				sortable : true
			}, {
				field : 'gatheringhj',
				title : '收款合计',
				width : 70,
				align : 'center',
				sortable : true
			}, {
				field : 'back_fee',
				title : '返款',
				width : 70,
				align : 'center',
				sortable : 'true'
			},
			//{field : 'duty_rate',title : '税率',width : 70,align:'center',sortable:'true'},
			{
				field : 'fankuan_stata',
				title : '返款方式',
				width : 70,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "现返";
					} else if (val == 1) {
						return "欠返";
					}
				}
			}, {
				field : 'trade_agency',
				title : '代收货款',
				width : 70,
				align : 'center'
			}, {
				field : 'shouxu_feelv',
				title : '费率',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'handling_charge',
				title : '手续费',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'daohuo_time',
				title : '到货时间',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'trade_agency_stata',
				title : '手续费付款方式',
				width : 70,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "现付";
					} else if (val == 1) {
						return "到付";
					}
				}
			}, {
				field : 'konghuo',
				title : '控货 ',
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "否";
					} else if (val == 1) {
						return "是";
					}
				}
			}, {
				field : 'most_urgent',
				title : '急货',
				width : 70,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "否";
					} else if (val == 1) {
						return "是";
					}
				}
			}, {
				field : 'printed',
				title : '运单打运',
				width : 70,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "机打标签";
					} else if (val == 1) {
						return "机打运单";
					} else if (val == 2) {
						return "机打标签,机打运单";
					}
				}
			},

			{
				field : 'pay_type',
				title : '付费方式',
				width : 70,
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
					} else if (val == 4) {
						return "发货方月结";
					} else if (val == 5) {
						return "收货方月结";
					} else if (val == 6) {
						return "货到付款";
					}
				}
			}, {
				field : 'shipping_order_state',
				title : '运单状态',
				width : 70,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "未出库";
					} else if (val == 1) {
						return "配送中";
					} else if (val == 2) {
						return "转运中";
					} else if (val == 3) {
						return "到达";
					} else if (val == 4) {
						return "签收";
					}
				}
			}, {
				field : 'is_recept_no',
				title : '是否回单',
				width : 70,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "否";
					} else if (val == 1) {
						return "是";
					}
				}
			}, {
				field : 'is_recept',
				title : '回单份数',
				width : 70,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "";
					} else {
						return val;
					}
				}

			}, {
				field : 'remarks',
				title : '备注',
				width : 90,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'stocks_predestination',
				title : '库存天数',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'invoice_state',
				title : '是否开票',
				width : 80,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "是";
					} else if (val == 1) {

						return "否";
					}
				}
			}, {
				field : 'phone_state',
				title : '电话预约',
				width : 80,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "否";
					} else if (val == 1) {

						return "是";
					}
				}
			}, {
				field : 'is_order_arrive',
				title : '是否实际到达',
				width : 90,
				align : 'center',
				sortable : 'true',
				formatter : function(value, row, index) {
					if (value == 0) {
						return "未到达";
					} else if (value == 1) {
						return "到达";
					}

				}

			}, {
				field : 'creat_type',
				title : '创建方式',
				width : 80,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "手录";
					} else if (val == 1) {

						return "PC端导入";
					} else if (val == 2) {
						return "无缝对接";
					} else if (val == 3) {
						return "APP端导入";
					} else if (val == 4) {
						return "pc手录";
					}
				}
			}, {
				field : 'is_order_arrive',
				title : '到达状态',
				width : 80,
				align : 'center',
				sortable : 'true',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "未到达";
					} else if (val == 1) {

						return "到达";
					}
				}
			}, {
				field : 'remarks_fee',
				title : '应收备注',
				width : 90,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'appointment_remarks',
				title : '配送备注',
				width : 90,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'order_time',
				title : '录入时间',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'time_appointment',
				title : '配送时间',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'order_arrive_time',
				title : '实际到达时间',
				width : 80,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'shouliwangdian',
				title : '受理网店',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'baozhuang_name',
				title : '包装人',
				width : 70,
				align : 'center',
				sortable : 'true',

			}, {
				field : 'yewuyuan',
				title : '业务员',
				width : 70,
				align : 'center',
				sortable : 'true'
			}, {
				field : 'shipping_order_name',
				title : '制单人',
				width : 80,
				align : 'center',
				sortable : 'true'
			},

			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});
		var fs = functions.split(",");
		for ( var i = 0; i < fs.length; i++) {
			if (fs[i] == "运费") {
				grid.datagrid('showColumn', 'freight_fee');
				grid.datagrid('showColumn', 'transport_pay');
			} else {
				grid.datagrid('hideColumn', 'freight_fee');
				grid.datagrid('hideColumn', 'transport_pay');

			}

		}
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
		/*
		select框
		 */

		$("#carid").select2({
			placeholder : "请输入车主电话", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "shipManual.do?method=getPhoneLength",
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
		})
	});

	//查询
	function searchCar_owner() {
		var start_time = document.getElementById("start_time").value;
		var end_time = document.getElementById("end_time").value;

		$("#dg").datagrid('load', {
			start_time : start_time,
			end_time : end_time,
			num : $.trim($("#ddId").val()),//运单号
			send_station : $.trim($("#send_station").val()),//发站
			end_address : $.trim($("#end_address").val()),//到站
			custom_name : $.trim($("#custom_name").val()),//发货人
			receipt : $.trim($("#receipt").val()),//收货人
			pay_type : $.trim($("#pay_type").combobox("getValue")),//付款方式
			order_state : $.trim($("#order_state").combobox("getValue")),//运单状况
			send_type : $.trim($("#send_type").combobox("getValue")),//交接方式
			goods_name : $.trim($("#goods_name").val()),
			weitoudanhao : $.trim($("#weitoudanhao").val()),
		});

	}
	//货物到达接收
	function isArrive(orderId) {
		var checkarray = [];
		var array = $('#dg').datagrid('getSelections');
		for ( var i = 0; i < array.length; i++) {
			checkarray.push(array[i].shiping_order_id);
			/*  if(array[i].shipping_order_state==0){
				checkarray.push(array[i].shiping_order_id);
				}else{
					$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
				} */
		}
		if (array != "") {
			$.messager.confirm('确认', '您确定要处理选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "shipManual.do?method=isArrive",
						type : "POST",
						data : {
							del : checkarray.join(",")
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("运单信息", "运单信息到达 ",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("运单录入", "请选择一行信息", "info");
		}
	}

	//货物到达取消
	function isNotArrive() {
		var checkarray = [];
		var array = $('#dg').datagrid('getSelections');
		for ( var i = 0; i < array.length; i++) {
			checkarray.push(array[i].shiping_order_id);
			/*  if(array[i].shipping_order_state==0){
				checkarray.push(array[i].shiping_order_id);
				}else{
					$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
				} */
		}
		if (array != "") {
			$.messager.confirm('确认', '您确定要取消到达选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "shipOrder.do?method=isNotArrive",
						type : "POST",
						data : {
							del : checkarray.join(",")
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("运单信息", "运单信息取消到达",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("运单录入", "请选择一行信息", "info");
		}
	}

	//删除
	function deleteEver() {
		var checkarray = [];
		var num = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				//checkarray.push(array[i].shiping_order_id);
				if (array[i].shipping_order_state == 0) {
					checkarray.push(array[i].shiping_order_id);
				} else {
					num++;
				}
			}
			if (num > 0) {
				$.messager
						.alert(
								'提示',
								'您选中的运单有' + num + '个已经制作协议不能执行删除！',
								'info',
								function(r) {
									if (checkarray.length > 0) {
										$.messager
												.confirm(
														'确认',
														'您确定要删除选中未做协议的记录吗？',
														function(r) {
															if (r) {
																$
																		.ajax({
																			url : "shipManual.do?method=deleteShipManual",
																			type : "POST",
																			data : {
																				del : checkarray
																						.join(",")
																			},
																			success : function(
																					data) {
																				if (data.flag) {
																					parent.$.messager
																							.alert(
																									"运单信息删除",
																									"运单信息删除成功",
																									'info',
																									function(
																											r) {
																										$(
																												'#dg')
																												.datagrid(
																														'reload');
																									});
																				}
																			}
																		});
															}
														});
									}
								});
				num = 0;
			} else {
				if (checkarray.length > 0) {
					$.messager.confirm('确认', '您确定要删除选中的记录吗？', function(r) {
						if (r) {
							$.ajax({
								url : "shipManual.do?method=deleteShipManual",
								type : "POST",
								data : {
									del : checkarray.join(",")
								},
								success : function(data) {
									if (data.flag) {
										parent.$.messager
												.alert("运单信息删除", "运单信息删除成功",
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
			$.messager.alert("运单录入", "请选择一行信息", "info");
		}
	}

	/*
	修改查询 
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				if (row[i].shipping_order_state == 0) {
					var id = row[i].shiping_order_id;
					dialog = parent.jy
							.modalDialog({
								title : '运单修改',
								url : 'shipManual.do?method=getEditShipManualPage&pid='
										+ id,
								/* width : 680, */
								fit : true,
								buttons : [ {
									text : '<input type="button" class="btncss" value="修改"/>',
									handler : function() {
										dialog.find('iframe').get(0).contentWindow
												.submitFormEdit(dialog, grid,
														parent.$);
									}
								} ]
							});
				} else {
					$.messager.confirm('提示', '您选中的运单号'
							+ row[i].shiping_order_num + '，已做协议，不能执行修改！');
				}
			}
		} else {
			$.messager.alert("运单录入", "请选择一行信息", "info");
		}
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
				/* width : 680, */
				fit : true,
				buttons : [ {
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("运单录入", "请选择一行信息", "info");
		}
	}
	//修改
	function updateUser() {
		var myform = document.forms[1];
		myform.action = "car_owner.do?method=updateCar_owner";
		myform.submit();

	}

	/* 	//导出
			function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="check_type"&&col.field!="send_type"&&col.field!="shipping_order_state"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 
		} 
		$("#fieldName").val(fieldName.join(","));
			 $("#headtitle").val(colName.join(","));
			var outputform=$("#outputform");
			outputform.submit(); 
		} */

	function add() {
		/* alert(document.getElementById("addbuttons"));
		alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '运单新增',
			url : 'shipManual.do?method=addShipManual',
			/* 				 buttons :'#addbuttons'
			 */
			/* width : 680, */
			id : "company",
			fit : true,
			buttons : [ {
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//打印
	function dy() {
		CreatePage();
		LODOP
				.ADD_PRINT_SETUP_BKIMG("<img border='0' src='.images/printmodel.jpg'>");
		LODOP.PRINT_SETUP();
		/* var checkarray=[];
		
		var row=$("#dg").datagrid('getSelections');
		if(row.length>=1){
				for(var i=0;i<row.length;i++){
					checkarray.push(row[i].shiping_order_id);
				}	
						var url="shipManual.do?method=getShipManualPrint&pid="+checkarray.join(",");
						ow(url);
		}else{
			$.messager.alert("运单打印","请选择一行信息","info");	
		}
		 */

	}
	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}
	//导入
	function putintfile() {
		dialog = parent.jy.modalDialog({
			title : '导入运单',
			url : 'shipManual.do?method=imp',
			width : 600,
			height : 300,
			buttons : [ {
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//重置
	function reset() {
		$("#start_time").val("");
		$("#end_time").val("");
		$("#ddId").val("");
		$("#send_station").val("");
		$("#end_address").val("");
		$("#custom_name").val("");
		$("#receipt").val("");
		$("#pay_type").combobox("setValue", "");
		$("#order_state").combobox("setValue", "");
		$("#send_type").combobox("setValue", "");
		$("#goods_name").val("");
		$("#weitoudanhao").val("");

	}
	var LODOP; //声明为全局变量  

	//一维打印
	function printYWM() {
		 var row=$("#dg").datagrid('getSelections');
/* 		if(row.length>=1){
			var checkarray=[];
			var array = $('#dg').datagrid('getSelections');
			for(var i=0;i<array.length;i++){
				checkarray.push(array[i].shiping_order_num);
			}
			$("#checkarray").val(checkarray.join(","));
			$("#printywm").submit();
		}else{
			$.messager.alert("运单录入","请选择一行信息","info");	
		} */	

/* 		LODOP = getLodop();
		LODOP.PRINT_INITA(0, 0, 916, 534, "运单打印");
		LODOP.SET_PRINT_PAGESIZE(1, 0, 0, "A3");
		LODOP.SET_PRINT_MODE("RESELECT_PRINTER", true);
		LODOP.SET_PRINT_MODE("RESELECT_ORIENT", true);
		LODOP.SET_PRINT_MODE("RESELECT_PAGESIZE", true);
		LODOP.SET_PRINT_MODE("RESELECT_COPIES", true);
		LODOP.SET_SHOW_MODE("NP_NO_RESULT", true);
		LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='./images/printmodelss.jpg'>"); */
		if(row.length>=1){
		LODOP = getLodop();		
	    LODOP.PRINT_INITA(-7,-69,916,534,"运单打印");
		LODOP.SET_PRINT_PAGESIZE(1,0,0,"A3");
		LODOP.SET_PRINT_MODE("RESELECT_PRINTER",true);
		LODOP.SET_PRINT_MODE("RESELECT_COPIES",true);
		LODOP.SET_PRINT_MODE("RESELECT_PAGESIZE",true);
		LODOP.SET_PRINT_MODE("RESELECT_ORIENT",true);
		LODOP.ADD_PRINT_SETUP_BKIMG("<img border='0' src='./images/printmodelss.jpg'>");			
		/* 		LODOP.SET_PREVIEW_WINDOW(0,0,0,0,0,"");	
		 LODOP.SET_SHOW_MODE("LANDSCAPE_DEFROTATED",1);//横向时的正向显示
		 */
		//for (j = 1; j <=10; j++) {
		CreatePage();

		//};

		//LODOP.SET_PRINT_PAGESIZE(2,2790,1620,"A4");
		//LODOP.PRINT_SETUP();
		LODOP.PRINT_DESIGN();
		}else{
		    $.messager.alert("运单打印","请选择一行信息","info");	
		}
	}

	function zhuanhua(input) {
		input = input + "";
		var ab_str = input.toString();
		var ab_num = parseInt(ab_str.substring(0, ab_str.indexOf('.'))) + "";
		var l = ab_num.length;
		var a = new Array(l);
		var b = new Array(l);
		var result = "";
		for ( var i = 0; i < l; i++) {
			a[i] = input.substr(i, 1);
			b[i] = getchinese(a[i]);
			result += b[i];
		}
	//	var row = $("#dg").datagrid('getSelections');
		
		if (result.length == 1) {
	    	yuan.push(result);
	    	
			//$("#yuan").text(" "+result+" ");
		} else if (result.length == 2) {
			yuan.push(result.substring(1,2));
			shi.push(result.substring(0,1));
			//$("#yuan").text(" "+result.substring(1,2)+" ");
			//$("#shi").text(" "+result.substring(0,1)+" ");
		} else if (result.length == 3) {
			yuan.push(result.result.substring(2,3));
			shi.push(result.substring(1,2));
			bai.push(result.substring(0,1));

			//$("#bai").text(" "+result.substring(0,1)+" ");
			//$("#shi").text(" "+result.substring(1,2)+" ");
			//$("#yuan").text(" "+result.substring(2,3)+" ");
		} else if (result.length == 4) {
			yuan.push(result.substring(3,4));
			shi.push(result.substring(2,3));
			bai.push(result.substring(1,2));
            qian.push(result.substring(0,1));
			//$("#qian").text(" "+result.substring(0,1)+" ");
			//$("#bai").text(" "+result.substring(1,2)+" ");
			//$("#shi").text(" "+result.substring(2,3)+" ");
			//$("#yuan").text(" "+result.substring(3,4)+" ");
		} else if (result.length == 5) {
			yuan.push(result.substring(4,5));
			shi.push(result.substring(3,4));
			bai.push(result.substring(2,3));
            qian.push(result.substring(1,2));
            wan.push(result.substring(0,1));
			//$("#wan").text(result.substring(0,1)+" ");
			//$("#qian").text(" "+result.substring(1,2)+" ");
			//$("#bai").text(" "+result.substring(2,3)+" ");
			//$("#shi").text(" "+result.substring(3,4)+" ");
			//$("#yuan").text(" "+result.substring(4,5)+" ");
		}
	}
function zhuanhua1(input) {
        var reg = /.*\..*/;
		input = input + "";
		var ab_str = input.toString();
		if(reg.test(ab_str)==true){
		var ab_num = parseInt(ab_str.substring(0, ab_str.indexOf('.'))) + "";
		}else{
		   var ab_num = ab_str;
		}
		var l = ab_num.length;
		var a = new Array(l);
		var b = new Array(l);
		var result = "";
		for ( var i = 0; i < l; i++) {
			a[i] = input.substr(i, 1);
			b[i] = getchinese(a[i]);
			result += b[i];
		}
	//	var row = $("#dg").datagrid('getSelections');
		
		if (result.length == 1) {
	    	yuan1.push(result);
			//$("#yuan").text(" "+result+" ");
		} else if (result.length == 2) {
			yuan1.push1(result.substring(1,2));
			shi1.pus(result.substring(0,1));
			//$("#yuan").text(" "+result.substring(1,2)+" ");
			//$("#shi").text(" "+result.substring(0,1)+" ");
		} else if (result.length == 3) {
			yuan1.push(result.substring(2,3));
			shi1.push(result.substring(1,2));
			bai1.push(result.substring(0,1));

			//$("#bai").text(" "+result.substring(0,1)+" ");
			//$("#shi").text(" "+result.substring(1,2)+" ");
			//$("#yuan").text(" "+result.substring(2,3)+" ");
		} else if (result.length == 4) {
			yuan1.push(result.substring(3,4));
			shi1.push(substring(2,3));
			bai1.push(result.substring(1,2));
            qian1.push(result.substring(0,1));
			//$("#qian").text(" "+result.substring(0,1)+" ");
			//$("#bai").text(" "+result.substring(1,2)+" ");
			//$("#shi").text(" "+result.substring(2,3)+" ");
			//$("#yuan").text(" "+result.substring(3,4)+" ");
		} else if (result.length == 5) {
			yuan1.push(result.substring(4,5));
			shi1.push(result.substring(3,4));
			bai1.push(result.substring(2,3));
            qian1.push(result.substring(1,2));
            wan1.push(result.substring(0,1));
			//$("#wan").text(result.substring(0,1)+" ");
			//$("#qian").text(" "+result.substring(1,2)+" ");
			//$("#bai").text(" "+result.substring(2,3)+" ");
			//$("#shi").text(" "+result.substring(3,4)+" ");
			//$("#yuan").text(" "+result.substring(4,5)+" ");
		}
	}
	function getchinese(p) {
		var input = p;
		if (input == "0")
			return "零";
		else if (input == "1")
			return "壹";
		else if (input == "2")
			return "贰";
		else if (input == "3")
			return "叁";
		else if (input == "4")
			return "肆";
		else if (input == "5")
			return "伍";
		else if (input == "6")
			return "陆";
		else if (input == "7")
			return "柒";
		else if (input == "8")
			return "捌";
		else if (input == "9")
			return "玖";
	}
	function CreatePage() {
		var row = $("#dg").datagrid('getSelections');

		LODOP.NewPage();
		for ( var i = 0; i < row.length; i++) {
			var input = row[i].trade_agency;
			var gat = row[i].gatheringhj;
			zhuanhua(input);
			zhuanhua1(gat);
			
			LODOP.ADD_PRINT_TEXT(107,616,50,20, row[i].send_station);//发站
			LODOP.ADD_PRINT_TEXT(107,702,48,20, row[i].end_address);//目的地
			LODOP.ADD_PRINT_TEXT(107,793,64,20, row[i].custom_name);//送货人

		
			LODOP.ADD_PRINT_TEXT(133,138,60,20, row[i].weituo_time_yyyy);//年
			LODOP.ADD_PRINT_TEXT(133,185,40,20, row[i].weituo_time_mm);//月
			LODOP.ADD_PRINT_TEXT(133,225,40,20, row[i].weituo_time_dd);//日
			
			

			
			
			LODOP.ADD_PRINT_TEXT(133,693,92,20, row[i].shiping_order_num);//运单编号
			LODOP.ADD_PRINT_TEXT(177,151,81,20, row[i].fhdanweiname);//单位名称
			

			LODOP.ADD_PRINT_TEXT(203,150,245,20, row[i].fahuo_address);//地址
			LODOP.ADD_PRINT_TEXT(224,148,81,20, row[i].send_phone);//电话
			LODOP.ADD_PRINT_TEXT(267,148,80,20, row[i].shdanweiname);//单位名称
			LODOP.ADD_PRINT_TEXT(288,150,260,20, row[i].receipt_address);//地址
		
			
			LODOP.ADD_PRINT_TEXT(309,148,80,20, row[i].receipt_tel);//电话
			LODOP.ADD_PRINT_TEXT(351,150,82,20, row[i].goods_name);//货物名称
			LODOP.ADD_PRINT_TEXT(371,150,83,20, row[i].goods_name);//长*宽*高
			LODOP.ADD_PRINT_TEXT(396,149,84,20, row[i].goods_weight);//重量


			LODOP.ADD_PRINT_TEXT(414,225,20,20, row[i].send_type1);//交接方式 专车送货
			LODOP.ADD_PRINT_TEXT(437,225,20,20, row[i].send_type3);//单位名称 送货上楼			
			LODOP.ADD_PRINT_TEXT(465,152,261,20, row[i].remarks);//注意事项
			
			
			LODOP.ADD_PRINT_TEXT(353,343,69,20, row[i].goods_packing);//包装
			LODOP.ADD_PRINT_TEXT(373,343,70,20, row[i].goods_num);//件数
			LODOP.ADD_PRINT_TEXT(398,343,64,20, row[i].goods_vol);//体积
			/* 
			LODOP.ADD_PRINT_TEXT(419,322,19,20, row[i].send_type0);//交接方式 客户自提
			LODOP.ADD_PRINT_TEXT(420,403,20,20, row[i].send_type2);//交接方式 送货进仓
			LODOP.ADD_PRINT_TEXT(441,383,21,20, row[i].send_type4);//单位名称  送货上门
			LODOP.ADD_PRINT_TEXT(179,547,16,20, row[i].is_recept_no0);//是签回单
			LODOP.ADD_PRINT_TEXT(179,587,20,20, row[i].is_recept_no1);//否签回单 */
			
			
			LODOP.ADD_PRINT_TEXT(416,320,19,20, row[i].send_type0);//交接方式 客户自提
			LODOP.ADD_PRINT_TEXT(420,400,20,20, row[i].send_type2);//交接方式 送货进仓
			LODOP.ADD_PRINT_TEXT(438,383,21,20, row[i].send_type4);//单位名称  送货上门
			LODOP.ADD_PRINT_TEXT(174,547,16,20, row[i].is_recept_no0);//是签回单
			LODOP.ADD_PRINT_TEXT(176,587,20,20, row[i].is_recept_no1);//否签回单
				
			LODOP.ADD_PRINT_TEXT(179,697,33,20, row[i].is_recept);//回单份数
			LODOP.ADD_PRINT_TEXT(179,790,58,20, "");//回单要求
			LODOP.ADD_PRINT_TEXT(226,525,60,20, row[i].freight_fee);//运费
			LODOP.ADD_PRINT_TEXT(246,523,62,20, row[i].receivable_ground_fee);//装卸费
			LODOP.ADD_PRINT_TEXT(269,525,60,20, row[i].deliver_fee);//送货费（直送费）
			LODOP.ADD_PRINT_TEXT(236,688,40,20, row[i].affirm_value);//生明价值
			LODOP.ADD_PRINT_TEXT(226,790,58,20, row[i].insurance_fee);//保价费
			/* LODOP.ADD_PRINT_TEXT(245,770,20,20, row[i].affirm_value2);//不投保
			LODOP.ADD_PRINT_TEXT(245,825,20,20, row[i].affirm_value1);//投保 */	
			LODOP.ADD_PRINT_TEXT(246,771,20,20, row[i].affirm_value2);//不投保
			LODOP.ADD_PRINT_TEXT(245,826,20,20, row[i].affirm_value1);//投保	
			LODOP.ADD_PRINT_TEXT(269,694,34,20, row[i].picking_fee);//提货费
			LODOP.ADD_PRINT_TEXT(269,793,49,20, row[i].adorn_fee);//其他费
/* 			LODOP.ADD_PRINT_TEXT(290,570,23,20, row[i].pay_type2);//现付
			LODOP.ADD_PRINT_TEXT(290,655,22,20, row[i].pay_type3);//到付
			LODOP.ADD_PRINT_TEXT(290,742,20,20, row[i].pay_type4);//月结 */
			
			LODOP.ADD_PRINT_TEXT(289,570,23,20, row[i].pay_type2);//现付
			LODOP.ADD_PRINT_TEXT(288,656,22,20, row[i].pay_type3);//到付
			LODOP.ADD_PRINT_TEXT(288,743,20,20, row[i].pay_type4);//月结
			LODOP.ADD_PRINT_TEXT(289,826,20,20, row[i].pay_type0);//会担负
			LODOP.ADD_PRINT_TEXT(310,533,63,20, row[i].trade_agency);//代收货款
			LODOP.ADD_PRINT_TEXT(330,535,56,20, row[i].transport_pay);//运输费用合计
			LODOP.ADD_PRINT_TEXT(350,535,56,20, row[i].gatheringhj);//应收费用总计
			LODOP.ADD_PRINT_TEXT(487,796,64,20, row[i].shipping_order_name);//制单人	
			
			
			
			
			
			for(var s in qian){ 	
			LODOP.ADD_PRINT_TEXT(311,676,30,20, wan[s]);//万
			}
			for(var s in qian){
			LODOP.ADD_PRINT_TEXT(311,734,24,20, qian[s]);//仟
			}
			for(var s in bai){
			LODOP.ADD_PRINT_TEXT(311,767,20,20, bai[s]);//佰
			}
			for(var s in shi){
			LODOP.ADD_PRINT_TEXT(311,797,20,20, shi[s]);//拾
			}
			for(var s in yuan){
			LODOP.ADD_PRINT_TEXT(311,824,18,20, yuan[s]);//元
            }
                     
            
            for(var s in wan1){
			LODOP.ADD_PRINT_TEXT(352, 701, 30, 20, wan1[s]);//万
			}
			for(var s in qian1){
			LODOP.ADD_PRINT_TEXT(352, 731, 30, 20, qian1[s]);//仟
			}
			for(var s in bai1){
			LODOP.ADD_PRINT_TEXT(352,765,23,20, bai1[s]);//佰
			}
			for(var s in shi1){
			LODOP.ADD_PRINT_TEXT(352,798,19,20, shi1[s]);//拾
			}
			for(var s in yuan1){
			LODOP.ADD_PRINT_TEXT(352,824,25,20,  yuan1[s]);//元
			} 
		}
	};
	//运单核对
	function check() {
		var checkarray = [];
		//var row=$("#dg").datagrid('getSelections');
		var array = $('#dg').datagrid('getSelections');
		if (array.length == 1) {
			for ( var i = 0; i < array.length; i++) {
				checkarray.push(array[i].shiping_order_id);
			}
			dialog = parent.jy
					.modalDialog({
						title : '运单核对',
						url : 'shipManual.do?method=checkData&checkarray='
								+ checkarray,
						width : 700,
						//height : 300,
						buttons : [ {
							text : '<input type="button" class="btncss" value="核对"/>',
							handler : function() {
								dialog.find('iframe').get(0).contentWindow
										.submitFormEdit(dialog, grid, parent.$);
							}
						} ]
					});
		} else {
			$.messager.alert("运单核对", "请选择一行信息", "info");
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
				checkarray.push(row[i].shiping_order_id);
				//alert(row[i].shiping_order_id);  				
			}
		}
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			if (col.field != 'shipping_orde') {
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 			
			}
		}
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		$("#checkarray").val(checkarray.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}
</script>
<body class="easyui-layout">
	<form action="shipManual.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			height="60px" collapsible="false">
			<lable>制单时间:</lable>
			<input id="start_time" class="Wdate" readonly="readonly"
				style="width:120px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="end_time" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable>委托单号:</lable>
			<input type="text" class="search-text" id="weitoudanhao"
				name="weitoudanhao" style="width:120px; margin-right:0px">
			<lable>运单编号:</lable>
			<input type="text" class="search-text" id="ddId"
				style="width:120px; margin-right:0px">

			<lable>发货人:</lable>
			<input type="text" class="search-text" style="width:120px"
				id="custom_name"> <a class="easyui-linkbutton"
				onclick="searchCar_owner()" data-options="iconCls:'icon-search'">查询</a>
			<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button"
				style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<lable>运单状态:</lable>
				<select class="easyui-combobox" id="order_state"
					name=shipping_order_state style="width:120px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">未出库</option>
					<option id="" value="1">配送中</option>
					<option id="" value="2">转运中</option>
					<option id="" value="4">签收</option>
				</select>
				<lable>付款方式:</lable>
				<select class="easyui-combobox" id="pay_type" name="agreement_type"
					style="width:120px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
					<option id="" value="4">发货方月结</option>
					<option id="" value="5">收货方月结</option>
					<option id="" value="6">货到付款</option>
				</select>
				<lable>交接方式:</lable>
				<select class="easyui-combobox" id="send_type" name=send_type
					style="width:120px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">客户自提</option>
					<option id="" value="1">专车送货</option>
					<option id="" value="2">送货进仓</option>
					<option id="" value="3">送货上楼</option>
					<option id="" value="4">送货上门</option>
				</select>
				<lable>收货人:</lable>
				<input type="text" class="search-text" style="width:120px"
					id="receipt">

				<lable>品名:</lable>
				<input type="text" class="search-text" id="goods_name"
					style="width:120px">
			</div>
		</div>
		<div region="center">
			<table id="dg" title="运单信息"></table>
		</div>
		<div id="tb">
		<div title='一天未出货'
				style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>一天未出货</span>	
				</div>		<!--   
   		      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="xiangxixinxi()">详细</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="modify()">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteEver()">删除</a>
			 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"onclick="printYWM()">一维码打印</a>
		  <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="isArrive()" id="tbru" >到达</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="isNotArrive()">取消到达</a>-->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onclick="add()">添加</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick="printYWM()">打印</a>
			<!-- 		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>			
 -->
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick="reset()">重置</a>
		</div>
		<!-- <input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		 -->
		<input type="hidden" name="method" value="getCustomerInput"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle"> <input
			type="hidden" id="checkarray" name="checkarray">
	</form>
	<form action="shipManual.do" target="_blank" id="printywm"
		method="post">
		<input type="hidden" name="method" value="getShipManualPrintYwm">
		<input type="hidden" id="checkarray" name="checkarray">
	</form>
</body>
</html>