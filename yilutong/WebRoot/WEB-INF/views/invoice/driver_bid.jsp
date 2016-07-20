<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<style type="text/css">
	.search-text1 {
	vertical-align: middle;
  width: 150px;
  margin-right: 9px;
  height: 16px;
	}


</style>
<title>消息推送</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>

</head>
<script type="text/javascript">
		  var dialog;
		 	var grid;
	$(function(){
		 $("#Regform").validationEngine('attach', {
				 promptPosition:'topRight:-15,0'
				 });
		
  			grid=$("#dg").datagrid({
  			url : 'driver_bid.do?method=getwaybill_number',
  			border : false,
  			rownumbers : true,
  			fit : false,
  			height:450,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
	 /*  	onSelect:function(index,data){
				var selectunum=$("#selectunum").text();
				var selectphone=$("#phone_number").text();
				
				if(selectunum=="全部"){
					$("#selectunum").text("");
					$("#selectuserid").text("");
				}
				if($("#selectunum").text()!=""){
					$("#selectunum").append(",");
				}
				if($("#phone_number").text()!=""&&$("#phone_number").text()!=null){
					$("#phone_number").append(",");
				}
		
				$("#selectunum").append(data.shiping_order_num);
				$("#phone_number").append(data.receipt_tel);
				$("#cnid").val($("#channelId").text());
				$("#phone_number").val($("#phone_number").text());
				$("#message_touserid").val($("#selectuserid").text());
				$("#message_tousername").val($("#selectunum").text());
				$('#dg').datagrid('deleteRow', index);
			}, */
			
  			columns : [[
  			
  				{field : 'rownum',title : '排名',width : 70,align:'center',
  				formatter:function(val,row,index){
  	  						return "第"+val+"名";
  	  				}},
  	  					{field : 'waybillnumber',title : '运单量',width : 80,align:'center',
  				formatter:function(val,row,index){
  	  						if(val =="" || val==null){
  	  							return "0";
  	  						}else{
  	  							return val;
  	  						}
  	  				}},
  				{field : 'driver_name',title : '司机姓名',width : 60,align:'center'},
  				{field : 'plate_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'phone_number',title : '手机号',width : 100,align:'center'},
  				{field : 'card_number',title : '身份证号',width : 100,align:'center'},
  				{field : 'address',title : '住址',width : 55,align:'center'}, 
  				
  			
  			
  	 			
 
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
  		
  		
  		
  		
  		
  		
  		
  		grid=$("#dg2").datagrid({
  			url : 'driver_bid.do?method=getdriver_evaluate',
  			border : false,
  			
  			rownumbers : true,
  			fit : false,
  			height:450,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
	 
  			columns : [[
  					
  					{field : 'rownum',title : '排名',width : 70,align:'center',
  				formatter:function(val,row,index){
  	  						return "第"+val+"名";
  	  				}},
  	  				{field : 'grade',title : '评价总分',width : 80,align:'center'},
  				{field : 'driver_name',title : '司机姓名',width : 60,align:'center'},
  					{field : 'plate_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'phone_number',title : '手机号',width : 100,align:'center'},
  				{field : 'card_number',title : '身份证号',width : 100,align:'center'},
  				{field : 'address',title : '住址',width : 55,align:'center'}, 
  			
  		
  			
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  				//能更多条件
		var btnMoreSearch1 = $("#btnMoreSearch1");
	btnMoreSearch1.click(function() {
		 if (btnMoreSearch1.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch1.text("收起");
			btnMoreSearch1.attr("state", "open");
			$("#searchInfoId1").css("display","block");
				$("#phone1").val("");
				$("#send_address").val("");
				$("#end_address").val("");
				$("#perpole").val("");
				$("#pay_state").combobox("setValue","");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch1.text("更多");
			btnMoreSearch1.attr("state", "close");
			$("#searchInfoId1").css("display","none");
		}
});

	var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
				$("#phone").val("");
				$("#send_address").val("");
				$("#end_address").val("");
				$("#perpole").val("");
				$("#pay_state").combobox("setValue","");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
		$('#dlg1').dialog({
			title : '添加',
			width : 380,
			height : 150,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons'
		});
		$('#cc').combobox({ 
			url:'shipOrder.do?method=getMsgModel',
			valueField:'id', 
			textField:'text',
			editable:false,
			 onChange:function(newValue,oldValue){
        		$.ajax({
						type : "POST",
						url : 'shipOrder.do?method=getMsgContent',
						data : {
						msgid:newValue
						},
						success : function(msg) {
							if (msg!=null) { 
								$("#ordeMsgs").val(msg);
							};
						}
					});
    		}
		}); 
	});
	 function addMessage () {
		if($("#Regform").validationEngine('validate')){
			var phone=$("#phone_number").val();
	 		var ordeMsg=$("#ordeMsgs").val();
		  		$.messager.confirm('发送消息', '确定要发送该条消息吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'shipOrder.do?method=sendOrderMsg',
						data : {
						phone:phone,
						orderMsg:ordeMsg
						},
						success : function(msg) {
							if (msg.flag) {
								$.messager.alert('发送消息', '发送消息成功', 'info');
							};
						}
					});
				}
			});
		}
	};

	function searchUser1() {
		$('#dg').datagrid('load', {
			driver_name1 : $.trim($("#driver_name1").val()),
			plate_numbers1 : $.trim($("#plate_numbers1").val()),
			phone1 : $.trim($("#phone1").val()),
		});
	}
	
	function searchUser(){
		$('#dg2').datagrid('load', {
			driver_name : $.trim($("#driver_name").val()),
			plate_numbers : $.trim($("#plate_numbers").val()),
			phone : $.trim($("#phone").val()),
		});
	}
	//键盘回车事件
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchUser();
			}
		};
		
		
</script>
<body  class="easyui-layout">
<div id="mainPanle" region="center"   data-options="region:'west',title:'检索',split:false" >
	<form action="" method="post" id="Regform">
		
	 <div style="padding:10px;">
			<label >司机名：</label><input id="driver_name1" name="driver_name1" type="text"
			class="search-text1" >
			<label >车牌号：</label><input id="plate_numbers1" name="plate_numbers1" type="text"
			class="search-text1">
			<a class="easyui-linkbutton" onclick="searchUser1()"
			data-options="iconCls:'icon-search'" id="searchId1">查询</a>	
			<a id="btnMoreSearch1" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多</a>
	    	 <div id="searchInfoId1" style="display: none">
	    	 <label >电&nbsp;话：</label><input id="phone1" name="phone1" type="text"
			class="search-text1" >
	<!-- 				<lable>签收时间:</lable>
		<input id="qsstartdate1" class="Wdate" readonly="readonly"
				style="width:120px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="qsenddate1" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			 -->
	    	 </div>
	</div>
		<table id="dg"  height="300px"  title="运单量"></table>
	</form>
	</div>
	<div region="east" border="true"  title="检索"  style="width: 560px;" collapsible =" false" id=" " data-options="collapsed:false">
	<form action="" method="post" id="Regform">
	<div style="padding:10px;">
					<label >司机名：</label><input id="driver_name" name="driver_name" type="text"
			class="search-text1" >
			<label >车牌号：</label><input id="plate_numbers" name="plate_numbers" type="text"
			class="search-text1">
			<a class="easyui-linkbutton" onclick="searchUser()"
			data-options="iconCls:'icon-search'" id="searchId">查询</a>	
			<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多</a>
	    	 <div id="searchInfoId" style="display: none">
	    	 <label >电&nbsp;话：</label><input id="phone" name="phone" type="text"
			class="search-text1" >
				<!-- 	<lable>签收时间:</lable>
			<input id="qsstartdate" class="Wdate" readonly="readonly"
				style="width:120px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="qsenddate" class="Wdate" readonly="readonly"
				style="width:120px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			 -->
			 </div>
	</div>
		<table id="dg2"  height="300px"  title="司机评价"></table>
		</form>
	</div>
	
	
</body>
</html>