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
    <title>订单回单信息管理</title>
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
  		var driver_id='<%=user.getDriver_id()%>';
 		if(driver_id=="null"||driver_id==""){
  			driver_id='';
  			}	
  		$(function(){
  			$("#driver_id").val(driver_id);
  			$("#costomid").val(costomid);
  			$('#dlg1').dialog({
			title : '客户回单',
			width : 400,
			height : 230,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons',
			 onClose:function(){
			/* $("#costomers").select2("val", "");
			$("#number_search2").select2("val", "");
			$("#flag").combobox("setValue", "4"); */
			$("#nums").val("");
			$("#company").val("");
			} 
		});
  			grid=$("#dg").datagrid({
  			url : 'ChangeO.do?method=getBackOrderInfo&costomid='+costomid+'&driver_id='+driver_id,
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
				if (row.is_receive==1&&row.is_send==0){
					return 'color:blue;';
				}else if (row.is_receive==0){
					return 'color:rgb(221, 14, 211);';
				}/* else if(row.is_send==1&&row.is_receive==1){
					return 'color:rgb(255, 4, 4);';
				} */
			},
  			columns : [[
  				{field : 'ck',checkbox : true},
  					{field : 'transpfreeing',title : '上传图片',width : 80,align:'center',sortable:'true',
  								formatter: function(value,row,index){
			  					value = "<a href='javascript:void(0)'onclick= 'OrderImg(\""+row.shiping_order_id+"\")'>上传</a>&nbsp";
			  					return value;
			  				} 				 
			  			}, 
  				{field : 'send_time',title : '发车时间',width : 120,align:'center',sortable:'true',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'},
  				{field : 'send_station',title : '发站',width : 100,align:'center'},
  				{field : 'end_address',title : '到站',width : 55,align:'center'},
  				{field : 'custom_name',title : '客户名称',width : 60,align:'center',
  				formatter:function(val,row,index){
  						if(costomid!="null"&&costomid!=""&&flag){
  							$("#kname").val(val);
  							$("#kname").attr("readonly", "readonly");
  							//document.getElementById("kname").readonly="true";	
  							}
  							return val;
  					}
  					},
  				{field : 'send_type',title : '交接方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "客户自提";
  						}else if(val==1){
  						    return "专车送货";
  						}else if(val==2){
  							return "送货进仓";
  						}else if(val==3){
  						    return "送货上楼";
  						}else if(val==4){
  						    return "送货上门";
  						}
  					}
  				}, 
  			 	{field : 'shipping_order_state',title : '状态',width : 50,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
	  							return "未出库";
	  						}else if(val==1){
	  							return "配送中";
	  						}else if(val==2){
	  						return "转运中";
	  						}else if(val==3){
	  						return "到达";
	  						}else if(val==4){
	  						return "签收";
  							}  		
  					}	
  				}, 
  					{field : 'is_recept',title : '回单信息',width : 80,align:'center',sortable:'true'},
  					{field : 'transpfreess',title : '查看图片',width : 90,align:'center',sortable:'true',
  								formatter: function(value,row,index){
			  					if (row.shipping_order_state < 4) {
												return "运单回单或无图片";
											} else {
												return "<a href='javascript:void(0)' style='color:red' title='点击查看签收图片' onclick=\"showimg('"
														+ row.shiping_order_id
														+ "')\">点击查看</a>";
											}
			  				} 				 
			  			}, 
  				{field : 'shipping_order_name',title : '制单人',width : 60,align:'center',sortable:'true'}, 			
  				{field : 'is_receive',title : '是否接收',width : 80,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未接收";
  						}else if(val==1){
  							return "已接收";
  						}
  						}
  				},
  				{field : 'is_send',title : '是否寄出',width : 80,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未寄出";
  						}else if(val==1){
  							return "已寄出";
  						}
  						}
  				},
  					{field : 'is_recept_time',title : '接收日期',width : 120,align:'center',sortable:'true',
  					formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  					},
  					{field : 'is_send_time',title : '寄出日期',width : 120,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  				if(value!=undefined){
			  				value=value.substr(0,19);
			  				}
			  					return value;
			  				} 				 
			  					},
			  					{field : 'is_send_nums',title : '寄出单号',width : 80,align:'center',sortable:'true'},
			  					{field : 'company_kd',title : '快递公司',width : 80,align:'center',sortable:'true'},		
				  				{field : 'car_number',title : '车牌号',width : 80,align:'center'},
				  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
				  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
				  				{field : 'receipt_address',title : '收货地址',width : 100,align:'center'},
				  				{field : 'goods_name',title : '货物',width : 60,align:'center'},
				  				{field : 'goods_packing',title : '包装',width : 60,align:'center'},
				  				{field : 'goods_num',title : '件数',width : 60,align:'center'},
				  				{field : 'goods_weight',title : '重量',width : 60,align:'center'},
				  				{field : 'goods_vol',title : '体积',width : 60,align:'center'},
				  			/* 	{field : 'spe',title : '规格',width : 60,align:'center'}, */
				  				{field : 'transport_pay',title : '运费总额',width : 70,align:'center'/* sortable: true */},
				  				{field : 'remarks',title : '备注',width : 100,align:'center'},
  					  							  			
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
			btnMoreSearch.text("收起");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#phone").combobox("setValue",""); 
			$("#phone").combobox("setText","全部");
			$("#iswrite").combobox("setValue",""); 
			$("#iswrite").combobox("setText","全部"); 
			$("#startDate1").val("");
			$("#endDate1").val("");
			$("#startDate2").val("");
			$("#endDate2").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多");
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
		$.trim($("#iswrite").combobox("setText","全部")); 	 
		$.trim($("#phone").combobox("setText","全部")); 	 
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		var startDate1=document.getElementById("startDate1").value;
  		var endDate1=document.getElementById("endDate1").value;
  		var startDate2=document.getElementById("startDate2").value;
  		var endDate2=document.getElementById("endDate2").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		name:$.trim($("#ddId").val()),
	 	 	//	phone_number:$.trim($("#phone").val()),
	 	 		phone_number:$.trim($("#phone").combobox("getValue")), //寄出
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#iswrite").combobox("getValue")),//是否接收
  				start_date1 :startDate1,
	 	 		end_date1 :endDate1,
	 	 		start_date2 :startDate2,
	 	 		end_date2 :endDate2,
	 	 		custom_name:$.trim($("#kname").val())
	 	});	  
	 	
  	}
  	//接收处理
  	function dealBack(){
  		var checkarray=[];
  		var checkip='';
  		var i=0;
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
		  	 if(array[i].is_receive==0&&array[i].is_send==0){
		  			checkarray.push(array[i].shiping_order_id);
		  			}
		  	}	
	  		/*if(checkip!=""){
	  			$.messager.confirm('提示','您选中的订单有'+i+'条，且单号'+checkip+'不能执行接收！')	
	  			} */
  		if(checkarray != ""){
  			$.messager.confirm('确认','您确定要接收选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "ChangeO.do?method=dealBackOrder",
						type: "POST",
						data:{deal:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单接收","运单信息接收成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("客户回单","请选择要未接收且未寄出的信息","info");
  		}
  	}
  	  	//接收处理取消
  	function notdealBack(){
  		var checkarray=[];
  		var checkip='';
  		var i=0;
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
	 		 	if(array[i].is_receive==1&&array[i].is_send==0){
	  				checkarray.push(array[i].shiping_order_id);
	  				}/* else{
	  						checkip=checkip+array[i].shiping_order_num+"  ";
	  						i++;
	  				} */
  		}
  		if(checkarray != ""){
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
  			$.messager.alert("客户回单","请选择要已接收未寄出的信息","info");
  		}
  	} 
  	//寄出处理 	dlg
  	function dealNotBack(){
  		var checkarray=[];
  		var checkip='';
  		var i=0;
	 	var array = $('#dg').datagrid('getSelections');
	 	for(var i=0;i<array.length;i++){
  		if(array[i].is_receive==1&&array[i].is_send==0){
  				checkarray.push(array[i].shiping_order_id);
  				}else{
  						checkip=checkip+array[i].shiping_order_num+"  ";
  						i++;
  				}		
  			}	 	
			if(checkarray != ""){
				$("#form").form('clear');
				$("#dlg1").dialog('open');
			}else{
					$.messager.alert("客户回单","请选择要已接收未寄出的信息","info");
			}		  	
  		
  	}
  	/**
        取消寄出
  	**/
  		function notdealNotBack(){
  		var checkarray=[];
  		var checkip='';
  		var i=0;
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  		if(array[i].is_receive==1&&array[i].is_send==1){
  			checkarray.push(array[i].shiping_order_id);
  			} 			
  		}
  		if(checkarray != ""){
  			$.messager.confirm('确认','您确定要取消寄出的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "ChangeO.do?method=dealOrderUpdate",
						type: "POST",
						data:{deal:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单寄出","运单信息取消寄出成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("客户回单","请选择要取已寄出的信息","info");
  		}
  	}
  	//寄出处理
  	function dealOrderJc(){
  		var checkarray=[];
  			var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
		  		if(array[i].is_receive==1&&array[i].is_send==0){
		  				checkarray.push(array[i].shiping_order_id);
		  				}
  			}
	  	/*if(checkip!=""){
	  			$.messager.confirm('提示','您选中的运单有'+i+'条，且单号'+checkip+'不能执行寄出！')	
	  			} */
  		if($("#nums").val() != ""&&$("#nums").val()!=null&&$("#company").val() != ""&&$("#company").val()!=null){
  			$.messager.confirm('确认','您确定要寄出选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "ChangeO.do?method=dealNotBackOrder",
						type: "POST",
						data:{deal:checkarray.join(","),
						nums:$("#nums").val(),
						company:$("#company").val()
						},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单寄出","运单信息寄出成功",'info',
										function(r) {
											$("#dlg1").dialog('close');
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("客户回单","请t填写寄出单号和快递公司","info");
  		}
  	}
  	/*
  	修改查询 
  	*/
  	function OrderImg(ids){
  		var row=$("#dg").datagrid('getSelections');
  		/* 	if(row.length==1){}
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}	 */	
	  			dialog = parent.jy.modalDialog({
				title : '上传图片',
				url : 'ChangeO.do?method=backImg&pid=' + ids,
				width : 680,
				height:350,
				buttons : [{
					text : '<input type="button" class="btncss" value="保存"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
					}
				}]
				   ,onClose:function(){
              	$.ajax({
							type : "POST",
							url : 'ChangeO.do?method=shhavepit',})
				   dialog.dialog("destroy");
                }
			});
  		
  			//$.messager.alert("客户回单","请选择一行信息","info");
  			
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
				if(col.field!="transpfreeing"&&col.field!="transpfreess"&&col.field!="shipping_order_state"){
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
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].shiping_order_id;
		  		}	
							var url="ChangeOrder.do?method=getShipOrderPrint&pid="+pid;
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
  	function putintfiles() {
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
		if(costomid!="null"&&costomid!=""&&flag){ 					  						
 							//document.getElementById("kname").readonly="true";	
  							}else{	$("#kname").val("");}
		$("#phone").combobox("setValue",""); 
		$("#phone").combobox("setText","全部");
		$("#iswrite").combobox("setValue",""); 
		$("#iswrite").combobox("setText","全部"); 
			$("#startDate1").val("");
		$("#endDate1").val("");
			$("#startDate2").val("");
		$("#endDate2").val("");
	}
	function showimg(obj) {
		dialog = parent.jy.modalDialog({
			title : '图片详情',
			url : 'ChangeO.do?method=getimgurl&iurl=' + obj,
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
			<input  id="startDate"  class="Wdate"  name="start_date"  readonly="readonly" style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  name="end_date"  readonly="readonly" style="width:120px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"   name="name" style="width:120px"  >
	    	 <lable >客户名称:</lable>
	    	 <input type="text" class="search-text" id="kname"  name="custom_name" style="width:120px"  >	    
	    	  <lable>是否寄出:</lable>
			<select  class="easyui-combobox"  id="phone"  name="phone_number"  style="width:120px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="1">已寄出</option>
				<option  value="0">未寄出</option>
			</select>	
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多</a>
	    	 <div id="searchInfoId" style="display: none">	    	
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->			
			<lable >是否接收:</lable>
			<select  class="easyui-combobox"  id="iswrite"  name="type" style="width:130px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="1">已接收</option>
				<option  value="0">未接收</option>
			</select>
			<lable class="divlabel">接收日期:</lable>
			<input  id="startDate1"  class="Wdate"  name="start_date1"  readonly="readonly" style="width:130px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate1"  class="Wdate"  name="end_date1"  readonly="readonly" style="width:130px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable class="divlabel">寄出日期:</lable>
			<input  id="startDate2"  class="Wdate" name="start_date2" readonly="readonly" style="width:130px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate2"  class="Wdate"  name="end_date2"  readonly="readonly" style="width:130px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />			
			</div>
			 	
    	</div>
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
		     <!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="add()">新增</a>		
		<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putgouxuan()">勾选导出导出</a> -->
		<!-- 	<div title='已寄出已接收' style='height: 16px;background:rgb(255, 4, 4);-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>已寄出已接收</span></div> -->
		<div title='未接收' style='height: 16px;background:rgb(221, 14, 211);-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未接收</span></div>
		    <div title='未寄出' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未寄出</span></div>
		</div>	
		<input type="hidden" name="method" value="outShipOrderHui">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
		<input type="hidden" id="driver_id"  name="driver_id">
		<input type="hidden" id ="costomid" name="costomid">

		</form>	
	<!-- 	<form action="ChangeO.do" id="formout" method="post">
		<input type="hidden" name="method" value="outShi">
		<input type="hidden" id="fieldName1" name="fieldName">
		<input type="hidden" id="headtitle1" name="headtitle">
		<input type="hidden" id=checkarray name="checkarray">
		</form> -->
			<div id="dlg1">
		<fieldset>
		  	<table class="tableclass">
			    <tr>
					<td><font color="red" style="margin-right:10px">*</font>寄出单号:</td>
					<td colspan="1" class="td2">
							<input  id="nums"  name="remarks">
					</td>
			    </tr>
			      <tr>
					<td><font color="red" style="margin-right:10px">*</font>快递公司:</td>
					<td colspan="1" class="td2">
							<input  id="company"  name="company">
					</td>
			    </tr>
			</table>
		    </fieldset>
			<div id="buttons">
				<input type="button" onclick="dealOrderJc()" value="提交" class="btncss"/>   
			</div>
		</div>
  </body>
</html>