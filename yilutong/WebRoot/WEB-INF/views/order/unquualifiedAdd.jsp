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

<title>运单信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<%
	/* String flg = (String) request.getAttribute("flg"); */
%>
</head>
<script type="text/javascript">
	var grid;
	var dialog;
	function searchCar_owner() {
		dialog = parent.jy.modalDialog({
			title : '上报新增',

			url : 'unqualified.do?method=getselectorder',
			/* 				 buttons :'#addbuttons'
			 */
			width : 780,
			buttons : [ {
				text : '<input type="button" class="btncss" value="添加"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	}
	/* var pid = document.getElementById("shiping_order_num").value;
	 if($("Regform").validationEngine('validate')){
	//可提交
	}else{
	$pjq.messager.alert('添加运单', '必填信息不可为空', 'info');
	}
	$.ajax({
		type : "POST",
		url : "unqualified.do?method=selectunqualified",
		data : {
			pid : pid
		},
		success : function(data) {
			if (data.goods_name != null) {
				$('#Regform').form('load', data);
				if(data.insurance==null){
					$('#insurance').val("0.0");
				}
				if(data.trade_agency==null){
					$('#trade_agency').val("0.0");
				}
				if(date.send_time==null){
				alert("null  date")
					$('#send_time').val("0000/0/0");
				}
			} else {
				$('#send_time').val("");
				$('#send_station').val("");
				$('#end_address').val("");
				$('#insurance').val("");
				$('#custom_name').val("");
				$('#receipt').val("");
				$('#goods_name').val("");
				$('#trade_agency').val("");
			}
		}
	}); */

	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		if ($('#shiping_order_num').val() == "") {
			$.messager.alert("添加异常上报", "请添加一条运单", "info");
		} else {
		
			if($("#send_time").val()==null||$("#send_time").val()==""){
					$('#send_time').val("  ");
				}
			if ($("#Regform").validationEngine('validate')) {
				//可提交
				$pjq.messager.confirm('新增信息', '确定要新增吗?', function(r) {
					if (r) {
						$.ajax({
							type : "POST",
							url : 'unqualified.do?method=addunqualified',
							data : $('#Regform').serialize(),
							success : function(msg) {
								if (msg.flag) {
									$pjq.messager.alert('新增信息', '不合格信息添加成功',
											'info');
									$dialog.dialog('close');

									$grid.datagrid('reload');
								}
								;
							}
						});
					}
				});

			};
			
		}
	};
</script>
<body>
	<form action="" method="post" id="Regform">

		<input type="hidden" name="shiping_order_id">
		<fieldset>
			<table class="tableclass">
				<tr>
					<th colspan="4">不合格商品明细</th>
				</tr>
				<tr>
					<td>运单号：</td>
					<td class="td2" colspan="3"><input type="text"
						id="shiping_order_num" class="validate[required]"
						style="width:200px" name="shiping_order_num" readonly="true">
						<a class="easyui-linkbutton" onclick="searchCar_owner()"
						data-options="iconCls:'icon-search'">查询</a>
					</td>
				</tr>
				<tr>
					<td>委托时间：</td>
					<td class="td2"><input type="text" readonly="true"
						id="send_time" name="send_time"></td>
					<td>起运站：</td>
					<td class="td2"><input type="text" readonly="true"
						id="send_station" class="validate[required]" name="send_station">
					</td>
				<tr>

					<td>到达站：</td>
					<td class="td2"><input type="text" readonly="true"
						id="end_address" name="end_address"></td>
					<td>保费：</td>

					<td class="td2"><input readonly="true" id="insurance"
						value='0.0' name="insurance" />
					</td>
				</tr>

				<tr>
					<td>发货客户：</td>
					<td class="td2"><input type="text" readonly="true"
						id="custom_name" name="custom_name"></td>
					<td>收货客户：</td>
					<td class="td2"><input type="text" readonly="true"
						id="receipt" name="receipt"></td>
				</tr>
				<tr>
					<td>发货客户手机：</td>
					<td class="td2"><input type="text"
						readonly="true"
						id="send_shouji" name="send_shouji"></td>
					<td>收货客户手机：</td>
					<td class="td2"><input type="text"
						readonly="true"
						id="receipt_phone" name="receipt_phone"></td>
				</tr>
				<tr>
					<td><lable>类型：</lable><font color="red"
						style="margin-right:10px">*</font></td>
					<td class="td2">
					<input type="text" class="validate[required]"
						name="types_id" id="types_id" />
				<!-- 	<select class="easyui-combobox" id="types_id"
						name="types_id" style="width:120px;" size="2">
							<option id="" value=""></option>
							<option id="" value="有协议无货">有协议无货</option>
							<option id="" value="货物破损">货物破损</option>
							<option id="" value="货物灭失">货物灭失</option>
							<option id="" value="受理违规路由">受理违规路由</option>
							<option id="" value="运价执行不合格">运价执行不合格</option>
							<option id="" value="标签使用不合格">标签使用不合格</option>
							<option id="" value="录入不合格">录入不合格</option>
							<option id="" value="发运不合格">发运不合格</option>
							<option id="" value="压货不合格">压货不合格</option>
							<option id="" value="有货无协议">有货无协议</option>
							<option id="" value="受理禁止市内运输服务">受理禁止市内运输服务</option>
							<option id="" value="货物签收不合格">货物签收不合格</option>
							<option id="" value="货物渗漏">货物渗漏</option>
							<option id="" value="货物污染">货物污染</option>
							<option id="" value="货物潮湿">货物潮湿</option>
							<option id="" value="货物变形">货物变形</option>
							<option id="" value="受理禁运货物">受理禁运货物</option>
							<option id="" value="代收货款受理不合格">代收货款受理不合格</option>
							<option id="" value="回单受理不合格">回单受理不合格</option>
							<option id="" value="报价执行不合格">报价执行不合格</option>
							<option id="" value="运单填写不合格">运单填写不合格</option>
							<option id="" value="承运协议签收不合格">承运协议签收不合格</option>
							<option id="" value="退货不合格">退货不合格</option>
							<option id="" value="标签脱落">标签脱落</option>
							<option id="" value="其他">其他</option>
							<option id="" value="货物不全">货物不全</option>
							<option id="" value="标签破损无法扫描">标签破损无法扫描</option>
							<option id="" value="罚款减肥防盗锁">罚款减肥防盗锁</option>
					</select> -->
					</td>
					<td>货品名称：<font color="red" style="margin-right:10px">*</font>
					</td>
					<td class="td2"><input type="text" readonly="true"
						id="goods_name" name="goods_name"></td>
				</tr>
				<tr>
					<td>不合格件数：<font color="red" style="margin-right:10px">*</font>
					</td>
					<td class="td2"><input type="text"
						class="validate[required[custom[number]]]"
						name="unqualified_number"></td>
					<td>代收款：</td>
					<td class="td2"><input type="text"  readonly="true"
						id="trade_agency" name="trade_agency" />
					</td>
				</tr>
				<tr>
					<td>负责机构：<font color="red" style="margin-right:10px">*</font>
					</td>
					<td class="td2"><input type="text" class="validate[required]"
						name="responsible_institutions" id="responsible_institutions" />
					</td>
					<td>负责人：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input type="text" class="validate[required]"
						name="responsible_people" id="responsible_people" />
					</td>
				</tr>

				<tr>
					<td>参考价格：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input type="text" value="0"
						class="validate[required[custom[number]]]"  name="reference_price"
						id="reference_price" /></td>
					<td>上报人姓名：<font color="red" style="margin-right:10px">*</font>
					</td>
					<td class="td2"><input type="text" value="盖仓操作员"
						name="report_people" id="report_people" /></td>
				</tr>
				<tr>
					<td>协议编号：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input type="text" value="" name="agreement"
					class="validate[required]"
						id="agreement"/></td>
					<td>协议实收数量：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input id='agreement_paid'
						name="agreement_paid" class="validate[required[custom[number]]]"
						type="text"> <input type="hidden" readonly="true"
						name="check_type">
					</td>
				</tr>
				<tr>

					<td>协议签收人：<font color="red" style="margin-right:10px">*</font>
					</td>
					<td class="td2"><input id="agreement_Sign"
						class="validate[required]" name="agreement_Sign" type="text">
						<input type="hidden" readonly="true">
					<td>总体积(立方米)：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input type="text" class="validate[required,custom[number]]" 
						placeholder="0.0000" name="goods_vol" />
					</td>
				</tr>

				<tr>
					<td>总件数：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input type="text" class="validate[required,custom[number]]" 
						placeholder="0" name="goods_num" />
					</td>
					<td>总重量(千克)：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input type="text" class="validate[required,custom[number]]" 
						placeholder="0.0000" name="goods_weight" />
					</td>
				</tr>
				<tr>
					<td>异常情况：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2" colspan="3"><input type="text" class="validate[required]"
						id="abnormal_situation" name="abnormal_situation"
						style="width:350px"> <input type="hidden"
						name="customer_id" id="customer_id" />
					</td>
			</table>
		</fieldset>
		<input type="hidden" name="method" value="addunqualified">
	</form>
</body>
</html>
