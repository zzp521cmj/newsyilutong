<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<!DOCTYPE>
<html>
  <head>
 <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName); %>
     <% String flag=(String)request.getAttribute("flag"); %>
    <base href="<%=basePath%>">
    <title>个人信息</title>
    
    	<link rel="stylesheet" type="text/css" href="./css/main.css">
    	   <link rel="stylesheet" href="./bootstrap/css/bootstrap.css" type="text/css"></link>
       <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css" type="text/css"></link>
      
                                  <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
        <script type="text/javascript" src="./bootstrap/js/bootstrap.min.js"></script>
<style>
.uploader {
	position: relative;
	display: inline-block;
	overflow: hidden;
	cursor: default;
	padding: 0;
	margin: 10px 0px;
	-moz-box-shadow: 0px 0px 5px #ddd;
	-webkit-box-shadow: 0px 0px 5px #ddd;
	box-shadow: 0px 0px 5px #ddd;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
	border-radius: 5px;
}

.filename {
	float: left;
	display: inline-block;
	outline: 0 none;
	height: 32px;
	width: 250px;
	margin: 0;
	padding: 8px 10px;
	overflow: hidden;
	cursor: default;
	border: 1px solid;
	border-right: 0;
	font: 9pt/100% Arial, Helvetica, sans-serif;
	color: #777;
	text-shadow: 1px 1px 0px #fff;
	text-overflow: ellipsis;
	white-space: nowrap;
	-moz-border-radius: 5px 0px 0px 5px;
	-webkit-border-radius: 5px 0px 0px 5px;
	border-radius: 5px 0px 0px 5px;
	background: #f5f5f5;
	background: -moz-linear-gradient(top, #fafafa 0%, #eee 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #fafafa),
		color-stop(100%, #f5f5f5));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#fafafa',
		endColorstr='#f5f5f5', GradientType=0);
	border-color: #ccc;
	-moz-box-shadow: 0px 0px 1px #fff inset;
	-webkit-box-shadow: 0px 0px 1px #fff inset;
	box-shadow: 0px 0px 1px #fff inset;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.button {
	float: left;
	height: 32px;
	display: inline-block;
	outline: 0 none;
	padding: 8px 12px;
	margin: 0;
	cursor: pointer;
	border: 1px solid;
	font: bold 9pt/100% Arial, Helvetica, sans-serif;
	-moz-border-radius: 0px 5px 5px 0px;
	-webkit-border-radius: 0px 5px 5px 0px;
	border-radius: 0px 5px 5px 0px;
	-moz-box-shadow: 0px 0px 1px #fff inset;
	-webkit-box-shadow: 0px 0px 1px #fff inset;
	box-shadow: 0px 0px 1px #fff inset;
}

.uploader input[type=file] {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	border: 0;
	padding: 0;
	margin: 0;
	height: 30px;
	cursor: pointer;
	filter: alpha(opacity = 0);
	-moz-opacity: 0;
	-khtml-opacity: 0;
	opacity: 0;
}

input[type=button]::-moz-focus-inner {
	padding: 0;
	border: 0 none;
	-moz-box-sizing: content-box;
}

input[type=button]::-webkit-focus-inner {
	padding: 0;
	border: 0 none;
	-webkit-box-sizing: content-box;
}

input[type=text]::-moz-focus-inner {
	padding: 0;
	border: 0 none;
	-moz-box-sizing: content-box;
}

input[type=text]::-webkit-focus-inner {
	padding: 0;
	border: 0 none;
	-webkit-box-sizing: content-box;
}

/* White Color Scheme ------------------------ */
.white .button {
	color: #555;
	text-shadow: 1px 1px 0px #fff;
	background: #ddd;
	background: -moz-linear-gradient(top, #eeeeee 0%, #dddddd 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #eeeeee),
		color-stop(100%, #dddddd));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#eeeeee',
		endColorstr='#dddddd', GradientType=0);
	border-color: #ccc;
}

.white:hover .button {
	background: #eee;
	background: -moz-linear-gradient(top, #dddddd 0%, #eeeeee 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #dddddd),
		color-stop(100%, #eeeeee));
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#dddddd',
		endColorstr='#eeeeee', GradientType=0);
}
.jcrop-holder{
	margin-left: 100px;
}
</style>
  <link rel="stylesheet" href="./js/jcrop/jquery.Jcrop.css" type="text/css"></link>
  <script type="text/javascript" src="./js/jcrop/jquery.Jcrop.js"></script>
  </head>
<script type="text/javascript">

function previewImage(file)  
{  
  var MAXWIDTH  = 130;  
  var MAXHEIGHT = 130;  
  var div = document.getElementById('preview');  
  if (file.files && file.files[0])  
  {  
    div.innerHTML = '<img id=imghead>';  
    var img = document.getElementById('imghead');  
    img.onload = function(){  
      var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);  
      img.width = MAXWIDTH;  
      img.height = MAXHEIGHT;  
      /* img.style.marginLeft = rect.left+'px';  
      img.style.marginTop = rect.top+'px'; */  
    }
    var reader = new FileReader();  
    reader.onload = function(evt){img.src = evt.target.result;}
    reader.readAsDataURL(file.files[0]);  
  }  
  else  
  {  
    var sFilter='filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
    file.select();  
    var src = document.selection.createRange().text;  
    div.innerHTML = '<img id=imghead>';  
    var img = document.getElementById('imghead');  
    img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;  
    var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);  
    status =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);  
    div.innerHTML = "<div id=divhead style='width:"+rect.width+"px;height:"+rect.height+"px;margin-top:"+rect.top+"px;margin-left:"+rect.left+"px;"+sFilter+src+"\"'></div>";  
  }  
}  
function clacImgZoomParam( maxWidth, maxHeight, width, height ){  
    var param = {top:0, left:0, width:width, height:height};  
    if( width>maxWidth || height>maxHeight )  
    {  
        rateWidth = width / maxWidth;  
        rateHeight = height / maxHeight;  
          
        if( rateWidth > rateHeight )  
        {  
            param.width =  maxWidth;  
            param.height = Math.round(height / rateWidth);  
        }else  
        {  
            param.width = Math.round(width / rateHeight);  
            param.height = maxHeight;  
        }  
    }  
      
    param.left = Math.round((maxWidth - param.width) / 2);  
    param.top = Math.round((maxHeight - param.height) / 2);  
    return param;  
}  
  var depart=<%=user.getDid()%>;

$(function(){
$.ajax({
  			type: "POST",
  			async : false,
  			url:'login.do?method=getRoles',
  			success:function(data){
  			var rols = data.split(",");
  			for(var i=0;i<rols.length;i++){
  			$("#role").append(rols[i]+" ");
  			//$("#role").html(rols[i]);
  			}
  			}
  		}); 
  		$.ajax({
  			type: "POST",
  			async : false,
  			url:'depn.do?method=getDepn',
  			data:{department_id:depart},
  			success:function(data){
  			$("#pname").html(data.department_name);
  			$("#pnameid").html(data.department_id);
  			$("#pnamefid").html(data.father_id);
  			//$("#departments").append("<li>"+data+"</li>");
  			}
  		});
var flag='<%=flag%>';
 if(flag==1){
	$.messager.alert('提示','上传头像成功，刷新页面即可查看');
} 
$('#dlg1').dialog({
			title : '添加',
			width : 500,
			height : 430,
			closed : true,
			cache : false,
			modal : true,
			buttons : [{
				text : '<input type="button"  class="btncss" value="上传"/>',
				handler : function() {
					var files = $('#filename').val();
					var getdian = files.indexOf(".");
					if (getdian > 0) {
						var hz = files.substring(getdian, files.length);
						if (hz == ".jpg" || hz == ".png") {
							$("#uploadform").action="person.do?method=uploadHeadImage";
 							$("#uploadform").submit();
						} else {
							$.messager.alert('上传头像', '请选择正确的文件格式', 'info');
						}
					}else {
						$.messager.alert('上传头像', '没有后缀名的文件', 'info');
					}
 					
				}
			}] 
		});
		//$("#dlg2").modal("hide");
$("input[type=file]").change(function() {
			$(this).parents(".uploader").find(".filename").val($(this).val());
			readURL(this);
		});
		$("input[type=file]").each(
				function() {
					if ($(this).val() == "") {
						$(this).parents(".uploader").find(".filename").val(
								"没有选择文件... ...");
					}
				});
				
});
function btnheadfile(){
	$("#dlg1").dialog('open');
}

//修改密码
		/* function editPass(){
			//$("#dlg2").dialog('open');
			alert("1111")
			//$('#dlg2').popover(options)
		} */
		function updatepassword() {
				var id ='<%=user.getId()%>';
				var password2 = document.getElementById("password2").value;
				var password1 = document.getElementById("password1").value;
				var password3 = document.getElementById("password3").value;
				if (password1 == ""||password2==""||password3=="") {
					parent.$.messager.alert('警告!', '密码不能为空，请输入密码!', 'info');
				} else { 
					//if(!(password2.length>5&&password2.length<13)&&!(password3.length>5&&password3.length<13)){
					//	parent.$.messager.alert('警告!', '你输入密码长度有错，密码应为6-12位!', 'info');
					//} else
					 if(password2!=password3){
						parent.$.messager.alert('警告!', '你输入的新密码两次不一致!', 'info');
					}else {
						//myform.action = "user.do?method=modifypassword";
						//myform.submit();
						$.ajax({
						url: "user.do?method=modifypassword",
						type: "POST",
						data:{id:id,
						password1:password1,
						password2:password2},
			  				success:function(data){
			  					if (data.ans=="1") {
									parent.$.messager.alert("警告!","密码修改成功，下次登录自动生效！",'info',
										function(r) {
											$("#password1").val("");
											$("#password2").val("");
											$("#password3").val("");
											$('#myModal').modal("hide");
 										});
  								}else if (data.ans=="3"){
  									parent.$.messager.alert("警告!","密码修改失败，原密码错误！",'info',
  									function(r) {
											$("#password1").val("");
											$("#password2").val("");
											$("#password3").val("");
 										}
  									);
  								}else if (data.ans=="2"){
  									parent.$.messager.alert("警告!","密码修改失败，请重新输入！",'info',
  									function(r) {
											$("#password1").val("");
											$("#password2").val("");
											$("#password3").val("");
 										}
  									);
  								}
  						}
					});
					}
					}
			}
//定义一个全局api，这样操作起来比较灵活
        var api = null;
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.readAsDataURL(input.files[0]);
                reader.onload = function (e) {
                    $('#cutimg').removeAttr('src');
                    $('#cutimg').attr('src', e.target.result);
                    api = $.Jcrop('#cutimg', {
                        setSelect: [ 2, 2, 130, 130 ],
                        maxSize:[130,130],
                        minSize:[100,100],
                        aspectRatio: 1,
                        onSelect: updateCoords
                    });
                };
                if (api != undefined) {
                    api.destroy();
                }
            }
            function updateCoords(obj) {
                $("#x").val(obj.x);
                $("#y").val(obj.y);
                $("#w").val(obj.w);
                $("#h").val(obj.h);
            };
        }
        
</script>
<body style="padding: 30px">
<div class="panel panel-default">
    <h3 style="margin-left: 20px;font: 17px/20px 'Microsoft YaHei',微软雅黑,Helvetica,Arial,sans-serif;">基本角色</h3>
    <hr>
   	<form action="" method="post">
    <fieldset>
      <div class="panel-bodys">
	  	<div class="form-horizontal">
			<div class="form-group" style="margin-top: 15px;">
				<label for="" class="col-sm-2 control-label">角色</label>
				<div class="col-sm-4" >
<!-- 					<input type="text" class="form-control" placeholder=""> -->
					<label id="role" style="margin-top: 7px;"></label>
				</div>
				<label for="" class="col-sm-2 control-label" >所属机构</label>
				<div class="col-sm-4">
					<label id="pname" style="margin-top: 7px;"></label>
				</div>
			</div>
			<div class="form-group" style="margin-top: 15px;">
				<label for="" class="col-sm-2 control-label">所属机构代码</label>
				<div class="col-sm-4">
					<label id="pnameid"style="margin-top: 7px;"></label>
				</div>
				<label for="" class="col-sm-2 control-label">所属顶级机构代码</label>
				<label id="pnamefid" class="col-sm-4"style="margin-top: 7px;"></label>
			</div>
			<div class="form-group" style="margin-top: 15px;">
				<label for="" class="col-sm-2 control-label" >登陆名</label>
				<div class="col-sm-4">
					<label style="margin-top: 7px;"><%=user.getUsername()%></label>
				</div>
			<label for="" class="col-sm-2 control-label" >修改密码</label>
				<div class="col-sm-4">
				<!--  <a  data-toggle="modal" class="btn btn-primary btn-lg" data-target="#myModal" >修改密码</a>-->
	  				 <label style="margin-top: 7px;"><a data-toggle="modal" 
   					data-target="#myModal">修改密码</a></label> 
				</div> 
				
				</div>
			<!--<div class="form-group" style="margin-top: 15px;">
				<label for="" class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-4">
					<label style="margin-top: 7px;"></label>
					</div>
			-->
			<div class="form-group" style="margin-top: 15px;">
				<label for="" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-4">
					<label style="margin-top: 7px;"><%=user.getRealName()%></label>
				</div>
				<label for="" class="col-sm-2 control-label">用户手机号</label>
				<div class="col-sm-4">
					<input type="text"  disabled name="" placeholder="" style="margin-top: 7px;border: 0;background: #fff;" >
				</div>
				
			</div>
			<div class="form-group" style="margin-top: 15px;">
				<label for="" class="col-sm-2 control-label">用户电子邮箱</label>
				<div class="col-sm-4">
					<input type="email"   disabled style="margin-top: 7px;border: 0;background: #fff;" name="" placeholder="">
				</div>
				<label for="" class="col-sm-2 control-label">上传头像</label>
				<div class="col-sm-4">
				 	<div class="controls" style="margin-top:6px; ">
						<a href="javascript:void(0)" class="input-file" onclick="btnheadfile()" style="margin-top: 7px;">上传</a>          			
					</div>
				</div>
			</div>
		</div>
		</div>
		</fieldset>
		</form>
	  <div class="panel-footer" style="margin-top: 15px;height:60px">
	  	
	</div>
	 </div>
	<!--  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <button type="button" class="close" 
               data-dismiss="modal" aria-hidden="true">
                  &times;
            </button>
            <h4 class="modal-title" id="myModalLabel">
               模态框（Modal）标题
            </h4>
         </div>
         <div class="modal-body">
            在这里添加一些文本
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default" 
               data-dismiss="modal">关闭
            </button>
            <button type="button" class="btn btn-primary">
               提交更改
            </button>
         </div>
      </div> /.modal-content
</div> /.modal 
</div> -->
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
 		  aria-labelledby="myModalLabel" aria-hidden="true">
		<form action="" method="post" id="editpass">
		<div class="modal-dialog">
      	<div class="modal-content">
			    <div class="modal-header">
			    <a class="close" data-dismiss="modal">×</a>
			    <b>修改密码</b>
			    </div>
			    <div class="modal-body">
			    <div class="form-horizontal">
			    <div class="form-group" >
				<label for="" class="col-sm-3 control-label"style="padding-top: 15px">原密码</label>
				<div class="col-sm-7">
					<input type="password"  class="form-control"  id="password1" name="password1" placeholder="请输入您的原始密码" style="width:250px;margin-top: 7px;background: #fff;" >
				</div>
				</div>
				<div class="form-group" >
				<label for="" class="col-sm-3 control-label" style="padding-top: 15px">新密码</label>
				<div class="col-sm-7">
					<input type="password"   class="form-control" id="password2"name="password" placeholder="请输入您的新密码" style="width:250px;margin-top: 7px;background: #fff;" >
				</div>	
				</div>
				<div class="form-group" >
				<label for="" class="col-sm-3 control-label"style="padding-top: 15px">确认密码</label>
				<div class="col-sm-7">
					<input type="password"   class="form-control" id="password3"name="password" placeholder="请再次输入您的新密码" style="width:250px;margin-top: 7px;background: #fff;" >
				</div>	
				</div>
				</div>
			</div>
			    <div class="modal-footer">
			    <a href="javascript:void(0)" class="btn btn-primary" onclick="updatepassword()">修改</a>
			    <a href="javascript:void(0)" type="button" class="btn btn-default"  data-dismiss="modal">关闭</a>
			    </div>
			  </div>
			  </div>
		<!--	 <div  id="buttons3"class="panel-footer" style="margin-top: 15px;height:55px">
			 <div class="col-sm-8 "></div>
	  			<div class="col-sm-2 ">
	  				  <button type="submit"  id="buttons3" class="btn btn-lg btn-danger" onclick="updatepassword()" data-toggle="popover" title="Popover title" data-content="">
	  				<span class="glyphicon glyphicon-floppy-disk"  aria-hidden="true"></span>保存</button>
	  				<button id="buttons3" onclick="updatepassword()"class="btn btn-default" type="submit">
	  				<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>保存</button>
	  			</div>
	  			<div class="col-sm-2 ">
	  				<button class="btn btn-default" onclick="closeps('password');"type="submit">
	  				<span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>取消</button>
	  			</div>
			</div> -->
		</form>
		</div> 
	
	<div id="dlg1">
	<form name="form" action="person.do?method=uploadHeadImage" class="form-horizontal"
      method="post" enctype="multipart/form-data" id="uploadform">
    <div class="modal-body text-center">
        <div class="zxx_main_con">
            <div class="zxx_test_list">
            	<div class="uploader white">
	            <input type="text" id="filename" class="filename"
						readonly="readonly" /> <input type="button" name="file"
						class="button" value="选择文件" /> <input type="file" name="imgFile"
						size="30" />     
				</div>         
				<br>
				<div style="text-align: center;font-family: 'Microsoft YaHei', 微软雅黑, Arial, Helvetica, sans-serif; font-size: 13px;  color: blue;">
				提示：请选择正确的文件格式（.jpg或 .png）
				</div>
 				<img alt="" src="./images/touxiang2.jpg" id="cutimg" style="display: inline-block;"/>
                <input type="hidden" id="x" name="x"/>
                <input type="hidden" id="y" name="y"/>
                <input type="hidden" id="w" name="w"/>
                <input type="hidden" id="h" name="h"/>
            </div>
        </div>
    </div>
</form>
    </div>
</body>
</html>
