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
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>费用核销</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">

<%

	String id = request.getAttribute("id").toString();
%>


<% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName); %>
<script type="text/javascript">
	  	var dialog;
 		var grid;
	$(function() {
		$("#Regform").validationEngine('attach', {
			promptPosition : 'topRight:-15,0'
		});
	});
	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if ($("#Regform").validationEngine('validate')) {
			//可提交
			$pjq.messager.confirm('费用核销', '确定要核销吗?', function(r) {
				var zid=$("#pid").val();//id合集
				var type=$("input[name='write_off']:checked").val();//核销类型
				var bz=$("#bz").val();
				var names="<%=user.getUsername()%>";
				if (r) {
					$.ajax({
						type : "POST",
						url : 'kickback.do?method=updates',
						data : {zid:zid,type:type,bz:bz,username:names},
						success : function(msg) {
							if (msg.flag) {
								$pjq.messager.alert('费用核销', '费用核销成功', 'info');
								$dialog.dialog('close');
								$grid.datagrid('reload');
							}else{
								$pjq.messager.alert('费用核销', '费用核销失败', 'info');
								$dialog.dialog('close');
								$grid.datagrid('reload');
							}
							;
						}
					});
				}
			});
		} else {
			$pjq.messager.alert('费用核销', '必填信息不可为空', 'info');
		}
	};
</script>
</head>
<body class="easyui-layout">
	<form action="" method="post" id="Regform">
		<table class="tableclass">
			<tr>
					<th colspan="3">回扣核销</th>
			</tr>
			<tr>
				<td style="width: 130px;"><input type="hidden" id="pid" name="shiping_order_id" value="<%=id%>">
				</td>
				<td><font color="red" style="margin-right:10px">*</font>付款方式：</td>
				<td class="td2" colspan="3"><input type="radio"
					name="write_off"  value="1" style="width:14px" /><label
					style="margin-left: 10px">现金</label>&nbsp;&nbsp;<input type="radio"
					name="write_off" value="0" style="width:14px" /><label
					style="margin-left: 10px">刷卡</label></td>
			</tr>
			<tr>
				<td style="color: blue;">应付回扣核销备注:</td>
				<td colspan="3" class="td2"><textarea class="easyui-textarea" id="bz"
						cols="40" rows="2" name="fee_remarks"></textarea></td>
			</tr>
		</table>
	</form>
</body>
</html>