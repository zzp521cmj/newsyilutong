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
<title>结算审核</title>
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
<%
	String dd = (String) request.getAttribute("sl.getWrite_id()");
	String pid = (String) request.getAttribute("flg");
%>
<script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
 		var id = '<%=pid%>';
	$(function() {
		grid = $("#dg")
				.datagrid(
						{
							url : 'Handling.do?method=getShippingCloseAuditing&pid='
									+ id,
							border : false,
							rownumbers : true,
							fit : true,
							singleSelect : false,
							selectOnCheck : true,
							checkOnSelect : true,
							multiSort : true,
							rowStyler : function(index, row) {
								//未结算未审核
								/* 				if (row.destination_stata==0) {
								
								 return 'color:blue;';
								 };
								 if (row.des_sh_stata==0&&row.destination_stata!=0) {
								 return 'color:rgb(221, 14, 211);';
								 }; */
								if (row.handling_shenhe == 1) {
									return 'color:red;';
								}
								;
							},
							columns : [ [
									{
										field : 'ck',
										checkbox : true
									},
									{
										field : 'shipping_orde',
										title : '记录详情',
										width : 80,
										align : 'center',
										sortable : 'true',
										formatter : function(val, row, index) {
											return '<a href="javascript:void(0)" onclick="CheckManager(\''
													+ row.shiping_order_id
													+ '\')">查看详细信息</a>  ';
										}
									},
									{
										field : 'send_time',
										title : '发车时间',
										width : 60,
										align : 'center'
									},
									{
										field : 'shiping_order_num',
										title : '运单号',
										width : 60,
										align : 'center'
									},
									{
										field : 'send_station',
										title : '发站',
										width : 80,
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
										align : 'center',
										sortable : 'true'
									},
									{
										field : 'goods_name',
										title : '货物名称',
										width : 60,
										align : 'center'
									},
									//{field : 'goods_packing',title : '包装',width : 60,align:'center'},
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
									},
									{
										field : 'receipt',
										title : '收货人',
										width : 60,
										align : 'center'
									},
									{
										field : 'receipt_tel',
										title : '收货联系电话',
										width : 80,
										align : 'center'
									},
									//{field : 'receipt_phone',title : '收货人手机',width : 80,align:'center'},	  				
									{
										field : 'handling_charge',
										title : '应收手续运费',
										width : 80,
										align : 'center'
									},
									{
										field : 'handling_shihou',
										title : '实收手续运费',
										width : 80,
										align : 'center'
									},
									{
										field : 'paid_fee',
										title : '实收代收运费',
										width : 80,
										align : 'center'
									},
									{
										field : 'chayi',
										title : '差异',
										width : 80,
										align : 'center',
										formatter : function(val, row, index) {
											return Number(Number(row.destination_fee * 1)
													- Number(row.paid_fee * 1));
										}
									}, {
										field : 'transport_pay',
										title : '费用总额',
										width : 80,
										align : 'center'
									},
									// {field : 'back_fee',title : '返款',width : 80,align:'center'},
									/* {field : 'xian_back_fee',title : '现返',width : 80,align:'center',
									formatter:function(val,row,index){
									    if (row.fankuan_stata == "0") {
										return Number(Number(row.paid_fee*1)-Number(row.transport_pay*1));	  
									} else {
									      return "0";
									}     		   
										             		   
										}
									
									},
									{field : 'qian_back_fee',title : '欠返',width : 80,align:'center',
									 formatter:function(val,row,index){
												  
									    if (row.send_type!="1") {
										return Number(Number(row.paid_fee*1)-Number(row.transport_pay*1));	  
									} else if (row.send_type=="1"){
									      return Number(row.paid_fee*1);
									}    		   
										             		   
										} 
									}, */
									{
										field : 'send_type',
										title : '配送方式',
										width : 80,
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
										field : 'handling_stata',
										title : '付款方式',
										width : 80,
										align : 'center',
										formatter : function(val, row, index) {
											if (val == 2) {
												return "转账";
											} else if (val == 1) {
												return "现金";
											} else if (val == 0) {
												return "未结算";
											} else if (val == 3) {
												return "支票";
											} else if (val == 4) {
												return "其他";
											}
										}
									}, {
										field : 'end_address',
										title : '到站',
										width : 55,
										align : 'center'
									}, {
										field : 'receipt_address',
										title : '送货详细地址',
										width : 100,
										align : 'center'
									}, {
										field : 'handling_shenhe',
										title : '审核状态',
										width : 80,
										align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "未审核";
											} else if (val == 1) {
												return "审核中";
											} else if (val == 2) {
												return "审核通过";
											} else if (val == 3) {
												return "审核未通过";
											}
										}
									}, {
										field : 'department_name',
										title : '部门名称',
										width : 80,
										align : 'center'
									}, {
										field : 'settlyf_time',
										title : '结算日期',
										width : 80,
										align : 'center'
									}, {
										field : 'username',
										title : '结算人',
										width : 80,
										align : 'center'
									}, {
										field : 'settlyf_remaks',
										title : '结算备注',
										width : 80,
										align : 'center'
									}, {
										field : 'settlyf_th_times',
										title : '提审日期',
										width : 80,
										align : 'center'
									}, {
										field : 'usernameth',
										title : '提审人',
										width : 80,
										align : 'center'
									}, {
										field : 'settleds_sh_remaks',
										title : '提审备注',
										width : 80,
										align : 'center'
									}, ] ],
							onBeforeEdit : function(index, row) { //可编辑之前
								editval = index;
								row.editing = true;
							},
							onAfterEdit : function(index, row) {//编辑关闭后
								$('#dg').datagrid("endEdit", editval);
								$.ajax({
									type : "post",
									url : 'collect.do?method=updateShippiOrCo',
									data : row,
									success : function(data) {
										//console.log(data);
										// Play with returned data in JSON format
									},
									error : function(msg) {
									}
								});
								/* $('#dg').datagrid("updateRow", {index:index,row:{gain_total:price}}); */
								row.editing = false;
							},
							//双击事件
							onDblClickRow : function(rowIndex, rowData) {
								//双击开启编辑行
								if (editval != rowIndex
										&& rowData.customs_recheck_state != 2) {
									$('#dg').datagrid("endEdit", editval);
									$('#dg').datagrid("beginEdit", rowIndex);
									editval = rowIndex;
								} else {
									editval = undefined;
									$('#dg').datagrid("endEdit", rowIndex);
								}

							},
							onLoadSuccess : function() {
								/*  $('#dg').datagrid('appendRow', {
								  Saler: '<span class="subtotal">合计</span>',
								  TotalOrderCount: '<span class="subtotal">' + compute("TotalOrderCount") + '</span>',
								  TotalOrderMoney: '<span class="subtotal">' + compute("TotalOrderMoney") + '</span>',
								  TotalOrderScore: '<span class="subtotal">' + compute("TotalOrderScore") + '</span>',
								  TotalTrailCount: '<span class="subtotal">' + compute("TotalTrailCount") + '</span>',
								  Rate: '<span class="subtotal">' + ((compute("TotalOrderScore") / compute("TotalTrailCount")) * 100).toFixed(2) + '</span>'
								});
								 compute(); */
							},

							pagination : true,//分页
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							toolbar : '#tb'
						});

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
				$("#address").val("");
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

	});
	//编辑
	function bianji() {
		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var fee;

		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			fee = array[i].destination_fee;

		}
		if (id != "") {
			dialog = parent.jy.modalDialog({
				title : '费用结算',
				type : "POST",
				url : 'Destination.do?method=getEditCompanyPagef&pid=' + id
						+ '&fee=' + fee,
				//data :{fee:fee},
				width : 300,
				height : 200,
				buttons : [ {
					text : '<input type="button" class="btncss" value="确定"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});

		} else {
			$.messager.alert("客户结算", " 请选择正确的信息", "info");
		}
	}
	//结算
	function modify() {
		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var a = true;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			if (array[i].write_off == 3) {
				a = true;
			}
		}

		if (a == true) {
			if (id != "") {
				dialog = parent.jy
						.modalDialog({
							title : '费用结算',
							url : 'Destination.do?method=getEdiPagef&pid=' + id,
							width : 500,
							height : 300,
							buttons : [ {
								text : '<input type="button" class="btncss" value="结算"/>',
								handler : function() {
									dialog.find('iframe').get(0).contentWindow
											.submitFormEdit(dialog, grid,
													parent.$);
								}
							} ]
						});
			}
		} else {
			$.messager.alert("客户结算", " 请选择正确的信息", "info");
		}
	}
	function compute(colName) {
		var rows = $('#dg').datagrid('getRows');
		var total = 0;
		for ( var i = 0; i < rows.length; i++) {
			total += parseFloat(rows[i][colName]);
		}
		return total;
	}
	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {
			send_times : $.trim($("#send_times").val()),
			send_time : $.trim($("#send_time").val()),
			jiesuStata : $.trim($("#jiesuStata").val()),
			jiesuantimes : $.trim($("#jiesuantimes").val()),
			jiesuantime : $.trim($("#jiesuantime").val()),
			order_time : $.trim($("#order_time").val()),
			order_times : $.trim($("#order_times").val()),
			shipindi : $.trim($("#shipindi").val()),

			shenhe : $.trim($("#shenhe").val()),
			car_time : $.trim($("#car_time").val()),

			car_number : $.trim($("#car_number").val()),
			driver_name : $.trim($("#driver_name").val()),

		});

	}
	//详细信息
	function CheckManager(pid) {
		dialog = parent.jy.modalDialog({
			title : '费用结算',
			url : 'Handling.do?method=getShippingshenhe&pid=' + pid,
			width : 800,
			heght : 400,
		});
	}
	//重置
	function reset() {
		$("#send_time").val("");
		$("#send_times").val("");
		$("#shipindi").val("");
		$("#jiesuStata").val("");
		$("#shenhe").val("");
		$("#kuhu_date").val("");
		$("#jiesuStata").val("");
		$("#jiesuantime").val("");
		$("#jiesuantimes").val("");
		$("#order_time").val("");
		$("#order_times").val("");
	}
	/* function del() {
	var array = $("#dg").datagrid('getSelections');
		var id = [];
		var a = false;
	for ( var i = 0; i < array.length; i++) {
		id.push(array[i].custom_id); //注意修改你的id列 
		if (array[i].jiesuStata != 3) {
			a = true;
		}
	}
	
		if (a== true) {
			$.messager.confirm('确认', '您确定要取消核销吗？', function(r) {
				if (r) {
					$.ajax({
						url : 'collect.do?method=editKuhu&pid=' + id,
						type : "POST",
						data : {
							id:id.join(",")
						},
						success : function(data) {
							if (data.flag == false) {
								parent.$.messager.alert("其他费核销", "取消核销成功",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert('取消核销', '你选择的信息没有核销', 'info');
		}

	} */
	document.onkeydown = function(event) {
		e = event ? event : (window.event ? window.event : null);
		if (e.keyCode == 13) {
			//执行的方法 
			searchCar_owner();
		}
	};
	//		提审	
	function settlementSh() {
		var ids = [];
		var row = $("#dg").datagrid('getSelections');
		var ds = false;
		if (row.length > 0) {
			for ( var i = 0; i < row.length; i++) {
				ids.push(row[i].shiping_order_id);
				//alert(row[i].shiping_order_id);	
				/* 	  				if (row[i].customs_recheck_state==0&&row[i].write_off!=3) {
									 	ds = true;
									} */
			}
		}
		if (ds == false) {
			dialog = parent.jy.modalDialog({
				title : '结算提审',
				url : 'Destination.do?method=getArraignedClose&pid='
						+ ids.join(","),
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
			$.messager.alert("结算提审", "请选则正确信息！", "info");
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
	//审核
	function shenhetijiao() {
		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var shpid = [];
		var i;
		var j;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			//i = array[i].driver_id;
			j = array[i].handling_shenhe;
			//shpid.push(array[i].shiping_order_id);
			var shp = shpid.join(",");
			/* 	if (array[i].company_id !=0) {
					
				} */
		}

		if (id != "") {
			if (j == 1) {
				dialog = parent.jy
						.modalDialog({
							title : '费用结算',
							url : 'Handling.do?method=getDriverCh&id='
									+ id.join(","),
							data : {},
							width : 700,
							height : 450,
							buttons : [
									{
										text : '<input type="button" class="btncss" value="通过"/>',
										handler : function() {
											dialog.find('iframe').get(0).contentWindow
													.submitFormEdit(dialog,
															grid, parent.$);
										}
									},
									{
										text : '<input type="button" class="btncss" value="驳回" style="margin-left: 10px;"/>',
										handler : function() {
											dialog.find('iframe').get(0).contentWindow
													.submitFormReject(dialog,
															grid, parent.$);
										}
									}, ],

						});
			} else {
				$.messager.alert("费用结算", " 请选择审核中的信息！", "info");
			}
		} else {
			$.messager.alert("费用结算", " 请选择一行信息！", "info");
		}
	}
</script>
<body class="easyui-layout">
	<form action="Handling.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable class="divlabel">发车日期:</lable>
			<input id="send_time" class="Wdate" name=" send_time"
				style="width:150px;height:22px; "
				onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="send_times" class="Wdate" name=" send_times"
				style="width:150px;height:22px; "
				onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable class="divlabel">运单编号:</lable>
			<input type="text" id="shipindi" name="shipindi" class="search-text"
				style="width:150px;height:22px;" /> <label class="divlabel">客户名称:</label>
			<input type="text" id="jiesuStata" name="jiesuStata"
				class="search-text" style="width:150px;height:22px;" /> <a
				class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">

				<label class="divlabel">是否审核:</label> <select id='shenhe'
					name="shenhe" style="width:50px;height:22px">
					<option value="">全部</option>
					<option value="0">未审核</option>
					<option value="1">审核中</option>
					<option value="2">审核通过</option>
					<option value="3">审核未通过</option>

				</select> <label class="divlabel">结算日期:</label> <input id="jiesuantime"
					class="Wdate" name="jiesuantime" style="width:150px;height:22px; "
					onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				- <input id="jiesuantimes" class="Wdate" name="jiesuantimes"
					style="width:150px;height:22px; "
					onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				<label class="divlabel">制单日期:</label> <input id="order_time"
					class="Wdate" name="order_time" style="width:150px;height:22px; "
					onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				- <input id="order_times" class="Wdate" name=" order_times"
					style="width:150px;height:22px; "
					onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			</div>
		</div>
		<div region="center">
			<table id="dg" title="汇总信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true"
				onclick="shenhetijiao()">审核</a> <a href="javascript:void(0)"
				class="easyui-linkbutton" id="outputCar_owner"
				data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a>
             <a href="javascript:void(0)"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-reset',plain:true" onclick="reset()">重置</a>
			<div title='审核中'
				style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>审核中</span>
			</div>
		</div>
		<input type="hidden" name="method" value="getCustomerOup"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle"> <input
			type="hidden" id="checkarray" name="checkarray">
	</form>
</body>
</html>