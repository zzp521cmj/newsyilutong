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
<title>一键审核</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<!-- <script type="text/javascript" src="./js/function.js"></script> -->
<!--命名按钮方法  -->


</head>
<%
	User user = (User) request.getSession().getAttribute(
			SessionInfo.SessionName);
%>
<%
	String flg = (String) request.getAttribute("flg");
%>

<script type="text/javascript">
 
  $(function(){
   $("#verifier").val('<%=user.getUsername()%>');
    var claimsid='<%=flg%>';
		$.ajax({
			url : 'claims.do?method=bohuiId&id='+claimsid,
			data : {
				
			},
			success : function(data) {
				//根据form表单获取所以值
				/* $('#shiping_order_num').val(data.shiping_order_num); */
				$('#editTravel').form('load', data);
			}
		});
		$('#cc')
				.combotree(
						{
							url : "depn.do?method=getTree&&id=",
							width : 150,
							onBeforeLoad : function(node, param) {

								if (node == null) {
									$('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {

									$('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
					});
	//通过按钮
     var submitFormtongguo=function($dialog, $grid, $pjq, $mainMenu){
      var audit=document.getElementById("claims_state").value;
      //if(audit==0){
     $pjq.messager.confirm('审核', '确定要审核吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'claims.do?method=review&claimsid='+claimsid,
						data : $('#editTravel').serialize(),
						success : function(msg) {
							if (msg.flag ==true) {
								$pjq.messager.alert('审核信息', '审核成功', 'info');
								$grid.datagrid('reload');
								$dialog.dialog('close');
								
							} else {
								$pjq.messager.alert('审核信息', '审核失败', 'info');
								$grid.datagrid('reload');
								$dialog.dialog('close');
							}
						}
					});
				}
			});
			/* }else{
				$.messager.alert('重新选择','请选择审核通过');
			} */
     };
   //驳回按钮
   	 var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
   	  
			$pjq.messager.confirm('驳回', '确定要驳回吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'claims.do?method=bohuiInfo',
						data : $('#editTravel').serialize(),
						success : function(msg) {
							if (msg.flag) {
								$pjq.messager.alert('驳回', '驳回成功', 'info');
								$grid.datagrid('reload');
								$dialog.dialog('close');
							} else {
								$pjq.messager.alert('驳回', '通过审核或未审核,驳回失败', 'info');
								$grid.datagrid('reload');
								$dialog.dialog('close');
							}
						}
					});
				}
			});
			
	}; 
	//自动填写二次维护日期
	function cDayFunc() {
		cFunc("d");
	}

</script>
<body >
	<form action="" method="post" id="editTravel">
		<fieldset>
			<table class="tableclass">
				<tr>
					<th colspan="4">一键审核</th>
				</tr>
				<tr>
					<input type="hidden" id="claimsid" name="claimsid">
					<input type="hidden" id="verifier" name="verifier">
				<tr>
					<td>订单号:</td>
					<td class="td2"><input type="text"
						id="shiping_order_num"name="shiping_order_num" disabled="disabled"> 
						</td>
						<td>理赔金：</td>
					<td class="td2">
					<input type="text" id="compensation_payments" name="compensation_payments" value='0.0' disabled="disabled"></td>
				</tr>
				<tr>
					<td>理赔状态</td>
					<td class="td2"><input type="text" readonly="true"
						id="claims_state" name="claims_state" disabled="disabled">
					</td>
					<td>理赔发起时间:</td>
					<td class="td2"><input type="text" readonly="true"
						id="claims_time" name="claims_time" disabled="disabled">
					</td>
				<tr>

					<td>事故分析及处理结果：</td>
					<td  class="td2"><input type="text" readonly="true"
						id="damage_intensity" name="damage_intensity" disabled="disabled">
					</td>
					<td>审核意见:</td>
				
					<td class="td2"><input readonly="true" id="audit_opinion"
					 name="audit_opinion" disabled="disabled"/></td>
				</tr>
			
				<tr>
					<td>发货客户：</td>
					<td class="td2"><input type="text" readonly="true"
						id="custom_name" name="custom_name" disabled="disabled">
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset>
		  <table class="tableclass">
		  <tr>
		   <td>备注</td>
		    <td colspan="3" class="td2">
			<textarea class="easyui-textarea" class="validate[maxSize[64]]" cols="45" rows="2" id="audit_opinion" name="audit_opinion"></textarea>
		</td>
		</tr>
		</fieldset>
		<input type="hidden" name="roadTransportCardId" />
	</form>
</body>
</html>


