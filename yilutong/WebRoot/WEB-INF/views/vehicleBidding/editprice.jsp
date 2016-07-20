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
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>确定车辆</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
    <script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/tableCss.css">

     <script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<!-- <script type="text/javascript" src="./js/function.js"></script> -->
<!--命名按钮方法  -->


</head>
<%
	String cid = request.getAttribute("id").toString();
	String ca = request.getAttribute("ca").toString();
	
%>
<script type="text/javascript">
    var dialog;
    var grid;
    var cid='<%=cid%>';
    var ca='<%=ca%>';
	$(function() {
	
    });
    var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
	  var price = $("#price").val();
 	  if(price!=""&&price!=null){
 	      if(!isNaN(price)){
	         	$.ajax({
					type : "POST",
					url : 'vehicleBidding.do?method=editPriceInfo',
					data : {
					ca:ca,
					id:cid,
					price:price
					},
					success : function(msg) {
						if (msg) {
							$pjq.messager.alert('修改竞价', '竞价修改成功，等待司机确定', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});
	      }else{
	        $pjq.messager.alert('修改价格', '请输入数字', 'info');
	      }
 	  }else{
 	        $pjq.messager.alert('修改价格', '请要修改的价格', 'info');
 	  }
	 
	};
</script>
<body class="easyui-layout">
	<form action="" name="clform" id="clform" method="post">
	    <table class="tableclasss" style="">
		  	<tr>
		  	   <td class="td5" style="height: 40px;">请输入要修改的价格</td>
					
			</tr>	
			 <tr>
			    <td colspan="2" class="td5" style="height: 40px;">
					 <input type="text"  id="price" name="price" >
			    </td>	
			</tr> 
		</table>
	</form>

	
</body>
</html>