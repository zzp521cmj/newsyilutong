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
<title>发票管理</title>
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
<%
	String pid = (String) request.getAttribute("flg");
%>
</head>
<script type="text/javascript">

	var dialog;
	var grid;
	 
	$(function() {
	var pids='<%=pid%>';	
	$("#pids").val(pids);
		grid = $("#dg").datagrid({
		  type : "POST",
			url : 'receipt.do?method=selectreceipt&pid='+pids,
	
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
		
	//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#auditsign").combobox("setValue",""); 
			$("#auditsign").combobox("setText","全部");
			$("#documents_state").combobox("setValue",""); 
			$("#documents_state").combobox("setText","全部"); 
			
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
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
								parent.$.messager.alert("上报信息", "上报信息到达 ",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("产品上报", "请选择一行信息", "info");
		}
	}

	
	//取消开票
	function update() {
	var checkarray = [];
		var num = 0;
		var number=0;
		var row = $("#dg").datagrid('getSelections');
		if (row.length > 0) {
			for ( var i = 0; i < row.length; i++) {
				if (row[i].invoice_state == 0){
			if(row[i].invoice_type==1){
					num=num+1;
			}else{			
										checkarray.push(row[i].order_id);			
			}
			
			}else{
				$.messager.alert("取消发票", "此订单无发票，不可以取消发票", "info");
			};
	}
}else{
	$.messager.alert("发票处理", "请选择一行信息", "info");
}
if(num==0){
if(checkarray.length>0){
$.ajax({
				type: "POST",
		  			url:'receipt.do?method=selectlistreceipt',
		  			data :{pid : checkarray.join(",")},
		  			success:function(msg){
		  			if(msg.flag){
		  				$.messager.alert("取消发票", "你选中的订单中 已经有超过30天，不可以取消发票", "info");
		  			}else{
		  			$.ajax({
						type : "POST",
						url : "receipt.do?method=updatereceipt",
						data : {
					pid : checkarray.join(",")
						},
						success : function(data) {
							$.messager.alert("发票", "操作成功", "info");
							$("#dg").datagrid('load');
						}
					});
		  			}
		  			}
				
				})

					
					}
					
					}else{
						$.messager.alert("发票", "你选中的有"+num+"条未处理", "info");
					}
}




	function tijiao() {
	var a=0;
  		var ids;
  		var row=$("#dg").datagrid('getSelections');
  			if (row.length ==1) {

			for ( var i = 0; i < row.length; i++) {
				if (row[i].invoice_type == 0 ) {
				a=a+1;
				}else{
					ids=(row[i].order_id);
			}	
			}
			if(a>0){
				$.messager.confirm('提示', '您选中的运单中有'	+a+ '条，已提交，不能再次提交！');
				}else{
		  	if(ids!=0){
	  			dialog = parent.jy.modalDialog({
				title : '结算提审',
				url : 'receipt.do?method=makedispose&pid=' + ids,
				width :450,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="确定"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
			}else{
				$.messager.alert("发票", "请至少选择一行信息", "info");
			}		
	}
	}else{
	$.messager.alert("发票", "请选中一条订单", "info");
	}
	}
	
	
	
	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}
	//导出
		function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		var checkarray=[];
		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
					checkarray.push(row[i].order_id);	  				
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
		$("#checkarray").val(checkarray.join(","));
		var outputform = $("#outputform");
		outputform.submit();
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
		$("#receiptstartdate").val("");
		$("#receiptendate").val("");
		$("#shiping_order_num").val("");
		$("#invoice_state").combobox("setValue","");
		$("#whether").combobox("setValue","");
	}
	
	
</script>
<body class="easyui-layout">
	<form action="receipt.do" id="outputform" method="post">
		<input	type="hidden" id="pids" name="pids"> 
		<div region="north" title="检索" class="st-north" border="false"
		collapsible="false">
			<lable>发票时间:</lable>
			<input id="receiptstartdate"   name="receiptstartdate"  class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="receiptendate" name="receiptendate"  class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable>运单编号:</lable>
			<input type="text" class="search-text" id="shiping_order_num"  name="shiping_order_num"
				style="width:120px; margin-right:0px">
				
			<lable>是否处理:</lable>
			<select class="easyui-combobox"  id="whether" name="whether" style="width:130px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">已处理</option>
				<option id="" value="1">未处理</option>
			</select>
				 <a class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> 
		</div>
		<div region="center">
			<table id="dg" title="发票信息"></table>
		</div>
		<div id="tb">		
			
		<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton"	data-options="iconCls:'icon-add',plain:true" onclick="add()"> 添加</a>


			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"	onclick="deleteEver()">删除</a>  -->
			<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner"	data-options="iconCls:'icon-edit',plain:true" onclick="tijiao()">开票处理</a>
									   <a href="javascript:void(0)" class="easyui-linkbutton"	data-options="iconCls:'icon-remove',plain:true" onclick="update()">取消开票</a>

					      
					<!--	   <a href="javascript:void(0)" class="easyui-linkbutton"	data-options="iconCls:'icon-remove',plain:true" onclick="tijiao()"></a>
			 <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
			 	<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出导出</a>
 -->
	
		    <div title='未处理' style='height: 16px;background:green;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未处理</span></div>
		    <div title='已处理' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>已处理</span></div>
		</div>
	<input type="hidden" name="method" value="selectinvoices"> 
			<input	type="hidden" id="fieldName" name="fieldName"> 
			<input	type="hidden" id="headtitle" name="headtitle">
			<input type="hidden" id="checkarray" name="checkarray">
	</form>
	
</body>
</html>

