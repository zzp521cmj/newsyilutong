<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page language="java" import="com.jy.model.ShipperOrderImg"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
	+ request.getServerName() + ":" + request.getServerPort()
	+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>订单签收图片</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="./webuploader/jquery.js"></script>
<script type="text/javascript" src="./webuploader/webuploader.js"></script>
<script type="text/javascript"
	src="./webuploader/singshiporder_uplaod.js"></script>
<!-- <link rel="stylesheet" type="text/css"
	href="./webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="./webuploader/style.css" /> -->
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<%
	List<ShipperOrderImg> listOrderImg=null;
	if(!request.getAttribute("iurl").equals("")){
	listOrderImg = (List<ShipperOrderImg>) request.getAttribute("iurl");
	}
%>
<style type="text/css">


</style>
<link rel="stylesheet" href="./css/viewer.css" type="text/css"></link>
<script type="text/javascript" src="./js/viewer.js"></script>
</head>
<script type="text/javascript">
$(function(){

$('.images').viewer();   
$.fn.viewer.noConflict();
});
</script>
<body>

	<div id="wrapper">
		<div id="container" style="height:400px; ">
			<div id="uploader">
				<div class="queueList" style="height:300px;">
					<div id="dndArea" class="placeholder">
						<div id="filePicker"></div>
						<!-- <table class="tableclass">
							<tr>
								<td id="xian"> -->
						<div >
							
								<ul class="images" style="list-style-type:none;">
									
							<%
								for (ShipperOrderImg shipperOrderImg : listOrderImg) {
							%>
									<li><img class="imsty" src=<%=shipperOrderImg.getImageUrl()%>>
									</li>
							<%
								}
							%>
								</ul>
						
						</div>
						<!-- </td>
							</tr>
						</table> -->
					</div>
				</div>
				<div class="statusBar" style="display:none;">
					<div class="progress">
						<span class="text">0%</span> <span class="percentage"></span>
					</div>
					<div class="info"></div>
					<div class="btns">
						<div id="filePicker2"></div>
						<div class="uploadBtn">开始上传</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	<%-- $(function(){
	 var u='<%=iurl%>';
	if(u!=""&&u!=null){
					images=(u).split("|");
					var imag="<dl>";
					for(var i=0;i<images.length;i++){
						var im=images[i];
						var idd=im.substring(im.lastIndexOf("/")+1,im.lastIndexOf("."));
					imag+="<div id=\""+idd+"\" style=\"float:left;margin-left:10px;padding-bottom: 30px;\"><dt><img class=\"imsty\" src=\""+images[i]+"\"/></dt> </div>";
					}
					imag+="</dl>";
					$("#xian").html(imag);
   }
	}); --%>
	
</script>



</html>
