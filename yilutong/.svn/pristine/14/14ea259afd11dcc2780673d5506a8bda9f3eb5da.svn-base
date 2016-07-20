<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML >
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'InputDriver.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css"/>
  </head>
  	<script >
  		function downExcel(){
  			window.open('team/司机表格模板.xlsx');
  		}
  	</script>
  
  <body>
   	<div class="panel panel-default">
		  <div class="panel panel-heading"> 
			  <label><b>首页</b><label>	
		  </div>
 	 <div class="panel panel-body" style="padding: 0px 30px 0px 30px">
		  <div class="row"  style="padding: 0px 0px 20px 0px">
		  	<div class="col-md-1">
			  	<button type="button" class="btn btn-default" aria-label="Left Align" onclick="returnDriverInfo()">
	 			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true">返回</span>
				</button>
			</div>
		 </div>
		 <div class="panel panel-default">
		 	<div class="panel panel-body" style="padding:0px 10px 0px 30px">
		 		<div class="row" style="margin-bottom:10px">
		 			<div class="col-sm-4" style="padding:0px 10px 0px 20px">
		 				<label><h3>导入车主:第一步</h3></label>
		 			</div>
		 		</div>
		 		<div class="row" style="padding:20px">
			 		<form>
			 			<div class="col-sm-6">
			 				<div class="row" style="padding：10px;text-align:left ">
			 					<label>请选择要导入的文件（支持xlsx格式）：</label>
			 					
			 						<button type="button" onclick="downExcel()" class="btn btn-danger" aria-label="Left Align" >
		 							<span  aria-hidden="true">下载模板</span>
									</button>
			 				
			 				</div>
			 					<div class="row" style="margin-bottom:10px;">
			 					<div class="col-sm-10" style="padding:10px;height:30px">
			 					<input type="file" style="text-align: center;border:1px">
			 					</div>
			 				</div>
			 					<div class="row" style="margin-bottom:10px">
			 					<div class="col-sm-3">
			 						<label>重复数据</label><br>
			 						<input type="checkbox" value="跳过"><label>跳过</label><br>
			 						<input type="checkbox" value="覆盖"><label>覆盖</label>
			 					</div>
			 				</div>
			 			</div>
			 			<div  class="col-sm-6" style="">
						<b>支持格式</b><br>
						您可以导入XLSX格式(最多1500条记录)的数据。<br>
						<b>导入提示</b><br>
						给定文件的第一行将视为字段名。<br>
						请确认您的文件大小不超过5MB。<br>
						车辆字段中以车牌号作为检验重复的标准。<br>
						在检查重复记录时，您可以覆盖，复制，或者跳过重复。更多信息请参考在线帮助。<br>
						如果XLS文件包含特殊控件(如组合过滤器)或者文件包含嵌入式图像，则可能发生意外错误。<br>
						复选框值应该是1或者0。<br>
						日期值必须为yyyy/MM/dd格式。任何其它格式的日期都将被忽略。<br>
						期时间必须符合yyyy/MM/dd hh:mm:ss的格式，其它格式的日期时间将被忽略。<br>
			 			</div>
			 		</form>
		 		</div>
		 	</div>
		 	<div class="panel-footer"style="padding:13px;text-align:right;">
			 			 	<div class="row" >
					  		<div class="col-sm-3">
					  			<button type="button" class=" btn btn-primary" aria-label="Left Align" style="width:90px,background:'blue' "  onclick="saveDriver()">
			 					<span class="glyphicon glyphicon-save-file" aria-hidden="true">保存</span>
								</button>
								<button type="button" class="btn btn-default" aria-label="Left Align" style="width:80px" onclick="reloadPage()">
			 					<span  aria-hidden="true">取消</span>
								</button>
					  		</div>
			 			 </div>   	
		 </div>
		 </div>
	 </div>
   </div> 	
 </body>
</html>
