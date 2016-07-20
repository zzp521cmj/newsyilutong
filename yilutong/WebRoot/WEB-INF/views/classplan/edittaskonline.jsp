<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>修改</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="./bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="./css/main.css">

<%
	String linnumber = (String) request.getAttribute("linnumber");
%>
</head>
<script type="text/javascript">
	$(function(){
		
		 $("#Regform").validationEngine('attach', { 
			 promptPosition:'topRight:-50,0',
			 autoHidePrompt:true,//	是否自动隐藏提示信息
		 	 autoHideDelay:2000 //两秒
			 }); 
		
		var linnumber='<%=linnumber%>';
		$.ajax({
			url : 'linplan.do?method=getlinplanplanbyid',
			data : {
				linnumber : linnumber
			},
			success : function(data) {
				$('#Regform').form('load', data); 
			}
		});
	});

	var submitFormEdit = function($dialog, $grid, $pjq) {
		 if($("#Regform").validationEngine('validate')){ 
		$pjq.messager.confirm('修改线路', '确定要修改吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'linplan.do?method=updatelinplan',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('修改线路', '修改线路成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						}
						;
					}
				});
			}
		});
		
	 }else{
		$pjq.messager.alert('修改线路', '必填信息不可为空', 'info');
	}
	};
</script>
<body>
	<form action="" method="post" id="Regform">
		<input type="hidden" name="linno" id="linno"/>
		<fieldset>
			<legend>线路信息</legend>
			<table class="tableclass">
				<tr>
					<td>线路号:</td>
					<td class="td2"><input class="validate[required]" type="text" name="linnumber" id="linnumber">
					</td>
					<td>线路名称:</td>
					<td class="td2"><input class="search-text validate[required]" id="linname"
						name="linname">
					</td>
				</tr>
				<tr>
					<td>车号:</td>
					<td class="td2"><input class="validate[required]" id="lincarno"  name="lincarno" />
					</td>
					<td>车型:</td>
					<td class="td2"><input class="validate[required]" id="lincartype" name="lincartype" />
					</td>
				</tr>
				<tr>
					<td>车主:</td>
					<td class="td2">
					<input type="text" class="validate[required]" id="lincarowner" name="lincarowner"style="width:150px">
					</td>
					<td>总运费:</td>
					<td class="td2"><input class="search-text validate[required,min[1],custom[number]]" id="linmoney"
						name="linmoney" />
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
