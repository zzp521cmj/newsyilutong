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

<title>修改订单信息</title>
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
				data.plate_number='';
				}	
				//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
				//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
				$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number); 
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
		$pjq.messager.confirm('修改订单', '确定要修改吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'shipOrder.do?method=updateShipOrder',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('修改订单', '订单修改成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});
			}
		});
		} else{
			    $pjq.messager.alert('修改订单', '必填信息不可为空', 'info');
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
				 <td ><font color="red" style="margin-right:10px">*</font>订单号:</td>
					<td  class="td2"><input type="text" readonly="true"  class="validate[required]" id="num"
						name="shiping_order_num"></td>
					<td ><font color="red" style="margin-right:10px">*</font>起运地:</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="start_address"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>到达地:</td>
					<td   class="td2"><input type="text"  class="validate[required]" id=""
						name="end_address"></td>
				
					<td ><font color="red" style="margin-right:10px">*</font>创建时间:</td>
					<td  class="td2"><input  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true})" id=""
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
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="checkp"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td class="td2" ><input type="text" class="validate[required,custom[number],custom[phone]]"id=""
						name="check_tel"></td>
				</tr>
				<tr>
					<td  >手机：</td>	
					<td colspan="3"  class="td2"><input type="text" class="validate[custom[phone],custom[number]]" id=""
						name="check_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货方：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="receipt"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number],custom[phone]]" id=""
						name="receipt_tel"></td>
						</tr>
				<tr>
					<td >手机：</td>	
					<td  colspan="3"class="td2"><input type="text"  class="validate[custom[phone],custom[number]]" id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货地址/单位：</td>	
					<td colspan="3" class="td2">
					<textarea cols="45" rows="2" class="validate[required]" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>货物名称：</td>
					<td class="td2"><input   type="text" class="validate[required]" name="goods_name" /></td>
					<td  ><font color="red" style="margin-right:10px">*</font>包装：</td>
					<td  class="td2"><input  type="text"   class="validate[required]" name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总件数：</td>
					<td  class="td2"><input  type="text" class="validate[custom[integer],required,max[99999.9999],min[0.0000]]"  placeholder="0"value="0" name="goods_num" /></td>
					<td ><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number],max[99999.9999],min[0.0000]]" placeholder="0.0000" value="0.0000"  name="goods_weight" /></td>	
				</tr>
				
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
					<td  colspan="3"  class="td2"><input type="text"  class="validate[required,custom[number],max[99999.9999],min[0.0000]]"   placeholder="0.0000"  value="0.0000" name="goods_vol" /></td>
				</tr> 
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>发货方式：</td>
					<td class="td2">
					<select id='check' class="combobox" name="check_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">发货人门点</option>
							<option id="" value="1">起运货运站</option>
					</select></td>
					<td >提货方式：</td>
					<td class="td2"><select id='send' class="combobox" name="send_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">自提</option>
							<option id="" value="1">送货</option>
					</select> </td>
				</tr>	
				<tr>
					<td >接货车号：</td>
					<td  class="td2"><input class="search-text" type="hidden"  id="carid" name="car_id" style="width:150px">
					</td>
					<td >规格(米)：</td>
					<td class="td2"><input type="text"  name="spe" style="width:150px">
					</td>
				</tr> 
				<!-- <tr>
					<th colspan="4">计费标准</th>
				</tr>
				<tr>
					<td >提货费：</td>
					<td class="td2"><input id="take_pay" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="take_fee" /></td>
					<td >送货费：</td>
					<td class="td2"><input id="send_pay" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" value="0.00" name="send_fee" /></td>
				</tr>
				<tr>
					<td >装货费：</td>
					<td class="td2"><input id="adorn_fee"  type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00" value="0.00" name="adorn_fee" /></td>
					<td >干线费：</td>
					<td  class="td2"><input id="trunk_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  value="0.00"name="trunk_fee" /></td>
				</tr> -->
				<tr>
					<!-- <td >保险费：</td>
					<td  class="td2"><input type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  value="0.00"  name="insurance" /></td> -->
					<td >
					<input id="take_pay" type="hidden"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="take_fee" />
					<input id="send_pay" type="hidden"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" value="0.00" name="send_fee" />
					<input id="adorn_fee"  type="hidden"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00" value="0.00" name="adorn_fee" />
					<input id="trunk_fee" type="hidden"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  value="0.00"name="trunk_fee" />
					<input type="hidden"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  value="0.00"  name="insurance" />
					<input type="hidden"class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  value="0.00" name="trade_agency" style="width:150px">
					<!-- <td >保险费：</td>
					<td  class="td2"><input type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  value="0.00"  name="insurance" /></td> -->
					<font color="red" style="margin-right:10px">*</font>付费方式：</td>
					<td class="td2"><select id='type' class="combobox" name="pay_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">到付</option>
							<option id="" value="1">回付</option>
							<option id="" value="2">月结</option>
							<option id="" value="3">等通知</option>
							<option id="" value="4">打卡</option>
					</select></td>
				<!-- </tr>
				 <tr>
				 <td >代收货款：</td>
					<td  class="td2"><input type="text"class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  value="0.00" name="trade_agency" style="width:150px">
					</td> -->
					<td ><font color="red" style="margin-right:10px">*</font>运费总额：</td>
					<td   colspan="3" class="td2"><input    placeholder="0.00" value="0.00" class="validate[required,custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text"
						editable="" name="transport_pay" /> 
					</td>
				</tr> 
				<tr>
					<td >订单状态：</td>
					 <td  class="td2">
					 <select id='state'  class="combobox" name="shipping_order_state"   style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0" >受理</option>
					</select>
					</td>
					<td >中转地：</td>
					<td  class="td2"><input   type="text"
						editable="" name="change_address" /> 
					</td>
					</tr>
					<tr>
					<td >制单人：</td>
					<td   colspan="3" class="td2"><input   type="text"
						editable="" name="shipping_order" /> 
					</td>
				</tr>
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks" ></textarea></td>
				</tr>
			</table>
		</fieldset>
		<input type="hidden"   name="creat_type" value="0" style="width:150px">
	</form>
</body>
</html>
