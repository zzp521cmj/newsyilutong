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

<title>修改运单信息</title>
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
	String flg = (String) request.getAttribute("rows");
%>
</head>
<script type="text/javascript">
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
		var pid='<%=flg%>';
		$.ajax({
			url : 'shipOrder.do?method=getUpdateShipOrder',
			data : {
				id : pid
			},
			success : function(data) {
			 if(data.plate_number==null){
					$("#carid").select2("val",'');
				}else{
					$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number); 
				}	
				$('#Regform').form('load', data);
			}
		});

		$("#carid").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "shipOrder.do?method=getPlateNumberLength",
					data : {
						number : query.term
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
							;
						});
						query.callback(data);
					}
				});
			}
		});

	});

	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
	  			//可提交
		$pjq.messager.confirm('修改运单', '确定要修改吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'shipOrder.do?method=updateShipOrder',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('修改运单', '运单修改成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});
			}
		});
		} else{
			    $pjq.messager.alert('修改运单', '必填信息不可为空', 'info');
			  }
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
				 <td ><font color="red" style="margin-right:10px">*</font>运单号:</td>
					<td  class="td2"><input type="text" class="validate[required]" id="num"
						name="shiping_order_num"></td>
						<td ><font color="red" style="margin-right:10px">*</font>发站:</td>
					<td class="td2"><input type="text"  class="validate[required]" id=""
						name="send_station"></td> 
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
					<td  class="td2"><input type="text" class="validate[custom[number]]" id=""
						name="receipt_tel"></td>
				    <td ><font color="red" style="margin-right:10px">*</font>收货人手机：</td>
					<td  class="td2"><input type="text" class="validate[custom[number]]" id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td >收货详细地址：</td>	
					<td colspan="3" class="td2">
					<textarea cols="45" rows="2" type="text" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td  >品名：</td>
					<td class="td2"><input   type="text"  name="goods_name" /></td>
					<td  >包装：</td>
					<td  class="td2"><input  type="text"  name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td >总件数：</td>
					<td  class="td2"><input  type="text" type="text"  class="validate[custom[integer],min[0]]" placeholder="0"  name="goods_num" /></td>
					<td >总重量(千克)：</td>
					<td  class="td2"><input type="text" type="text"  class="validate[,custom[number],min[0]]" placeholder="0.0000"  name="goods_weight" /></td>	
			    </tr>
			    <tr>
					<td >总体积(立方米)：</td>
					<td  class="td2"><input type="text"  type="text"  class="validate[custom[number],max[99999.9999],min[0.0000]]"   placeholder="0.0000"   name="goods_vol" /></td>
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
					<td >应收送货费：</td>
					<td class="td2"><input id="take_pay" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="take_fee" /></td>
					<td >应收落地费：</td>
					<td class="td2"><input id="send_pay" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="send_fee" /></td>
				</tr>
				<tr>
					<td >应收其他费：</td>
					<td class="td2"><input id="adorn_fee"  type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00"  name="adorn_fee" /></td>
					<td >应收中转费：</td>
					<td class="td2"><input id="change_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="change_fee" /></td>
				</tr> 
				<tr>
					<td >落地费：</td>
					<td class="td2"><input id="receivable_ground_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="receivable_ground_fee" /></td>
					<td >上楼费：</td>
					<td class="td2"><input id="upstairs_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="upstairs_fee" /></td>			
				</tr>
				<tr>
					<td >直送费：</td>
					<td class="td2"><input id="deliver_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="deliver_fee" /></td>
					<td >理货费：</td>
					<td class="td2"><input id="seized_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="seized_fee" /></td>			
				</tr>
				<tr>
				<td >开箱验货费：</td>
					<td class="td2"><input id="inspect_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="inspect_fee" /></td>
				<td >回扣：</td>
					<td class="td2"><input id="back_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="back_fee" /></td>						   
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
					<option id="" value="4">发货方月结</option>
					<option id="" value="5">收货方月结</option>
					</select></td>
					<td >运费总额：</td>
					<td  class="td2"><input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text"
						editable="" name="transport_pay" /> 
					</td>
				</tr> 
				<tr>
					<td >代收货款：</td> 
					<td >
					<input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "  placeholder="0.00"  name="paid_fee"  style="width:150px">
					<td >回单份数：</td>
					<td class="td2"><input type="text"  name="is_recept" style="width:150px">
					</td>
					</tr>
						<!--<tr>
				<td >接货车号：</td>
					<td  class="td2"><input class="search-text" type="hidden"  id="carid" name="car_id" style="width:150px">
					</td>
					<td >规格(米)：</td>
					<td class="td2"><input type="text"  name="spe" style="width:150px">
					</td>
				</tr> 
				<tr>
						<input type="hidden"  value="0" name="shipping_order_state" style="width:150px">
			 	<td >运单状态：</td>
					<td  class="td2"><select id='state'  class="combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">受理</option>
							<option id="" value="1">在途</option>
							<option id="" value="2">到达</option>
							<option id="" value="3">配送</option>
							<option id="" value="4">签收</option>
					</select> 
					</td> 
					<td >中转地：</td>
					<td  class="td2"  colspan="3"><input   type="text"
						editable="" name="change_address" /> 	
					</td>
				</tr> 
		 -->
			<!-- 	 <tr>
				<td >制单人：</td>
					<td   colspan="3" class="td2"><input type="text" editable="" name="shipping_order_name" /> 
					</td>
				</tr> -->
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks"></textarea>
						<input   type="hidden"  id="user" editable="" name="shipping_order_name" /> 
                        <!-- <input   type="hidden"  id="user" editable="" name="send_station" />  -->
 						<input   type="hidden"  id="user" editable="" name="send_time" /> 
						<input   type="hidden"  id="user" editable="" name="custom_name" /> 
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
