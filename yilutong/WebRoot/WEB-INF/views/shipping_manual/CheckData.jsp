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

<title>运单核对</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<%
	String flg = (String) request.getAttribute("flg");
%>
</head>
<script type="text/javascript">
    var pid='<%=flg%>';
	$(function(){
	$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
				 var $target = $('input,textarea,select');
		 $target.bind('keydown', function (e) {
            var key = e.which;
            if (key == 13) {
                e.preventDefault();
                var nxtIdx = $target.index(this) + 1;
                    $target.eq(nxtIdx).focus();
            }
        });
});

	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
	  			//可提交
		$pjq.messager.confirm('运单核对', '确定核对信息吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'shipManual.do?method=getCheckData&pid='+pid,
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.ans=='1') {
							$pjq.messager.alert('核对运单', '运单核对无误!', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						}else{
						    $pjq.messager.alert('核对运单','异常信息:'+ msg.ans, 'info');
						   // $dialog.dialog('close');
							//$grid.datagrid('reload');
						}
					}
				});
			}
		});
		} else{
			    $pjq.messager.alert('核对运单', '必填信息不可为空', 'info');
			  }
	};
	function SumNum(){
		var sumValue;	
		a=eval(freight_fee.value);
		b=eval(picking_fee.value);
		c=eval(insurance_fee.value);
		d=eval(adorn_fee.value);
		e=eval(inspect_fee.value);
		f=eval(seized_fee.value);
		g=eval(deliver_fee.value);
		h=eval(upstairs_fee.value);
		i=eval(receivable_ground_fee.value);
		k = eval(back_fee.value);
		l = eval(destination_fee.value);		
		if (isNaN(a)){a=0};
		if (isNaN(b)){b=0};
		if (isNaN(c)){c=0};
		if (isNaN(d)){d=0};	
		if (isNaN(e)){e=0};
		if (isNaN(f)){f=0};
		if (isNaN(g)){g=0};
		if (isNaN(h)){h=0};
		if (isNaN(i)){i=0};
		if (isNaN(k)){k=0};
		if (isNaN(l)){l=0};
		sumValue = a+b+c+d+e+f+g+h+i+l-k;
		self['transport_pay'].value =sumValue;
	}
</script>
      <body >
		<form action="" method="post" id="Regform">
		<input type="hidden" name="shiping_order_id">
		<fieldset>
			<table class="tableclass">
				<tr>
				<th colspan="4">基本信息</th>
				</tr>
				 <tr>
				 <td ><font color="red" style="margin-right:10px">*</font>运单号:</td>
					<td  class="td2"><input type="text" class="validate[required]" id="num"
						name="shiping_order_num" ></td>
					 <td ><font color="red" style="margin-right:10px">*</font>发货客户电话:</td>
					<td class="td2"><input type="text"  class="validate[required]" id=""
						name="send_phone" ></td>  
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>到站:</td>
					<td class="td2"><input type="text"  class="validate[required]" id=""
						name="end_address"></td> 
					<td ><font color="red" style="margin-right:10px">*</font>收货人名称：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="receipt"></td>
				</tr>
				<tr>
				    <td ><font color="red" style="margin-right:10px">*</font>收货人电话：</td>
					<td  class="td2"><input type="text" class="validate[custom[number],[required]]" id=""
						name="receipt_tel"></td>
				    <td ><font color="red" style="margin-right:10px">*</font>收货人手机：</td>
					<td  class="td2"><input type="text" class="validate[custom[number],[required]]" id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td >收货详细地址：</td>	
					<td colspan="3" class="td2">
					<textarea cols="45" rows="2" type="text" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>品名：</td>
					<td class="td2"><input   type="text"  name="goods_name" class="validate[required]"/></td>
					<td  >包装：</td>
					<td  class="td2"><input  type="text"  name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总件数：</td>
					<td  class="td2"><input  type="text" type="text"  class="validate[custom[integer],min[0],required]" placeholder="0"  name="goods_num" /></td>
					<td ><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
					<td  class="td2"><input type="text" type="text"  class="validate[,custom[number],min[0],required]" placeholder="0.0000"  name="goods_weight" /></td>	
			    </tr>
			    <tr>
					<td ><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
					<td  class="td2"><input type="text"  type="text"  class="validate[custom[number],max[99999.9999],min[0.0000]]"   placeholder="0.0000"   name="goods_vol" /></td>
                    <td >是否开发票：</td>
					<td  class="td2"><select id='state'  class="combobox" name="invoice_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">是</option>
							<option id="" value="1">否</option>

					</select> 
					</td>
               
                </tr> 
			    <tr>
					<td ><font color="red" style="margin-right:10px">*</font>运输方式：</td>
					<td class="td2">
					<select id='check' class="combobox" name="transport_mode" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">普快</option>
							<option id="" value="1">特快</option>
					</select></td> 
					<td ><font color="red" style="margin-right:10px">*</font>交接方式：</td>
					<td class="td2"><select id='send' class="combobox" name="send_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">自提</option>
							<option id="" value="1">送货</option>
					</select> </td>
				</tr>	
				<tr>
					<th colspan="4">计费标准</th>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>运费：</td>
					<td class="td2">
<!-- 					<input id="take_fee" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="take_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
 -->					<input id="freight_fee" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd],required]" placeholder="0.00"  name="freight_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					
					
					<td >提货费：</td>
					<td class="td2"><input id="picking_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="picking_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();" />
					<!-- <input id="send_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="send_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();" /> --></td>
				</tr>
				<tr>
					<td >保价费：</td>
					<td class="td2">
					<input id="insurance_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="insurance_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					
					<td >其他费：</td>
					<td class="td2"><input id="adorn_fee"  type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00"  name="adorn_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
				
<!-- 					<input id="change_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="change_fee" /></td>
 -->				</tr> 
				<tr>
					<td >装卸费：</td>
					<td class="td2"><input id="receivable_ground_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="receivable_ground_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					<td >上楼费：</td>
					<td class="td2"><input id="upstairs_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="upstairs_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>			
				</tr>
				<tr>
					<td >直送费：</td>
					<td class="td2"><input id="deliver_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="deliver_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					<td >理货费：</td>
					<td class="td2"><input id="seized_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="seized_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>			
				</tr>
				<tr>
				<td >开箱验货费：</td>
					<td class="td2"><input id="inspect_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="inspect_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
				<td >到付款：</td>
					<td class="td2"><input id="destination_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="destination_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>						   
				</tr>
				<tr>
					<td >回扣：</td>
					<td class="td2"><input id="back_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="back_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>						   			
					<td >运费总额：</td>
					<td  class="td2"><input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text"
					id="transport_pay"	name="transport_pay" /> 
					</td>
				</tr>				
				<tr>
					<td >应收备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks_fee"></textarea></td>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>付费方式：</td>
					<td class="td2"><select id='type' class="combobox" name="pay_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
					<option id="" value="6">货到付款</option>
					<option id="" value="4">发货方月结</option>
					<option id="" value="5">收货方月结</option>
					
					</select></td>
				<td >税率：</td> 
					<td >
					<input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "  placeholder="0.00"  name="duty_rate"  style="width:150px">
					</td>
				</tr> 
				<tr>
					<td >代收货款：</td> 
					<td >
					<input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "  placeholder="0.00"  name="trade_agency"  style="width:150px">
					<td >回单份数：</td>
					<td class="td2"><input type="text"  name="is_recept" style="width:150px">
					</td>
					</tr>						
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks"></textarea>
					<input type="hidden"   name="creat_type" value="4" style="width:150px">
					<input   type="hidden"  id="user"  name="shipping_order_name" /> 
					<input   type="hidden"  id="cid"  name="custom_id" /> 
					<input   type="hidden"  id="ci"  name="custom_name" /> 
					<input   type="hidden"  id="cen"  name="Send_station" /> 
				
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>									