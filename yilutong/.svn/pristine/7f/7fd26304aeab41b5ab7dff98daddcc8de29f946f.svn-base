<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
	String s = "";
	if (request.getAttribute("filesname") != null) {
		s = request.getAttribute("filesname").toString();
%>
<script type="text/javascript">
$(function() {
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
				url : 'linplan.do?method=implinplan',
				data : {
					filename : filename
				},
				success : function(msg) {
					var zs=msg.split("#")[0];
					var cg=msg.split("#")[1];
					var ch=msg.split("#")[2];
					var carno=ch.substring(1,ch.length-1);
					var ms="<span>导入完成！<br>总数据为 ："+zs+"<br>导入成功数："+cg+",未导入的车号有："+carno+"</span>";
					parent.$.messager.alert('导入发车计划', ms, 'info');
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
	});

	var submitForm = function($dialog, $dg, $pjq) {
		$pjq.messager.confirm('导入订单信息', '确定要导入订单信息?', function(r) {
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
						$pjq.messager.alert('导入发车计划', '请选择正确的文件格式', 'info');
					}
				} else {
					$pjq.messager.alert('导入发车计划', '没有后缀名的文件', 'info');
				}
			}
		});
	};
</script>

</head>
<body style="overflow: hidden;">
	<div>
		<div style="text-align: center;  margin-top: 40px;">
			<div class="uploader white">
				<form action="shipOrder.do?method=startimplinplan" id="impform"
					method="post" enctype="multipart/form-data">
					<input type="text" id="filename" class="filename"
						readonly="readonly" /> <input type="button" name="file"
						class="button" value="选择文件" /> <input type="file" name="files"
						size="30" />
				</form>
			</div>
		</div>
		<br>
		<div
			style="text-align: center;font-family: 'Microsoft YaHei', 微软雅黑, Arial, Helvetica, sans-serif; font-size: 13px;  color: blue;">提示：请选择正确的文件格式（.xls
			或 .xlsx）<br><span style="color:red">导入失败原因：请检查excel金额列是否有非数字数据</span>
			<br></div>
	</div>
</body>
</html>
