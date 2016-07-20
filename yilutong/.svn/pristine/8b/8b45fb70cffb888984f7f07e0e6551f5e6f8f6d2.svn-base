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

<title>详细运单信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<link rel="stylesheet" type="text/css" href="./css/tableCss.css">

<link rel="stylesheet" type="text/css" href="./css/main.css">

<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<%
	String flg = (String) request.getAttribute("flg");
%>
</head>
<script type="text/javascript">
	$(function(){
		var pid='<%=flg%>';
		$.ajax({
			url : 'shipManual.do?method=getUpdateShipManual',
			data : {
				id : pid
			},
			success : function(data) {
				if (data.plate_number == null) {
					data.plate_number = '';
				}
				if (data.send_type == 0) {
					$("#send").val("自提");
				} else if (data.send_type == 1) {
					$("#send").val("送货");
				}
				if (data.pay_type == 1) {
					$("#type").val("到付");
				} else if (data.pay_type == 0) {
					$("#type").val("回付");
				} else if (data.pay_type == 2) {
					$("#type").val("现付");

				} else if (data.pay_type == 3) {
					$("#type").val("货到前付");
				}
				$('#Regform').form('load', data);
			}
		});
	});
</script>
<body>
	<form action="" method="post" id="Regform">
		<input type="hidden" name="shiping_order_id">	
			<fieldset>
				<table class="tableclasss">
					<tr>
						<td colspan="14" align="left"><b>注意：带<font color="red"
								style="margin-right: 5px">*</font>的为必填项！</b>
						</td>
					</tr>
					<tr>

						<td class="td3">委托时间:</td>
						<td colspan="2" class="td5"><input class="Wdate"
							onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							id="" name="weituo_time" disabled="disabled" /></td>
						<td class="td3">委托单号:</td>
						<td colspan="2" class="td5"><input type="text"
							id="weitoudanhao" name="weitoudanhao" disabled="disabled">
						</td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>交接方式：</td>
						<td class="td5"><select id='send' class="combobox"
							name="send_type"
							data-options="panelHeight : 'auto',editable:false"
							disabled="disabled">
								<option id="" value="0">客户自提</option>
								<option id="" value="1">专车送货</option>
								<option id="" value="2">送货进仓</option>
								<option id="" value="3">送货上楼</option>
								<option id="" value="4">送货上门</option>
						</select></td>
						<td class="td3" > <font color="red"
							style="margin-right:5px">*</font>运单号:
						</td>
						<td colspan="2" class="td5"><input type="text"
							class="validate[required]" id="num" disabled="disabled"
							name="shiping_order_num">
						</td>

						<td colspan="4"></td>
					</tr>
					<tr>
						<th colspan="14"><b>发货人</b>
						</th>
					</tr>
					<tr>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>单位名称:</td>
						<td colspan="2" class="td5"><input type="text" id=""
							name="fhdanweiname" disabled="disabled">
						</td>
						<td class="td3" ><font color="red" style="margin-right:5px">*</font>发货人名称:</td>
						<td colspan="2" class="td5"><input type="text"
							id="custom_name" name="custom_name" disabled="disabled">
							<input type="hidden" id="cname" name="custom_name"></td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>发货人电话:</td>
						<td colspan="2" class="td5"><input type="text"
							class="validate[required]" id="" name="send_phone"
							disabled="disabled">
						</td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>发货人手机:</td>
						<td colspan="2" class="td5"><input type="text" id=""
							name="send_shouji" disabled="disabled">
						</td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>发站:</td>
						<td class="td5"><input type="text" class="validate[required]"
							id="" name="send_station" disabled="disabled"></td>

					</tr>
					<tr>
						<td colspan="2" class="td3">发货详细地址：</td>
						<td colspan="6" class="td6"><textarea cols="60" rows="2"
								 name="fahuo_address" disabled="disabled"></textarea>
						</td>
						<td colspan="6"></td>
					</tr>
					<tr>
						<th colspan="14"><b>收货人</b>
						</th>
					</tr>
					<tr>
						<td colspan="2" class="td3"><font color="red" style="margin-right:5px">*</font>单位名称:</td>
						<td class="td5"><input type="text" id="" name="shdanweiname"
							disabled="disabled">
						</td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人名称：</td>
						<td colspan="2" class="td5"><input type="text"
							class="validate[required]" id="" name="receipt"
							disabled="disabled">
						</td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人电话：</td>
						<td colspan="2" class="td5"><input type="text"
							class="validate[custom[number],[required]]" id=""
							name="receipt_tel" disabled="disabled">
						</td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人手机：</td>
						<td colspan="2" class="td5"><input type="text" id=""
							name="receipt_phone" disabled="disabled"></td>
						<td class="td3"><font color="red" style="margin-right:5px">*</font>到站:</td>
						<td ><input type="text" class="validate[required]"
							id="" name="end_address" disabled="disabled"></td>
					</tr>
					<tr>
						<td colspan="2"  class="td3">收货详细地址：</td>
						<td colspan="6" class="td6"><textarea cols="60" rows="2"
								name="receipt_address" disabled="disabled"></textarea></td>
						<td colspan="6"></td>
					</tr>
					<tr>
						<!-- <th colspan="4">运单基本信息</th> 
				</tr> -->
					<tr>
						<td  class="td3"><font
							color="red" style="margin-right:5px">*</font>货品名称</td>
						<td  class="td3">包装</td>
						<td  class="td3"><font
							color="red" style="margin-right:5px">*</font>总件数</td>
						<td  class="td3"><font
							color="red" style="margin-right:5px">*</font>总重量(公斤)</td>
						<td  class="td3"><font
							color="red" style="margin-right:5px">*</font>总体积(立方米)</td>
						<td  class="td3"><font
							color="red" style="margin-right:5px">*</font>运费</td>
						<td  class="td3">提货费</td>
						<td  class="td3">装卸费</td>
						<td  class="td3">上楼费</td>
						<td  class="td3">直送费</td>
						<td  class="td3">理货费</td>
						<td  class="td3">开箱验货费</td>
						<td  class="td3">其他费</td>
						<td><font color="red" style="margin-right:5px">*</font>付费方式：</td>



					</tr>
					<tr>
						<td class="td5"><input type="text" name="goods_name"
							class="validate[required]" disabled="disabled" />
						</td>
						<td class="td5"><input type="text" name="goods_packing"
						 disabled="disabled">
						</td>
						<td class="td5"><input type="text" type="text"
							class="validate[custom[integer],min[0],required]" placeholder="0"
							name="goods_num" disabled="disabled" />
						</td>
						<td class="td5"><input type="text" type="text"
							class="validate[,custom[number],min[0],required]"
							placeholder="0.0000" name="goods_weight" disabled="disabled" />
						</td>
						<td class="td5"><input type="text" type="text"
							class="validate[custom[number],max[99999.9999],min[0.0000]]"
							placeholder="0.0000" name="goods_vol" disabled="disabled" />
						</td>
						<td class="td5"><input id="freight_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="freight_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="picking_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="picking_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="receivable_ground_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="receivable_ground_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="upstairs_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="upstairs_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="deliver_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="deliver_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="seized_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="seized_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="inspect_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="inspect_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="adorn_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="adorn_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><select id='type' class="combobox"
							name="pay_type"
							data-options="panelHeight : 'auto',editable:false"
							disabled="true">
								<option id="" value="0">回付</option>
								<option id="" value="1">提付</option>
								<option id="" value="2">现付</option>
								<option id="" value="3">货到前付</option>
								<option id="" value="6">货到付款</option>
								<option id="" value="4">发货方月结</option>
								<option id="" value="5">收货方月结</option>
						</select></td>
					</tr>
					<tr>
						<td  class="td3">投保价值</td>
						<td  class="td3">费率</td>
						<td  class="td3">保价费</td>
						<td  class="td3">代收货款</td>
						<td  class="td3">费率</td>
						<td  class="td3">手续费</td>
						<td class="td3">手续费付款方式</td>
						<td colspan="2" class="td3">到货时间</td>
						<!--  <td  class="td3">代收运费</td>	
					<td  class="td3">运费总额</td>					
					<td  class="td3">返款</td>
				    <td >付款方式</td> -->
						<td class="td3">是否发票</td>
						<td id="" class="td3">是否控货：</td>

						<td class="td3">是否回单：</td>

						<td id="is_recept_id" class="td3">回单份数：</td>

						<td id="" class="td3">是否急货：</td>

					</tr>
					<tr>
						<td class="td5"><input id="affirm_value" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="affirm_value"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber();SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input id="rates" type="text"
							class="validate[custom[number],max[99999.99],min[0.000],custom[dd]]"
							style="width: 50px" value="5" name="rates"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber();SumNum();"
							disabled="disabled" /><font style="size: 15">‰</font>
						</td>
						<td class="td5"><input id="insurance_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="insurance_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"
							disabled="disabled" />
						</td>
						<td class="td5"><input type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "
							placeholder="0.00" name="trade_agency" id="trade_agency"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber1();"
							disabled="disabled"></td>
						<td class="td5"><input type="text"
							class="validate[custom[number],max[99999.99],min[0.000],custom[dd]] "
							value="5" id="shouxu_feelv" style="width: 50px"
							name="shouxu_feelv"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber1();"
							disabled="disabled" />‰</td>
						<td class="td5"><input type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "
							placeholder="0.00" id="handling_charge" name="handling_charge"
							disabled="disabled" /></td>
						<td class="td5"><select id='type' class="combobox"
							name="trade_agency_stata"
							data-options="panelHeight : 'auto',editable:false"
							disabled="disabled">
								<option id="" value="0">现付</option>
								<option id="" value="1">到付</option>
						</select></td>
						<td colspan="2" class="td5"><input class="Wdate"
							onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
							id="" name="daohuo_time" disabled="disabled" /></td>

						<!--  <td class="td5"><input id="destination_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="destination_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();" disabled="disabled"/></td>						   			   
                    
				    <td  class="td5"><input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="transport_pay"	name="transport_pay" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();" disabled="disabled"/> 				   
					<td class="td5"><input id="back_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="back_fee" disabled="disabled"/></td>						   			
				    <td class="td5">
                        <select id='type' class="combobox" name="fankuan_stata"  data-options="panelHeight : 'auto',editable:false" disabled="disabled">
							<option id="" value="0">现反</option>
							<option id="" value="1">欠反</option>
					    </select>
                    </td> -->
						<td class="td5"><select id='state' class="combobox"
							name="invoice_state"
							data-options="panelHeight : 'auto',editable:false"
							disabled="disabled">
								<option id="" value="0">是</option>
								<option id="" value="1">否</option>

						</select></td>
						<td colspan=""><input type="radio" name="konghuo" value="1"
							style="width:15px" disabled="disabled">&nbsp;是 <input
							type="radio" name="konghuo" value="0" style="width:15px"
							checked="true" disabled="disabled">&nbsp;否</td>
						<td colspan=""><input type="radio" name="is_recept_no"
							value="1" style="width:15px" onclick="rideroo(this)"
							disabled="disabled">&nbsp;是 <input type="radio"
							name="is_recept_no" value="0" style="width:15px"
							onclick="rideroo1(this)" checked="true" disabled="disabled">&nbsp;否
						</td>
						<td class="td5"><input type="text" value="0" id="is_recept"
							name="is_recept" disabled="true" disabled="disabled"></td>
						<td class="td" colspan=""><input type="radio"
							name="most_urgent" value="1" style="width:15px"
							disabled="disabled">&nbsp;是 <input type="radio"
							name="most_urgent" value="0" style="width:15px" checked="true"
							disabled="disabled">&nbsp;否</td>
					</tr>
					<tr>
						<td  class="td3">代收运费</td>
						<td  class="td3">运费总额</td>
						<td  class="td3">返款</td>
						<td class="td3">返款方式</td>
						<td class="td3">收款合计</td>
						<td colspan="7" class="td3">备注:</td>
						<td colspan="2" class="td3">运单打印：</td>
					</tr>
					<tr>
						<td class="td5"><input id="destination_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="destination_fee"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();"
							disabled="disabled" />
						</td>

						<td class="td5"><input placeholder="0.00"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							type="text" id="transport_pay" name="transport_pay"
							onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();"
							disabled="disabled" />
						<td class="td5"><input id="back_fee" type="text"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							placeholder="0.00" name="back_fee" disabled="disabled" />
						</td>
						<td class="td5"><select id='type' class="combobox"
							name="fankuan_stata"
							data-options="panelHeight : 'auto',editable:false"
							disabled="disabled">
								<option id="" value="0">现反</option>
								<option id="" value="1">欠反</option>
						</select></td>
						<td class="td5"><input placeholder="0.00"
							class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
							type="text" id="gatheringhj" name="gatheringhj"
							onkeyup="value=value.replace(/[^\d\.]/g,'');" />
						</td>
						<td colspan="7" class="td6"><textarea class="easyui-textarea"
								cols="45" rows="2" name="remarks" disabled="disabled"></textarea>
						</td>
						<td class="td" colspan="2" ><input type="checkbox"
							name="printed" value="1" style="width:15px" disabled="disabled">机打运单
							&nbsp;&nbsp; <input type="checkbox" name="printed" value="0"
							style="width:15px" disabled="disabled">机打标签</td>
					</tr>
					<tr>
						<td class="td3">受理网点:</td>
						<td colspan="2" class="td5"><input type="text"
							id="shouliwangdian" name="shouliwangdian" disabled="disabled" />
						</td>
						<td class="td3">制单人</td>
						<td colspan="2" class="td5"><input type="text" id="user"
							name="shipping_order_name" disabled="disabled" /></td>
						<td class="td3">包装人</td>
						<td colspan="2" class="td5"><input type="text" id=""
							name="baozhuang_name" disabled="disabled" /></td>
						<td class="td3">业务员</td>
						<td colspan="2" class="td5"><input type="text" id=""
							name="yewuyuan" disabled="disabled" /></td>
						<td colspan="2"></td>
					</tr>
				</table>
			</fieldset>
	</form>
</body>
</html>
