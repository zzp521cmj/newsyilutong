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
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
<%
	String flg = (String) request.getAttribute("flg");
%>
</head>
<script type="text/javascript">
	$(function(){
		var pid='<%=flg%>';
		$.ajax({
			url : 'order.do?method=getUpdateShipOrder',
			data : {
				id : pid
			},
			success : function(data) {
				if(data.plate_number==null){
				data.plate_number='';
				} 
				//$("#carid").val(data.plate_number);
				//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
				//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
				if(data.check_type==0){
					$("#check1").val("发货人门点");
					}else if(data.check_type==1){
					$("#check1").val("起运货运站");	
				}
				if(data.send_type==0){
				$("#send").val("自提");}
				else if(data.send_type==1){
				$("#send").val("送货");
				}
				if(data.pay_type==0){				
				$("#type").val("到付");
				}else if(data.pay_type==1){
				$("#type").val("回付");
				}else if(data.pay_type==2){
				$("#type").val("月结");
				
				}else if(data.pay_type==3){
				$("#type").val("等通知");
				
				}else if(data.pay_type==4){
				$("#type").val("打卡");
				
				}
				//$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number);
				//	$("#receiptid").prev("div").find("span.select2-chosen").text(data.customer_name); 
				$("#receiptid").val(data.customer_name);
				$("#carid").val(data.plate_number);
				$('#Regform').form('load', data);
			}
		});
		/* $("#carid").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
			}
			}); */
	});
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
				 <td ><font color="red" style="margin-right:10px">*</font>订单号:</td>
					<td  class="td2"><input type="text"  id="num" readonly="true"
						name="shiping_order_num"></td>
					<td ><font color="red" style="margin-right:10px">*</font>起运地:</td>
					<td  class="td2"><input type="text"  readonly="true" id=""
						name="start_address"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>到达地:</td>
					<td   class="td2"><input type="text"  readonly="true" id=""
						name="end_address"></td>
				
					<td ><font color="red" style="margin-right:10px">*</font>创建时间:</td>
					<td  class="td2"><input    readonly="true" id=""
						name="check_time" />
					</td>
					<!--  <td>性别:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="gender" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="">请选择</option>
							<option  value="0">男</option>
							<option  value="1">女</option>
					</select></td> -->  
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>托运方：</td>
					<td  class="td2"><input type="text" readonly="true" id=""
						name="checkp"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td class="td2" ><input type="text" readonly="true"id=""
						name="check_tel"></td>
				</tr>
				<tr>
					<td  >手机：</td>	
					<td colspan="3"  class="td2"><input type="text" readonly="true" id=""
						name="check_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货客户：</td>
					<td  class="td2"><input type="text" readonly="true" id="receiptid"
						name="receipt"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td  class="td2"><input type="text" readonly="true" id=""
						name="receipt_tel"></td>
						</tr>
				<tr>
					<td >手机：</td>	
					<td  colspan="3"class="td2"><input type="text"  readonly="true"id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货地址/单位：</td>	
					<td colspan="3" class="td2">
					<textarea cols="45" rows="2"readonly="true" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>货物名称：</td>
					<td class="td2"><input   type="text" readonly="true" name="goods_name" /></td>
					<td  ><font color="red" style="margin-right:10px">*</font>包装：</td>
					<td  class="td2"><input  type="text"   readonly="true"  name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总件数：</td>
					<td  class="td2"><input  type="text" readonly="true"  value="0" name="goods_num" /></td>
					<td ><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
					<td  class="td2"><input type="text" readonly="true"  value="0.00"  name="goods_weight" /></td>	
				</tr>
				
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
					<td  colspan="3"  class="td2"><input type="text"  readonly="true"   value="0.00"  name="goods_vol" /></td>
				</tr> 
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>发货方式：</td>
					<td class="td2">
					<input id='check1' type="text" readonly="true">
					<input type="hidden" readonly="true" name="check_type">
				<!-- 	<select id='check' class="combobox" name="check_type" readonly="true" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">发货人门点</option>
							<option id="" value="1">起运货运站</option>
					</select> --></td>
					<td >提货方式：</td>	
					<td class="td2"><input id='send'  type="text"readonly="true" >
					<input  type="hidden"  name="send_type" readonly="true" >
					<!-- <select id='send' class="combobox" name="send_type" readonly="true"style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">自提</option>
							<option id="" value="1">送货</option>
					</select> --> </td>
				</tr>	
				<tr>
					<td >接货车号：</td>
					<td  class="td2"><input type="text" id="carid" readonly="true" style="width:150px">
					<input type="hidden" id="carid" readonly="true" name="car_id" style="width:150px">
					</td>
					<td >规格(米)：</td>
					<td class="td2"><input type="text" readonly="true" name="spe" style="width:150px">
					</td>
				</tr> 
				<tr>
					<!-- <th colspan="4">计费标准</th>
				</tr>
				<tr>
					<td >提货费：</td>
					<td class="td2"><input id="take_pay" type="text" readonly="true" value="0.00" name="take_fee" /></td>
					<td >送货费：</td>
					<td class="td2"><input id="send_pay" type="text"  readonly="true" value="0.00" name="send_fee" /></td>
				</tr>
				<tr>
					<td >装货费：</td>
					<td class="td2"><input id="adorn_fee"  type="text"  readonly="true"  value="0.00" name="adorn_fee" /></td>
					<td >干线费：</td>
					<td  class="td2"><input id="trunk_fee" type="text"   readonly="true"  value="0.00"name="trunk_fee" /></td>
				</tr>
				<tr>
					<td >保险费：</td>
					<td  class="td2"><input type="text"   readonly="true"  value="0.00"  name="insurance" /></td> -->
					<td ><font color="red" style="margin-right:10px">*</font>付费方式：</td>
					<td class="td2">
					<input id='type'  type="text" readonly="true" >
					<input   type="hidden" readonly="true"  name="pay_type">
					<!-- <select id='type' class="combobox" name="pay_type" readonly="true" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现付</option>
							<option id="" value="1">代付</option>
							<option id="" value="2">月结</option>
					</select> --></td>
				<!-- </tr>
				 <tr>
				 <td >代收货款：</td>
					<td  class="td2"><input type="text"  readonly="true" value="0.00" name="trade_agency" style="width:150px">
					</td> -->
					<td ><font color="red" style="margin-right:10px">*</font>运费总额：</td>
					<td   colspan="3" class="td2"><input    value="0.00"  readonly="true"  type="text"
						editable="" name="transport_pay" /> 
					</td>
				</tr> 
				<tr>
					<td >订单状态：</td>
					<td  class="td2"><select id='state' readonly="true" class="combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">受理</option>
							<!-- <option id="" value="1">在途</option>
							<option id="" value="2">到达</option>
							<option id="" value="3">配送</option>
							<option id="" value="4">签收</option> -->
					</select> 
					</td>
					<td >中转地：</td>
					<td  class="td2"><input   type="text"
						readonly="true"  name="change_address" /> 
					</td>
				</tr> 
				<tr>
				<td >制单人：</td>
					<td   class="td2"><input   type="text"
						readonly="true" name="shipping_order" /> 
					</td>
					<td >制单时间：</td>
					<td   class="td2"  class="td2"><input   type="text"
						readonly="true" name="updatetime" /> 
					</td>
				</tr>
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" readonly="true"cols="45" rows="2" name="remarks" ></textarea></td>
				</tr>
			</table>
		</fieldset>
		<input type="hidden"   name="creat_type" style="width:150px">
	</form>
</body>
</html>
