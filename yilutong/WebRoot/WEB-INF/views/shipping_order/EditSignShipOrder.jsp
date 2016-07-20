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

<title>修改签收运单信息</title>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="./webuploader/jquery.js"></script>
<script type="text/javascript" src="./webuploader/webuploader.js"></script>
<script type="text/javascript"
	src="./webuploader/singshiporder_uplaod.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<%-- <jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include> --%>
<link rel="stylesheet"
	href="./ValidationEngine/css/validationEngine.jquery.css">
<script src="./ValidationEngine/js/jquery.validationEngine-zh_CN.js"></script>
<script src="./ValidationEngine/js/jquery.validationEngine.js"></script>

<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>


<link rel="stylesheet" type="text/css"
	href="./webuploader/webuploader.css" />
<link rel="stylesheet" type="text/css" href="./webuploader/style.css" />
<%
	String flg = (String) request.getAttribute("flg");
	String isok = (String) request.getAttribute("isok");
	User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
%>

</head>
<script type="text/javascript">
	$(function(){
	$("#signform").validationEngine('attach', {
				 promptPosition:'topRight:-15,0'
				 });
		var pid='<%=flg%>';
		var isok='<%=isok%>';
		if(isok==4||isok==1){//签收
		    $("#trupload").hide();
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
	di();
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
		$("#sign_username").val('<%=user.getUsername()%>');
			if($("#signform").validationEngine('validate')){
				$pjq.messager.confirm('签收运单', '确定要签收吗?', function(r) {
					if(r){
						 $.ajax({
							type : "POST",
							url : 'shipOrder.do?method=saveSignShipOrder',
							data :$('#signform').serialize(),
							success : function(msg) {
								if (msg.flag) {
									$pjq.messager.alert('签收运单', '签收运单成功', 'info');
									$dialog.dialog('close');
									$grid.datagrid('reload');
								}else{
									$pjq.messager.alert('签收运单', '签收运单失败', 'info');
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
			alert('大于运单实际数量');
			obj.value=num;
		}
	}
	function checkqs(obj){
		if(obj.value<=num){
			_QSNUM=true;
		}else{
			alert('大于运单实际数量');
			obj.value=0;
		}	
	}
	function checkhd(obj){
		if(obj.value<=num){
			_HDNUM=true;
		}else{
					alert('大于运单实际数量');
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
				 <td ><font color="red" style="margin-right:10px"></font>运单号:</td>
					<td  class="td2"><input style="display: none;" readonly="readonly" type="text" readonly="readonly"  class="validate[required]" id="shiping_order_id"
						name="shiping_order_id"><input readonly="readonly" type="text" readonly="readonly"  class="validate[required]" id="num"
						name="shiping_order_num"></td>
					<td ><font color="red" style="margin-right:10px"></font>发站:</td>
					<td  class="td2"><input readonly="readonly" type="text" class="" id=""
						name="send_station"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px"></font>到站:</td>
					<td   class="td2"><input readonly="readonly" type="text"  class="" id=""
						name="end_address"></td>
				
					<td ><font color="red" style="margin-right:10px"></font>创建时间:</td>
					<td  class="td2"><input  disabled="disabled" readonly="readonly"  class="Wdate " onfocus="WdatePicker({isShowWeek:true})" id=""
						name="send_time" />
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
					<td  ><font color="red" style="margin-right:10px"></font>发货客户：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="" id=""
						name="custom_name"></td>
					<td ><font color="red" style="margin-right:10px"></font>发货人电话：</td>
					<td class="td2" ><input readonly="readonly" type="text" class="validate[required,custom[number]]"id=""
						name="send_phone"></td>
				</tr>				
				<tr>
					<td ><font color="red" style="margin-right:10px"></font>收货方：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required]" id="receipt"
						name="receipt"></td>
					<td ><font color="red" style="margin-right:10px"></font>电话：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required,custom[number]]" id="receipt_tel"
						name="receipt_tel"></td>
						</tr>
				<tr>
					<td >手机：</td>	
					<td  colspan="3"class="td2"><input readonly="readonly" type="text"  class="validate[custom[phone],custom[number]]" id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px"></font>收货详细地址：</td>	
					<td colspan="3" class="td2">
					<textarea readonly="readonly" cols="45" rows="2" class="validate[required]" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>品名：</td>
					<td class="td2"><input   type="text" readonly="readonly"   name="goods_name" class="validate[required]"/></td>
					<td >包装：</td>
					<td  class="td2"><input  type="text"  readonly="readonly"  name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td ><font color="red" style="margin-right:10px"></font>总件数：</td>
					<td  class="td2"><input readonly="readonly"  type="text" class="validate[custom[integer],required,min[0]]"  value="0" name="goods_num" id="goods_num"/></td>
					<td ><font color="red" style="margin-right:10px"></font>总重量(千克)：</td>
					<td  class="td2"><input readonly="readonly" type="text" class="validate[required,custom[number],min[0]]"  value="0.00"  name="goods_weight" /></td>	
				</tr>
				
			   <tr>
					<td >总体积(立方米)：</td>
					<td  class="td2"><input type="text"  readonly="readonly"  type="text"  class="validate[custom[number],max[99999.9999],min[0.0000]]"   placeholder="0.0000"   name="goods_vol" /></td>
                    <td >是否开发票：</td>
					<td  class="td2"><select id='state'   class="combobox" readonly="readonly"  name="invoice_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">是</option>
							<option id="" value="1">否</option>

					</select> 
					</td>
                </tr>  				
					<tr>
					<th colspan="4">计费标准</th>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>运费：</td>
					<td class="td2">
				    <input id="freight_fee" type="text" readonly="readonly"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd],[required]]" placeholder="0.00"  name="freight_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					
					
					<td >提货费：</td>
					<td class="td2"><input id="picking_fee" readonly="readonly"  type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="picking_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();" />
				</tr>
				<tr>
					<td >保价费：</td>
					<td class="td2">
					<input id="insurance_fee" type="text"  readonly="readonly"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="insurance_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					
					<td >其他费：</td>
					<td class="td2"><input id="adorn_fee"  readonly="readonly"  type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00"  name="adorn_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
				
				</tr> 
				<tr>
					<td >落地费：</td>
					<td class="td2"><input id="receivable_ground_fee" readonly="readonly"  type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="receivable_ground_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					<td >上楼费：</td>
					<td class="td2"><input id="upstairs_fee" type="text"  readonly="readonly"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="upstairs_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>			
				</tr>
				<tr>
					<td >直送费：</td>
					<td class="td2"><input id="deliver_fee" type="text"  readonly="readonly"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="deliver_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					<td >理货费：</td>
					<td class="td2"><input id="seized_fee" type="text" readonly="readonly"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="seized_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>			
				</tr>
				<tr>
				<tr>
				<td >开箱验货费：</td>
					<td class="td2"><input id="inspect_fee" type="text"  readonly="readonly"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="inspect_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
				<td >到付款：</td>
					<td class="td2"><input id="destination_fee" type="text"  readonly="readonly"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="destination_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>						   
				</tr>
				<tr>
					<td >回扣：</td>
					<td class="td2"><input id="back_fee" type="text"  readonly="readonly"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="back_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>						   
				
					<td >运费总额：</td>
					<td  class="td2"><input    placeholder="0.00"  readonly="readonly"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text"
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
					<td class="td2"><select id='type' disabled="disabled"  class="combobox" name="pay_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
					<option id="" value="6">货到付款</option>
					<option id="" value="4">发货方月结</option>
					<option id="" value="5">收货方月结</option>
					</select></td>
						<td ><font color="red" style="margin-right:10px">*</font>交接方式：</td>
					<td class="td2"><select id='send' class="combobox" name="send_type" style="width:150px;height:22px"  disabled="disabled" 
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">客户自提</option>
							<option id="" value="1">专车送货</option>
							<option id="" value="2">送货进仓</option>
							<option id="" value="3">送货上楼</option>
							<option id="" value="4	">送货上门</option>
							
					</select> </td>				
				</tr> 
				<tr>
					<td >代收货款：</td> 
					<td >
					<input type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "  placeholder="0.00"  readonly="readonly"  name="trade_agency"  style="width:150px;  margin-right: 25px;">
					<td >回单份数：</td>
					<td class="td2"><input type="text"  name="is_recept" style="width:150px">
					</td>
					</tr>									
				<tr>
					<td >运单状态：</td>
					<td  class="td2"><select readonly="readonly" disabled="disabled" id='state'  class="combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">未出库</option>
							<option id="" value="1">配送中</option>
							<option id="" value="2">转运中</option>
							<option id="" value="3">已到达</option>
							<option id="" value="4">签收</option>
					</select> 
					</td>
					<td >制单人：</td>
					<td   colspan="3" class="td2"><input readonly="readonly"   type="text"
						editable="" name="shipping_order_name" /> 
					</td>
				<!-- 	<td >中转地：</td>
					<td  class="td2"><input readonly="readonly"   type="text"
						editable="" name="change_address" /> 
					</td> -->
				</tr> 			
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" readonly="readonly" cols="45" rows="2" name="remarks" ></textarea></td>
				</tr>
			</table>
		</fieldset>
	<input readonly="readonly" type="hidden" name="shiping_order_id">	
	</form>

	<form action="" id="signform">	
	<input readonly="readonly" type="hidden" name="order_id" id="order_id">	
	<input readonly="readonly" type="hidden" name="order_number" id="order_number">
	<input type="hidden"  name="sign_username"  id="sign_username">
		<fieldset>
			<table class="tableclass" style="display: none;" id="signtable">
				<tr>
					<td>提货人：</td>
					<td class="td2"><input  class=""  type="text"
						editable="" name="sign_user" id="sign_user" /> 
					</td>
					<td >提货代理人：</td>
					<td class="td2"><input type="text" name="sign_name" id="sign_name"/> 
					</td>
				</tr>
				<tr>
					<td >手机号：</td>
					<td class="td2"><input id="sign_userphone"
						name="sign_userphone" /> 
					</td>
				
					<tr>
					 <td style="color: blue;"><span style="color: red"></span>代理提货人证件：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input  type="text"
						editable="" name="sign_number"  id="sign_number"   class="validate[required]"/> 
					</td>
					
					<td style="color: blue;"><span style="color: red"></span>签收结果：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><select id='sign_result'  class="validate[required]"  name="sign_result"  class="combobox" name="shipping_order_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">异常签收</option>
							<option id="" value="1" selected="selected">正常签收</option>
					</select>
				</tr>
				<tr>
					<td style="color: blue;"><span style="color: red"></span>实际数量：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input  type="text"
						editable="" name="actual_number"   id="actual_number" onblur="checksj(this)"/>
					</td>
					</td>
					<td style="color: blue;"><span style="color: red"></span>缺失数量：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input  type="text"
						editable="" name="defect_number" id="defect_number"   class="validate[required[custom[number]"  onblur="checkqs(this)"/>
					</td>
				</tr>
				<tr>
					<td style="color: blue;"><span style="color: red"></span>回单份数：<font color="red" style="margin-right:10px">*</font></td>
					<td class="td2"><input  type="text"
						 class="validate[required[custom[number]"  name="copies_number" id="copies_number"  onblur="checkhd(this)"/>
					</td>
					
					<td style="color: blue;"><span style="color: red"></span>提货日期：</td>
					<td class="td2"><input  onfocus="WdatePicker({isShowWeek:true})"  class="validate[required]"  id="sign_time"
						name="sign_time" /> 
					</td>
				</tr>
				
				<tr>
					<td style="color: blue;">提货备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="sign_remarks" ></textarea></td>
				</tr>
				<tr id="trupload">
					<td>图片上传：</td>
					<td colspan="3">
						<div id="wrapper">
							<div id="container">
								头部，相册选择和格式选择

								<div id="uploader">
									<div class="queueList">
										<div id="dndArea" class="placeholder">
											<div id="filePicker"></div>
											<p>请将照片拖到这里，单次最多可选5张</p>
										</div>
									</div>
									<div class="statusBar" style="display:none;">
										<div class="progress">
											<span class="text">0%</span> <span class="percentage"></span>
										</div>
										<div class="info"></div>
										<div class="btns">
											<div id="filePicker2"></div>
											<div class="uploadBtn">开始上传</div>
										</div>
									</div>
								</div>
							</div>
						</div>  
					</td>
				</tr>
			</table>
		</fieldset>
	 </form>
		<input readonly="readonly" type="hidden"  name="creat_type" value="0" style="width:150px">
</body>
</html>
