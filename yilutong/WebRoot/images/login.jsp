<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>项目管理系统后台登陆</title>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
  	<link rel="stylesheet" href="css/login.css" type="text/css"></link>
  <% 
String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath()+request.getServletPath().substring(1,request.getServletPath().lastIndexOf("/")+1); 
%> 
  </head>
  <script type="text/javascript" src="js/jquery.cookie.js"></script>
  <script type="text/javascript">
/*   $(function(){
  		$("#dlg").dialog('open');
  		//获取所属部门名称
  		$("#cc").combobox({
			url : 'login.do?method=getDepartment',
			valueField : 'id',
			textField : 'text',
			panelHeight:'auto'
		});

  	}); */
	//登录
  	function loginUser(){
<%--   	var username=$("#username").val();
 	var passoword=$("#password").val();
  	var url='login.do?method=login&username='+username+'&password='+passoword;
 		window.open('<%=realPath1%>'+url,'tolayout','width='+(window.screen.availWidth-10)+',height='+(window.screen.availHeight-65)+ ',top=0,left=0,resizable=yes,status=yes,menubar=no,scrollbars=yes,fullscreen=1');
 --%>  
 $.cookie("usertime", null, { path: '/' });  //删除cookie  
 $("#myform").submit();  
  	}

 /*  	//注册
  	function RegUser(){
  		var myform=document.forms[1];
  		var username = document.getElementById("username_").value;
  		var password = document.getElementById("password_").value;
  		var password1 = document.getElementById("password1_").value;
  		var realName = document.getElementById("realName_").value;
  		var did = $("#cc").combobox('getValue');
  		if(username==""){
  			alert("请输入名字!");
  			return false;
  		}else if(password == ""){
  			alert("请输入密码!");
  			return false;
  		}else if(password1 == ""){
  			alert("请输入确认密码!");
  			return false;
  		}else if(password1 != password){
  			alert("不一样");
  			return false;
  		}else if(realName==""){
  			alert("请输入真实姓名");
  			return false;
  		}else if(did==""){
  			alert("请选择部门");
  			return false;
  		}else{
	  		myform.action="login.do";
	  		myform.submit();
  		}
  	} */
  /* 	//注册框
  	function RegistrationUser(){
  		$('#dd').dialog('open');
  	}
  	//取消注册框
  	function CancelUser(){
  		$('#dd').dialog('close');
  		$("#dlg").dialog('open');
  	} */
  	
  	/* $(function(){
	//得到焦点
	$("#password").focus(function(){
		$("#left_hand").animate({
			left: "150",
			top: " -38"
		},{step: function(){
			if(parseInt($("#left_hand").css("left"))>140){
				$("#left_hand").attr("class","left_hand");
			}
		}}, 2000);
		$("#right_hand").animate({
			right: "-64",
			top: "-38px"
		},{step: function(){
			if(parseInt($("#right_hand").css("right"))> -70){
				$("#right_hand").attr("class","right_hand");
			}
		}}, 2000);
	});
	//失去焦点
	$("#password").blur(function(){
		$("#left_hand").attr("class","initial_left_hand");
		$("#left_hand").attr("style","left:100px;top:-12px;");
		$("#right_hand").attr("class","initial_right_hand");
		$("#right_hand").attr("style","right:-112px;top:-12px");
	}); 
});*/
$(function(){
		//回车点击获取事件
	document.onkeydown=function(event){ 
		e = event ? event :(window.event ? window.event : null); 
		if(e.keyCode==13){ 
		//执行的方法 
		loginUser();
		} 
	};
})
</script>
</head>
<body>
<div class="top_div"></div>  <!-- 登陆窗口上方深色部分 -->
<div class="login_box">   <!-- 登陆窗口主体部分 -->
	<div class="img_owl">    <!-- 猫头鹰 -->
    	<div class="owl_head"></div>
    	<div class="initial_left_hand" id="left_hand"></div>
    	<div class="initial_right_hand" id="right_hand"></div>
	</div>
	<div style="margin-top:60px;" ></div>
	<form name="form1" method="post" action="login.do" id="myform" ENCTYPE="multipart/form-data" style="margin-top: -10px;"><!-- target="tolayout" -->
		<input type="hidden" value="login" name="method">
		
		<p class="login_user">
			<input type="text" name="username" class="ipt"  id="username"  placeholder="请输入用户名"/>
			<span class="user_logo"></span>
		</p>
		
		
		<p class="login_pwd">
			<input type="password" name="password" class="ipt" id="password"  placeholder="请输入密码" />
			<span class="pwd_logo"></span>
		</p>
<!-- class="login-btn" -->
		<button type="button" name="sm1" class="login-btnn" onclick="loginUser()">登录</button>
<!-- 		<button type="button" name="sm1" class="login-btnn" onclick="RegistrationUser()">注册</button>
 -->	</form>
	<div>
	<% if(request.getParameter("errornote")!=null){%>
			<p style="color: red">该用户没有指定权限</p>
	<% }%>
	<%if(request.getParameter("erroruser")!=null){ %>
			<p style="color: red">用户名密码不正确</p>
	<%} %>
	<%if(request.getParameter("erroruseragin")!=null){ %>
			<p style="color: red">用户重复登陆</p>
	<%} %>
	</div>
	<div class="bottom_box">
		<p class="bottom_box_txt">
			<span style="float: left;margin-left: 2px;"><a href="#" target="_blank" title="java团队">JAVA团队</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" title="返回网站主页">返回网站主页</a></span>
		</p>
	</div>
</div>

<!-- <!-- 注册 
	<div id="dd" class="easyui-dialog" title="注册" style="width:400px;height:510px;padding:20px 20px 20px 90px"  data-options="iconCls:'icon-save',resizable:true,modal:true,collapsible:true,minimizable:true,closed:true">
		<form action="user.do" method="post" id="Regform">
			<input type="hidden" value="addUser" name="method">
			<div style="margin-bottom:20px">
	            <p>用户名:</p>
	            <input id="username_" class="easyui-textbox" name="username" data-options="prompt:'请输入用户名..',required:true" style="width:70%;height:32px">
	        </div>
	        <div style="margin-bottom:20px">
	            <p>密码:</p>
	            <input id="password_" class="easyui-textbox" name="password" style="width:70%;height:32px" type="password" data-options="prompt:'请输入密码..',required:true">
	        </div>
	        <div style="margin-bottom:20px">
	        	<p>重复密码:</p>
	            <input class="easyui-textbox" name="password1" id="password1_" style="width:70%;height:32px" type="password" data-options="prompt:'请输入密码..',required:true">
	        </div>
	        <div style="margin-bottom:20px">
	        	<p>真实姓名:</p>
	            <input id="realName_" class="easyui-textbox" name="realName" style="width:70%;height:32px" data-options="prompt:'输入真实姓名..',required:true">
	        </div>
	        <div>
	        	<p>所属部门编号:</p>
	            <input id="cc" class="easyui-combobox" name="did" data-options="prompt:'请选择部门..',required:true" style="width:70%;height:32px" data-options="valueField:'id',textField:'text',url:'user.do?method=getDepartment'"/>
	        </div>
	        <div style="padding:20px 10px 10px 20px">
            	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" style="width:30%;height:32px" onclick="RegUser()">注册</a>
            	<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" style="width:30%;height:32px;position:absolute;right:130px;" onclick="CancelUser()">取消</a>
        	</div>
        </form>
	</div> -->

</body>
</html>
