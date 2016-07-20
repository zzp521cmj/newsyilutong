<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>

<head>
<base href="<%=basePath%>">

<title>审核司机信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>

</head>
<script type="text/javascript">
	//通过
	var submitThrough = function($dialog, $grid, $pjq, $mainMenu) {
		var userId=$("#user_id").val();
		var driverId=$("#driverid").val();
		$.ajax({
			type : "POST",
			url : 'driver.do?method=driverRegisterThrough',
			data : {
				userId : userId,
				driverId:driverId
			},
			success:function(data){
			    if(data){
			        $pjq.messager.alert('司机审核', '司机审核成功','info');
                    $dialog.dialog('close');
                    $grid.datagrid('reload');
			    }else{
			        $pjq.messager.alert('司机审核', '司机审核失败','info');
                    $dialog.dialog('close');
                    $grid.datagrid('reload');
			    }
			},
			error: function(jqXHR, textStatus, errorMsg){
                    $pjq.messager.alert('司机审核', '司机审核失败','info');
                    $dialog.dialog('close');
                    $grid.datagrid('reload');
            }
		});
	};
	//不通过
	var submitNotThrough = function($dialog, $grid, $pjq, $mainMenu) {
       	var userId=$("#user_id").val();
        var driverId=$("#driverid").val();
        $.ajax({
			type : "POST",
			url : 'driver.do?method=driverRegisterNotThrough',
			data : {
				userId : userId,
				driverId:driverId
			},
			success:function(data){
			     if(data){
			        $pjq.messager.alert('司机审核', '司机不通过成功','info');
                    $dialog.dialog('close');
                    $grid.datagrid('reload');
			     }else{
			        $pjq.messager.alert('司机审核', '司机不通过失败','info');
                    $dialog.dialog('close');
                    $grid.datagrid('reload');
			     }
			      
			},
			error: function(jqXHR, textStatus, errorMsg){
                     $pjq.messager.alert('司机审核', '司机不通过失败','info');
                    $dialog.dialog('close');
                    $grid.datagrid('reload');
            }
		});
	};
</script>
<style type="text/css">
.image {
	list-style-type: none;
	padding: 5px;
}
</style>
<body>
	<form action="" method="post" id="Regform">
		<input type="hidden" name="driverId" id="driverid"
			value="${driverRegister.driverId}"> <input type="hidden"
			name="user_id" id="user_id" value="${driverRegister.user_id}">
		<fieldset>

			<table class="tableclass">
				<tr>
					<th colspan="4">基本信息</th>
				</tr>
				<tr>
					<td>司机姓名:</td>
					<td class="td2"><input type="text" id="drive_name"
						name="drive_name" readonly="readonly"
						value="<c:out value="${driverRegister.drive_name}"></c:out>">
					</td>
					<td>车牌号:</td>
					<td class="td2"><input type="text" id=car_number
						name="car_number" style="width:150px" readonly="readonly"
						value="<c:out value="${driverRegister.car_number}"></c:out>">
					</td>

				</tr>
				<tr>
					<td>联系方式:</td>
					<td class="td2"><input type="text" id="phone" name="phone"
						readonly="readonly"
						value="<c:out value="${driverRegister.phone}"></c:out>" />
					</td>
					<td>身份证号:</td>
					<td class="td2"><input type="text" id="IDcardnumber"
						name="IDcardnumber" readonly="readonly"
						value="<c:out value="${driverRegister.IDcardnumber}"></c:out>" />
					</td>

				</tr>
				<tr>
					<td>住址:</td>
					<td class="td2" colspan="3"><input id="adress" type="text"
						name="adress" readonly="readonly" style="width:300px"
						value="<c:out value="${driverRegister.adress}"></c:out>" />
				</tr>
			</table>
		</fieldset>

		<fieldset>
			<table class="tableclass">
				<tr>
					<th colspan="4">车辆基本信息</th>
				</tr>
				<tr>
					<td>车牌号:</td>
					<td class="td2"><input type="text" id="" name="car_number"
						style="width:150px" readonly="readonly"
						value="<c:out value="${driverRegister.car_number}"></c:out>">
					</td>
					<td>所有人</td>
					<td class="td2"><input type="text" id="" name="drive_name"
						readonly="readonly"
						value="<c:out value="${driverRegister.drive_name}"></c:out>" /></td>
				</tr>
				<tr>
					<td>车长：</td>
					<td class="td2"><input type="text" id="car_long"
						readonly="readonly" name="car_long"
						value="<c:out value="${driverRegister.car_long}"></c:out>" /></td>
					<td>载重:</td>
					<td class="td2"><input class="text " readonly="readonly"
						name="car_weight"
						value="<c:out value="${driverRegister.car_weight}"></c:out>" /></td>
				</tr>
				<tr>
					<td>箱型：</td>
					<td class="td2"><input type="text" id="box_type"
						name="car_type" readonly="readonly"
						value="<c:out value="${driverRegister.car_type}"></c:out>" /></td>
					<td>车型:</td>
					<td class="td2"><input class="text" readonly="readonly"
						name="car_type"
						value="<c:out value="${driverRegister.car_type}"></c:out>" /></td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
			<c:forTokens items="${driverRegister.image_url}" delims=","
				var="image">
				<ul class="image">
					<li><img
					src="<c:out value="./WebRoot/driverRegister/${image}"/>"
						style="height: 800px;width: 600px" /></li>
				</ul>
			</c:forTokens>
		</fieldset>
	</form>
</body>

</html>