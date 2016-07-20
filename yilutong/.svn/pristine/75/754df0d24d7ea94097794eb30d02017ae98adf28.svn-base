<%-- <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
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
	<!-- <script type="text/javascript" src="./js/function.js"></script>命名按钮方法  -->
	
  
  </head>
  <% 	String flg = (String) request.getAttribute("flg"); %> 
  //	回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
  
  
  
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
	 	 		phone_number:$.trim($("#perpole").val()),//发货人
	 	 		phone:$.trim($("#phone").val()),
	 	 		order_state:$.trim($("#order_state").combobox("getValue")),
	 	 		pay_type:$.trim($("#pay_type").combobox("getValue")),
	 	 		send_address:$.trim($("#send_address").val()),//发站
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#end_address").val())//到站
	 	});	  
	 	
  	}
  
  --%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/surmax/";
%>
<!DOCTYPE html>
<!--STATUS OK-->
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="always" name="referrer">
<meta name="theme-color" content="#2932e1">
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
<link rel="search" type="application/opensearchdescription+xml"
	href="/content-search.xml" title="一路通搜索" />
<link rel="icon" sizes="any" mask href="//www.baidu.com/img/baidu.svg">
<!-- <link rel="dns-prefetch" href="//s1.bdstatic.com" />
<link rel="dns-prefetch" href="//t1.baidu.com" />
<link rel="dns-prefetch" href="//t2.baidu.com" />
<link rel="dns-prefetch" href="//t3.baidu.com" />
<link rel="dns-prefetch" href="//t10.baidu.com" />
<link rel="dns-prefetch" href="//t11.baidu.com" />
<link rel="dns-prefetch" href="//t12.baidu.com" />
<link rel="dns-prefetch" href="//b1.bdstatic.com" /> -->
<title>一路通搜索</title>
<style index="index" id="css_index">
html,body {
	height: 100%
}

html {
	overflow-y: auto
}

#wrapper {
	position: relative;
	_position:;
	min-height: 100%
}

#head {
	padding-bottom: 100px;
	text-align: center;
	*z-index: 1
}

#ftCon {
	height: 100px;
	position: absolute;
	bottom: 44px;
	text-align: center;
	width: 100%;
	margin: 0 auto;
	z-index: 0;
	overflow: hidden
}

#ftConw {
	width: 720px;
	margin: 0 auto
}

body {
	font: 12px arial;
	text-align:;
	background: #fff
}

body,p,form,ul,li {
	margin: 0;
	padding: 0;
	list-style: none
}

body,form,#fm {
	position: relative
}

td {
	text-align: left
}

img {
	border: 0
}

a {
	color: #00c
}

a:active {
	color: #f60
}

.bg {
	background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/icons_45de3f02.png);
	background-repeat: no-repeat;
	_background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/icons_15f748ea.gif)
}

.bg_tuiguang_browser {
	width: 16px;
	height: 16px;
	background-position: -600px 0;
	display: inline-block;
	vertical-align: text-bottom;
	font-style: normal;
	overflow: hidden;
	margin-right: 5px
}

.bg_tuiguang_browser_big {
	width: 56px;
	height: 56px;
	position: absolute;
	left: 10px;
	top: 10px;
	background-position: -600px -24px
}

.bg_tuiguang_weishi {
	width: 56px;
	height: 56px;
	position: absolute;
	left: 10px;
	top: 10px;
	background-position: -672px -24px
}

.c-icon {
	display: inline-block;
	width: 14px;
	height: 14px;
	vertical-align: text-bottom; font-style normal;
	overflow: hidden;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/icons_45de3f02.png)
		no-repeat 0 0;
	_background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/icons_15f748ea.gif)
}

.c-icon-triangle-down-blue {
	background-position: -480px -168px
}

.c-icon-chevron-unfold2 {
	background-position: -504px -168px
}

#m {
	width: 720px;
	margin: 0 auto
}

#nv a,#nv b,.btn,#lk {
	font-size: 14px
}

input {
	border: 0;
	padding: 0
}

#nv {
	height: 19px;
	font-size: 16px;
	margin: 0 0 4px;
	text-align: left;
	text-indent: 137px
}

.s_btn {
	width: 95px;
	height: 32px;
	padding-top: 2px\9;
	font-size: 14px;
	background-color: #ddd;
	background-position: 0 -48px;
	cursor: pointer
}

.s_btn_h {
	background-position: -240px -48px
}

.s_btn_wr {
	width: 97px;
	height: 34px;
	display: inline-block;
	background-position: -120px -48px;
	*position: relative;
	z-index: 0;
	vertical-align: top
}

#lk {
	margin: 33px 0
}

#lk span {
	font: 14px "宋体"
}

#lh {
	margin: 16px 0 5px
}

#cp,#cp a {
	color: #666
}

#cp .c-icon-icrlogo {
	width: 14px;
	height: 17px;
	display: inline-block;
	overflow: hidden;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/icons_45de3f02.png)
		no-repeat;
	_background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/icons_15f748ea.gif);
	background-position: -600px -96px;
	position: relative;
	top: 3px
}

#shouji {
	margin-right: 14px
}

#u {
	display: none
}

#c-tips-container {
	display: none
}

#wrapper {
	min-width: 810px;
	height: 100%;
	min-height: 600px
}

#head {
	position: relative;
	padding-bottom: 0;
	height: 100%;
	min-height: 600px
}

#head .head_wrapper {
	height: 100%
}

#m {
	position: relative
}

#fm {
	padding-left: 40px;
	top: -37px
}

#lh a {
	margin: 0 10px
}

#lk {
	position: absolute;
	display: none;
	top: 0;
	right: 0
}

#nv {
	position: absolute;
	display: none;
	top: 0;
	right: 0
}

#lm {
	color: #666;
	width: 100%;
	height: 60px;
	margin-top: 60px;
	line-height: 15px;
	font-size: 13px;
	position: absolute;
	top: 0;
	left: 0
}

#lm a {
	color: #666
}

#pad-version {
	line-height: 40px
}

.s_ipt_wr.bg,.s_btn_wr.bg,#su.bg {
	background-image: none
}

.s_btn_wr {
	width: auto;
	height: auto;
	border-bottom: 1px solid transparent;
	*border-bottom: 0
}

.s_btn {
	width: 100px;
	height: 36px;
	color: white;
	font-size: 15px;
	letter-spacing: 1px;
	background: #3385ff;
	border-bottom: 1px solid #2d78f4;
	outline: medium;
	*border-bottom: 0;
	-webkit-appearance: none;
	-webkit-border-radius: 0
}

.s_btn.btnhover {
	background: #317ef3;
	border-bottom: 1px solid #2868c8;
	*border-bottom: 0;
	box-shadow: 1px 1px 1px #ccc
}

.s_btn_h {
	background: #3075dc;
	box-shadow: inset 1px 1px 5px #2964bb;
	-webkit-box-shadow: inset 1px 1px 5px #2964bb;
	-moz-box-shadow: inset 1px 1px 5px #2964bb;
	-o-box-shadow: inset 1px 1px 5px #2964bb
}

#result_logo {
	display: none
}

#index_logo img {
	display: inline-block;
	width: 270px;
	height: 129px
}

#s_tab {
	display: none
}

.s_form {
	position: relative;
	top: 38.2%
}

.s_form_wrapper {
	position: relative;
	top: -251px
}

.s_ipt_wr {
	height: 34px
}

#head .c-icon-bear-round {
	display: none
}

#form {
	margin: 22px auto 0;
	width: 641px;
	text-align: left;
	z-index: 100
}

#form .bdsug,#fm .bdsug {
	top: 35px
}

.bdsug {
	display: none;
	position: absolute;
	width: 538px;
	background: #fff;
	border: 1px solid #ccc;
	_overflow: hidden;
	box-shadow: 1px 1px 3px #ededed;
	-webkit-box-shadow: 1px 1px 3px #ededed;
	-moz-box-shadow: 1px 1px 3px #ededed;
	-o-box-shadow: 1px 1px 3px #ededed
}

.bdsug.bdsugbg ul {
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/sugbg_6a9201c2.png)
		100% 100% no-repeat;
	background-size: 100px 110px;
	background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/sugbg_d24a0811.gif)
		\9
}

.bdsug li {
	width: 522px;
	color: #000;
	s_form_wrapper font: 14px arial;
	line-height: 25px;
	padding: 0 8px;
	position: relative;
	cursor: default
}

.bdsug li.bdsug-s {
	background: #f0f0f0
}

.bdsug-store span,.bdsug-store b {
	color: #7a77c8
}

.bdsug-store-del {
	font-size: 12px;
	color: #666;
	text-decoration: underline;
	position: absolute;
	right: 8px;
	top: 0;
	cursor: pointer;
	display: none
}

.bdsug-s .bdsug-store-del {
	display: inline-block
}

.bdsug-ala {
	display: inline-block;
	border-bottom: 1px solid #e6e6e6
}

.bdsug-ala h3 {
	line-height: 14px;
	background: url(//www.baidu.com/img/sug_bd.png) no-repeat left center;
	margin: 8px 0 5px 0;
	font-size: 12px;
	font-weight: normal;
	color: #7b7b7b;
	padding-left: 20px
}

.bdsug-ala p {
	font-size: 14px;
	font-weight: bold;
	padding-left: 20px
}

.bdsug .bdsug-direct {
	width: auto;
	padding: 0;
	border-bottom: 1px solid #f1f1f1
}

.bdsug .bdsug-direct p {
	color: #00c;
	font-weight: bold;
	line-height: 34px;
	padding: 0 8px;
	cursor: pointer;
	white-space: nowrap;
	overflow: hidden
}

.bdsug .bdsug-direct p img {
	width: 16px;
	height: 16px;
	margin: 7px 6px 9px 0;
	vertical-align: middle
}

.bdsug .bdsug-direct p span {
	margin-left: 8px
}

.bdsug .bdsug-direct p i {
	font-size: 12px;
	line-height: 100%;
	font-style: normal;
	font-weight: normal;
	color: #fff;
	background-color: #2b99ff;
	display: inline;
	text-align: center;
	padding: 1px 5px;
	*padding: 2px 5px 0 5px;
	margin-left: 8px;
	overflow: hidden
}

.bdsug .bdsug-pcDirect {
	color: #000;
	font-size: 14px;
	line-height: 30px;
	height: 30px;
	background-color: #f8f8f8
}

.bdsug .bdsug-pc-direct-tip {
	position: absolute;
	right: 15px;
	top: 8px;
	width: 55px;
	height: 15px;
	display: block;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/pc_direct_ffda303e.png)
		no-repeat 0 0
}

.bdsug li.bdsug-pcDirect-s {
	background-color: #f0f0f0
}

.bdsug .bdsug-pcDirect-is {
	color: #000;
	font-size: 14px;
	line-height: 22px;
	background-color: #f8f8f8
}

.bdsug .bdsug-pc-direct-tip-is {
	position: absolute;
	right: 15px;
	top: 3px;
	width: 55px;
	height: 15px;
	display: block;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/pc_direct_ffda303e.png)
		no-repeat 0 0
}

.bdsug li.bdsug-pcDirect-is-s {
	background-color: #f0f0f0
}

.bdsug .bdsug-pcDirect-s .bdsug-pc-direct-tip,.bdsug .bdsug-pcDirect-is-s .bdsug-pc-direct-tip-is
	{
	background-position: 0 -15px
}

.bdsug .bdsug-newicon {
	color: #929292;
	opacity: .7;
	font-size: 12px;
	display: inline-block;
	line-height: 22px;
	letter-spacing: 2px
}

.bdsug .bdsug-s .bdsug-newicon {
	opacity: 1
}

.bdsug .bdsug-newicon i {
	letter-spacing: 0;
	font-style: normal
}

.toggle-underline {
	text-decoration: none
}

.toggle-underline:hover {
	text-decoration: underline
}

.tools {
	position: absolute;
	right: -75px
}

#mHolder {
	width: 62px;
	position: relative;
	z-index: 296;
	display: none
}

#mCon {
	height: 18px;
	line-height: 18px;
	position: absolute;
	cursor: pointer
}

#mCon span {
	color: #00c;
	cursor: default;
	display: block;
	width: 24px
}

#mCon .hw {
	text-decoration: underline;
	cursor: pointer;
	display: inline-block
}

#mCon .pinyin {
	display: inline-block
}

#mCon .c-icon-chevron-unfold2 {
	margin-left: 5px
}

#mMenu a {
	width: 100%;
	height: 100%;
	display: block;
	line-height: 22px;
	text-indent: 6px;
	text-decoration: none;
	filter: none\9
}

#mMenu,#user ul {
	box-shadow: 1px 1px 2px #ccc;
	-moz-box-shadow: 1px 1px 2px #ccc;
	-webkit-box-shadow: 1px 1px 2px #ccc;
	filter: progid:DXImageTransform.Microsoft.Shadow(Strength=2, Direction=135,
		Color="#cccccc") \9
}

#mMenu {
	width: 56px;
	border: 1px solid #9b9b9b;
	list-style: none;
	position: absolute;
	right: 27px;
	top: 28px;
	display: none;
	background: #fff
}

#mMenu a:hover {
	background: #ebebeb
}

#mMenu .ln {
	height: 1px;
	background: #ebebeb;
	overflow: hidden;
	font-size: 1px;
	line-height: 1px;
	margin-top: -1px
}

#u1 a:link,#u1 a:visited {
	color: #666;
	text-decoration: none
}

#u1 a:hover,#u1 a:active {
	text-decoration: underline
}

#u1 a:active {
	color: #00c
}

#u1 {
	z-index: 2;
	color: white;
	position: absolute;
	right: 0;
	top: 0;
	margin: 19px 0 5px 0;
	padding: 0 96px 0 0
}

#u1 .reg {
	display: none
}

#u1 a.pf,#u1 a.pf:visited {
	display: inline-block;
	float: left;
	color: #333;
	line-height: 24px;
	font-size: 13px;
	margin-left: 20px;
	overflow: hidden;
	text-decoration: underline
}

#u1 a.lb,#u1 a.lb:visited,#u1 a.username {
	display: inline-block;
	float: left;
	color: #333;
	font-size: 13px;
	line-height: 24px;
	margin-left: 20px;
	text-decoration: underline
}

#u1 a.bri,#u1 a.bri:visited {
	display: inline-block;
	position: absolute;
	right: 10px;
	width: 60px;
	height: 23px;
	float: left;
	color: white;
	background: #38f;
	line-height: 24px;
	font-size: 13px;
	text-align: center;
	overflow: hidden;
	border-bottom: 1px solid #38f;
	margin-left: 19px;
	margin-right: 2px
}

#u1 a.bri.brihover {
	display: none;
	text-decoration: none;
	color: #333;
	background: 0;
	border-bottom: 1px solid transparent;
	margin-left: 19px
}

#u1 #lm a {
	color: #00c;
	text-decoration: underline
}

#u1 a.mnav,#u1 a.mnav:visited {
	float: left;
	color: #333;
	font-weight: bold;
	line-height: 24px;
	margin-left: 20px;
	font-size: 13px;
	text-decoration: underline
}

#u1 a.pf:hover,#u1 a.lb:hover,#u1 a.mnav:hover {
	color: #00c
}

.briiconsbg {
	background-repeat: no-repeat;
	background-size: 300px 18px;
	background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/icons_c3b33b92.png);
	background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/icons_0a1fc6ac.gif)
		\9
}

.bdpfmenu {
	background-color: #fff;
	border: 1px solid #d1d1d1;
	position: absolute;
	right: 160px;
	width: 68px;
	top: 36px;
	margin-top: -1px;
	_margin-top: -3px;
	z-index: 2;
	box-shadow: 1px 1px 5px #d1d1d1;
	-webkit-box-shadow: 1px 1px 5px #d1d1d1;
	-moz-box-shadow: 1px 1px 5px #d1d1d1;
	-o-box-shadow: 1px 1px 5px #d1d1d1
}

.bdpfmenu a {
	display: block;
	text-align: left;
	margin: 0 !important;
	padding: 0 9px;
	line-height: 26px;
	text-decoration: none
}

#wrapper .bdpfmenu a:link,#wrapper .bdpfmenu a:visited {
	background: white;
	color: #333
}

#wrapper .bdpfmenu a:hover,#wrapper .bdpfmenu a:active {
	background: #38f;
	text-decoration: none;
	color: white
}

#wrapper .bdnuarrow {
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	display: block;
	position: absolute;
	top: -10px;
	left: 50%;
	margin-left: -5px
}

#wrapper .bdnuarrow em,#wrapper .bdnuarrow i {
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	display: block;
	position: absolute;
	border: 5px solid transparent;
	border-style: dashed dashed solid dashed
}

#wrapper .bdnuarrow em {
	border-bottom-color: #d8d8d8;
	top: -1px
}

#wrapper .bdnuarrow i {
	border-bottom-color: #fff;
	top: 0
}

.s-isindex-wrap #wrapper .bdnuarrow {
	height: 13px;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/icons_c3b33b92.png)
		no-repeat -90px -1px
}

#wrapper .bdnuarrow.bdbriarrow {
	right: 104px;
	display: none !important
}

#wrapper .bdbri {
	width: 85px;
	min-height: 100px;
	border-left: 1px solid #e7e7e7;
	position: absolute;
	background-color: #f9f9f9;
	overflow: hidden;
	z-index: 2;
	right: 0;
	top: 0
}

#prefpanel {
	background: #fafafa;
	display: none;
	opacity: 0;
	position: fixed;
	_position: absolute;
	top: -359px;
	z-index: 1000;
	width: 100%;
	min-width: 960px;
	border-bottom: 1px solid #ebebeb
}

#prefpanel form {
	_width: 850px
}

#wrapper .bdbriimgtitle {
	color: #333;
	text-align: center;
	width: 66px;
	height: 43px;
	line-height: 43px;
	padding-top: 9px;
	margin: 0 auto;
	border-bottom: #f0f0f0 1px solid;
	font-size: 13px;
	cursor: default
}

#wrapper .briscrollwrapper {
	overflow: hidden
}

#wrapper .briscrollwrapperContainer {
	position: relative
}

#wrapper .bdbri.bdbriimg .bdmainlink a,#wrapper .bdbri.bdbriimg .bdothlink a
	{
	display: block;
	text-align: center;
	width: 66px;
	height: 76px;
	margin: 0 auto;
	border-bottom: #f0f0f0 1px solid;
	color: #666;
	text-decoration: none;
	overflow: hidden
}

#wrapper .bdbri.bdbriimg .bdmainlink a:visited,#wrapper .bdbri.bdbriimg .bdothlink a:visited
	{
	color: #666
}

#wrapper .bdbri.bdbriimg .bdmainlink a:hover,#wrapper .bdbri.bdbriimg .bdothlink a:hover
	{
	color: #666;
	text-decoration: underline
}

#wrapper .bdbri.bdbriimg .bdmainlink a:active,#wrapper .bdbri.bdbriimg .bdothlink a:active
	{
	color: #00c;
	text-decoration: underline
}

#wrapper .bdbri.bdbriimg span {
	width: 36px;
	height: 36px;
	display: block;
	margin: 10px auto 5px;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/logos/bdbri_icons_2e35e84b.png)
		no-repeat;
	cursor: pointer
}

#wrapper .bdbri.bdbriimg .bdbrimore,#wrapper .bdbri.bdbriimg .bdbrievenmore
	{
	clear: both;
	text-align: center
}

#wrapper .bdbri.bdbriimg .bdbrievenmore {
	margin-top: 15px;
	height: 30px;
	width: 85px;
	overflow: hidden
}

#wrapper .bdbri.bdbriimg span.bdbriimgitem_1 {
	background-position: 0 0
}

#wrapper .bdbri.bdbriimg span.bdbriimgitem_2 {
	background-position: -36px 0
}

#wrapper .bdbri.bdbriimg span.bdbriimgitem_3 {
	width: 40px;
	background-position: -72px 0
}

#wrapper .bdbri.bdbriimg span.bdbriimgitem_4 {
	background-position: -112px 0
}

#wrapper .bdbri.bdbriimg span.bdbriimgitem_5 {
	background-position: -148px 0
}

#wrapper .bdbri.bdbriimg span.bdbriimgitem_6 {
	background-position: -184px 0
}

#wrapper .bdbri.bdbriimg span.bdbriimgitem_7 {
	background-position: -220px 0
}

#wrapper .bdbri.bdbriimg .bdbrievenmore a:link,#wrapper .bdbri.bdbriimg .bdbrievenmore a:visited
	{
	color: #666;
	text-decoration: underline
}

#wrapper .bdbri.bdbriimg .bdbrievenmore a:hover {
	color: #666;
	text-decoration: underline
}

#wrapper .bdbri.bdbriimg .bdbrievenmore a:active {
	color: #00c
}

.bdbriscroll-ctrl-scroll {
	position: absolute;
	top: 10px;
	right: 1px;
	width: 8px;
	border-top: 1px solid #e4e4e4;
	border-left: 1px solid #e4e4e4;
	cursor: default;
	-webkit-user-select: none;
	-moz-user-select: none
}

.bdbriscroll-ctrl-scroll .bdbriscroll-axis {
	width: 8px;
	left: 0;
	z-index: 0;
	position: absolute;
	background: #f2f2f2
}

.bdbriscroll-ctrl-scroll-touch .bdbriscroll-axis {
	width: 7px;
	background: #f2f2f2
}

.bdbriscroll-ctrl-scroll-hover .bdbriscroll-axis {
	background: #f2f2f2
}

.bdbriscroll-ctrl-scroll .bdbriscroll-slider {
	overflow: hidden;
	width: 7px;
	height: 14px;
	position: absolute;
	left: 0;
	z-index: 10;
	display: none;
	background: #d9d9d9;
	margin-top: -1px;
	margin-left: -1px;
	border-right: 1px solid #cecece;
	border-bottom: 1px solid #cecece;
	cursor: default
}

.bdbriscroll-ctrl-scroll-touch .bdbriscroll-slider,.bdbriscroll-ctrl-scroll-hover .bdbriscroll-slider
	{
	background: #b8b8b8;
	border-right: 1px solid #afafaf;
	border-bottom: 1px solid #afafaf
}
</style>
<!--[if lte IE 8]><style index="index" >.s_form{top:260px}</style><![endif]-->
<!--[if IE 8]><style index="index" >#u1 a.mnav,#u1 a.mnav:visited,#u1 a.lb,#u1 a.lb:visited,#u1 a.pf,#u1 a.pf:visited,#u1 a.bri,#u1 a.bri:visited{font-family:simsun}</style><![endif]-->
<style data-for="debug">
#debug {
	display: none !important
}
</style>
<style data-for="result" id="css_index_result">
#seth {
	display: none;
	behavior: url(#default#homepage)
}

#setf {
	display: none
}

#sekj {
	margin-left: 14px
}

#st,#sekj {
	display: none
}

.s_ipt_wr {
	border: 1px solid #b6b6b6;
	border-color: #7b7b7b #b6b6b6 #b6b6b6 #7b7b7b;
	background: #fff;
	display: inline-block;
	vertical-align: top;
	width: 539px;
	margin-right: 0;
	border-right-width: 0;
	border-color: #b8b8b8 transparent #ccc #b8b8b8;
	overflow: hidden
}

.wrapper_s .s_ipt_wr {
	width: 439px
}

.wrapper_s .s_ipt {
	width: 434px
}

.wrapper_s .s_ipt_tip {
	width: 434px
}

.s_ipt_wr:hover,.s_ipt_wr.ipthover {
	border-color: #999 transparent #b3b3b3 #999
}

.s_ipt_wr.iptfocus {
	border-color: #4791ff transparent #4791ff #4791ff
}

.s_ipt_tip {
	color: #aaa;
	position: absolute;
	z-index: -10;
	font: 16px/22px arial;
	height: 32px;
	line-height: 32px;
	padding-left: 7px;
	overflow: hidden;
	width: 526px
}

.s_ipt {
	width: 526px;
	height: 22px;
	font: 16px/18px arial;
	line-height: 22px\9;
	margin: 6px 0 0 7px;
	padding: 0;
	background: transparent;
	border: 0;
	outline: 0;
	-webkit-appearance: none
}

#kw {
	position: relative
}

#u .username i {
	background-position: -408px -144px
}

.bdpfmenu,.usermenu {
	border: 1px solid #d1d1d1;
	position: absolute;
	width: 105px;
	top: 36px;
	z-index: 302;
	box-shadow: 1px 1px 5px #d1d1d1;
	-webkit-box-shadow: 1px 1px 5px #d1d1d1;
	-moz-box-shadow: 1px 1px 5px #d1d1d1;
	-o-box-shadow: 1px 1px 5px #d1d1d1
}

.bdpfmenu {
	font-size: 12px;
	background-color: #fff
}

.bdpfmenu a,.usermenu a {
	display: block;
	text-align: left;
	margin: 0 !important;
	padding: 0 9px;
	line-height: 26px;
	text-decoration: none
}

.briiconsbg {
	background-repeat: no-repeat;
	background-size: 300px 18px;
	background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/icons_c3b33b92.png);
	background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/icons_0a1fc6ac.gif)
		\9
}

#u {
	z-index: 301;
	position: absolute;
	right: 0;
	top: 0;
	margin: 21px 9px 5px 0;
	padding: 0
}

.wrapper_s #u {
	margin-right: 3px
}

#u a {
	text-decoration: underline;
	color: #333;
	margin: 0 7px
}

.wrapper_s #u a {
	margin-right: 0 6px
}

#u div a {
	text-decoration: none
}

#u a:hover {
	text-decoration: underline
}

#u .back_org {
	color: #666;
	float: left;
	display: inline-block;
	height: 24px;
	line-height: 24px
}

#u .bri {
	display: inline-block;
	width: 24px;
	height: 24px;
	float: left;
	line-height: 24px;
	color: transparent;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/icons_c3b33b92.png)
		no-repeat 4px 3px;
	background-size: 300px 18px;
	background-image:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/home/img/icons_0a1fc6ac.gif)
		\9;
	overflow: hidden
}

#u .bri:hover,#u .bri.brihover {
	background-position: -18px 3px
}

#mCon #imeSIcon {
	background-position: -408px -144px;
	margin-left: 0
}

#mCon span {
	color: #333
}

.bdpfmenu a:link,.bdpfmenu a:visited,#u .usermenu a:link,#u .usermenu a:visited
	{
	background: white;
	color: #333
}

.bdpfmenu a:hover,.bdpfmenu a:active,#u .usermenu a:hover,#u .usermenu a:active
	{
	background: #38f;
	text-decoration: none;
	color: white
}

.bdpfmenu {
	width: 70px
}

.usermenu {
	width: 68px;
	right: 8px
}

#wrapper .bdnuarrow {
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	display: block;
	position: absolute;
	top: -10px;
	left: 50%;
	margin-left: -5px
}

#wrapper .bdnuarrow em,#wrapper .bdnuarrow i {
	width: 0;
	height: 0;
	font-size: 0;
	line-height: 0;
	display: block;
	position: absolute;
	border: 5px solid transparent;
	border-style: dashed dashed solid dashed
}

#wrapper .bdnuarrow em {
	border-bottom-color: #d8d8d8;
	top: -1px
}

#wrapper .bdnuarrow i {
	border-bottom-color: #fff;
	top: 0
}

#prefpanel {
	background: #fafafa;
	display: none;
	opacity: 0;
	position: fixed;
	_position: absolute;
	top: -359px;
	z-index: 500;
	width: 100%;
	min-width: 960px;
	border-bottom: 1px solid #ebebeb
}

#prefpanel form {
	_width: 850px
}

#kw_tip {
	cursor: default;
	display: none;
	margin-top: 1px
}

#bds-message-wrapper {
	top: 43px
}

.quickdelete-wrap {
	position: relative
}

.quickdelete-wrap input {
	width: 500px
}

.wrapper_l .quickdelete-wrap input {
	width: 500px
}

.wrapper_s .quickdelete-wrap input {
	width: 402px
}

input::-ms-clear {
	display: none
}

.quickdelete {
	width: 32px;
	height: 32px;
	background:
		url(https://ss1.bdstatic.com/5eN1bjq8AAUYm2zgoY3K/r/www/cache/static/protocol/https/global/img/quickdelete_9c14b01a.png)
		no-repeat;
	background-position: 10px 10px;
	position: absolute;
	display: block
}

.quickdelete:hover {
	background-position: 10px -24px
}
#details{
	bottom: 44px;
	text-align: center;
	width: 100%;
	padding-top:50px;
	z-index: 0;
	overflow: hidden;
	
}
#deta{
	bottom: 44px;
	text-align: center;
	width: 100%;
	z-index: 0;
	overflow: hidden;
}
tr{
	padding-top:50px;
	text-align: center;
}
td{
	font-size:18px;
	padding-top:20px;
	text-align: center;
}
#error{
	font-size:15px;
	color: red;
}
</style>
</head>
<body>

	<div id="wrapper" style="display:none;">
		<script></script>
		<div id="head">
			<div class="head_wrapper">
				<div class="s_form">
					<div class="s_form_wrapper">
						<div id="lg">
							<img hidefocus="true" src="/yilutong/images/yltbig.png"
								width="270" height="129">
						</div>
						<a href="/surmax/souShip.do?method=index" id="result_logo"
							onmousedown="return c({'fm':'tab','tab':'logo'})"><img
							src="/surmax/images/supmaxlogo.png" alt="到速搜首页" title="到速搜首页"></a>
						<form id="form" name="f" action="#" class="fm">
							<span><input id="kw" class="s_ipt" value="" maxlength="255"
								autocomplete="off" placeholder="在此输入运单号进行查询"></span><span class="bg s_btn_wr"><input
								type="button" onclick="fangwen()" id="sou" value="速搜一下" class="bg s_btn">
								</span>
						</form>
						<div id="details">
							<div id="loading"></div> 
							<table id="deta">
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="./js/jquery-1.8.3.js"></script>
	<script>
		  $("form").submit(function(e){
		    e.preventDefault();
		  });
		if(!location.hash.match(/[^a-zA-Z0-9]wd=/)){
			document.getElementById("wrapper").style.display='block';
			setTimeout(function(){
				try{kw.parentNode.className="bg s_ipt_wr iptfocus quickdelete-wrap";
				}catch(e){
					
				}
			},0);
		}</script>
	<script type="text/javascript" language=JavaScript charset="UTF-8">
	
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				fangwen();
			}
		};
		
		 	$("#loading").ajaxStart(function(){ 
		        $(this).html("<img src='./images/loading.gif' />"); 
		      }); 
		      $("#loading").ajaxSuccess(function(){ 
		        $(this).html(""); 
		        // $(this).empty(); // 或者直接清除 
		      }); 

		      
			$("#details").hide();
			function fangwen(){
				$("#details").show();
				$("#deta").html("");
				var pid=$("#kw").val();
				if(pid!=""&&pid!=null){
					$.ajax({
						   type: "POST",
						   url: 'shipOrder.do?method=getShowOrder',
						   data: {pid:pid} ,
						   success: function(msg){
							   $("#deta").html("");
							   $.each(msg,function(x,y){
								   $("#deta").append('<tr><td>'+y.goods_arrive_remakes+'</td></tr>');
								});
							   if(msg==""){
								   $("#deta").append("<tr><td id='error'>*抱歉！未查到此运单"+pid+"信息，请确认运单号码是否正确，或致电一路通。</td></tr>");
							   }
						   }
						   
						});
					}else{
						$("#deta").append("<tr><td id='error'>*请输入订单号</td></tr>");
					}
				}
				
	</script>

</body>
</html>
