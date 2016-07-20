<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>车主信息管理</title>
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
  </head>
  <%
	String flg = (String) request.getAttribute("flg");
	%>
  <script type="text/javascript">
  
	  	var dialog;
 		var grid;
  		$(function(){
  			var pid='<%=flg%>';
  			grid=$("#dg").datagrid({
  			url : 'car_owner.do?method=getUpdateCar_owner',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				//{field : 'stutas_id',title : '操作',width : 60,align:'center'},
  				{field : 'carOwnerName',title : '车主姓名',width : 80,align:'center'},
  				{field : 'gender',title : '性别',width : 50,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "男";
  						}else if(val==1){
  						return "女";
  						}
  					}
  				},
  				{field : 'phoneNumber',title : '手机号',width : 90,align:'center'},
  				{field : 'cardNumber',title : '身份证号',width : 120,align:'center'},
  				{field : 'plate_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'drivingLicense',title : '驾驶证号',width : 100,align:'center'},
  				{field : 'drivingType',title : '准驾车型',width : 80,align:'center'},
  				{field : 'employmentCertifiedCard',title : '上岗证从业资格证件号',width : 150,align:'center'},				
  				//{field : 'employmentType',title : '从业类型',width : 80,align:'center'},
  				{field : 'address',title : '住址',width : 100,align:'center'},
  				{field : 'drivingRecord',title : '记录',width : 110,align:'center'},
  				//{field : 'updateDate',title : '更新日期',width : 80,align:'center'},
  				
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  		});
  		
  	});
  	
  </script>
  <body class="easyui-layout">
    	<div region="center" >
    		<table id="dg" title="车主信息" ></table>
    	</div>
	<div>
		<form action="driver.do" id="outputform" method="post">
		<input type="hidden" name="method" value="outDriverExcel">
		<input type="hidden" id="datas" name="datas">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
	</div>
  </body>
</html>