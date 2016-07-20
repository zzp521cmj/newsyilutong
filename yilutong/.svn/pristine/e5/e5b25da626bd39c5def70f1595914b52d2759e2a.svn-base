<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>易路通配送管理系统</title>
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<link rel="stylesheet" type="text/css" href="./css/default.css">

<link rel="stylesheet" type="text/css" href="./css/skin.css">
<link rel="stylesheet" href="./css/layout.css" type="text/css">
<link>
<link href="./images/jyico.ico" type=image/x-icon rel="shortcut icon" />
<script type="text/javascript" src="./js/loyout.js"></script>
<script type="text/javascript" src="./js/jquery.cookie.js"></script>
<script type="text/javascript" src="./js/jquery.portal.js"></script>
<script type="text/javascript" src="./jslib/js/highcharts.js"></script>
<script type="text/javascript" src="./jslib/js/exporting.js"></script>
<script type="text/javascript" src="./jslib/js/highcharts-3d.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<%
     User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
     %>

<style type="text/css">
#roles,#departments {
	font-size: 18px;
	color: blue;
	font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑',
		Arial, sans-serif;
}

.panel-header {
	padding: 8px;
}
</style>

</head>
<%response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "No-cache");
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store");%>
<script type="text/javascript">
  $(function(){
 	
  //顶部导航切换
 $(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	}); 
   				$.ajax({
		  			type: "POST",
		  			async : false,
		  			url:'login.do?method=getRoles',
		  			success:function(data){
		  			var rols = data.split(",");
		  			for(var i=0;i<rols.length;i++){
		  			$("#roles").append("<li>"+rols[i]+"</li>");
		  			}
		  			}
		  		}); 
		  		$.ajax({
		  			type: "POST",
		  			async : false,
		  			url:'login.do?method=getDepartmentName',
		  			success:function(data){
		  			
		  			$("#departments").append("<li>"+data+"</li>");
		  			}
		  		});
		  		  /*  $("#maskContainer").delay("fast").fadeOut("fast",function(){
		  		 	$(this).remove();
		  		 });  */
 		  		 $("#lyouts").removeClass("hidden").layout("resize");
 	  		  
 		  		$.messager.show({ title:"提示",msg: "欢迎用户："+"<%=user.getUsername() %>", showType:'show' });
  });
window.onload=function(){
$("#maskContainer").delay("fast").fadeOut("fast",function(){
		  		 	$(this).remove(); });
};
  </script>

<body>
	<div id="maskContainer">
		<div class="datagrid-mask" style="display: block;"></div>
		<div class="datagrid-mask-msg"
			style="display: block; left: 50%; margin-left: -52.5px;height: 20px;">
			正在加载页面中，请稍等...</div>
	</div>
	<div class="easyui-layout hidden" id="lyouts" fit="true">
		<noscript>
			<div
				style=" position:absolute; z-index:100000; height:2046px;top:0px;left:0px; width:100%; background:white; text-align:center;">
				<img src="/images/noscript.gif" alt='抱歉，请开启脚本支持！' />
			</div>
		</noscript>
		<div region="north" border="false"
			style="overflow: visible;height: 88px;background:url(./images/topbg.gif) repeat-x;">
			<jsp:include page="north.jsp"></jsp:include>
		</div>

		<div region="west" border="true" split="true" title="易路通配送管理系统导航"
			class="cs-west" style="width:240px;" id="westId">
			<div id="nav" class="easyui-accordion" fit="true" border="false">
				<!--  导航内容 -->

			</div>
		</div>
		<!-- <div region="east" border="false"  title="显示"  style="width:200px;top:51px" id="eastId" data-options="collapsed:true">
		<div class="easyui-panel" title="日历">
				<div class="easyui-calendar" style="height: 180px;width: 100%"
					data-options="border:false"></div>
		</div>
		权限存放位置
		<div id="roles" class="easyui-panel" title="所拥有权限">
			
		</div>
		<div id="departments" class="easyui-panel" title="所在部门">
			
		</div>
	</div> -->

		<div id="mainPanle" region="center"
			style="background: #eee; overflow-y:hidden">
			<div id="tabs" class="easyui-tabs" fit="true" border="false"
				data-options="tools:'#tab-tools'">
				<div title="欢迎使用"
					style="margin: 0px;padding: 0px;overflow-x:visible; /* background: url('./images/bb.png'); */ background-size:cover;width: 100%;height: 100%;opacity: 0.9; background-repeat:no-repeat; ">
					<jsp:include page="center.jsp"></jsp:include>
				</div>
			</div>
		</div>
		<div id="mainPanle" region="south"
			style="height: 30px;overflow:hidden;background: url('./images/footbgi.png');">
			<jsp:include page="south.jsp"></jsp:include>
		</div>

	</div>
	<div id="mm" class="easyui-menu cs-tab-menu">
		<div id="mm-tabupdate">刷新</div>
		<div class="menu-sep"></div>
		<div id="mm-tabclose">关闭</div>
		<div id="mm-tabcloseother">关闭其他</div>
		<div id="mm-tabcloseall">关闭全部</div>
	</div>
	<div id="tab-tools" style="border: 0px"></div>
	<input type="hidden" id="urlId"></input>

</body>
</html>
