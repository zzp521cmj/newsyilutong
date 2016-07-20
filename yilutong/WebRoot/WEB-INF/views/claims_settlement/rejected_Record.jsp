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
    <title>驳回记录</title>
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
	<!-- <script type="text/javascript" src="./js/function.js"></script>命名按钮方法  -->
	
  
  </head>
  <%
  	User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
   %>
   <%
     String flg = (String) request.getAttribute("flg");
    %>
  <script type="text/javascript">

		var s;
	  	var dialog;
 		var grid;
 		//显示列表
  		$(function(){
  		   var claimsid='<%=flg%>';
  			grid=$("#dg").datagrid({
  			url : 'claims_settlement.do?method=RecordList&claimsid='+claimsid,
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
  			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'numbersid',
				title : '理赔单号',
				width : 70,
				align : 'center'
			}, {
				field : 'custom_name',
				title : '发货客户',
				width : 100,
				align : 'center'
			}, {
				field : 'receipt',
				title : '收货客户',
				width : 80,
				align : 'center'
			}, {
				field : 'compensation_payments',
				title : '理赔金',
				width : 70,
				align : 'center'
			},  {
				field : 'claims_state',
				title : '理赔单状态',
				width : 80,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "审核通过";
					} else if (val == 1) {
						return "未审核";
					} else if (val == 2) {
						return "审核未通过";
					}else if (val == 3) {
						return "待审核";
					}
				},
			}, {
				field : 'claims_time',
				title : '理赔发起时间',
				width : 120,
				align : 'center',
			}, {
				field : 'damage_intensity',
				title : '事故分析及处理结果',
				width : 80,
				align : 'center'
			},{
				field : 'audit_opinion',
				title : '审核意见',
				width : 80,
				align : 'center'
			},

			] ],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
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
			$("#audit_state").val("");
			$("#startDate1").val("");
			$("#endDate2").val("");
			$("#phone").val("");
			$("#send_adress").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
  		 $('#cc3').combotree({    
    		url: "depn.do?method=getTree&&id=",    
    		width: 150,
    		onBeforeLoad: function(node, param) {
    		
                if (node == null) {
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
		}); 
  	});
  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
    	<input type="hidden" id="claimsid" name="claimsid">
    	<div region="center" >
    		<table id="dg" title="驳回记录" ></table>
    	</div>
		</form>
  </body>
</html>

