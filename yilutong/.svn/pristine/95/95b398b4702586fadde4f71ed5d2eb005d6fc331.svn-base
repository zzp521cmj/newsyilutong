<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.model.Demand_release"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'printpcd.jsp' starting page</title>
      <link href="./images/print.ico" type=image/x-icon rel="shortcut icon" />
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="./easyui/jquery.min.js"></script>
 <script type="text/javascript" src="./js/jqprint/jquery-migrate-1.1.0.js"></script>
  <script type="text/javascript" src="./js/jqprint/jquery.jqprint-0.3.js"></script>
 <script type="text/javascript">
 function  a(){
$("#printinfo").jqprint();
}</script>
<% Demand_release demand_release=(Demand_release)request.getAttribute("printinfo"); %>
  </head>
  
  <body>
<div id="div1">
  <h2 align="center">
    派车单
  </h2>

  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000">
    <tbody><tr>
      <td width="12%" height="20" align="center">
        <span class="style1">派车单编号</span>
      </td>
      <td width="24%" colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getDemandReleaseId() %></span>
      </td>
      <td width="12%" align="center">
        <span class="style1">线路名称 </span>
      </td>
      <td width="20%" colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getLine_name() %></span>
      </td>
      <td width="12%" align="center">
        <span class="style1">车号 </span>
      </td>
      <td width="27%" colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getCar_number() %></span>
      </td>
    </tr>
    <tr>
      <td height="20" align="center">
        <span class="style1">装货城市 </span>
      </td>
      <td colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getZhuangCity() %> </span>
      </td>
      <td align="center">
        <span class="style1">卸货城市 </span>
      </td>
      <td colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getXieCity() %> </span>
      </td>
      <td align="center">
        <span class="style1">方位 </span>
      </td>
      <td colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getRanges() %></span>
      </td>
    </tr>
    <tr>
      <td height="20" align="center">
        <span class="style1">重量 </span>
      </td>
      <td colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getWeight() %> </span>
      </td>
      <td align="center">
        <span class="style1">车长</span>
      </td>
      <td colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getModels()%>
        </span>
      </td>
      <td align="center">
        <span class="style1">联系方式 </span>
      </td>
      <td colspan="2" align="left">
        <span class="style1">&nbsp;<%=demand_release.getContactInformation()%></span>
      </td>
      
    </tr>
    <tr>
      <td height="20" align="center">
        <span class="style1">备注</span>
      </td>
      <td colspan="7" align="left">
        <span class="style1">&nbsp;<%=demand_release.getRemarks() %> </span>
      </td>
       
    </tr>
    <tr>
      <td height="20" align="center">
        <span class="style1">创建时间</span>
      </td>
      <td colspan="7" align="left">
        <span class="style1">&nbsp;<%=demand_release.getCreateTime() %></span>
      </td>
      
    </tr>
    
  </tbody></table>

       </div>  </body>
</html>
