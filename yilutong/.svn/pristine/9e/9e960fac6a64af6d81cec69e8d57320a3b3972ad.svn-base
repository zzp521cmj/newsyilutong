<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName); %>
    <base href="<%=basePath%>">
	  
    <title></title>
	
 	<link type="text/css" rel="stylesheet" href="./css/login.css" />
	<style type="text/css">
	.window{
  background-color: #F7F7F7;
	</style>
<!-- <script type="text/javascript" src="./js/page/north.js"></script>
 --><script type="text/javascript">

function changeTheme(themeName) {
			if(themeName=="blue"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1.png')";
			}
			if(themeName=="pink"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1pink.png')";
			}
			if(themeName=="green"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1green.png')";
			}
			if(themeName=="bootstrapgray"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1ys.png')";
			}
			if(themeName=="grays"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1hs.png')";
			}
			if(themeName=="metro"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1white.png')";
			}
			if(themeName=="zise"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1xc.png')";
			}
			if(themeName=="black"){
				document.getElementById("hed").style.backgroundImage="url('./images/h1black.png')";
			}
			var $easyuiTheme = $('#easyuiTheme');
			var url = $easyuiTheme.attr('href');	 
			var href = url.substring(0, url.indexOf('themes')) + 'themes/' + themeName + '/easyui.css';
			$easyuiTheme.attr('href', href);
		 	$.cookie("easyuiTheme", href, { path: '/', expires: 10 });
		 	
	};
</script>

<body style="background:#056DAF">

    <div class="topleft" >
    <!-- <a href="login.do" href="javascript:void(0);"> --><img src="./images/yilytong.png" title="系统首页"  height="69"/><!-- </a> -->
    </div>
        
    <ul class="navs">
<!--      <li><a href="default.html" target="rightFrame" class="selected"><img src="images/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
   -->
<!--      <li><a href="javascript:addTab('线路维护','maplin.do?method=golin&menu_id=124')" ><img src="./images/xianlu.png"  title="线路维护" style="width: 45px;height: 45px;"/><h2>线路维护</h2></a></li>
 -->     <li><a href="javascript:addTab('运单录入','shipOrder.do?method=getShipOrderInfo&menu_id=110')" ><img src="./images/yundan.png"  title="运单录入" style="width: 45px;height: 45px;"/><h2>运单录入</h2></a></li>
    <li><a href="javascript:addTab('车辆全图监控','map.do?method=getMap')" ><img src="./images/mapsearch.png" title="车辆全图监控" style="width: 45px;height: 45px;"/><h2>车辆全图监控</h2></a></li>
    <li><a href="javascript:addTab('车辆基本信息','travel.do?method=travel&menu_id=55')" ><img src="./images/car.png" title="车辆管理" style="width: 45px;height: 45px;"/><h2>车辆管理</h2></a></li>
    <li><a href="javascript:addTab('个人信息','user.do?method=personInfo')" ><img src="./images/users.png" title="个人信息" style="width: 45px;height: 45px;"/><h2>个人信息</h2></a></li>
    </ul>
            
    <div class="topright">    
    <ul>
   <!--  <li><span><img src="./images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li> -->
    <li><a href="javascript:void(0)" onclick="layout()">退出</a></li>
    </ul>
  	<div >
  	<div class="user" style="padding-left: 20px;padding-bottom: 20px;">
  <!-- 	<input id="pid" type="text" class="search-text"  style="width: 100px;"> --><a href="javascript:void(0)"  type="button" style="color: white;font-size: 13px;" onclick="searchShipOrder()">快速查询</a>
    <span>欢迎您：<%=user.getUsername() %></span>
    </div>   
  	</div>

    
     
    
    </div>

</body>
<script type="text/javascript"> 
	var dialog;
$(function(){
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchShipOrder();
			}
		};
});
  function layout(){
		$('body').addClass('lyouts');
		setTimeout(out, 500);
  }
  function out(){
  	window.location.href="login.do?method=loginout";
  }
  
		
		function searchShipOrder(){
	  			dialog = parent.jy.modalDialog({
				title : '订单详情',
				url : 'orderC.do?method=getOrderMsgSY',
				maximizable:true,
				width : 1200,
				height:650,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
		}
  </script>
</html>
