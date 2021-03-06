<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>添加客户信息</title>
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
<%
	User user = (User) request.getSession().getAttribute(
			SessionInfo.SessionName);
	String flg = (String) request.getAttribute("flg");
		String flg2 = (String) request.getAttribute("flg2");
%>
<script type="text/javascript">
	$(function() {
		var $target = $('input,textarea,select');
		$target.bind('keydown', function(e) {
			var key = e.which;
			if (key == 13) {
				e.preventDefault();
				var nxtIdx = $target.index(this) + 1;
				$target.eq(nxtIdx).focus();
			}
		});
		$("#Regform").validationEngine('attach', {
			promptPosition : 'topRight:-15,0'
		});
		 var claimsid='<%=flg2%>';
				//根据form表单获取所以值
				$('#customer_num').val(claimsid);
	});
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		var customer_num = $.trim($("#customer_num").val());
		var name=$.trim($("#customer_name").val());
		$.ajax({
			type : "POST",
			url : 'remarkMap.do?method=getcustomer_num',
			data : {
				customer_num : customer_num,
				name1 : name
			},
			success : function(data) {
				 if (data.flag== false) {
					$pjq.messager.alert('新增客户', '此客户编码或者名称已经存在', 'info');
				} else {
					if ($("#Regform").validationEngine('validate')) {
						//可提交
						$pjq.messager.confirm('新增客户', '确定要新增吗?', function(r) {
							if (r) {
								$.ajax({
									type : "POST",
									url : 'remarkMap.do?method=saveCustomer',
									data : $('#Regform').serialize(),
									success : function(msg) {
										if (msg.flag) {
											$pjq.messager.alert('新增客户',
													'客户添加成功', 'info');
											$dialog.dialog('close');
											$grid.datagrid('reload');
										}else{
											$pjq.messager.alert('新增客户',
													'客户添加失败', 'info');
										};
									}
								});
							}
						});
					} else {
						$pjq.messager.alert('新增客户', '必填信息不可为空', 'info');
					}
				} 
			}
		});

	};
</script>
<body>
	<form action="" method="post" id="Regform">
		<input type="hidden" name="shiping_order_id">
		<fieldset>
			<table class="tableclass">
				<tr>
					<th colspan="4">基本信息</th>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>客户编码:</td>
					<td class="td2"><input type="text" class="validate[required]"
						id="customer_num" name="customer_num" readonly="true" ></td>
					<td><font color="red" style="margin-right:10px">*</font>客户名称:</td>
					<td class="td2"><input type="text" class="validate[required]"
						id="customer_name" name="customer_name"></td>
						</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>	<lable>客户层级:</lable>
			</td>
					<td class="td2"><select class="easyui-combobox" id="customer_grade" name="customer_grade"  style="width:130px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option id="" value="0">散货</option>
				<option id="" value="1">大宗</option>
				<option id="" value="2">项目落仓</option>
			</select></td>
							<td><font color="red" style="margin-right:10px">*</font>联系方式：</td>
					<td class="td2"><input type="text" class="validate[required,custom[phone]]"
						id="customer_tel" name="customer_tel"></td>
				</tr>
				<tr>
						<td><font color="red" style="margin-right:10px">*</font>备用联系方式：</td>
					<td class="td2"><input type="text" class="validate[required,custom[phone]]"
						id="customer_teltoo" name="customer_teltoo"></td>
					<td><font color="red" style="margin-right:10px">*</font>地址：</td>
					<td class="td2"><input type="text"
						class="validate[required]" id="customer_address" name="customer_address"></td>
				</tr>
				<tr>
					<td>备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea"
							cols="45" rows="2" name="bz"></textarea> 
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
