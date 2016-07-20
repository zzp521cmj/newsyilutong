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
 	 var abnormalid='<%=flg%>';
		$.ajax({
		
			url : 'inf.do?method=bohuiInfo',
			data : {
				id : abnormalid
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
     
     $pjq.messager.confirm('审核', '确定要审核吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'inf.do?method=update',
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
			
     }
   //驳回按钮
   	 var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
   	   
			$pjq.messager.confirm('驳回', '确定要驳回吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'inf.do?method=bohui',
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
					<input type="hidden" id="idid" name="abnormalid">
				<tr>
					<td>运单号:</td>
					<td class="td2"><input type="text"
						id="shiping_order_num"name="shiping_order_num" disabled="disabled"> 
						</td>
						<td>异常情况：</td>
					<td class="td2">
					<input type="text" id="abnormal_situation" name="abnormal_situation" disabled="disabled"></td>
				</tr>
				<tr>
					<td>发货日期</td>
					<td class="td2"><input type="text" readonly="true"
						id="send_time" name="send_time" disabled="disabled">
					</td>
					<td>起运站:</td>
					<td class="td2"><input type="text" readonly="true"
						id="send_station" name="send_station" disabled="disabled">
					</td>
				<tr>

					<td>到达站：</td>
					<td  class="td2"><input type="text" readonly="true"
						id="end_address" name="end_address" disabled="disabled">
					</td>
					<td>保费:</td>
				
					<td class="td2"><input readonly="true" id="insurance"
						value='0.0' name="insurance" disabled="disabled"/></td>
				</tr>
			
				<tr>
					<td>发货客户：</td>
					<td class="td2"><input type="text" readonly="true"
						id="custom_name" name="custom_name" disabled="disabled">
					</td>
					<td>收货客户：</td>
					<td class="td2"><input type="text" readonly="true"
						id="receipt" name="receipt" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td><lable>类型:</lable>
						<td class="td2"><input type="text" readonly="true"
						id="types_id" name="types_id" disabled="disabled">
					</td>
					
					<td>货品名称：</td>
					<td class="td2"><input type="text" readonly="true"
						id="goods_name" name="goods_name" disabled="disabled">
					</td>
				</tr>
				<tr>
					<td>不合格件数：</td>
					<td class="td2"><input type="text" id="unqualified_number"
						name="unqualified_number" disabled="disabled">
					</td>
					<td>代收款：
					</td>
					<td class="td2"><input type="text" readonly="true"
						id="trade_agency" name="trade_agency" disabled="disabled"/></td>
				</tr>
				<tr>
					<td>负责机构：</font>
					</td>
					<td class="td2"><input type="text" name="responsible_institutions" id="responsible_institutions"disabled="disabled" />
					</td>
					<td>负责人：</font>
					</td>
					<td class="td2"><input type="text" name="responsible_people" id="responsible_people" disabled="disabled"/></td>
				</tr>

				<tr>
					<td>参考价格：</font>
					</td>
					<td class="td2"><input type="text" value="0" name="reference_price" id="reference_price" disabled="disabled" />
					</td>
					<td>上报人姓名：</font>
					</td>
					<td class="td2"><input type="text" value="盖仓操作员"
						name="report_people" id="report_people" disabled="disabled" />
					</td>
				</tr>
				<tr>
					<td>协议编号：</font>
					</td>
					<td  class="td2"><input type="text" value="0.00"
						name="agreement" id="agreement" disabled="disabled"/>
					</td>
					<td>协议实收数量：</td>
					<td class="td2"><input id='agreement_paid' name="agreement_paid" type="text" disabled="disabled"> <input
						type="hidden" readonly="true" name="check_type" disabled="disabled"></td>
				</tr>
				<tr>
				
					<td>协议签收人：</td>
					<td class="td2"><input id='agreement_Sign' name="agreement_Sign" type="text" disabled="disabled"> <input
						type="hidden" name="" readonly="true" disabled="disabled">
				</tr>
			</table>
		</fieldset>
		<fieldset>
		  <table class="tableclass">
		  <tr>
		   <td>备注</td>
		    <td colspan="3" class="td2">
			<textarea class="easyui-textarea" class="validate[maxSize[64]]" cols="45" rows="2" id="reason" name="reason"></textarea>
		</td>
		</tr>
		</fieldset>
		<input type="hidden" name="roadTransportCardId" />
	</form>
</body>
</html>

