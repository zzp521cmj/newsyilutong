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
<title>配送费结算信息管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/function.js"></script>
<!--命名按钮方法  -->


</head>
<%
	String flg = (String) request.getAttribute("pid");
%>
<script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
  		$(function(){
  		$('#dlg1').dialog({
			title : '调整实收金额',
			width : 450,
			height : 260,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons',
			/* onClose:function(){
			$("#costomers").select2("val", "");
			$("#number_search2").select2("val", "");
			$("#flag").combobox("setValue", "4");
			} */
		}); 
  			grid=$("#dg").datagrid({
  			url : 'distribu.do?method=getCustomerSetYf&kname='+'<%=flg%>',
							border : false,
							rownumbers : true,
							fit : true,
							/* sortName:'transport_pay,check_time,shipping_order',
							sortOrder:'desc', */
							singleSelect : false,
							selectOnCheck : true,
							checkOnSelect : true,
							sortName: 'trade_cha',
							remoteSort:true,
							rowStyler : function(index, row) {
								if (row.payment_tz != 2
										|| row.payment_method == 0
										|| row.payment_sh == 3
										|| (row.payment_tz != 2 && (parseFloat(row.send_fee) != parseFloat(row.receivable_fee)))) {
									return 'color:blue;';
								} else if (row.payment_sh == 0) {
									return 'color:rgb(221, 14, 211);';
								} else if (row.payment_sh == 1) {
									return 'color:red;';
								}
							},
							//双击
							onDblClickRow : function(rowIndex, rowData) {
								var agreement_id = rowData.agreement_id;
								dialog = parent.jy
										.modalDialog({
											title : '运单信息',
											url : 'distribu.do?method=settlementYfPage&pid='
													+ agreement_id,
											width : 1200,
											heght : 800,
											buttons : [ {
												handler : function() {
													dialog.find('iframe')
															.get(0).contentWindow
															.submitForm(dialog,
																	grid,
																	parent.$);
												}
											} ],
											onDestroy:function(){																																
													 $("#dg").datagrid('reload');																	
												}
										});
							},
							onSortColumn : function(sort, order) {
							var startDate2 = document.getElementById("startDate2").value;
	                        var endDate2 = document.getElementById("endDate2").value;
		                    var startDate1 = document.getElementById("startDate1").value;
		                    var endDate1 = document.getElementById("endDate1").value;
								$('#dg').datagrid('load',{
											ddId : $.trim($("#ddId").val()),
											types : $.trim($("#types")
													.combobox("getValue")),
											isdelivery : $.trim($("#trade_cha")
													.combobox("getValue")),
											start_date : startDate2,
											end_date : endDate2,
											start_date1 : startDate1,
											end_date1 : endDate1,
											sort : sort,
											order : order,
										});
							},
							columns : [ [
									{
										field : 'ck',
										checkbox : true
									},
									{
										field : 'transpfreeing',
										title : '记录详情',
										width : 90,
										align : 'center',
										sortable : 'true',
										formatter : function(value, row, index) {
											value = "<a href='javascript:void(0)'onclick= 'OrderUpdates(\""
													+ row.agreement_id
													+ "\")'>查看详情</a>&nbsp";
											return value;
										}
									}, {
										field : 'agreement_number',
										title : '协议编号',
										width : 100,
										align : 'center',										
									}, {
										field : 'lx',
										title : '协议类型',
										width : 100,
										align : 'center',
										hidden:true,
									}, {
										field : 'agreement_type',
										title : '协议类型',
										width : 100,
										align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "班线";
											} else if (val == 1) {
												return "配送";
											} else if (val == 2) {
												return "转运";
											}
										},
									}, {
										field : 'department_name',
										title : '托运部门',
										width : 100,
										align : 'center',										
									}, {
										field : 'send_station',
										title : '起始地',
										width : 100,
										align : 'center'
									}, {
										field : 'end_address',
										title : '到达地',
										width : 100,
										align : 'center'
									}, {
										field : 'car_number1',
										title : '车牌号',
										width : 100,
										align : 'center'
									}, {
										field : 'car_name',
										title : '司机',
										width : 70,
										align : 'center'
									}, {
										field : 'all_money',
										title : '应付配送费',
										width : 80,
										align : 'center',

									}, {
										field : 'receivable_fee',
										title : '实付配送费',
										width : 80,
										align : 'center',
									}, {
										field : 'trade_cha', //trade_cha as cy
										title : '差异',
										width : 120,
										align : 'center',
										sortable : true,
									}, {
										field : 'yf',
										title : '预付',
										width : 80,
										align : 'center',
									}, {
										field : 'df',
										title : '到付',
										width : 80,
										align : 'center',
									}, {
										field : 'sf',
										title : '回付',
										width : 80,
										align : 'center',
									}, {
										field : 'payment_method',
										title : '付款方式',
										width : 100,
										align : 'center',
										formatter : function(val, row, index) {
											if (val == 1) {
												return "现金";
											} else if (val == 2) {
												return "油卡";
											} else if (val == 3) {
												return "转账";
											}
										},
									}, {
										field : 'settlyf_time',
										title : '结算日期',
										width : 80,
										align : 'center',
									}, {
										field : 'create_time',
										title : '协议制作日期',
										width : 80,
										align : 'center',
									},{
										field : 'payment_bz',
										title : '付款备注',
										width : 80,
										align : 'center',
									},{
									    field : 'dn',
									    title : '提审部门',
									    width : 90,
									    align:'center'}, 
							] ],
							pagination : true,//分页
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							toolbar : '#tb'
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
				$("#trade_cha").combobox("setValue", "");
				$("#trade_cha").combobox("setText", "全部");
				$("#startDate1").val("");
				$("#endDate1").val("");
				$("#startDate2").val("");
				$("#endDate2").val("");
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

		$.trim($("#trade_cha").combobox("setText", "全部"));
		$.trim($("#types").combobox("setText", "全部"));
		$.trim($("#types").combobox("setValue", ""));
	});

	//查询
	function searchCar_owner() {

		var startDate2 = document.getElementById("startDate2").value;
		var endDate2 = document.getElementById("endDate2").value;
		var startDate1 = document.getElementById("startDate1").value;
		var endDate1 = document.getElementById("endDate1").value;
		$("#dg").datagrid('load', {
		
			ddId : $.trim($("#ddId").val()),
			carname: $.trim($("#carname").val()),
			types : $.trim($("#types").combobox("getValue")),
			isdelivery : $.trim($("#trade_cha").combobox("getValue")),
			start_date : startDate2,
			end_date : endDate2,
			start_date1 : startDate1,
			end_date1 : endDate1,
		});
	}
	
	//重置
	function reset() {
		$("#ddId").val("");
		
		$("#carname").val("");
		$("#types").combobox("setValue","");
		$("#trade_cha").combobox("setValue","");
		$("#startDate2").val("");
		$("#endDate2").val("");
		$("#startDate1").val("");
		$("#endDate1").val("");
	}
	//接收处理
	function dealDelivery() {
		var checkarray = [];
		var checkip = '';
		var i = 0;
		var array = $('#dg').datagrid('getSelections');
		if (array.length > 0) {
			for ( var i = 0; i < array.length; i++) {
				if (array[i].is_print == 1 && array[i].is_takes == 0) {
					checkarray.push(array[i].agreement_id);
				} else {
					checkip = checkip + array[i].shiping_order_num + "  ";
					i++;
				}
			}
			if (checkip != "") {
				$.messager
						.confirm(
								'提示',
								'您选中的运单有' + i + '条，且单号' + checkip + '不能执行提货！',
								function(r) {
									if (r) {
										if (array != "") {
											$.messager
													.confirm(
															'确认',
															'您确定要接收选中的记录吗？',
															function(r) {
																if (r) {
																	$
																			.ajax({
																				url : "ChangeO.do?method=updateFreeOrder",
																				type : "POST",
																				data : {
																					deal : checkarray
																							.join(",")
																				},
																				success : function(
																						data) {
																					if (data.flag) {
																						parent.$.messager.alert("客户提货","客户提货成功",'info',function(r) {
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
										} else {
											$.messager.alert("客户提货",
													"请选择要提货的订单", "info");
										}
									}
								});
			}
		} else {
			$.messager.alert("客户提货", "请选择要提货的运单", "info");
		}
	}
	/*
	结算提审
	 */
	function dealtishen() {
		var ids = [];
		var row = $("#dg").datagrid('getSelections');
		if (row.length > 0) {
			for ( var i = 0; i < row.length; i++) {
				if (row[i].payment_sh==0&&row[i].payment_tz==2) {
					ids.push(row[i].agreement_id);
				}
			}
			
			
		}
		if (ids.length > 0) {
			dialog = parent.jy.modalDialog({
				title : '配送费提审',
				url : 'distribu.do?method=thSettlement&pid=' + ids.join(","),
				width : 450,
				height : 300,
				buttons : [ {
					text : '<input type="button" class="btncss" value="确定"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("配送费调整", "请选择已结算未审核信息", "info");
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
	}
    //结算
	function settlementYfs() {
		
		var ids = [];
		var wids = [];
		var row = $("#dg").datagrid('getSelections');
		if (row.length > 0) {
			for ( var i = 0; i < row.length; i++) {
				//&&(parseFloat(row[i].transport_pay)!=parseFloat(row[i].reality_sum)
				if (row[i].payment_method==0||(row[i].payment_method!=0&&row[i].payment_sh==3&&row[i].payment_tz!=2)||(row[i].payment_tz!=2&&row[i].payment_method!=0)) {
					//ids=row[i].agreement_id;
					ids.push(row[i].agreement_id);
				}
			}
			
			
			
			if (ids.length > 0) {
				dialog = parent.jy
						.modalDialog({
							title : '配送费结算',
							url : 'distribu.do?method=edSettlement&pid='
									+ ids.join(","),
							/* 				 buttons :'#addbuttons'
							 */
							width : 530,
							height : 270,
							buttons : [ {
								text : '<input type="button" class="btncss" value="确定"/>',
								handler : function() {
									dialog.find('iframe').get(0).contentWindow
											.submitFormEditss(dialog, grid,
													parent.$);
								}
							} ]
						});
			} else {
				$.messager.alert("配送费结算", "请选择未结算或者已调整未结算的信息", "info");
			}

		} else {
			$.messager.alert("配送费结算", "请选择未结算或者已调整未结算信息", "info");
		}
	};
	//打印
	function dy() {
		var pid = [];
		var row = $("#dg").datagrid('getSelections');
		if (row.length > 0) {
			for ( var i = 0; i < row.length; i++) {
				if (row[i].is_takes == 0) {
					pid.push(row[i].agreement_id);
				}
			}
			var url = "ChangeOrder.do?method=getShipOrderPrint&pid="
					+ pid.join(",");
			ow(url);
		} else {
			$.messager.alert("客户回单", "请选择一行信息", "info");
		}

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
			url : 'ChangeOrder.do?method=imp',
			width : 600,
			height : 300,
			buttons : [ {
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitFormEdit(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//调整金额
	function eidtChange() {
		var ids = "";
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				if (row[i].payment_tz==0||row[i].payment_tz!=2||row[i].payment_sh==3||
			          (row[i].payment_sh==2&&(parseFloat(row[i].send_fee)!=parseFloat(row[i].receivable_fee)))) {
					ids = row[i].agreement_id;
				}
			}
			
			
			
			if (ids != "") {
				$("#form").form('clear');
				if (row[0].payment_method == 0 && row[0].trade_cha == 0) {
					$("#yingshou").val(row[0].all_money);
				} else if (isNaN(parseFloat(row[0].receivable_fee))) {
					$("#yingshou").val(row[0].all_money);
				} else {
					$("#yingshou").val(
							parseFloat(row[0].all_money)
									- parseFloat(row[0].receivable_fee));
				}
				$("#dlg1").dialog('open');
			} else {
				$.messager.alert("结算调整", "请选未结算或者调整未结算的信息", "info");
			}
		} else {
			$.messager.alert("结算调整", "请选择一行可结算的信息", "info");
		}
	}
	function dealOrder() {
		var row = $("#dg").datagrid('getSelections');
		var receivable_fee;
		if (isNaN(parseFloat(row[0].receivable_fee))) {
			receivable_fee = parseFloat($("#shishou").val());
		} else {
			receivable_fee = parseFloat($("#shishou").val())
					+ parseFloat(row[0].receivable_fee);
		}
		$.messager.confirm('确认', '您确定要提交处理吗？', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'distribu.do?method=changePrice',
					data : {
						dds : row[0].agreement_id,
						price : receivable_fee,
						payment_bz:$("#payment_bz").val()
					},
					success : function(data) {
						if (data.flag) {
							parent.$.messager.alert("结算调整", "运单结算调整成功", 'info',
									function(r) {
										$("#dlg1").dialog('close');
										$('#dg').datagrid('reload');
									});
						}
					}
				});
			}
		});
	}

	//查看审核详情
	function OrderUpdates(ids) {
		dialog = parent.jy
				.modalDialog({
					title : '配送费结算记录',
					url : 'distribu.do?method=setlRcordInfo&pid=' + ids
							+ '&state=' + 0,
					/* 				 buttons :'#addbuttons'
					 */
					width : 800,
					height : 600,
				});
	}
</script>
<body class="easyui-layout">
	<form action="distribu.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable class="divlabel">协议编号:</lable>
			<input type="text" class="search-text" id="ddId" name="ddId"
				style="width:150px"> <input type="hidden"
				class="search-text" id="kname" name="kname">
			<lable>是否结算:</lable>
			<select class="easyui-combobox" id="types" name="types"
				style="width:150px;height:22px"
				data-options="panelHeight : 'auto',editable:false">
				<option value="">全部</option>
				<option value="0">未结算</option>
				<option value="1">现金</option>
				<option value="2">油卡</option>
				<option value="3">转账</option>
			</select>
			
			<lable class="divlabel">司机名称:</lable>
			<input type="text" class="search-text" id="carname" name="carname"
				style="width:130px"> 
			<!-- <lable >审核状态:</lable>
			<select  class="easyui-combobox"  id="isdelivery"  name="isdelivery"style="width:150px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="0">未审核</option>
				<option  value="1">已提审</option>
				<option  value="2">审核通过</option>
				<option  value="3">审核未通过</option>
			</select> -->
			<lable>差异是否为0:</lable>
			<select class="easyui-combobox" id="trade_cha" name="trade_cha"
				style="width:150px;height:22px"
				data-options="panelHeight : 'auto',editable:false">
				<option value="">全部</option>
				<option value="0">否</option>
				<option value="1">是</option>
			</select> <a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->

				<lable class="divlabel">结算日期:</lable>
				<input id="startDate2" class="Wdate" name="start_date"
					readonly="readonly" style="width:150px;height:22px; "
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				- <input id="endDate2" class="Wdate" name="end_date"
					readonly="readonly" style="width:150px;height:22px;"
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				<lable class="divlabel">协议制作日期:</lable>
				<input id="startDate1" class="Wdate" name="start_date1"
					readonly="readonly" style="width:150px;height:22px; "
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				- <input id="endDate1" class="Wdate" name="end_date1"
					readonly="readonly" style="width:150px;height:22px;"
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			</div>
		</div>
		<div region="center">
			<table id="dg" title="协议信息"></table>
		</div>
		<div id="tb">
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true"
				onclick="changemoney()">编辑</a> <a href="javascript:void(0)"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true"
				onclick="settlementYfs()">结算</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" id="getUpdateCar_owner"
				data-options="iconCls:'icon-edit',plain:true"
				onclick="settlementSh()">提审</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" id="outputCar_owner"
				data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a> -->
			<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="dealOrderUpdate()">取消寄出</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出导出</a> -->
			<div title='可结算'
				style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>可结算</span>
			</div>
			<div title='未审核'
				style='height: 16px;background:rgb(221, 14, 211);-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>未审核</span>
			</div>
			<div title='已提审'
				style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>已提审</span>
			</div>
		</div>
		<!-- 协议导出 -->
		<input type="hidden" name="method" value="getCustomerSetYfout">
		<input type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle"> <input
			type="hidden" id="checkarray" name="checkarray">
		
	</form>

	<div id="dlg1">
		<form action="ChangeO.do" id="form" method="">
			<fieldset>
				<table class="tableclass">
					<tr>
						<th colspan="2">调整结算金额</th>
					</tr>
					<tr>
						<td>应付配送费:</td>
						<td colspan="1" class="td2"><input
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							type="text" readonly="readonly" id="yingshou" name="remarks">
						</td>
					</tr>
					<tr>
						<td>实付配送费:</td>
						<td colspan="1" class="td2"><input type="text" id="shishou"
							class="validate[custom[number],max[99999.99],custom[dd]]"
							name="remarks"></td>
					</tr>	
			 <tr>
				<!-- <td >结算备注:</td>
				<td colspan="3" class="td2">
				<textarea class="easyui-textarea" id="payment_bz"
						cols="18" rows="2" name="payment_bz"></textarea></td>
			</tr>  -->
				</table>
			</fieldset>
		</form>
		<div id="buttons">
			<input type="button" onclick="dealOrder()" value="确定" class="btncss" />
		</div>
	</div>

	<script type="text/javascript">
		$("#form").validationEngine('attach', {
			promptPosition : 'topRight:-15,0'
		});
	</script>
</body>
</html>

