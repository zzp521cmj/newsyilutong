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
<title>中转费核销</title>
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
		grid = $("#dg")
				.datagrid(
						{
							url : 'payable.do?method=getDelivery',
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
							}, {
								field : 'shiping_order_num',
								title : '订单编号',
								width : 80,
								align : 'center'
							}, 

							{
								field : 'trade_agency',
								title : '代收款',
								width : 80,
								align : 'center'
							},  {
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
										field : 'paid',
										title : '应收',
										width : 80,
										align : 'center'
									},{
										field : 'paid_chayi',
										title : '实收',
										width : 80,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 2,
												validType : 'paid_chayi'
											}
										},
										formatter : function(val, row, index) {

											if (val == null || val == "") {
												return row.paid;
											} else {
												return row.paid_chayi;
											}
										}
									},
									{
										field : 'tifu_chayi',
										title : '差异',
										width : 80,
										align : 'center',
										formatter : function(val, row, index) {

											if (row.paid_chayi == null || val == "") {
												 return Number(Number(row.paid)
														- Number(row.paid));
											} else {
												return Number(Number(row.paid_chayi)
														- Number(row.paid));
											}
										}
										}, {
								field : 'send_remarks',
								title : '送货备注',
								width : 120,
								align : 'center',
								editor : {
									type : 'text',
									options : {

										validType : 'send_remarks'
									}
								}
							}, {
								field : 'send_fee',
								title : '应付送货费',
								width : 80,
								align : 'center'
							}, {
								field : 'send_fee1',
								title : '实付送货费',
								width : 80,
								align : 'center',
								editor : {
									type : 'numberbox',
									options : {
										precision : 2,
										validType : 'send_fee1'
									}
								},
								formatter : function(val, row, index) {

									if (val == null) {
										return row.send_fee;
									} else {
										return row.send_fee1;
									}
								}
							}, {
								field : 'send_remarks1',
								title : '应付送货费核销备注',
								width : 120,
								align : 'center',
								editor : {
									type : 'text',
									options : {
										precision : 2,
										validType : 'send_remarks1'
									}
								}
							},
							{
								field : 'is_recept',
								title : '回单状态',
								width : 80,
								align : 'center'
							}, {
								field : 'send_time',
								title : '送货日期',
								width : 80,
								align : 'center'
							}, {
								field : 'car_name',
								title : '送货司机',
								width : 80,
								align : 'center'
							},{
								field : 'send_station',
								title : '发站',
								width : 80,
								align : 'center'
							}, {
								field : 'end_address',
								title : '到达地',
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
								field : 'receipt_address',
								title : '送货地址',
								width : 80,
								align : 'center'
							}, {
								field : 'write_off1',
								title : '核销方式',
								width : 80,
								align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
										return "打卡";
									} else if (val == 1) {
										return "现金";
									} else if (val == 3) {
										return "未核销";
									}
								}
							},

							{
								field : 'send_date',
								title : '核销日期',
								width : 80,
								align : 'center'
							}, 
							{
								field : 'Send_remarks1',
								title : '核销备注',
								width : 80,
								align : 'center'
							}, 
							
							
							
							
							
							
							
							
							
							{
								field : 'create_time',
								title : '协议制作日期',
								width : 80,
								align : 'center'
							}, {
								field : 'people_song',
								title : '核销人',
								width : 80,
								align : 'center'
							}, ] ],
							onBeforeEdit : function(index, row) { //可编辑之前
								editval = index;
								row.editing = true;
							},
							onAfterEdit : function(index, row) {//编辑关闭后

								$('#dg').datagrid("endEdit", editval);
								$
										.ajax({
											type : "post",
											url : 'payable.do?method=updateShippingOrders',
											data : row

											,
											success : function(data) {
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
								var data = $('#dg').datagrid('getData');
								//最后一行取消编辑
								if (rowIndex < data.rows.length - 1) {
									//双击开启编辑行
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
								if (row.shiping_order_num != '合计'
										&& row.write_off1 != 3) {
									return 'color:blue;';
								}

							},
							onLoadSuccess : function(data) {
								//添加合计行
								$('#dg').datagrid('appendRow', {
									shiping_order_num : '合计',
									trade_agency : compute("trade_agency"),
									send_fee : compute("send_fee"),
									send_fee1 : compute("send_fee1")
								});
								//合并单元格
								var merges2 = [ {
									field : 'shiping_order_num',
									index : data.rows.length - 1,
									colspan : 7,
									rowspan : 1
								}, {
									field : 'pay_type',
									index : data.rows.length - 1,
									colspan : 5,
									rowspan : 1
								} ]
								for ( var i = 0; i < merges2.length; i++)
									$('#dg').datagrid('mergeCells', {
										index : merges2[i].index,
										field : merges2[i].field,
										colspan : merges2[i].colspan,
										rowspan : merges2[i].rowspan
									});
							},
							/*  onLoadSuccess:function(){
							 $('#dg').datagrid('appendRow', {
							  Saler: '<span class="subtotal">合计</span>',
							  TotalOrderCount: '<span class="subtotal">' + compute("TotalOrderCount") + '</span>',
							  TotalOrderMoney: '<span class="subtotal">' + compute("TotalOrderMoney") + '</span>',
							  TotalOrderScore: '<span class="subtotal">' + compute("TotalOrderScore") + '</span>',
							  TotalTrailCount: '<span class="subtotal">' + compute("TotalTrailCount") + '</span>',
							  Rate: '<span class="subtotal">' + ((compute("TotalOrderScore") / compute("TotalTrailCount")) * 100).toFixed(2) + '</span>'
							});
							 compute();
							},
							 */
							pagination : true,//分页
							pageSize : 10,
							pageList : [ 10, 20,30,40,50,60,100 ],
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
	function modify() {

		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			if (array[i].write_off1 == 3) {
				a = true;
			}
		}

		if (a == true) {
			if (id != "") {

				dialog = parent.jy
						.modalDialog({
							title : '费用核销',
							url : 'payable.do?method=getEditCompanyPage1&pid='
									+ id,
							width : 500,
							height : 300,

							buttons : [ {
								text : '<input type="button" class="btncss" value="核销"/>',
								handler : function() {
									dialog.find('iframe').get(0).contentWindow
											.submitFormEdit(dialog, grid,
													parent.$);
								}
							} ]
						});
			}
		} else {
			$.messager.alert("中转费核销", " 请选择正确的信息", "info");
		}
	}
	function compute(colName) {
		var rows = $('#dg').datagrid('getRows');
		var total = 0;
		for ( var i = 0; i < rows.length; i++) {
		if(rows[i][colName]!=null&&rows[i][colName]!=''){
			total += parseFloat(rows[i][colName]);
			}			
		}
		return total;
	}
	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {

			send_station : $.trim($("#send_station").val()),
			end_address : $.trim($("#end_address").val()),
			send_time : $.trim($("#send_time").val()),
			car_name : $.trim($("#car_name").val()),
			send_date : $.trim($("#send_date").val()),
			create_time : $.trim($("#create_time").val()),
			write_off1 : $.trim($("#write_off1").val()),
			receipt : $.trim($("#receipt").val()),
			goods_name : $.trim($("#goods_name").val()),
			goods_num : $.trim($("#goods_num").val()),
			pay_type : $.trim($("#pay_type").val()),
			send_fee : $.trim($("#send_fee").val()),
			yy : $.trim($("#yy").val()),
			dd : $.trim($("#dd").val()),
			ss : $.trim($("#ss").val()),
			sp : $.trim($("#sp").val()),
		});

	}

	//重置
	function reset() {
		$("#send_station").val("");
		$("#end_address").val("");
		$("#send_time").val("");
		$("#car_name").val("");
		$("#send_date").val("");
		$("#create_time").val("");
		$("#write_off1").val("");
		$("#receipt").val("");
		$("#goods_name").val("");
		$("#goods_num").val("");
		$("#pay_type").val("");
		$("#send_fee").val("");
		$("#dd").val("");
		$("#ss").val("");
		$("#yy").val("");
			$("#sp").val("");
	}
	/* function del() {
		var array = $("#dg").datagrid('getSelections');
		var id = [];
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
		}
		if (array != "") {

			$.messager.confirm('确认', '您确定要取消核销吗？', function(r) {
				if (r) {
					$.ajax({
						url : 'payable.do?method=updateSonghuo&pid=' + id,
						type : "POST",
						data : {
							id : id.join(",")
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
			$.messager.alert('取消核销', '请选择要核销的信息', 'info');
		}

	} */
		function del() {
		var array = $("#dg").datagrid('getSelections');
			var id = [];
			var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].shiping_order_id); //注意修改你的id列 
			if (array[i].write_off1 != 3) {
				a = true;
			}
		}
	
			if (a== true) {
							$.messager.confirm('确认', '您确定要取消核销吗？', function(r) {
					if (r) {
						$.ajax({
							url : 'payable.do?method=updateSonghuo&pid=' + id,
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
				$.messager.alert('取消核销', ' 请选择正确的信息', 'info');
			}

		} 
		document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};
  			//导出
  	function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
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
  			//alert(array[i].shiping_order_id);
  			}
  		 $("#fieldName1").val(fieldName.join(","));
  		 $("#headtitle1").val(colName.join(","));
  		 $("#checkarray").val(checkarray.join(","));
  		var outdfrom=$("#outdfrom");
  		outdfrom.submit();		
  		}else{
  			$.messager.alert("应付中转费","请选择要导出的信息","info");
  		}
  	}
  		
</script>
<body class="easyui-layout">
	<form action="payable.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable class="divlabel">单号:</lable>
			<input type="text" class="search-text" id="sp"
				style="width:70px">
			<lable class="divlabel">发站:</lable>
			<input type="text" class="search-text" id="send_station"
				style="width:70px">
			<lable class="divlabel">到达地:</lable>
			<input type="text" class="search-text" id="end_address"
				style="width:70px">
				<lable class="divlabel">收货人:</lable>
			<input type="text" class="search-text" id="receipt"
				style="width:70px">
				<lable class="divlabel">物品名称:</lable>
			<input type="text" class="search-text" id="goods_name"
				style="width:70px">
			<lable class="divlabel">送货日期:</lable>
			<input id="send_time" class="Wdate" readonly="readonly"
				style="width:70px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
				-
			<input id="yy"  class="Wdate"  readonly="readonly" style="width:50px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
			<a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<lable>送货司机:</lable>
				<input type="text" class="search-text" id="car_name" style="width:70px;height:22px; ">
				<lable class="divlabel">核销日期:</lable>
				<input id="send_date" class="Wdate" readonly="readonly"
					style="width:50px;height:22px; "
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
					-
			<input id="dd"  class="Wdate"  readonly="readonly" style="width:50px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
				<lable class="divlabel">协议制作日期:</lable>
				<input id="create_time" class="Wdate" readonly="readonly"
					style="width:50px;height:22px; "
					onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
					-
			<input id="ss"  class="Wdate"  readonly="readonly" style="width:50px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
				<td>核销:</td>
				<td><select id='write_off1' name="write_off1"
					style="width:50px;height:22px">
						<option></option>
						<option value="0">打卡</option>
						<option value="1">现金</option>
						<option value="3">未核销</option>
				</select></td>
				
				
				<lable class="divlabel">件数:</lable>
			<input type="text" class="search-text" id="goods_num"
				style="width:70px">
				<lable class="divlabel">付费方式:</lable>
				<td><select id='pay_type' name="pay_type"
					style="width:70px;height:22px">
						<option></option>
						<option value="0">回付</option>
						<option value="1">现付</option>
						<option value="2">提付</option>
						<option value="3">货到前付</option>
				</select></td>
				<lable class="divlabel">金额:</lable>
			<input type="text" class="search-text" id="send_fee"
				style="width:70px">
				
			</div>
		</div>
		<div region="center">
			<table id="dg" title="汇总信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="modify()">核销</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消核销</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出</a>
		
		</div>
		<input type="hidden" name="method" value="getDiliveryleOutpa">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
	</form>
	<form action="payable.do" id="outdfrom" method="post">
		<input type="hidden" name="method" value="getGouXuanOutpa">
		<input type="hidden" id="fieldName1" name="fieldName">
		<input type="hidden" id="headtitle1" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
    </form>
</body>
</html>