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
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>理赔结算</title>
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
		grid = $("#dg")
				.datagrid(
						{
							url : 'claims_settlement.do?method=inquire',
							border : false,
							rownumbers : true,
							fit : true,
							singleSelect : false,
							selectOnCheck : true,
							checkOnSelect : true,
							multiSort : true,
							//双击
							onDblClickRow : function(rowIndex, rowData) {
								var claimsid = rowData.claimsid;
								dialog = parent.jy
										.modalDialog({
											title : '不合格品查看',
											url : 'claims_settlement.do?method=skip&record_id='
													+ claimsid,
											width : 800,
											heght : 700,
											buttons : [ {
												handler : function() {
													dialog.find('iframe')
															.get(0).contentWindow
															.submitForm(dialog,
																	grid,
																	parent.$);
												}
											} ]
										});
							},
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
							columns : [ [ {
								field : 'ck',
								checkbox : true
							},/* {
								field : 'numbersid',
								title : '理赔单号',
								width : 100,
								align : 'center'
							}, */{
								field : 'shiping_order_num',
								title : '订单号',
								width : 100,
								align : 'center'
							}, {
								field : 'custom_name',
								title : '发货客户',
								width : 100,
								align : 'center'
							}, {
								field : 'send_shouji',
								title : '发货人联系电话',
								width : 100,
								align : 'center'
				    		},{
								field : 'goods_name',
								title : '货物名称',
								width : 100,
								align : 'center'
							},{
								field : 'receipt',
								title : '收货人',
								width : 100,
								align : 'center'
							},{
								field : 'receipt_phone',
								title : '收货人联系方式',
								width : 100,
								align : 'center'
							},{
								field : 'compensation_payments',
								title : '理赔金',
								width : 70,
								align : 'center'
							}, {
								field : 'claims_state',
								title : '理赔单状态',
								width : 80,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
										return "审核通过";
									} else if (val == 1) {
										return "未审核";
									} else if (val == 2) {
										return "审核未通过";
									} else if (val == 3) {
										return "待审核";
									}
								},
							}, {
								field : 'responsible_people',
								title : '理赔操作人',
								width : 80,
								align : 'center',							
							}, {
								field : 'claims_time',
								title : '理赔发起时间',
								width : 120,
								align : 'center',
							}, {
								field : 'damage_intensity',
								title : '事故分析及处理结果',
								width : 80,
								align : 'center'
							}, {
								field : 'audit_opinion',
								title : '审核意见',
								width : 80,
								align : 'center'
							},{
								field : 'department_name',
								title : '提审部门',
								width : 80,
								align : 'center'
							},{
								field : 'arraign_remarks',
								title : '提审备注',
								width : 80,
								align : 'center'
							},{
								field : 'send_station',
								title : '发站',
								width : 100,
								align : 'center'
							},{
								field : 'end_address',
								title : '到站',
								width : 100,
								align : 'center'
							},{
								field : 'goods_num',
								title : '件数',
								width : 100,
								align : 'center'
							},{
								field : 'goods_weight',
								title : '重量',
								width : 100,
								align : 'center'
							},{
								field : 'goods_vol',
								title : '体积',
								width : 100,
								align : 'center'
							},{
								field : 'type',
								title : '付款方式',
								width : 80,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
										return "未结算";
									} else if (val == 1) {
										return "现金";
									} else if (val == 2) {
										return "转账";
									}else if (val == 3) {
										return "支票";
									} else if (val == 4) {
										return "其他";
									}
								},
							},{
								field : 'khbank',
								title : '开户行',
								width : 100,
								align : 'center'
							},{
								field : 'usernames',
								title : '开户名',
								width : 100,
								align : 'center'
							},{
								field : 'kahao',
								title : '银行卡号',
								width : 100,
								align : 'center'
							},{
								field : 'zpbh',
								title : '支票编号',
								width : 100,
								align : 'center'
							},

							] ],
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
				$("#phone").val("");
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
		/* 	$('#cc3')
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
							}); */
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
					url : "claims_settlement.do?method=inquireName1",
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
					url : "claims_settlement.do?method=inquireName",
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

	//查询
	function searchCar_owner() {
	  var custom_name;
	
	 if($("#custom_name").select2('data')!=null){
	      custom_name=$("#custom_name").select2('data').text;
	    }
		$("#dg").datagrid('load', {
		
			numbersid : $.trim($("#numbersid").val()),
			claims_state : $.trim($("#claims_state").val()),
			claims_time : $.trim($("#claims_time").val()),
			claims_endtime : $.trim($("#claims_endtime").val()),
			custom_name : $.trim(custom_name),
			receipt :  $.trim($("#receipt").val())
		});
	}

	//删除
	function deleteEver() {
		var checkarray = [];
		var num = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				//checkarray.push(array[i].claimsid);
				if (array[i].submit_state == 1) {
					checkarray.push(array[i].claimsid);
				} else {
					num++;
				}
			}
			if (num > 0) {
				$.messager.alert('提示', '您选中的运单有' + num + '个已经提交不能执行删除！',
						'info', function(r) {

						});
				num = 0;
			} else {
				if (checkarray.length > 0) {
					$.messager
							.confirm(
									'确认',
									'您确定要删除选中的记录吗？',
									function(r) {
										if (r) {
											$
													.ajax({
														url : 'claims_settlement.do?method=deleteTravel',
														data : {
															del : checkarray
																	.join(",")
														},
														success : function(data) {
															if (data.flag) {
																parent.$.messager
																		.alert(
																				"信息删除",
																				"信息删除成功",
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
			}

		} else {
			$.messager.alert("理赔结算", "请选择一行信息", "info");
		}
	}


	/*
	结算提审
	 */
	function tijiao() {
		var ids = [];
		var row = $("#dg").datagrid('getSelections');
		if (row.length > 0) {
			for ( var i = 0; i < row.length; i++) {
				if (row[i].submit_state == 1) {
					ids.push(row[i].claimsid);

					dialog = parent.jy
							.modalDialog({
								title : '结算提交',
								url : 'claims_settlement.do?method=getArraignedClose&pid='
										+ ids.join(","),
								width : 450,
								height : 300,
								buttons : [ {
									text : '<input type="button" class="btncss" value="确定"/>',
									handler : function() {
										dialog.find('iframe').get(0).contentWindow
												.submitFormEdit(dialog, grid,
														parent.$);
									}
								} ]
							});
				} else {
					$.messager.alert("结算提审", "请选则正确信息！", "info");
				}
			}
		}
	}

	/*
	修改
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		var claimsid;
		for ( var i = 0; i < row.length; i++) {
			claimsid = row[i].claimsid;
			s = row[i].claims_state;
		}
		if (row.length == 1) {
			if (s != 0) {
				dialog = parent.jy
						.modalDialog({
							title : '理赔修改',
							url : 'claims_settlement.do?method=gupdate&claimsid='
									+ claimsid,
							width : 1200,
							buttons : [ {
								text : '<input type="button" class="btncss" value="修改"/>',
								handler : function() {
									dialog.find('iframe').get(0).contentWindow
											.submitForm(dialog, grid, parent.$);
								}
							} ]
						});
			} else {
				$.messager.alert("理赔结算", "请选择一条有效的数据", "info");
			}
		} else {
			$.messager.alert("理赔结算", "请选择一行信息", "info");
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
	
		/* function putoutfile() {
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
			if (col.field != "agreement_type"&&col.field != "transpfreeing") {
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 	
			}
		}
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		$("#checkarray").val(checkarray.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	} */
	//勾选导出
	function putgouxuan() {
		var checkarray = [];
		var checkip = '';
		var colName = [];
		var fieldName = [];
		var i = 0;
		var array = $('#dg').datagrid("getSelections");
		var allRows2 = $("#dg").datagrid("getColumnFields");

		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);

			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去 			
		}
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				checkarray.push(array[i].claimsid);
			}
			$("#fieldName1").val(fieldName.join(","));
			$("#headtitle1").val(colName.join(","));
			$("#checkarray").val(checkarray.join(","));
			var formout = $("#formout");
			formout.submit();
		} else {
			$.messager.alert("理赔结算", "请选择要导出的信息", "info");
		}
	}
	function eidtChange() {
		/* alert(document.getElementById("addbuttons"));
		alert(document.getElementById("upbuttons")); */
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var id = row[i].shiping_order_id;
			}
			dialog = parent.jy.modalDialog({
				title : '收费明细',
				url : 'ChangeO.do?method=AddchangeOrder&pid=' + id,
				/* 				 buttons :'#addbuttons'
				 */
				width : 680,
				height : 350,
				buttons : [ {
					text : '<input type="button" class="btncss" value="保存"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitForm(
								dialog, grid, parent.$);
					}
				} ]
			});

		} else {
			$.messager.alert("理赔结算", "请选择一行信息", "info");
		}
	};
	//添加理赔单
	function addlp() {
		/* alert(document.getElementById("addbuttons"));
		alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '运单新增',
			url : 'claims_settlement.do?method=getadd',
			/* 				 buttons :'#addbuttons'
			 */
			width : 1200,
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
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var pid = row[i].shiping_order_id;
			}
			var url = "shipManual.do?method=getShipManualPrint&pid=" + pid;
			ow(url);
		} else {
			$.messager.alert("理赔结算", "请选择一行信息", "info");
		}

	}
	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}
	//重置
	function reset() {
		$("#numbersid").val("");
		$("#claims_state").combobox("setValue", "");
		$("#claims_time").val("");
		$("#claims_endtime").val("");
		$("#project_name").val("");
		$("#common_carrier").val("");
		$("#custom_name").select2("val",'');
		$("#receipt").select2("val",'');
	}
	//一维打印
	function printYWM() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length >= 1) {
			var checkarray = [];
			var array = $('#dg').datagrid('getSelections');
			for ( var i = 0; i < array.length; i++) {
				checkarray.push(array[i].shiping_order_num);
			}
			$("#checkarray").val(checkarray.join(","));
			$("#printywm").submit();
		} else {
			$.messager.alert("理赔结算", "请选择一行信息", "info");
		}
	}
</script>
<body class="easyui-layout">
	<form action="claims_settlement.do" id="outputform" method="post">

		<div region="north" title="检索" class="st-north" border="false"
			height="75px" collapsible="false">
			<lable>订单号:</lable>
			<input type="text" class="search-text" id="numbersid" name="numbersid"
				style="width:120px; margin-right:0px">
			<!-- <lable>理赔单据状态:</lable>
			<select class="easyui-combobox" id="claims_state" name="claims_state"
				style="width:120px;"
				data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">已提交</option>
				<option id="" value="1">未提交</option>
			</select> -->
			<lable>理赔发起时间:</lable>
			<input id="claims_time" class="Wdate" readonly="readonly" name="claims_time"
				style="width:120px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="claims_endtime" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;" name="claims_endtime"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />

			<a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a> <br>
			<div id="searchInfoId" style="display: none">
				<lable class="divlabel">发货客户:</lable>
				<input type="text" class="search-text" id="custom_name" name="custom_name"
					style="width:128px">
				<lable class="divlabel">收货客户:</lable>
				<input type="text" class=" search-text" id="receipt" name="receipt">
			</div>
		</div>
		<div region="center">
			<table id="dg" title="理赔信息"></table>
		</div>
		<div id="tb">
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onclick="add()">
				添加理赔单</a> <a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:true"
				onclick="deleteEver()">删除</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" id="getUpdateCar_owner"
				data-options="iconCls:'icon-edit',plain:true" onclick="modify()">修改</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:true" onclick="tijiao()">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				id="outputCar_owner" data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" id="outputCar_owner"
				data-options="iconCls:'icon-output',plain:true"
				onclick="putgouxuan()">勾选导出</a> <a href="javascript:void(0)"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick="reset()">重置</a> -->

			<div title='审核未通过'
				style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>审核未通过</span>
			</div>

			<div title='审核通过'
				style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>审核通过</span>
			</div>
			<div title='待审核'
				style='height: 16px;background:purple;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>待审核</span>
			</div>
			<div title='未审核'
				style='height: 16px;background:black;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>未审核</span>
			</div>
			<!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"onclick="printYWM()">一维码打印</a>
		  <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="isArrive()" id="tbru" >到达</a>
	      <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="isNotArrive()">取消到达</a>
	 
		  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick=" dy()">打印</a>		   	   -->
		</div>
		<input type="hidden" name="method" value="exportunqualified">
		<input type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
	<!-- 	<form action="claims_settlement.do" target="_blank" id="printywm"
		method="post">

		<input type="hidden" id="checkarray" name="checkarray">
	</form> -->
	<form action="claims_settlement.do" id="formout" method="post">
		<input type="hidden" name="method" value="outShi"> <input
			type="hidden" id="fieldName1" name="fieldName"> <input
			type="hidden" id="headtitle1" name="headtitle"> <input
			type="hidden" id="checkarray" name="checkarray">
			
	</form>
</body>
</html>