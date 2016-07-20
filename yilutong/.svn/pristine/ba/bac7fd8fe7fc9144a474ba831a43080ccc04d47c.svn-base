<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>运费调整模块</title>
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
  <script type="text/javascript">
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'transpfree.do?method=getTransportfree',
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
				if ((row.transpfree_sh!=1)&&row.is_settlementyf!=1){
					return 'color:blue;';
				}else if(row.transpfree_sh==1){
					return 'color:rgb(255, 4, 4);';
				}
			},
  			columns : [[
  				{field : 'shiping_order_id',checkbox : true},
  				{field : 'transpfreeing',title : '调整详情',width : 90,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  					value = "<a href='javascript:void(0)'onclick= 'OrderUpdates(\""+row.shiping_order_id+"\")'>查看详情</a>&nbsp";
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
  					{field : 'custom_name',title : '客户名称',width : 60,align:'center'},  				
  					{field : 'transport_pay',title : '运费总额',width : 70,align:'center'/* sortable: true */},
  					{field : 'transpfrees',title : '调整金额',width : 100,align:'center',sortable:'true'},
  					{field : 'transpfree_time',title : '调整日期',width : 120,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  				if(value!=undefined){
			  				value=value.substr(0,19);
			  				}
			  					return value;
			  				} 				 
			  					},			  		
			  			{field : 'username',title : '操作人',width : 80,align:'center',sortable:'true'},
			  			{field : 'transpfree_remaks',title : '调整原因',width : 100,align:'center',sortable:'true'},			  		
			  			{field : 'transpfree_th_times',title : '提审日期',width : 120,align:'center',sortable:'true',
  						formatter: function(value,row,index){
			  				if(value!=undefined){
			  				value=value.substr(0,19);
			  				}
			  					return value;
			  				} 				 
			  					},
			  			/* {field : 'transpfree_th_users',title : '提审操作人',width : 80,align:'center',sortable:'true'}, */
			  			{field : 'transpfree_th_notes',title : '提审备注',width : 100,align:'center',sortable:'true'},
			  			{field : 'transpfree_sh',title : '是否需审核',width : 80,align:'center',
		  				formatter:function(val,row,index){
		  						if(val==4){
		  							return "未调整";
		  						}else if(val==0){
		  							return "未审核";
		  						}else if(val==1){
		  							return "审核中";
		  						}else if(val==2){
		  							return "审核通过";
		  						}else if(val==3){
		  							return "审未通过";
		  						}
		  						}
		  				},				
			  	{field : 'is_settlementyf',title : '是否结算运费', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  							if(val==0){
  							return "未结算";
  						}else if(val==1){ 						
  						return "现金";
  						}else if(val==2){ 						
  						return "刷卡";
  						}else if(val==3){ 						
  						return "支票";
  						}else if(val==4){ 						
  						return "其他";
  						}
  					}
  				},
			  	{field : 'send_station',title : '发站',width : 80,align:'center'},
  				{field : 'end_address',title : '到站',width : 80,align:'center'}, 			
  				{field : 'car_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
  				{field : 'receipt_address',title : '收货地址',width : 100,align:'center'},
  				{field : 'goods_name',title : '货物',width : 60,align:'center'},
  				{field : 'send_type',title : '配送方式',width : 70,align:'center',
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
  				{field : 'shipping_order_name',title : '制单人',width : 60,align:'center',sortable:'true'}, 			
  			
  			]],
  			pagination:true,//分页
		    pageSize:30,
		    pageList:[30,40,50,70,100],
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
		
		$.trim($("#isdelivery").combobox("setText","全部")); 	 
		$.trim($("#types").combobox("setText","全部")); 	 
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
	 	 		ddId:$.trim($("#ddId").val()),
	 	 		kname:$.trim($("#kname").val()),
	 	 	//	phone_number:$.trim($("#phone").val()),
	 	 		types:$.trim($("#types").combobox("getValue")), //寄出
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				isdelivery:$.trim($("#isdelivery").combobox("getValue")),//是否提货
  				start_date1 :startDate1,
	 	 		end_date1 :endDate1,
	 	 		start_date2 :startDate2,
	 	 		end_date2 :endDate2,
	 	});	  
	 	
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
									parent.$.messager.alert("运单接收","运单信息寄出成功",'info',
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
  	}
  	/*
  	提交审核 
  	*/
  	function dealtishen(){
  		var ids=[];
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length>0){
	  			for(var i=0;i<row.length;i++){
	  			if(row[i].transpfree_sh==0){//&&row[i].is_settlementyf==0
	  				ids.push(row[i].shiping_order_id);	  	
	  				}	  		
		  		}
		  	}		
		  	if(ids.length>0){
	  			dialog = parent.jy.modalDialog({
				title : '调整提审',
				url : 'transpfree.do?method=thTraspfree&pid=' + ids.join(","),
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
  				$.messager.alert("运费调整","请选择未审核且未结算信息","info");
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
			 
			 if(col.field!="transpfreeing"){
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
		 var ids=[];
		 	var row=$("#dg").datagrid('getSelections');		 	
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
	  			if((row[i].transpfree_sh!=1)&&row[i].is_settlementyf==0){
	  				ids.push(row[i].shiping_order_id);	  
	  				ids.push(row[i].transport_pay);	 	
	  				ids.push(row[i].transpfrees);	 		
	  				}	  		
		  		}	
		  	}else {
			$.messager.alert("运费调整","请选择一条未调整或者未审核且未结算信息","info");
		}			 
		if(ids.length>0){
		  	dialog = parent.jy.modalDialog({
			title : '运费调整',
			url : 'transpfree.do?method=edittraspfree&pid='+ids.join(","),
/* 				 buttons :'#addbuttons'
*/
			width : 600,
			height:270,
			buttons : [{
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});	
		 
		}else {
			$.messager.alert("运费调整","请选择一条未调整或者未审核且未结算信息","info");
		}
	};
 
	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#kname").val("");
		$("#types").combobox("setValue",""); 
		$("#types").combobox("setText","全部");
		$("#isdelivery").combobox("setValue",""); 
		$("#isdelivery").combobox("setText","全部"); 
		$("#startDate1").val("");
		$("#endDate1").val("");
		$("#startDate2").val("");
		$("#endDate2").val("");
	}
	//查看详情
  		function OrderUpdates(ids){
  			dialog = parent.jy.modalDialog({
			title : '运费调整记录',
			url : 'transpfree.do?method=TransportfreeRC&pid='+ids,
/* 				 buttons :'#addbuttons'
*/
			width : 870,
			height:500,
		});	
  	}
  	
 
  </script>
  <body class="easyui-layout">
  	<form action="transpfree.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>发车日期 :</lable>
			<input  id="startDate"  class="Wdate"  name="start_date"  readonly="readonly" style="width:110px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate" name="end_date"    readonly="readonly" style="width:110px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  name="ddId"   style="width:110px"  >
	    	 <lable >客户名称:</lable>
	    	 <input type="text" class="search-text" id="kname" name="kname"   style="width:110px"  >
	    	 <lable>是否审核:</lable>
			<select  class="easyui-combobox"  id="types" name="types"  style="width:110px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="0">未审核</option>
				<option  value="1">审核中</option>
				<option  value="2">审核通过</option>			
				<option  value="3">审核未通过</option>						
			</select>
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">	    	
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable >是否调整:</lable>
			<select  class="easyui-combobox"  id="isdelivery"  name="isdelivery"style="width:110px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option  value="">全部</option>
				<option  value="4">未调整</option>
				<option  value="0">已调整</option>
			</select>
			 <lable class="divlabel">调整日期:</lable>
			<input  id="startDate2"  class="Wdate" name="start_date2" readonly="readonly" style="width:110px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate2"  class="Wdate" name="end_date2" readonly="readonly" style="width:110px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable class="divlabel">提审日期:</lable>
			<input  id="startDate1"  class="Wdate" name="start_date1" readonly="readonly" style="width:110px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate1"  class="Wdate"  name="end_date1"  readonly="readonly" style="width:110px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		 	
    		</div>    		
    	</div>
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
		     <!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="add()">新增</a>		
		   		<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a> -->
			<div title='审核中' style='height: 16px;background:rgb(255, 4, 4);-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核中</span></div>
		<div title='可调整' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>可调整</span></div>
		</div>	
		<input type="hidden" name="method" value="getTransportfreeOut">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id=checkarray name="checkarray">
		</form> 
  </body>
</html>