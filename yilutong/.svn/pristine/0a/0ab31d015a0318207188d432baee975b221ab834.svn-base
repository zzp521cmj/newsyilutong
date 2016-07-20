<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'orderImg.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<%
	String iurl = (String) request.getAttribute("iurl");
	%>
  </head>
  
  <body>
  <div  style="overflow: hidden;">
 	 <img id="signimg" alt="签收图片" src="" width="100%" height="100%">
  </div>
  </body>
	<script type="text/javascript">
	 var u='<%=iurl%>';
	 var imgurl=[];imgurl=u.split("////");
	 var ur="./WebRoot/"+imgurl[imgurl.length-2]+"/"+imgurl[imgurl.length-1];
	 document.getElementById("signimg").src=ur;
	</script>
</html>
