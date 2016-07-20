<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'maplinimp.jsp' starting page</title>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
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
</style>
<%
	String flg_id=(String)request.getAttribute("flg_id");
	String s = "";
	if (request.getAttribute("filesname") != null) {
		s = request.getAttribute("filesname").toString();
			User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
			request.setAttribute("name", user.getUsername());
%>
<script type="text/javascript">
$(function() {
var usersname="<%=user.getUsername()%>";
var filename="<%=s%>";
		if (filename != null || filename != "") {
			var win = $.messager.progress({
				title : '请稍等',
				msg : '正在导入...',
				text : '拼命加载中...',
				interval : 500
			});
			$.ajax({
				type : "POST",
				url : 'orderC.do?method=implinplan',
				data : {
					filename : filename,
					usersname : usersname
				},
				success : function(msg) {
					var zs=msg.split("#")[0];
					var cg=msg.split("#")[1];
					var order=msg.split("#")[2];
					$("#pid").val(msg.split("#")[3]);
					var ms="<span>导入完成！<br>总数据为 ："+zs+"<br>导入成功数："+cg+"</span>"+"<br>未导入运单号："+order+"</span>";
					parent.$.messager.alert('导入运单成功', ms, 'info');
					$.messager.progress('close');
				}
			});
		};
	});
</script>
<%
	}
%>
<script>
	$(function() {
	$("#pid").val('<%=flg_id%>');
		$("input[type=file]").change(function() {
			$(this).parents(".uploader").find(".filename").val($(this).val());
		});
		$("input[type=file]").each(
				function() {
					if ($(this).val() == "") {
						$(this).parents(".uploader").find(".filename").val(
								"没有选择文件... ...");
					}
				});
				$('#cc').combobox({   

                  //  url:'combobox_data.json',   

                    valueField:'id',   

                    textField:'text'  

  });   
				
	});

	var submitForm = function($dialog, $dg, $pjq) {
		$pjq.messager.confirm('导入运单', '确定要导入运单?', function(r) {
			if (r) {
				var files = $('#filename').val();
				var getdian = files.indexOf(".");
				if (getdian > 0) {
					var hz = files.substring(getdian, files.length);
					if (hz == ".xlsx" || hz == ".xlsm" || hz == ".xltx"
							|| hz == ".xltm" || hz == ".xlsb" || hz == ".xlam"
							|| hz == ".xls") {
						$("#impform").submit();
					} else {
						$pjq.messager.alert('导入运单', '请选择正确的文件格式', 'info');
					}
				} else {
					$pjq.messager.alert('导入运单', '没有后缀名的文件', 'info');
				}
			}
		});
		
	};
	
</script>
<style type="text/css">
.ui-select {  
    text-align: center;  
    /* 加border只是为了看到边框*/  
    border:solid 0px;  
}  
.ui-select select {  
    position: absolute;  
    left: 0px;  
    top: 0px;  
    width: 100%;  
    height: 3em;  
    opacity:0;  
}  
</style>

</head>
<body style="overflow: hidden;">
 
        
             <!--   选择用户模板：<input type="text" id="" name="" />
          是否开票 ：<input type="radio" name="qualityProblemCircs" value="1">是&nbsp;<input type="radio" name="qualityProblemCircs" value="0" checked>否&nbsp;<br>
       
           开票税率：<input type="text" id="" name=""/>
            电话预约： <input type="radio" name="qualityProblemCircs" value="1">是&nbsp;<input type="radio" name="qualityProblemCircs" value="0" checked>否&nbsp;
         
          -->
	    <div class="ui-select">
	       <select id="cc" name="dept" style="width:200px; "> 
	       <option >==请选择导入模板==<</option>  
	       <option value="1">易路通Excel导入模板</option>  
	       </select> 
	     </div>     
		<div>
		<div style="text-align: center;  margin-top: 40px;">
		<!--  <input id="cc" name="dept" value="aa">  --> 
				 
			<div class="uploader white">
			<form action="orderC.do?method=startimplinplan" id="impform"
					method="post" enctype="multipart/form-data">
				
					<input type="text" id="filename" class="filename"
						readonly="readonly" /> <input type="button" name="file"
						class="button" value="选择文件" /> <input type="file" name="files"
						size="30" />
						<input id="pid" name="pid" type="hidden">
				</form>
			</div>
		</div>
		<br>
		<div
			style="text-align: center;font-family: 'Microsoft YaHei', 微软雅黑, Arial, Helvetica, sans-serif; font-size: 13px;  color: blue;">提示：请选择正确的文件格式（.xls
			或 .xlsx）<br>
			<br></div>
	</div>
</body>
</html>
