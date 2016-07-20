<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
  <%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>运单提货信息管理</title>
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
	<script type="text/javascript" src="./js/function.js"></script><!--命名按钮方法  -->
	
  
  </head>
    <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);%>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var flag=false;
 		var costomid='<%=user.getCostomersid()%>';
 		if(costomid=="null"||costomid==""){
  			costomid='';
  			}else{
  			 flag=true;
  			}	
  		$(function(){
  			$("#costomid").val(costomid);
  			grid=$("#dg").datagrid({
  			url : 'ChangeO.do?method=getDeliveryOrderInfo&costomid='+costomid,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
  		rowStyler: function(index,row){
				if (row.is_takes==0){
					return 'color:blue;';
				/* }else if (row.is_print==1&&row.is_takes==0){
					return 'color:rgb(221, 54, 211);'; */
				/* }else if(row.is_print==0&&row.is_takes==0){
					return 'color:rgb(255, 4, 4);'; */
				}
			},
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'send_time',title : '发车时间',width : 120,align:'center',sortable:'true',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},
  					{field : 'custom_name',title : '客户名称',width : 60,align:'center',	
  					formatter:function(val,row,index){
  						if(costomid!="null"&&costomid!=""&&flag){
  							$("#kname").val(val);
  							$("#kname").attr("readonly", "readonly");
  							//document.getElementById("kname").readonly="true";	
  							}
  							return val;
  					}},
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'},				
  			 	{field : 'shipping_order_state',title : '状态',width : 80,align:'center',
  					formatter:function(val,row,index){
  					if(val==4){
  						return "已签收";
  					}else{ 
  						return "未签收";			
  					}
  					}	
  				}, 
  					{field : 'transpfreess',title : '查看图片',width : 90,align:'center',sortable:'true',
  								formatter: function(value,row,index){
			  					if (row.shipping_order_state < 4) {
												return "运单未签收或无图片";
											} else {
												return "<a href='javascript:void(0)' style='color:red' title='点击查看签收图片' onclick=\"showimg('"
														+ row.shiping_order_id
														+ "')\">点击查看</a>";
											}
			  				} 				 
			  			},  		
  				{field : 'sign_user',title : '签收人',width : 70,align:'center'},
  				{field : 'sign_usernumber',title : '签收人证件',width : 70,align:'center'},
  				{field : 'sign_name',title : '签收代理人',width : 70,align:'center'},
  				{field : 'sign_number',title : '签收代理人证件',width : 70,align:'center'},
  				{field : 'sign_time',title : '签收日期',width : 70,align:'center'},
  				{field : 'sign_remarks',title : '签收备注',width : 70,align:'center'},
  			/* 	{field : 'sign_username',title : '签收经办',width : 70,align:'center',
  				 formatter:function(val,row,index){
  						if(val==null){
  							return sign_username;
  						}
  					}	
  				},	 */	 			
  				/* {field : 'is_print',title : '是否打印',width : 80,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未打印";
  						}else if(val==1){
  							return "已打印";
  						}
  						}
  				},
  					{field : 'printtime',title : '打印日期',width : 120,align:'center',sortable:'true',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  					}, 
				{field : 'printer',title : '打印操作人',width : 80,align:'center',sortable:'true'}, */
  				{field : 'is_takes',title : '是否提货',width : 80,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未提货";
  						}else if(val==1){
  							return "已提货";
  						}
  						}
  				},
  					{field : 'take_times',title : '提货日期',width : 120,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  				if(value!=undefined){
			  				value=value.substr(0,19);
			  				}
			  					return value;
			  				} 				 
			  					},
			  			{field : 'takers',title : '提货操作人',width : 80,align:'center',sortable:'true'},
			  			{field : 'send_station',title : '发站',width : 80,align:'center'},
  				{field : 'end_address',title : '到站',width : 85,align:'center'},			
  				{field : 'car_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
  				{field : 'receipt_address',title : '收货地址',width : 100,align:'center'},
  				{field : 'goods_name',title : '货物',width : 60,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 70,align:'center'/* sortable: true */},
			  			{field : 'shipping_order_name',title : '制单人',width : 60,align:'center',sortable:'true'},
  				{field : 'remarks',title : '订单备注',width : 80,align:'center',sortable:'true'},	
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[10,20,30,40,50,70,100],
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
			$("#types").combobox("setValue",""); 
			$("#types").combobox("setText","全部");
			$("#isdelivery").combobox("setValue",""); 
			$("#isdelivery").combobox("setText","全部"); 
			$("#startDate1").val("");
			$("#endDate1").val("");
			$("#startDate2").val("");
			$("#endDate2").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
	//回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
		
		$.trim($("#isdelivery").combobox("setText","全部")); 	 
		$.trim($("#types").combobox("setText","全部")); 	 
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		var startDate1=document.getElementById("startDate1").value;
  		var endDate1=document.getElementById("endDate1").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */  	
  		$("#dg").datagrid('load',{
  				start_date :$("#startDate").val(),
	 	 		end_date :$("#endDate").val(),
	 	 		ddId:$.trim($("#ddId").val()),
	 	 		kname:costomid,
	 	 	//	phone_number:$.trim($("#phone").val()),
	 	 		//types:$.trim($("#types").combobox("getValue")), //打印
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				isdelivery:$.trim($("#isdelivery").combobox("getValue")),//是否提货
  				start_date1 :$("#startDate1").val(),
	 	 		end_date1 :$("#endDate1").val(),
	 	 		kname:$.trim($("#kname").val()),
	 	 		start_date2 :$("#startDate2").val(),
	 	 		end_date2 :$("#endDate2").val(), 
	 	});	  
  	}
  	//提货处理
  	function dealDelivery(){
  		var checkarray=[];
  		var checkip='';
  		var h=0;
	 	var array = $('#dg').datagrid('getSelections');
	 	if(array.length>0){
  		for(var i=0;i<array.length;i++){
  		if(/* array[i].is_print==1&& */array[i].is_takes==0){
  			checkarray.push(array[i].shiping_order_id);
  			}else{
  				checkip=checkip+array[i].shiping_order_num+"  "; 				
  			h++;
  			}
  		}	
	  	if(checkip!=""){
	  			$.messager.alert('提示','您选中的运单有'+h+'条，且单号'+checkip+'不能执行提货操作！','info',function(r){    
				      if(checkarray != ""){
				  			$.messager.confirm('确认','您确定要操作选中的记录吗？',function(r){ 
				    			if (r){ 
				    				$.ajax({
										url: "ChangeO.do?method=updateFreeOrder",
										type: "POST",
										data:{deal:checkarray.join(",")},
							  				success:function(data){
							  					if (data.flag) {
													parent.$.messager.alert("客户提货","客户提货成功",'info',
														function(r) {
															$('#dg').datagrid('reload');
				 										});
				  								} 
				  						}
									});
								}  			
				  			});
			  		}else{
			  			$.messager.alert("客户提货","请选择未提货单的运单","info");
			  		}
				        } 				 
	  			);	
		  	}else{
					  	if(checkarray != ""){
			  			$.messager.confirm('确认','您确定要操作选中的记录吗？',function(r){ 
			    			if (r){ 
			    				$.ajax({
									url: "ChangeO.do?method=updateFreeOrder",
									type: "POST",
									data:{deal:checkarray.join(",")},
						  				success:function(data){
						  					if (data.flag) {
												parent.$.messager.alert("客户提货","客户提货成功",'info',
													function(r) {
														$('#dg').datagrid('reload');
			 										});
			  								} 
			  						}
								});
							}  			
			  			});
			  		}else{
			  			$.messager.alert("客户提货","请选择未提货单的运单","info");
			  		}					  	
		  		}
		  	}else{
			$.messager.alert("客户提货","请选择未提货单的运单","info");		
				}
		}
			
  	  	//接收处理取消
  	function dealBackOrderUpdate(){
  		var checkarray=[];
  		var checkip='';
  		var i=0;
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  		checkarray.push(array[i].shiping_order_id);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要取消接收选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "ChangeO.do?method=dealBackOrderUpdate",
						type: "POST",
						data:{deal:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单接收","运单信息接收取消成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("客户回单","请选择要接收的信息","info");
  		}
  	}
  	//寄出处理
  	function dealNotBack(){
  		var checkarray=[];
  		var checkip='';
  		var i=0;
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  			}
  		/* 	if(array[i].is_receive==1){
  				checkarray.push(array[i].shiping_order_id);
  				}else{
  						checkip=checkip+array[i].shiping_order_num+"  ";
  						i++;
  				}
  			}
	  	if(checkip!=""){
	  			$.messager.confirm('提示','您选中的订单有'+i+'条，且单号'+checkip+'不能执行寄出！')	
	  			} */
  		if(array != ""){
  			$.messager.confirm('确认','您确定要寄出选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "ChangeO.do?method=dealNotBackOrder",
						type: "POST",
						data:{deal:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单寄出","运单信息寄出成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("客户回单","请选择要寄出的信息","info");
  		}
  	}/**
        签收
  	**/
  		function searchMsgQs(){
  		var row=$("#dg").datagrid('getSelections');
  		var isok=0;
  		var id="";
		for(var i=0;i<row.length;i++){
			if(row[i].is_takes==1){
					id=row[i].shiping_order_id;
					isok=row[i].shipping_order_state;			
			}
		
		}
  		if(row.length==1&&id!=""){
	  		if(isok==4){
		  		dialog = parent.jy.modalDialog({
					title : '运单详情',
					url : 'shipOrder.do?method=getEditSignShipOrderPage&pid=' + id+'&isok=4',
					width : 680,
					buttons : [{
						text : '',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
						}
					}] 
				});
	  		}else{
			  	dialog = parent.jy.modalDialog({
					title : '运单详情',
					url : 'shipOrder.do?method=getEditSignShipOrderPage&pid=' + id+'&isok=0',
					width : 680,
					buttons : [{
						text : '<input type="button" id="btncss"  class="btncss" value="签收"/>',
						handler : function() {
							dialog.find('iframe').get(0).contentWindow.qs(dialog, grid, parent.$);
						}
					}] 
				});
	  		}
  		}else{
	  		$.messager.alert("运单签收", '请选择一行已提货未签收的信息', 'info');
	  	}
  	}
  	
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '订单修改',
				url : 'ChangeO.do?method=getEditChangeOrderPage&pid=' + id,
				width : 680,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("客户回单","请选择一行信息","info");
  		}	
  	}
  	//修改
  	function updateUser(){
	 var myform=document.forms[1];
  	 myform.action="car_owner.do?method=updateCar_owner";
  	 myform.submit();
	
	}
  	
  	//导出
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		var checkarray=[];
		var array = $('#dg').datagrid("getSelections");
  		if(array != ""){
	  		for(var i=0;i<array.length;i++){
	  			checkarray.push(array[i].shiping_order_id);			
	  			}
  			}
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
				if(col.field!="transpfreeing"&&col.field!="transpfreess"&&col.field!="shipping_order"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 					
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		 $("#checkarray").val(checkarray.join(","));
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
				if(col.field!="transpfreeing"&&col.field!="transpfreess"&&col.field!="shipping_order"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 				
		} 	 
  		if(array != ""){
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
  			
  			}
  		 $("#fieldName1").val(fieldName.join(","));
  		 $("#headtitle1").val(colName.join(","));
  		 $("#checkarray").val(checkarray.join(","));
  		var formout=$("#formout");
  		formout.submit();		
  		}else{
  			$.messager.alert("客户回单","请选择要导出的信息","info");
  		}
  	}
 	function eidtChange() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		 	var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}	
		  			dialog = parent.jy.modalDialog({
			title : '收费明细',
			url : 'ChangeO.do?method=AddchangeOrder&pid='+id,
/* 				 buttons :'#addbuttons'
*/
			width : 680,
			height:350,
			buttons : [{
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});	
	
		}else {
			$.messager.alert("客户回单","请选择一行信息","info");
		}
	};
  	//打印
  	function dy(){
  	var pid=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
		  			if(row[i].is_takes==0){
		  				pid.push(row[i].shiping_order_id);
		  			}	  			
		  		}
							var url="ChangeO.do?method=getShipOrderPrint&pid="+pid.join(",");
							ow(url);
  		}else{
  			$.messager.alert("客户回单","请选择一行信息","info");
  		}	
  	
  	}
  	function ow(owurl){ 
			var tmp=window.open("about:blank","","fullscreen=1");
			tmp.moveTo(0,0); 
			tmp.resizeTo(screen.width+20,screen.height); 
			tmp.focus(); 
			tmp.location=owurl; 
			} 
  	//导入
  	function putintfile() {
		dialog = parent.jy.modalDialog({
			title : '导入订单',
			url : 'ChangeOrder.do?method=imp',
			width : 600,
			height: 300,
			buttons : [{
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#types").combobox("setValue",""); 
		$("#types").combobox("setText","全部");
		$("#isdelivery").combobox("setValue",""); 
		$("#isdelivery").combobox("setText","全部"); 
		$("#startDate1").val("");
		$("#endDate1").val("");
		$("#startDate2").val("");
		$("#endDate2").val("");
		if(costomid!="null"&&costomid!=""&&flag){ 					  						
 							//document.getElementById("kname").readonly="true";	
  							}else{	$("#kname").val("");}
	}
	
	function showimg(obj) {
		dialog = parent.jy.modalDialog({
			title : '图片详情',
			url : 'shipOrder.do?method=getimgurl&iurl=' + obj,
			width : 680,
			buttons : [ {
				text : '',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.qs(dialog, grid,
							parent.$);
				}
			} ]
		});
	}
  </script>
  <body class="easyui-layout">
  	<form action="ChangeO.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>发车日期 :</lable>
			<input  id="startDate"  class="Wdate"  name="start_date"  readonly="readonly" style="width:140px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate" name="end_date"    readonly="readonly" style="width:140px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  name="ddId"   style="width:140px"  >
	    	 <lable >客户名称:</lable>
	    	 <input type="text" class="search-text" id="kname" name="kname"   style="width:140px"  >
	    	<!--  <lable>是否打印:</lable>
			<select  class="easyui-combobox"  id="types" name="types"  style="width:110px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="0">未打印</option>
				<option  value="1">已打印</option>			
			</select> -->
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">	    	
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable >是否提货:</lable>
			<select  class="easyui-combobox"  id="isdelivery"  name="isdelivery"style="width:140px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="1">已提货</option>
				<option  value="0">未提货</option>
			</select>
			<lable class="divlabel">签收日期:</lable>
			<input  id="startDate2"  class="Wdate" name="start_date2" readonly="readonly" style="width:110px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd'})" />
			-
			<input id="endDate2"  class="Wdate" name="end_date2" readonly="readonly" style="width:110px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd'})" />
		
			<lable class="divlabel">提货日期:</lable>
			<input  id="startDate1"  class="Wdate" name="start_date1" readonly="readonly" style="width:140px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate1"  class="Wdate"  name="end_date1"  readonly="readonly" style="width:140px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		 	
    		</div>
    	</div>
    	<div region="center" >
    	<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
		     <!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="add()">新增</a>-->
		
			<div title='未提货' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未提货</span></div>
		</div>	
		<input type="hidden" name="method" value="outDeliveryOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
		<input type="hidden" id="costomid" name="costomid">
		</form>	
  </body>
</html>