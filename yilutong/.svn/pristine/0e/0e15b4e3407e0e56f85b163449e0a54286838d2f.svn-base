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
<title>中转费结算</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<!-- <script type="text/javascript" src="./js/function.js"></script> -->
<script type="text/javascript" src="./js/function.js"></script>


</head>
<script type="text/javascript">
	var dialog;
	var grid;
	var palg=true;
	$(function() {
	var da = "";
		var fs = $("#functionname").val().split(",");
		for (var i = 0; i < fs.length; i++) {
			if (fs[i] == "添加") {
				$("#tbadd").removeAttr("style");
			} else if (fs[i] == "修改") {
				$("#tbmodify").removeAttr("style");
			} else if (fs[i] == "删除") {
				$("#tbdel").removeAttr("style");
			}

		}
		var btnMoreSearch = $("#btnMoreSearch");
		btnMoreSearch.click(function() {
			if (btnMoreSearch.attr("state") == "close") {
				//主要代码 
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 85
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("收起条件");
				btnMoreSearch.attr("state", "open");
				$("#searchInfoId").css("display", "block");
			} else {
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 61
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("更多条件");
				btnMoreSearch.attr("state", "close");
				$("#searchInfoId").css("display", "none");
			}
		});
	
		grid = $("#dg").datagrid(
						{
							url : 'settleTC_fu.do?method=getCustomerSetYf',
							fit : true,
							rownumbers : true,
							//singleSelect: true,
							selectOnCheck : true,
							checkOnSelect : true,
							sortName: 'money_cha',
							remoteSort:true,
							//双击
							onDblClickRow : function(rowIndex, rowData) {							
								var agreement_id = rowData.agreement_id;
								dialog = parent.jy
										.modalDialog({
											title : '运单信息',
											url : 'settleTC_fu.do?method=settlementTcPage&agreement_id='
													+ agreement_id,
											fit:true,
											buttons : [ {
												handler : function() {
													dialog.find('iframe').get(0).contentWindow.submitForm(dialog,grid,	parent.$);
												}
											} ],
											onDestroy:function(){																																
																			 $("#dg").datagrid('reload');																	
														}
											
										});
							},
								onSortColumn: function(sort,order){
									$('#dg').datagrid('load', {
										agreement_number : $.trim($("#agreement_number").val()),
										agreement_type : $.trim($("#agreement_type").val()),
										agreementstartdate:$.trim($("#agreementstartdate").val()),
										agreementenddate:$.trim($("#agreementenddate").val()),
										sort:sort,
										order:order,
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
								field : 'agreement_id',
								checkbox : true
							},{
								field : 'agreement_number',
								title : '协议编号',
								width : 100,
								align : 'center'
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
								field : 'company_name',
								title : '转运公司',
								width : 100,
								align : 'center',
						
				    		},{
								field : 'send_station',
								title : '起始地',
								width : 100,
								align : 'center'
							},{
								field : 'end_address',
								title : '到达地',
								width : 100,
								align : 'center'
							},{
								field : 'car_number1',
								title : '车牌号',
								width : 100,
								align : 'center'
							},{
								field : 'car_name',
								title : '司机',
								width : 70,
								align : 'center'
							},  {
								field : 'allnuns',
								title : '总票数',
								width : 80,
								align : 'center',
							},{
								field : 'seetls',
								title : '已结票数',
								width : 80,
								align : 'center',
							},{
								field : 'notseetls',
								title : '未结票数',
								width : 100,
								align : 'center',								
							},{
								field : 'transport_pays',
								title : '应付中转费',
								width : 80,
								align : 'center',
								
							}, {
								field : 'trade_cha',
								title : '实付中转费',
								width : 80,
								align : 'center',							
							},{
								field : 'money_cha', //trade_cha as cy
								title : '差异',
								width : 100,
								align : 'center',
								sortable:true	
							}, 
							{
								field : 'create_time', //trade_cha as cy
								title : '协议制作日期',
								width : 120,
								align : 'center',
							}, 
							] ],
							pagination : true,//分页
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							toolbar : '#tb'
						});

			$("#agreement_type").combobox("setValue",""); 
				$("#agreement_type").combobox("setText","全部");
	});
		
	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {
			agreement_number : $.trim($("#agreement_number").val()),
			agreement_type : 	$("#agreement_type").combobox("getValue"),
			agreementstartdate: $.trim($("#agreementstartdate").val()),
			agreementenddate: $.trim($("#agreementenddate").val()),
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
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var checkarray=[];
		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
					checkarray.push(row[i].agreement_id);	  				
		  			}		  			
		  		}	
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			
		} 
		$("#fieldName").val(fieldName.join(","));
  		$("#headtitle").val(colName.join(","));
  		$("#checkarray").val(checkarray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}

		function reset(){
				$("#agreement_number").val("");
				
				$("#agreementstartdate").val("");
				$("#agreementenddate").val("");
				$("#agreement_type").combobox("setValue",""); 
				$("#agreement_type").combobox("setText","全部");
			
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
	<form action="settleTC_fu.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable>协议编号:</lable>
			<input type="text" class="search-text"  id="agreement_number" name="agreement_number"
				style="width:120px; margin-right:0px">
				<lable class="divlabel">协议制作日期:</lable>
			<input  id="agreementstartdate"  class="Wdate" name="agreementstartdate" readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="agreementenddate"  class="Wdate" name="agreementenddate" readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
          <lable>协议类型:</lable>
			<select class="easyui-combobox" id="agreement_type" name="agreement_type"
				style="width:120px;"
				data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">班线</option>
				<option id="" value="1">配送</option>
				<option id="" value="2">转运</option>
			</select> 
			<a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> 
			
		</div>
		<div region="center">
			<table id="dg" title="中转费结算"></table>
		</div>
		<div id="tb">	
		<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton"
				id="outputCar_owner" data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a> -->
		</div>
		<input type="hidden" name="method" value="getCustomerSetYfout">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
	</form>
	<input id="functionname" type="hidden" value=${function}>
</body>
</html>
