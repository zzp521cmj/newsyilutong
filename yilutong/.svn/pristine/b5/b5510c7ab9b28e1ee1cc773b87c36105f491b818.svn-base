<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>图片上传</title>
    
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<link rel="stylesheet" type="text/css"
	href="./webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="./webuploader/style.css" />
<script type="text/javascript" src="./webuploader/jquery.js"></script>
<script type="text/javascript" src="./webuploader/webuploader.js"></script>
<script type="text/javascript"
	src="./webuploader/backshiporder_uplaod.js"></script>
  </head>
  <% String pid=(String)request.getAttribute("flg");%>
  <script type="text/javascript">  
  	var pid='<%=pid%>';
  	
  		//$('#signform').serialize()
  		$(function(){
  		di();		
 		});
 		 var submitForm= function($dialog, $grid, $pjq, $mainMenu) {
		 	$pjq.messager.confirm('回单上传', '确定要上传吗?', function(r) {
					if (r) {
						$.ajax({
							type : "POST",
							url : 'travel.do?method=savepit',
							data :{ids:pid},
							success : function(msg) {
								if (msg.flag) {
									$pjq.messager.alert('司机上传', '司机上传图片成功',
											'info');
									$dialog.dialog('close');
									$grid.datagrid('reload');
								} else {
									$pjq.messager.alert('司机上传', '司机上传图片失败',
											'info');
								}
								;
							}
						});
					}
				});
		 };
  </script>
  <body >
		<div>
		<form action="" id="signform">
		<input readonly="readonly" type="hidden" name="order_id" id="order_id">
		<fieldset>
			<table class="tableclass" id="signtable">
				<tr id="trupload">
					<td>上传：</td>
					<td colspan="3">
						<div id="wrapper">
							<div id="container">
								<!--头部，相册选择和格式选择-->

								<div id="uploader">
									<div class="queueList">
										<div id="dndArea" class="placeholder">
											<div id="filePicker"></div>
											<p>请将照片拖到这里，单次最多可选5张</p>
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
						</div> <!--   -->
					</td>
				</tr>					
			</table>
		</fieldset>
	</form>
	</div>
  </body>
</html>
