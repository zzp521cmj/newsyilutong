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
</head>
<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
		grid = $("#dg").datagrid({
			url : 'receipt.do?method=getRemarkslist',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			
          /* 双击事件  */onDblClickRow:function(rowIndex, rowData){
				  			var pid=rowData.customer_id;
							dialog = parent.jy.modalDialog({
									title : '运单查看',
									url : 'receipt.do?method=ReceiptOrder&pid='+pid,
									width : 1200,
									heght: 700,
									buttons : [{
										handler : function() {
											dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
										}
									}] 
								}); 		
  				},
  	
		columns : [ [
									{
										field : 'ck',
										checkbox : true
									}, {
										field : 'customer_grade',
										title : '客户层级',
										width : 80,
										align : 'center',
											formatter : function(val, row, index) {
												if (val == 0) {
												return "散货";
												} else if (val == 1) {
												return "大宗";
												} else if (val == 2) {
												return "项目落仓";
											}
										}
									},
									{
										field : 'customer_num',
										title : '客户编码',
										width : 130
									},
									{
										field : 'customer_name',
										title : '客户名称',
										width : 130
									},
									{
										field : 'customer_tel',
										title : '联系方式',
										width : 110,
										align : 'left'
									},
									{
										field : 'customer_teltoo',
										title : '备用联系方式',
										width : 110,
										align : 'left'
									},
									{
										field : 'customer_address',
										title : '地址',
										width : 110,
										align : 'left',
										formatter : function(value, row, index) {
											var content = '<div  title="' + value + '">'
													+ value + '</div>';
											return content;
										}
									},{
										field : 'wholepoll',
										title : '总票数',
										width : 110,
										align : 'left'
									},{
										field : 'startpoll',
										title : '已开票数',
										width : 110,
										align : 'left'
									},{
										field : 'netpoll',
										title : '未开票数',
										width : 110,
										align : 'left'
									},{
										field : 'shouldmoney',
										title : '应开发票金额',
										width : 110,
										align : 'left'
									},{
										field : 'netmoney',
										title : '实开发票金额',
										width : 110,
										align : 'left'
									},
							/*   {field:'user_name',title:'修改人',width:100,align:'left'} */
							] ],
							pagination : true,
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
								toolbar : '#tb'
						});

/* 	//能更多条件
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
}); */
	});		
  	
	//查询
	function searchCar_owner() {
		$("#dg").datagrid(
				'load',
				{
					remark_name : $.trim($("#remark_name").val()),//客户名称

					order_id : $.trim($("#order_id").val()),//运单号
				kuhu_date:$.trim($("#kuhu_date").val()),//订单时间
	 	 		kuhu_dates:$.trim($("#kuhu_dates").val()),//	
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

	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		var checkarray=[];
		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
					checkarray.push(row[i].customer_id);	  				
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
	//开票
	function tijiao() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {	
				if (row[i].invoice_state == 0) {
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
			
			}else{
				$.messager.alert("发票处理", "此运单不需要发票", "info");
			};
						
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
		$("#remark_name").val("");
		$("#order_id").val("");
		
		$("#kuhu_date").val("");
		$("#kuhu_dates").val("");
	}
	
	
</script>
<body class="easyui-layout">
	<form action="receipt.do" id="outputform" method="post">
	
		<div region="north" title="检索" class="st-north" border="false"
			 collapsible="false">
			<lable>客户名称 ：</lable>
			<input type="text" class="search-text" id="remark_name" name="remark_name"
				style="width:120px; margin-right:0px">
				<lable>运单号：</lable>
		<input type="text" class="search-text" id="order_id" id="order_id"
				style="width:120px; margin-right:0px">
						<lable class="divlabel">制单日期:</lable>
	    	 <input  id="kuhu_date"  class="Wdate"   style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})"  />
	    	 -
	    	 <input  id="kuhu_dates"  class="Wdate"   style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> 
							&nbsp <a	class="easyui-linkbutton" id="" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> 
		</div>
		
		<div region="center">
			<table id="dg" title="客户信息"></table>
		</div>
		<div id="tb">		
			
		<!-- 	<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner"	data-options="iconCls:'icon-edit',plain:true" onclick="tijiao()">开票处理</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick="reset()">重置</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a> -->
		</div>
			<input type="hidden" name="method" value="getRemarkdc"> 
			<input	type="hidden" id="fieldName" name="fieldName"> 
			<input	type="hidden" id="headtitle" name="headtitle">
			<input type="hidden" id="checkarray" name="checkarray">
	</form>
	
</body>
</html>