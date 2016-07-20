<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>结算审核</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>


</head>
<%
	String id = (String) request.getAttribute("id");
     String [] pids = id.split(",");
%>
<script type="text/javascript">
	  	var dialog;
 		var grid;
 		var pid=[];
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
	   });
				 
		<%for(String s:pids){%>
		pid.push('<%=s%>');
		<%}%>;
		var id ='<%=id%>';
		$.ajax({
					url : 'Handling.do?method=getShippingDriver',
					data : {
						id : id
					},
					success : function(data) {
						data.handling_charge = parseFloat(data.handling_charge)
								- parseFloat(data.handling_ysce.split(",")[1]);
						data.handling_shihou = parseFloat(data.handling_ysce
								.split(",")[0])
								- parseFloat(data.handling_ysce.split(",")[1]);
						$('#Regform').form('load', data);

					}
				});
		$("#receiptid").select2({
			placeholder : "请输入用户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "collect.do?method=getUser",
					data : {
						username : query.term
					}, //传递你输入框中的值
					success : function(msg) {
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.id,
								text : y.name
							});
						});
						query.callback(data);
					}
				});
			}
		}).on("select2-selecting", function(f) {
			$("#receiptid").val(f.object.id);
			$("#cname").val(f.object.text);
		});

	});

	//审核	
	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if ($("#Regform").validationEngine('validate')
				&& $("#receiptid").select2("val") != "") {
			//if($("#Regform").validationEngine('validate')){
			var handling_shihou = $("#handling_shihou").val();
			var shenhe_market = $("#shenhe_market").val();
			var handling_charge = $("#handling_charge").val();
			$pjq.messager.confirm('结算审核', '确定要审核吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'Handling.do?method=UpdateCheckedShipp',
						data : {
							id : pid.join(","),
							handling_shihou : handling_shihou,
							shenhe_market : shenhe_market,
							handling_charge : handling_charge
						},
						//data : $('#Regform').serialize(),
						success : function(msg) {
							if (msg.flag == true) {
								$pjq.messager.alert('结算审核', '审核成功！', 'info');
								$dialog.dialog('close');
								$grid.datagrid('reload');
							}
							;
						}
					});
				}
			});
		} else if ($("#receiptid").select2("val") == ""
				|| $("#receiptid").select2("val") == null) {
			$pjq.messager.alert('结算审核', '审核人不可为空', 'info');
		} else {

			$pjq.messager.alert('结算审核', '必填信息不可为空', 'info');
		}

	};
	//驳回
	var submitFormReject = function($dialog, $grid, $pjq, $mainMenu) {
		if ($("#Regform").validationEngine('validate')
				&& $("#receiptid").select2("val") != "") {
			var handling_shihou = $("#handling_shihou").val();
			var shenhe_market = $("#shenhe_market").val();
			var handling_charge = $("#handling_charge").val();
			$pjq.messager.confirm('结算审核', '确定要驳回吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'Handling.do?method=UpdateCheckedBohui',
						//data : $('#Regform').serialize(),
						data : {
							id : pid.join(","),
							handling_shihou : handling_shihou,
							shenhe_market : shenhe_market,
							handling_charge : handling_charge
						},
						success : function(msg) {
							if (msg.flag == true) {
								$pjq.messager.alert('结算审核', '驳回成功！', 'info');
								$dialog.dialog('close');
								$grid.datagrid('reload');
							}
							;
						}
					});
				}
			});
		} else if ($("#receiptid").select2("val") == ""
				|| $("#receiptid").select2("val") == null) {
			$pjq.messager.alert('结算审核', '审核人不可为空', 'info');
		} else {

			$pjq.messager.alert('结算审核', '必填信息不可为空', 'info');
		}

	};
</script>
<body class="easyui-layout">
	<form action="" method="post" id="Regform">
		<input type="hidden" id="driver_id" name="driver_id">
		<table class="tableclass">

			<tr>
				<th colspan="4">结算审核</th>
			</tr>
			<tr>
				<td><font color="red" style="margin-right:10px">*</font>运单号:</td>
				<td class="td2"><input type="text" readonly="true"
					name="shiping_order_num" />
				</td>
				<td>应收手续费：</td>
				<td class="td2"><input placeholder="0.00"
					class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
					type="text" id="handling_charge" name="handling_charge" />
				</td>
			</tr>
			<tr>
				<td>实收手续费：</td>
				<td class="td2"><input placeholder="0.00"
					class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
					type="text" id="handling_shihou" name="handling_shihou" />
				</td>
				<td><font color="red" style="margin-right:10px">*</font>付款方式：</td>
				<td class="td2" colspan="3"><input type="radio" name="handling_stata"
					value="1" style="width:14px" onclick="xj(this)" /><label
					style="margin-left: 10px">现金</label> <input type="radio"
					name="handling_stata" value="2" style="width:14px" onclick="sk(this)" /><label
					style="margin-left: 10px">转账</label> <br> <input type="radio"
					name="handling_stata" value="3" style="width:14px" onclick="zp(this)" /><label
					style="margin-left: 10px">支票</label> <input type="radio"
					name="handling_stata" value="4" style="width:14px" onclick="xj(this)" /><label
					style="margin-left: 10px">其他</label></td>
			</tr>

			<tr>
				<td style="color: blue;">审核备注:</td>
				<td colspan="3" class="td2"><textarea class="easyui-textarea"
						id="shenhe_market" cols="40" rows="2" name="shenhe_market"></textarea>
				</td>
			</tr>
			<tr>
				<td>提审备注:</td>
				<td colspan="3" class="td2"><textarea class="easyui-textarea"
						cols="48" readonly="true" rows="3" name="settlyf_th_remaks"></textarea>
				</td>
			</tr>
			<tr>
				<td>审核备注:</td>
				<td colspan="3" class="td2"><textarea class="easyui-textarea"
						cols="48" rows="2" id="remarks" name="settleds_sh_remaks"></textarea>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>