<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>易路通配送管理系统</title>

<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Cache-Control" CONTENT="no-cache">
<meta http-equiv="Pragma" CONTENT="no-cache">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<!--  	<script type="text/javascript" src="js/cloud.js"></script>
 -->
<!--  	<link type="text/css" rel="stylesheet" href="./css/login.css" />
 -->
<script type="text/javascript" src="js/jquery.cookie.js"></script>


<!--   <link rel="stylesheet" href="css/layout.css" type="text/css"></link>
 -->
<script type="text/javascript" src="./css/login.js"></script>
<link href="./css/login2.css" rel="stylesheet" type="text/css" />

<style type="text/css">

/* 	input:-webkit-autofill,
input:-webkit-autofill:hover,
input:-webkit-autofill:focus {
     -webkit-box-shadow: 0 0 0px 1000px blue inset;
    
    -webkit-text-fill-color: #333; 
} */
.ghost {
	width: 100px;
	margin: 100px auto;
	position: relative;
	animation: ghostUpdown 1s infinite alternate;
	-webkit-animation: ghostUpdown 1s infinite alternate;
}

.ghostBody {
	width: 120px;
	height: 140px;
	background: #fff;
	border-radius: 100% 100% 0 0;
	position: relative;
}

.ghostEye {
	width: 10px;
	height: 10px;
	border-radius: 100%;
	border: 2px solid #061E74;
	background: #061E74;
	box-shadow: inset -2px -2px #fff;
	position: absolute;
	top: 60px;
}

.left {
	left: 45px
}

.right {
	right: 50px;
}

.ghostMouth {
	width: 10px;
	height: 18px;
	border-radius: 100%;
	border: 2px solid #061E74;
	position: absolute;
	top: 90px;
	left: 70px;
}

.ghostWave {
	position: absolute;
	width: 120px;
	height: 20px;
	background-size: 25px 20px;
	background-image: radial-gradient(circle at 50% 0%, #fff, 71%, transparent 71%);
}

.shadow {
	width: 120px;
	height: 10px;
	border-radius: 100%;
	background: #061E74;
	opacity: 0.3;
	margin-top: 50px;
	animation: shadow 1s infinite alternate;
	-webkit-animation: shadow 1s infinite alternate;
}
</style>
</head>
<%response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "No-cache");
response.setDateHeader("Expires", -1);
response.setHeader("Cache-Control", "No-store");%>
<%session.invalidate();%>
<script type="text/javascript">
	$(function() {
		//清楚缓存
			
			//history.go(0);
	$('.loginbox').css({
			'position' : 'absolute',
			'left' : (document.body.clientWidth - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : (document.body.clientWidth - 692) / 2
			});
		});
		$('#username').addClass('loginuser');
		$('#password').addClass('loginpwd');
		});

</script>


<body>
	<h1 style="margin-left: 10px;">
		<img src="./images/ylts.png">
	</h1>

	<div class="login" style="margin-top:50px;">

		<div class="header">
			<div class="switch" id="switch">
				<a class="switch_btn_focus" id="switch_qlogin"
					href="javascript:void(0);" tabindex="7">快速登录</a> <a
					class="switch_btn" id="switch_login" href="javascript:void(0);"
					tabindex="8">APP二维码</a>
				<div class="switch_bottom" id="switch_bottom"
					style="position: absolute; width: 64px; left: 0px;"></div>
			</div>
		</div>


		<div class="web_qr_login" id="web_qr_login"
			style="display: block; height: 235px;">

			<!--登录-->
			<div class="web_login" id="web_login">


				<div class="login-box">


					<div class="login_form">
						<form action="login.do" id="myform" method="post">
							<input type="hidden" value="login" name="method">

							<div class="uinArea" id="uinArea">
								<label class="input-tips" for="u">帐号：</label>
								<div class="inputOuter" id="uArea">

									<input autocomplete="off" name="username" id="username"
										type="text" class="inputstyle" value=""
										onclick="JavaScript:this.value=''" />
								</div>
							</div>
							<div class="pwdArea" id="pwdArea">
								<label class="input-tips" for="p">密码：</label>
								<div class="inputOuter" id="pArea">
									<input class="inputstyle" name="password" id="password"
										value="" type="password">

								</div>
							</div>

							<div style="padding-left:50px;margin-top:20px;">
								<input type="button" value="登 录" style="width:150px;"
									class="button_blue" onclick="beforloginUser()" />
							</div>
						</form>
					</div>

				</div>

			</div>
			<!--登录end-->
		</div>

		<!--注册-->
		<div class="qlogin" id="qlogin" style="display: none; ">

			<div class="web_login">
				<div style="margin-left: 110px;margin-top: 10px;">
					<img width="150px" alt="二维码" title="APP下载"
						src="login.do?method=getQrcode&content=http://123.232.119.3:8090/yilutong/apk/yilutong.apk">
				</div>
			</div>

			<!--   <div style=""><img alt="二维码" title="APP下载" src="login.do?method=getQrcode&content=http://123.232.119.3.:8090/yilutong/apk/yilutong.apk"></div> -->
		</div>
		<!--注册end-->
	</div>
	<div class="jianyi">*推荐使用ie8或以上版本ie浏览器或Chrome内核浏览器访问本站</div>
	<ul>
		<li>
			<%
				if (request.getParameter("errornote") != null) {
			%>
			<p style="color: red">该用户没有指定权限</p> <%
 	}
 %> <%
 	if (request.getParameter("erroruseragin") != null) {
 %>
			<p style="color: red">用户重复登陆</p> <%
 	}
 %> <br /> <br /> <%
 	if (request.getParameter("erroruser") != null) {
 %>
			<p style="color: red">
				<strong>错误！</strong>用户名或密码不正确！。
			</p> <%
 	}
 %>
		</li>
	</ul>
</body>


<script type="text/javascript">
	document.onkeydown = function(event) {
		e = event ? event : (window.event ? window.event : null);
		if (e.keyCode == 13) {
			//执行的方法 
			beforloginUser();
		}
	};
	function beforloginUser() {
		$('body').addClass('lyouts');

		setTimeout(loginUser, 500);
	}
	function loginUser() {
		$.cookie("usertime", null, {
			path : '/'
		}); //删除cookie
		if ($('#checkboxmima').is(':checked')) {
			$.cookie("username", $("#username").val(), {
				path : '/'
			});
			$.cookie("password", $("#password").val(), {
				path : '/'
			}); //添加cookie
		} else {
			$.cookie("password", null, {
				path : '/'
			}); //删除cookie
			$.cookie("username", null, {
				path : '/'
			});
		}

		$("#myform").submit();
	}
	function closeerror() {
		$("#myAlert").alert('close');
	}
</script>
</html>