<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改订单信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">    
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
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
	String isok = (String) request.getAttribute("isok");
%>
</head>
<script type="text/javascript">
	$(function(){
	$("#signform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		var pid='<%=flg%>';
		var isok='<%=isok%>';
		if(isok==4){//签收
			$.ajax({
				url : 'shipOrder.do?method=getUpdateSignShipOrder',
				data : {
					id : pid
				},
				success : function(data) {
					document.getElementById("signtable").style.display="block";
					$('#Regform').form('load', data);
					$('#signform').form('load', data);
					var inputs=document.getElementsByTagName("input");
				    for(var i=0;i<inputs.length;i++){
				    inputs[i].setAttribute("readOnly",true);
				    }
				    document.getElementById("actual_number").disabled="disabled";
				    document.getElementById("defect_number").disabled="disabled";
				    document.getElementById("copies_number").disabled="disabled";
				    document.getElementById("sign_time").disabled="disabled";
				    document.getElementById("sign_result").disabled="disabled";
				}
			});
		}else{//未签收
			$.ajax({
				url : 'shipOrder.do?method=getUpdateShipOrder',
				data : {
					id : pid
				},
				success : function(data) {
					$('#Regform').form('load', data);
				}
			});
		}
		$("#carid").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "car_owner.do?method=getPlateNumberLength",
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
	
	var num;
	var _SJNUM=false;//实际数量的变量
	var _QSNUM=false;//缺失数量的变量
	var _HDNUM=false;//回单数量的变量
	var qs = function($dialog, $grid, $pjq, $mainMenu) {
		var sign=document.getElementById("sign_user").value;
		if(sign==""){
		    $("#sign_user").val($("#receipt").val());
		    $("#sign_userphone").val($("#receipt_tel").val());
		    $("#actual_number").val($("#goods_num").val());
		    $("#defect_number").val(0);
		    $("#copies_number").val($("#goods_num").val());
		    $("#order_id").val($("#shiping_order_id").val());
		    $("#order_number").val($("#num").val());
		    num=$("#goods_num").val();
		    
			document.getElementById("signtable").style.display="block";
			var scroll_offset = $("#signtable").offset();
			$("body,html").animate({
				   scrollTop:scroll_offset.top  //让body的scrollTop等于pos的top，就实现了滚动
			},0);
		}else{
			if($("#signform").validationEngine('validate')){
				$pjq.messager.confirm('签收订单', '确定要签收吗?', function(r) {
					if(r){
						 $.ajax({
							type : "POST",
							url : 'shipOrder.do?method=saveSignShipOrder',
							data :$('#signform').serialize(),
							success : function(msg) {
								if (msg.flag) {
									$pjq.messager.alert('签收订单', '签收订单成功', 'info');
									$dialog.dialog('close');
									$grid.datagrid('reload');
								}else{
									$pjq.messager.alert('签收订单', '签收订单失败', 'info');
								};
							}
						});
					}
				});
			}
		}
	};
	
	
	function checksj(obj){
		if(obj.value<=num){
			_SJNUM=true;
		}else{
			$.messager.alert('签收订单', '大于订单实际数量', 'info');
			obj.value=num;
		}
	}
	function checkqs(obj){
		if(obj.value<=num){
			_QSNUM=true;
		}else{
			$.messager.alert('签收订单', '大于订单实际数量', 'info');
			obj.value=0;
		}	
	}
	function checkhd(obj){
		if(obj.value<=num){
			_HDNUM=true;
		}else{
			$.messager.alert('签收订单', '大于订单实际数量', 'info');
			obj.value=num;
		}	
	}	
</script>
<body>
		<form action="" method="post" id="Regform">
		<fieldset>
			<table class="tableclass">
				<tr>
				<th colspan="4">基本信息</th>
				</tr>
				 <tr>
				 <td ><font color="red" style="margin-right:10px">*</font>订单号:</td>
					<td  class="td2"><input style="display: none;" readonly="readonly" type="text" readonly="readonly"  class="validate[required]" id="shiping_order_id"
						name="shiping_order_id"><input readonly="readonly" type="text" readonly="readonly"  class="validate[required]" id="num"
						name="shiping_order_num"></td>
					<td ><font color="red" style="margin-right:10px">*</font>起运地:</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required]" id=""
						name="start_address"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>到达地:</td>
					<td   class="td2"><input readonly="readonly" type="text"  class="validate[required]" id=""
						name="end_address"></td>
				
					<td ><font color="red" style="margin-right:10px">*</font>创建时间:</td>
					<td  class="td2"><input  disabled="disabled" readonly="readonly"  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true})" id=""
						name="check_time" />
					</td>
					<!--  <td>性别:</td>
					<td class="td2"><select readonly="readonly"id='sectaa' class="easyui-combobox" name="gender" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="">请选择</option>
							<option  value="0">男</option>
							<option  value="1">女</option>
					</select></td> -->  
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>托运方：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required]" id=""
						name="checkp"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td class="td2" ><input readonly="readonly" type="text" class="validate[required,custom[number]]"id=""
						name="check_tel"></td>
				</tr>
				<tr>
					<td  >手机：</td>	
					<td colspan="3"  class="td2"><input readonly="readonly" type="text" class="validate[custom[phone],custom[number]]" id=""
						name="check_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货方：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required]" id="receipt"
						name="receipt"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required,custom[number]]" id="receipt_tel"
						name="receipt_tel"></td>
						</tr>
				<tr>
					<td >手机：</td>	
					<td  colspan="3"class="td2"><input readonly="readonly" type="text"  class="validate[custom[phone],custom[number]]" id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货地址/单位：</td>	
					<td colspan="3" class="td2">
					<textarea readonly="readonly" cols="45" rows="2" class="validate[required]" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>货物名称：</td>
					<td class="td2"><input readonly="readonly"   type="text" class="validate[required]" name="goods_name" /></td>
					<td  ><font color="red" style="margin-right:10px">*</font>包装：</td>
					<td  class="td2"><input readonly="readonly"  type="text"   class="validate[required]" name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总件数：</td>
					<td  class="td2"><input readonly="readonly"  type="text" class="validate[custom[integer],required,min[0]]"  value="0" name="goods_num" id="goods_num"/></td>
					<td ><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required,custom[number],min[0]]"  value="0.00"  name="goods_weight" /></td>	
				</tr>
				
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
					<td  colspan="3"  class="td2"><input readonly="readonly" type="text"  class="validate[required,custom[number],min[0]]"   value="0.00"  name="goods_vol" /></td>
				</tr> 
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>发货方式：</td>
					<td class="td2">
					<select  disabled="disabled" readonly="readonly"id='check' class="combobox" name="check_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">发货人门点</option>
							<option id="" value="1">起运货运站</option>
					</select></td>
					<td >提货方式：</td>
					<td class="td2"><select  disabled="disabled" readonly="readonly"id='send' class="combobox" name="send_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">自提</option>
							<option id="" value="1">送货</option>
					</select> </td>
				</tr>	
				<tr>
					<td >接货车号：</td>
					<td  class="td2"><input class="search-text" type="hidden" id="carid"  name="car_id" style="width:150px">
					</td>
					<td >规格(米)：</td>
					<td class="td2"><input readonly="readonly" type="text"  name="spe" style="width:150px">
					</td>
				</tr> 
				<tr>
					<th colspan="4">计费标准</th>
				</tr>
				<tr>
					<td >提货费：</td>
					<td class="td2"><input readonly="readonly" id="take_pay" type="text"  class="validate[custom[number],min[0]]" value="0.00" name="take_fee" /></td>
					<td >送货费：</td>
					<td class="td2"><input readonly="readonly" id="send_pay" type="text"   class="validate[custom[number],min[0]]" value="0.00" name="send_fee" /></td>
				</tr>
				<tr>
					<td >装货费：</td>
					<td class="td2"><input readonly="readonly" id="adorn_fee"  type="text"  class="validate[custom[number],min[0]]"  value="0.00" name="adorn_fee" /></td>
					<td >干线费：</td>
					<td  class="td2"><input readonly="readonly" id="trunk_fee" type="text"   class="validate[custom[number],min[0]]"  value="0.00"name="trunk_fee" /></td>
				</tr>
				<tr>
					<td >保险费：</td>
					<td  class="td2"><input readonly="readonly" type="text"   class="validate[custom[number],min[0]]"  value="0.00"  name="insurance" /></td>
					<td ><font color="red" style="margin-right:10px">*</font>付费方式：</td>
					<td class="td2"><select  disabled="disabled" readonly="readonly"id='type' class="combobox" name="pay_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现付</option>
							<option id="" value="1">代付</option>
							<option id="" value="2">月结</option>
					</select></td>
				</tr>
				 <tr>
				 <td >代收货款：</td>
					<td  class="td2"><input readonly="readonly" type="text"   value="0.00" name="trade_agency" style="width:150px">
					</td>
					<td ><font color="red" style="margin-right:10px">*</font>运费总额：</td>
					<td   colspan="3" class="td2"><input readonly="readonly"    value="0.00"  class="validate[required,custom[number],min[0.00]]"  type="text"
						editable="" name="transport_pay" /> 
					</td>
				</tr> 
				<tr>
					<td >订单状态：</td>
					<td  class="td2"><select readonly="readonly" disabled="disabled" id='state'  class="combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">受理</option>
							<option id="" value="1">在途</option>
							<option id="" value="2">到达</option>
							<option id="" value="3">配送</option>
							<option id="" value="4">签收</option>
					</select> 
					</td>
					<td >中转地：</td>
					<td  class="td2"><input readonly="readonly"   type="text"
						editable="" name="change_address" /> 
					</td>
				</tr> 
				<tr>
				<td >制单人：</td>
					<td   colspan="3" class="td2"><input readonly="readonly"   type="text"
						editable="" name="shipping_order" /> 
					</td>
				</tr>
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea readonly="readonly" class="easyui-textarea" cols="45" rows="2" name="remarks" ></textarea></td>
				</tr>
			</table>
		</fieldset>
	<input readonly="readonly" type="hidden" name="shiping_order_id">	
	</form>

	<form action="" id="signform">	
	<input readonly="readonly" type="hidden" name="order_id" id="order_id">	
	<input readonly="readonly" type="hidden" name="order_number" id="order_number">
		<fieldset>
			<table class="tableclass" style="display: none;" id="signtable">
				<tr>
					<td style="color: blue;"><span style="color: red">*</span>姓名：</td>
					<td class="td2"><input  class="validate[required]"  type="text"
						editable="" name="sign_user" id="sign_user" /> 
					</td>
					
					<td style="color: blue;"><span style="color: red">*</span>手机号：</td>
					<td class="td2"><input class="validate[required,custom[phone]]" id="sign_userphone"
						name="sign_userphone" /> 
					</td>
				</tr>
				<tr>
				    <td style="color: blue;"><span style="color: red">*</span>证件号：</td>
					<td class="td2"><input class="validate[required,custom[chinaIdLoose]]"  type="text"
						editable="" name="sign_usernumber" id="sign_usernumber" /> 
					</td>
					
					<td style="color: blue;"><span style="color: red">*</span>签收结果：</td>
					<td class="td2"><select id='sign_result' name="sign_result"  class="combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">异常签收</option>
							<option id="" value="1" selected="selected">正常签收</option>
					</select>
				</tr>
				<tr>
					<td style="color: blue;"><span style="color: red">*</span>实际数量：</td>
					<td class="td2"><input  class="validate[custom[integer],required,min[0]]"  type="text"
						editable="" name="actual_number" id="actual_number" onblur="checksj(this)"/>
					</td>
					</td>
					<td style="color: blue;"><span style="color: red">*</span>缺失数量：</td>
					<td class="td2"><input  class="validate[custom[integer],required,min[0]]"  type="text"
						editable="" name="defect_number" id="defect_number"  onblur="checkqs(this)"/>
					</td>
				</tr>
				<tr>
					<td style="color: blue;"><span style="color: red">*</span>回单份数：</td>
					<td class="td2"><input  class="validate[custom[integer],required,min[0]]"  type="text"
						editable="" name="copies_number" id="copies_number"  onblur="checkhd(this)"/>
					</td>
					
					<td style="color: blue;"><span style="color: red">*</span>签收日期：</td>
					<td class="td2"><input class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true})" id="sign_time"
						name="sign_time" /> 
					</td>
				</tr>
				<tr>
					<td style="color: blue;">备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="sign_remarks" ></textarea></td>
				</tr>
			</table>
		</fieldset>
	 </form>
		<input readonly="readonly" type="hidden"  name="creat_type" value="0" style="width:150px">
</body>
</html>
