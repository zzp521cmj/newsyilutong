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
<title>多条选择审核</title>
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
 	 var claimsid='<%=flg%>';
  $(function(){
		$.ajax({
			url : 'claims.do?method=selectID',
			data : {
				id : claimsid
			},
			success : function(data) {
				//根据form表单获取所以值
				//$('#shiping_order_num').val(data.shiping_order_num);
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
       /*  var audit=document.getElementById("claims_state").value;
               if(audit==0){ */
      $pjq.messager.confirm('审核', '确定要审核吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'claims.do?method=review&claimsid='+claimsid,
						data : $('#editTravel').serialize(),
						success : function(msg) {
							if (msg.flag) {
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
     }
   //驳回按钮
   	 var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) { 
   	   /* var audit=document.getElementById("claims_state").value;
   	   if(audit==2){ */
			$pjq.messager.confirm('驳回', '确定要驳回吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'claims.do?method=bohuiInfo&claimsid='+claimsid,
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
			/* }else{
			$.messager.alert('重新选择','请选择审核未通过'); 
			} */
	
	}; 
	//自动填写二次维护日期
	function cDayFunc() {
		cFunc("d");
	}
</script>
<body>
	<form action="" method="post" id="editTravel">
		<fieldset>
			<table class="tableclass">
				<tr>
					<th colspan="4">多条审核</th>
				</tr>
					<input type="hidden" id="claimsid" name="claimsid">
				<tr>
				    <td>备注</td>
		            <td colspan="3" class="td2">
			        <textarea class="easyui-textarea" class="validate[maxSize[64]]" cols="40" rows="2" id="audit_opinion" name="audit_opinion"></textarea>
		           </td>
		      <input type="hidden" id="idea" name="idea"/>
		    </tr>
		    <input type="hidden" name="roadTransportCardId" />
					
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>


