<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/TMS/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>协议信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css">
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
<!-- 	<script type="text/javascript" src="./js/function.js"></script>命名按钮方法  -->
	
  
  </head>
  <%
	String[] pid = (String[]) request.getAttribute("flg");
	User user = (User) request.getSession().getAttribute(
			SessionInfo.SessionName);
				String d=request.getSession().getAttribute(SessionInfo.SessionDepts).toString();
  	String[] did=d.substring(1, d.length()-1).split(",");
%>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
		var pid=[];
		var did=[];
<%--  		<%for (int i = 0; i < pid.length; i++) {%>
 			pid.push('<%=pid[i]%>');
 		<%}
 		%>
 		<%for (int i = 0; i < did.length; i++) {%>
 			did.push('<%=did[i]%>');
 		<%}
 		%> --%>
  		$(function(){
  			grid=$("#dg").datagrid({
  			//url : 'paiched.do?method=getOrderPD&pid='+pid.join(",")+'&did='+did.join(","),
  			url : 'shipManual.do?method=getCustomerFahuo',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
  		rowStyler: function(index,row){
				if (row.numorder==0){
				return 'color: blue;';
				}
				}, 		
  			columns : [[
						{field : 'orderid',checkbox : true},
									
						{field : 'customer_name',title : '客户名称',width : 80,align:'center'},
						{field : 'customer_teltoo',title : '客户电话',width : 100,align:'center'},
						{field : 'customer_tel',title : '客户手机',width : 100,align:'center'},
						{field : 'customer_address',title : '客户详细地址',width : 300,align:'center'},
		
  			]],
  			onLoadSuccess:function(){
  				var carId = $(window.parent.document).find('#company').get(0).contentWindow.document.getElementById('ddids');
  				if(carId.value!=''&&carId.value!=null){
  					$('#dg').datagrid('selectRecord',carId.value);	
  				}
            },
  			onSelect:function(index,data){
  			$("#custom_name").val(data.customer_name);
                  
			},
  			pagination:true,//分页
		    pageSize:50,
		    pageList:[50,100,150,200],
  			toolbar : '#tb',
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
  function searchOder() {

			$("#dg").datagrid('load',{	
					
			name : $.trim($("#odernum").val()),
		});
	}
  		
  	  	
  	  var submitForms = function($dialog, $grid, $pjq, $mainMenu) {
  	
  	  			
  			var company=$(window.parent.document).find('#company').get(0).contentWindow;
 			//var rows = $('#dg').datagrid('getSelections');
 			company.document.getElementById('custom_name').value=$("#custom_name").val();
 			
 			//company.document.getElementById('receipt').value=$("#receipt").val();
 			
 	 		company.document.getElementById('customer_address').value=$("#customer_address").val();
 			company.document.getElementById('customer_teltoo').value=$("#customer_teltoo").val();
 			company.document.getElementById('customer_tel').value=$("#customer_tel").val(); 
 		    $dialog.dialog('close');
            $grid.datagrid('reload');
  				
 			};
  	  function clearuser(){
			if($("#selectuser").text()!="请选择"){
				$("#selectuser").text("请选择");
				$("#selectuserid").text("");
				$("#channelId").text("");
				$("#message_touserid").val("");
				$("#message_tousername").val("");
				$("#cnid").val("");
				$("#dg").datagrid('clearSelections');
				$("#dg").datagrid('reload');
			}
		}
  	
 	function addShipOrder() {
	 	var array = $('#dg').datagrid('getSelections');
	 /* 	for(var i=0;i<pid.length;i++){
 		if((pid[i].charAt(pid[i].length-1))!='='){
 		alert(pid[i])		
 			 if(i==0){
  				$("#ddids").append(pid[i]);
  			}else{
  				$("#ddids").append(",");
  			$("#ddids").append(pid[i]);
  			}				
 		}
 		} */
  		if($("#selectuserid").text()!=""){
  			$("#ddids").val($("#selectuserid").text());
  		}else if(array.length!=0){
  			for(var i=0;i<array.length;i++){
  			if(i==0&&($("#ddids").val()==''||$("#ddids").val()==null)){
  				$("#ddids").append(array[i].orderid);
  			}else{
  			$("#ddids").append(",");
  			$("#ddids").append(array[i].orderid);
  			}				
  			}
  			$("#ddids").val($("#ddids").text());
  		}
	};
	//重置
	function reset(){
		$("#cname").select2("val",'');			
		$("#stime").val("");
		$("#etime").val("");
		$("#scity").select2("val",'');
		$("#trtype").select2("val",'');
		$("#ecity").select2("val",'');	
		$("#goodname").val("");
		$("#odernum").val("");
	}

  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
  	    
    	<div region="north" title="检索" class="st-north" border="false"  height="60px" collapsible="false"  >    	
	    	      <lable >客户名称：</lable>
	    	 <input type="text" class="search-text" id="odernum"  style="width:130px;margin-right: 0px;"  >
	    	 <a class="easyui-linkbutton" onclick="searchOder()" data-options="iconCls:'icon-search'" >查询</a>	
<!-- 	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
			</div> -->
    	</div>
    	<div region="center" >
    		<table id="dg" title="客户信息" ></table>
    	</div>
    	<div id="tb">
		  <!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="addShipOrder()">制作协议</a> -->
		    <!--<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="getUpdateCar_owner()">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteShipOrder()">删除</a>
		 <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a>
		     <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="daShipOrder()">打印</a> -->
		</div>	
		<input type="hidden" id="ddids" name="ddids"/>
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">

		</form>
  </body>
</html>