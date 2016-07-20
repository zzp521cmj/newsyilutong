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
<title>发票信息查询</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>

	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/function.js"></script>
</head>
<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
		grid = $("#dg").datagrid({
		  type : "POST",
			url : 'invoice.do?method=selectinvoice',
	
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
  				rowStyler:function(index,row){
 					
								if (row.invoice_type==0 ){
										return 'color:blue';
								}
								 if(row.invoice_type==1){
								  return 'color: green';
								}
							
						},
						
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'shiping_order_num',
				title : '运单号',
				width : 100,
				align : 'center'
			}, {
				field : 'transport_pay',
				title : '运费金额',
				width : 100,
				align : 'center'
			},{
				field : 'receipt_number',
				title : '发票编号',
				width : 100,
				align : 'center',
					formatter : function(val, row, index) {
					if (val == null) {
						return "还未处理";
					} else {
						return val;
					}
				}
			},
			 {
				field : 'invoice_type',
				title : '发票状态',
				width : 110,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "已处理";
					} else if (val == 1||val==null) {
						return "未处理";
					}
				}
			},{
				field : 'receipt_dime',
				title : '开票日期',
				width : 140,
				align : 'center',
					formatter : function(val, row, index) {
					if (val == null) {
						return "还未处理";
					} else {
						return val;
					}
				} 
			},{
				field : 'receipt_remark',
				title : '备注',
				width : 140,
				align : 'center',
					formatter : function(val, row, index) {
					if (val == null) {
						return "还未处理";
					} else {
						return val;
					}
				}
			}
			//{field : 'updateDate',title : '更新日期',width : 80,align:'center'},
			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});

	
	});		
  	
	//查询
		function searchCar_owner() {
		var receiptstartdate = document.getElementById("receiptstartdate").value;
		var receiptendate = document.getElementById("receiptendate").value;
		$("#dg").datagrid(
				'load',
				{
					receiptstartdate : receiptstartdate, //上报时间
					receiptendate : receiptendate,
			
					shiping_order_num : $.trim($("#shiping_order_num").val()),//运单号
				/* 	invoice_state : $.trim($("#invoice_state").combobox('getValue')),//审核状态 */
				whether : $.trim($("#whether").combobox('getValue')),//审核状态
				});

	}
	//导出
	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		var checkarray=[];
			var array = $('#dg').datagrid("getSelections");
		if(array != ""){
			for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].order_id);
  			}
  			}
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
		 $("#invoiceid").val(checkarray.join(","));
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
  			checkarray.push(array[i].order_id);
  			}
  		 $("#fieldName1").val(fieldName.join(","));
  		 $("#headtitle1").val(colName.join(","));
  		 $("#invoiceid").val(checkarray.join(","));
  		var formout=$("#formout");
  		formout.submit();		
  		}else{
  			$.messager.alert("开票导出","请选择要导出的信息","info");
  		}
  	}
	
	//开票
	function tijiao() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {	
					if(row[i].whether==null){
					var pid = row[i].order_id;

					$.ajax({
						type : "POST",
						url : "receipt.do?method=disposereceipt",
						data : {
						shiping_order_num : pid,
						},
						success : function(data) {
							$.messager.alert("发票", "操作成功", "info");
							$("#dg").datagrid('load');
						}

					});
			}else{
			$.messager.alert("发票处理", "已做处理", "info");
			}
			
			
						
	}
}else{
	$.messager.alert("发票处理", "请选择一行信息", "info");
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
		$("#receiptstartdate").val("");
		$("#receiptendate").val("");
		$("#shiping_order_num").val("");
		$("#invoice_state").combobox("setValue","");
		$("#whether").combobox("setValue","");
	}

</script>
<body class="easyui-layout">
	<form action="invoice.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
		collapsible="false">
			<lable>发票时间:</lable>
			<input id="receiptstartdate"  name="receiptstartdate"  class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="receiptendate"  name="receiptendate" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable>运单编号:</lable>
			<input type="text" class="search-text" id="shiping_order_num"  name="shiping_order_num"
				style="width:120px; margin-right:0px">
				
			<lable>是否处理:</lable>
			<select class="easyui-combobox" id="whether" name="whether" style="width:130px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">已处理</option>
				<option id="" value="1">未处理</option>
			</select>
				 <a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> 
		</div>
		<div region="center">
			<table id="dg" title="开票信息"></table>
		</div>
		<div id="tb">		
	
		    <div title='审核通过' style='height: 16px;background:green;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>有开票未处理</span></div>
		    <div title='待审核' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>有开票已处理</span></div>
		  
		  
		 
		  
		  	
		  	
		</div>
			<input type="hidden" name="method" value="outShipunqualified"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
			<input type="hidden" id="invoiceid" name="invoiceid">
	</form>
	
</body>
</html>