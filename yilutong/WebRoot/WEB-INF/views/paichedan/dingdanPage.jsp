<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>订单信息管理</title>
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
	
  	<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/truck_cloud/"; 
 	%>
 	<%String deid = (String)request.getAttribute("deid"); %>
 	<%String xxx = (String)request.getAttribute("xxx"); %>
  </head>
  <script type="text/javascript">
  
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'paichedan.do?method=getdingdans',
  			border : false,
  			idField:"shiping_order_id",
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			frozenColumns:[[{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '订单号',width : 80,align:'center'}]],
  			columns : [[
  				{field : 'start_address',title : '起运地',width : 80,align:'center'},
  				{field : 'end_address',title : '到达地',width : 80,align:'center'},
  				{field : 'checkp',title : '托运方',width : 90,align:'center'},
  				{field : 'customer_name',title : '收货方',width : 90,align:'center'},
  				{field : 'receipt_address',title : '收货地址',width : 90,align:'center'},
  				{field : 'goods_name',title : '货物',width : 120,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 80,align:'center'},
  				{field : 'check_type',title : '发货方式',width : 100,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "发货人门点";
  						}else if(val==1){
  						return "起运货运站";
  						}
  					}	
  				},
  				{field : 'send_type',title : '送货方式',width : 80,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  						return "送货";
  						}
  					}
  				},
  				{field : 'checktype',title : '发货方式',width : 90,align:'center',hidden:'true'},
  				{field : 'sendtype',title : '提货方式',width : 90,align:'center',hidden:'true'},
  				{field : 'shipping_order',title : '制单人',width : 90,align:'center'},
  				{field : 'check_time',title : '创建时间',width : 140,align:'center'},
  			]],
  			toolbar : '#tb',
  			onLoadSuccess:function(data){
  			for(var i = 0;i<array.length;i++){
  				$('#dg').datagrid('selectRecord',array[i]);
  			}
  		
  			}
  		});
  		var dd='<%=deid%>';
  		var xx ='<%=xxx%>';
  		
  		var array=[];
  		if(dd!=null&&dd!=""&&dd!="null"){
  			$.ajax({
		  			type: "POST",
		  			async : false,
		  			url:'paichedan.do?method=getDemendDingdan',
		  			data:{dd:dd},
		  			success:function(data){
		  			array =data;
		  			}
  		});
  		
  		}
  		if(dd=="null"){
  		array=xx.split(",");
  		}
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
			$("#phone").val("");
			$("#address").val("");
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
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		name:$.trim($("#ddId").val()),
	 	 		phone_number:$.trim($("#phone").val()),
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#drivingType").val())
	 	});	  
	 	
  	}
  	var submitFormdingdan = function($dialog, $pjq,$mainMenu) {
  		var checkarray="";
	 	var array = $('#dg').datagrid('getSelections');
	 	for(var i=0;i<array.length;i++){
	 		checkarray+=array[i].shiping_order_id+",";
		}
		if(array!=""){
		checkarray = checkarray.substring(0,checkarray.length-1);
		}
		var vv = $(window.parent.document).find('#addRelease').get(0).contentWindow.document.getElementById('dingdanhao');
		var font = $(window.parent.document).find('#addRelease').get(0).contentWindow.document.getElementById('font');
		vv.value=checkarray;
		if(checkarray==""||checkarray==null){
		font.innerText="未绑定订单";
		}else{
		font.innerText="已绑定订单";
		}
		  $dialog.dialog('close');
  	};
  	var submitModifyFormdingdan = function($dialog, $pjq,$mainMenu) {
  		var checkarray="";
	 	var array = $('#dg').datagrid('getSelections');
	 	for(var i=0;i<array.length;i++){
	 		checkarray+=array[i].shiping_order_id+",";
		}
		if(array!=""){
		checkarray = checkarray.substring(0,checkarray.length-1);
		}
		var xx = $(window.parent.document).find('#modifyRelease').get(0).contentWindow.document.getElementById('dingdanhao');
		var font =$(window.parent.document).find('#modifyRelease').get(0).contentWindow.document.getElementById('font');
			xx.value = checkarray;
		if(checkarray==""||checkarray==null){
		font.innerText="未绑定订单";
		}else{
		font.innerText="已绑定订单";
		}
		  $dialog.dialog('close');
  	};
  	var submitxiangxiFormdingdan = function($dialog, $pjq,$mainMenu) {
		  $dialog.dialog('close');
  	};
  		//详情查询
  	function getShipOrderPage(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '订单详情',
				url : 'shipOrder.do?method=getShipOrderPage&pid=' + id,
				width : 680,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			alert("请选择一行信息");
  		}	
  	}
  	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#phone").val("");
		$("#address").val("");
	}
  </script>
  <body class="easyui-layout">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>托运日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer'})" />
	    	<lable class="divlabel">订单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:150px"  >
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	<lable >发货人手机:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" >
			<lable class="divlabel">到达地址:</lable>
			<input type="text" class="search-text" id="address" >
			</div>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a>
		<a href="javascript:void(0)" class="easyui-linkbutton" onclick="reset()"data-options="iconCls:'icon-reset',plain:true">重置</a>
		</div>	
    	<div region="center" >
    		<table id="dg" title="订单信息" ></table>
    	</div>
  </body>
</html>