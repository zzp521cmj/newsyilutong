<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script language="javascript">
function sizeload(){
	if(top.location!=self.location)
	top.location=self.location;
	clock();
}
var times=6;
function clock() 
{ 
   window.setTimeout('clock()',1000); 
   times=times-1; 
   document.getElementById('time').innerHTML =times;
} 
</script>
<head>
<meta http-equiv="Refresh" content="5;url=login.jsp ">
<title>登录超时</title>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</head>
<body>
<body onload="sizeload()">
<table> 
	<tr> 
	<td class= "FontBlack STYLE1">系统登录超时，请重新登录 </td> 
	</tr> 
	<tr> 
		
		<td class= "FontBlack STYLE1">该页面将在 </td> 
		<td class= "FontBlack"> <div class="STYLE1" id= "time"> 5 </div> </td> 
		<td class= "FontBlack STYLE1"> 秒后自动跳转 </td> 
		<td class= "FontBlack STYLE1"> <a href="login.jsp">点此链接直接跳转到主页</a> </td> 
	</tr> 
</table> 
</body>