<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="java.text.*"%>
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
<link rel="stylesheet" type="text/css" href="./css/tableCss.css">

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
		$
				.ajax({
					url : 'shipOrder.do?method=getUpdateShipOrder',
					data : {
						id : pid
					},
					success : function(data) {
						if (data.plate_number == null) {
							$("#carid").select2("val", '');
						} else {
							$("#carid").prev("div").find("span.select2-chosen")
									.text(data.plate_number);
						}
						//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
						//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
						console.log(data);
						$('#Regform').form('load', data);
						if (data.settlyf_sh == 2
								&& (Number(data.transport_pay) - Number(data.reality_sum)) == 0) {
							$("#transport_pay").attr("disabled", true);
						}
						if (data.settlgf_sh == 2
								&& (Number(data.trade_agency) - Number(data.paidgf_fu)) == 0) {
							$("#trade_agency").attr("disabled", true);
						}
						if (data.handling_shenhe == 2
								&& (Number(data.handling_charge) - Number(data.handling_shihou)) == 0) {
							$("#handling_charge").attr("disabled", true);
						}
						if (data.des_sh_stata == 2
								&& (Number(data.destination_fee) - Number(data.paid_fee)) == 0) {
							$("#destination_fee").attr("disabled", true);
						}

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
					url : "shipManual.do?method=getPlateNumberLength",
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
		if ($("#Regform").validationEngine('validate')) {
			//可提交
			$pjq.messager.confirm('修改运单', '确定要修改吗?', function(r) {
				/* 	alert($('#Regform').serialize());	 */
				if (r) {
					$.ajax({
						type : "POST",
						url : 'shipManual.do?method=updateShipManual',
						data : $('#Regform').serialize(),
						success : function(msg) {
							if (msg.flag) {
								$pjq.messager.alert('修改运单', '运单修改成功', 'info');
								$dialog.dialog('close');
								$grid.datagrid('reload');
							}
							;
						}
					});
				}
			});
		} else {
			$pjq.messager.alert('修改运单', '必填信息不可为空', 'info');
		}
	};
	function SumNum() {
		var sumValue;
		a = eval(freight_fee.value);
		b = eval(picking_fee.value);
		c = eval(insurance_fee.value);
		d = eval(adorn_fee.value);
		e = eval(inspect_fee.value);
		f = eval(seized_fee.value);
		g = eval(deliver_fee.value);
		h = eval(upstairs_fee.value);
		i = eval(receivable_ground_fee.value);
		j = eval(affirm_value.value);
		k = eval(back_fee.value);
		//l = eval(destination_fee.value);	
		m = eval(rates.value);

		if (isNaN(a)) {
			a = 0;
		}
		;
		if (isNaN(b)) {
			b = 0;
		}
		;
		if (isNaN(c)) {
			c = 0;
		}
		;
		if (isNaN(d)) {
			d = 0;
		}
		;
		if (isNaN(e)) {
			e = 0;
		}
		;
		if (isNaN(f)) {
			f = 0;
		}
		;
		if (isNaN(g)) {
			g = 0;
		}
		;
		if (isNaN(h)) {
			h = 0;
		}
		;
		if (isNaN(i)) {
			i = 0;
		}
		;
		if (isNaN(k)) {
			k = 0;
		}
		;
		//if (isNaN(l)){l=0};
		if (isNaN(j)) {
			j = 0;
		}
		;
		if (isNaN(m)) {
			m = 0;
		}
		;
		sumValue = a + b + c + d + e + f + g + h + i;
		self['transport_pay'].value = sumValue;
	}
	function rideroo(values) {
		$("#is_recept").attr("readonly", false);

	}
	function rideroo1(values) {
		$("#is_recept").attr("readonly", true);
		$("#is_recept").val('0');
	}
	function customSelectshou() {
		dialog = parent.jy.modalDialog({
			title : '选择客户',
			url : 'shipManual.do?method=getcustomSelectShou',
			width : 940,
			height : 485,

			resizable : true,
			buttons : [ {
				text : '<input type="button"  class="btncss" value="确定"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForms(
							dialog, '', parent.$);
				}
			} ]
		});
	}
	function SumNum3() {
		var sumValue;
		a = eval(freight_fee.value);
		b = eval(picking_fee.value);
		c = eval(insurance_fee.value);
		d = eval(adorn_fee.value);
		e = eval(inspect_fee.value);
		f = eval(seized_fee.value);
		g = eval(deliver_fee.value);
		h = eval(upstairs_fee.value);
		i = eval(receivable_ground_fee.value);
		j = eval(affirm_value.value);
		k = eval(back_fee.value);
		//l = eval(destination_fee.value);	
		m = eval(rates.value);
		z = eval(handling_charge.value);

		if (isNaN(a)) {
			a = 0;
		}
		;
		if (isNaN(b)) {
			b = 0;
		}
		;
		if (isNaN(c)) {
			c = 0;
		}
		;
		if (isNaN(d)) {
			d = 0;
		}
		;
		if (isNaN(e)) {
			e = 0;
		}
		;
		if (isNaN(f)) {
			f = 0;
		}
		;
		if (isNaN(g)) {
			g = 0;
		}
		;
		if (isNaN(h)) {
			h = 0;
		}
		;
		if (isNaN(i)) {
			i = 0;
		}
		;
		if (isNaN(k)) {
			k = 0;
		}
		;
		//if (isNaN(l)){l=0};
		if (isNaN(j)) {
			j = 0;
		}
		;
		if (isNaN(m)) {
			m = 0;
		}
		;
		if (isNaN(z)) {
			z = 0;
		}
		;
		sumValue = a + b + c + d + e + f + g + h + i + z;
		self['gatheringhj'].value = sumValue;
	}
	function SumNumber() {
		var sumnuber;
		var i = 0;
		a = eval(affirm_value.value);
		b = eval(trade_agency.value);
		c = eval(rates.value);
		if (isNaN(a)) {
			a = 0;
		}
		;
		if (isNaN(b)) {
			b = 0;
		}
		;
		if (isNaN(c)) {
			c = 0;
		}
		;
		sumnuber = a * c * 0.001;
		i = b * c;
		var j = sumnuber.toFixed(2);
		self['insurance_fee'].value = j;
		//self['handling_charge'].value =i;
	}
	function SumNumber1() {
		var i;
		a = eval(trade_agency.value);
		b = eval(shouxu_feelv.value);

		shouxu_feelv
		if (isNaN(a)) {
			a = 0;
		}
		;
		if (isNaN(b)) {
			b = 0;
		}
		;
		i = b * 0.001 * a;
		var j = i.toFixed(2);

		self['handling_charge'].value = j;
	}
	function SumNum2() {
		var i;
		a = eval(destination_fee.value);
		b = eval(transport_pay.value);

		if (isNaN(a)) {
			a = 0;
		}
		;
		if (isNaN(b)) {
			b = 0;
		}
		;
		if (a != null && a != "") {
			i = a - b;
			self['back_fee'].value = i;
		} else {
			i = 0.00;
			self['back_fee'].value = i;
		}
		/* i = a-b;
		self['back_fee'].value =i; */
	}
</script>
<body>

	<form action="" method="post" id="Regform">
		<input type="hidden" name="shiping_order_id">
		<input
			type="hidden" id="courid" name="courid" />
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
						id="" name="weituo_time" /></td>
					<td class="td3">委托单号:</td>
					<td colspan="2" class="td5"><input type="text"
						id="weitoudanhao" name="weitoudanhao"></td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>交接方式：</td>
					<td class="td5"><select id='send' class="combobox"
						name="send_type"
						data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">客户自提</option>
							<option id="" value="1">专车送货</option>
							<option id="" value="2">送货进仓</option>
							<option id="" value="3">送货上楼</option>
							<option id="" value="4">送货上门</option>
					</select></td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>运单号:</td>
					<td colspan="2" class="td5"><input type="text"
						class="validate[required]" id="num" name="shiping_order_num"
						readonly="readonly"></td>

					<td colspan="4"></td>
				</tr>

				<tr>
					<th colspan="14"><b>发货人</b>
					</th>
				</tr>
				<tr>
					<td  class="td3">单位名称:</td>
					<td colspan="2" class="td5"><input type="text" id=""
						name="fhdanweiname">
					</td>
					<td  class="td3"><font color="red" style="margin-right:5px">*</font>发货人名称:</td>
					<td class="td5"><input type="text" id="custom_name"
						name="custom_name" class="validate[required]"></td>
					<td><a class="easyui-linkbutton" onclick="customSelect()"
						data-options="iconCls:'icon-search'">查询</a></td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>发货人电话:</td>
					<td colspan="2" class="td5"><input type="text"
						class="validate[required]" id="send_phone" name="send_phone">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>发货人手机:</td>
					<td colspan="2" class="td5"><input type="text"
						id="send_shouji" name="send_shouji" class="validate[required]">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>发站:</td>
					<td class="td5"><input type="text" class="validate[required]"
						id="send_station" name="send_station"></td>

				</tr>
				<tr>
					<td colspan="2" class="td3">发货详细地址：</td>
					<td colspan="6" class="td6"><textarea cols="60" rows="2"
							 id="fahuo_address" name="fahuo_address"></textarea>
					</td>
					<td colspan="6"></td>
				</tr>
				<tr>
					<th colspan="14"><b>收货人</b>
					</th>
				</tr>
				<tr>
					<td colspan="2" class="td3">单位名称:</td>
					<td class="td5"><input type="text" id="" name="shdanweiname">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人名称：</td>
					<td class="td5"><input type="text" class="validate[required]"
						id="receipt" name="receipt"></td>
					<td><a class="easyui-linkbutton" onclick="customSelectshou()"
						data-options="iconCls:'icon-search'">查询</a></td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人电话：</td>
					<td colspan="2" class="td5"><input type="text"
						class="validate[required]" id="receipt_tel" name="receipt_tel">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人手机：</td>
					<td colspan="2" class="td5"><input type="text"
						id="receipt_phone" name="receipt_phone"
						class="validate[custom[number],[required]]"></td>
					<td class="td4" class="td3"><font color="red" style="margin-right:5px">*</font>到站:</td>
					<td class="td5"><input type="text" class="validate[required]"
						id="" name="end_address"></td>
				</tr>
				<tr>
					<td colspan="2" class="td3">收货详细地址：</td>
					<td colspan="6" class="td6"><textarea cols="60" rows="2"
							id="receipt_address" name="receipt_address"></textarea></td>
					<td colspan="6"></td>
				</tr>
				<tr>
					<!-- <th colspan="4">运单基本信息</th> 
				</tr> -->
				<tr>
					<td class="td3"><font color="red"
						style="margin-right:5px">*</font>货品名称</td>
					<td class="td3">包装</td>
					<td class="td3"><font color="red"
						style="margin-right:5px">*</font>总件数</td>
					<td class="td3"><font color="red"
						style="margin-right:5px">*</font>总重量(公斤)</td>
					<td class="td3"><font color="red"
						style="margin-right:5px">*</font>总体积(立方米)</td>
					<td class="td3"><font color="red"
						style="margin-right:5px">*</font>运费</td>
					<td class="td3">提货费</td>
					<td class="td3">装卸费</td>
					<td class="td3">上楼费</td>
					<td class="td3">直送费</td>
					<td class="td3">理货费</td>
					<td class="td3">开箱验货费</td>
					<td class="td3">其他费</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>付费方式：</td>



				</tr>
				<tr>
					<td class="td5"><input type="text" name="goods_name"
						class="validate[required]" />
					</td>
					<td class="td5">
						<!-- <input  type="text" name="goods_packing"/> --> <select
						id='text' class="combobox" name="goods_packing"
						data-options="panelHeight : 'auto',editable:false">
							<option>纸箱</option>
							<option>编织袋</option>
							<option>木箱</option>
							<option>无</option>

					</select></td>
					<td class="td5"><input type="text" type="text"
						class="validate[custom[integer],min[0],required]" placeholder="0"
						name="goods_num" />
					</td>
					<td class="td5"><input type="text" type="text"
						class="validate[,custom[number],min[0],required]"
						placeholder="0.0000" name="goods_weight" />
					</td>
					<td class="td5"><input type="text" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],required]"
						placeholder="0.0000" name="goods_vol" />
					</td>
					<td class="td5"><input id="freight_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd],required]"
						placeholder="0.00" name="freight_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="picking_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="picking_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="receivable_ground_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="receivable_ground_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="upstairs_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="upstairs_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="deliver_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="deliver_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="seized_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="seized_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="inspect_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="inspect_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="adorn_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="adorn_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><select id='type' class="combobox"
						name="pay_type" data-options="panelHeight : 'auto',editable:false">
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
					<td class="td3">投保价值</td>
					<td class="td3">费率</td>
					<td class="td3">保价费</td>
					<td class="td3">代收货款</td>
					<td class="td3">费率</td>
					<td class="td3">手续费</td>
					<td class="td3">手续费付款方式</td>
					<td colspan="2" class="td3">到货时间</td>
					<!--  <td class="td3">代收运费</td>	
					<td class="td3">运费总额</td>					
					<td class="td3">返款</td>
				    <td>付款方式</td> -->
					<td class="td3">是否发票</td>
					<!--  <td  rowspan="2" colspan="4"></td> -->
					<td id="" class="td3">是否控货：</td>
					<td class="td3">是否回单：</td>
					<td id="is_recept_id" class="td3">回单份数：</td>
					<td id="" class="td3">是否急货：</td>
				</tr>
				<tr>
					<td class="td5"><input id="affirm_value" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="affirm_value"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber();SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="rates" type="text"
						class="validate[custom[number],max[99999.99],min[0.000],custom[dd]]"
						style="width: 50px" value="5" name="rates"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber();SumNum();SumNum2();SumNum3();" /><font
						style="size: 15">‰</font>
					</td>
					<td class="td5"><input id="insurance_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="insurance_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();"
						readonly="readonly" /></td>
					<td class="td5"><input type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "
						placeholder="0.00" name="trade_agency" id="trade_agency"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber1();SumNum2();SumNum3();">
					</td>
					<td class="td5"><input type="text"
						class="validate[custom[number],max[99999.99],min[0.000],custom[dd]] "
						value="5" id="shouxu_feelv" style="width: 50px"
						name="shouxu_feelv"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber1();SumNum2();SumNum3();" />‰
					</td>
					<td class="td5"><input type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "
						placeholder="0.00" id="handling_charge" name="handling_charge"
						readonly="readonly" /></td>
					<td class="td5"><select id='type' class="combobox"
						name="trade_agency_stata"
						data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现付</option>
							<option id="" value="1">到付</option>
					</select></td>
					<td colspan="2" class="td5"><input class="Wdate"
						onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						id="" name="daohuo_time" /></td>

					<!--  <td class="td5"><input id="destination_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="destination_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();"/></td>						   			   
                    
				    <td  class="td5"><input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="transport_pay"	name="transport_pay" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();"/> 				   
					<td class="td5"><input id="back_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="back_fee"/></td>						   			
				    <td class="td5">
                        <select id='type' class="combobox" name="fankuan_stata"  data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现反</option>
							<option id="" value="1">到反</option>
					    </select>
                    </td> -->
					<td class="td5"><select id='state' class="combobox"
						name="invoice_state"
						data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">是</option>
							<option id="" value="1">否</option>

					</select></td>
					<td colspan=""><input type="radio" name="konghuo" value="1"
						style="width:15px">&nbsp;是 <input type="radio"
						name="konghuo" value="0" style="width:15px" checked="true">&nbsp;否
					</td>
					<td colspan=""><input type="radio" name="is_recept_no"
						value="1" style="width:15px" onclick="rideroo(this)">&nbsp;是
						<input type="radio" name="is_recept_no" value="0"
						style="width:15px" onclick="rideroo1(this)">&nbsp;否</td>
					<td class="td5"><input type="text" value="0" id="is_recept"
						name="is_recept" readonly="readonly"></td>
					<td class="td" colspan=""><input type="radio"
						name="most_urgent" value="1" style="width:15px">&nbsp;是 <input
						type="radio" name="most_urgent" value="0" style="width:15px"
						checked="true">&nbsp;否</td>
				</tr>
				<tr>
					<td class="td3">代收运费</td>
					<td class="td3">运费总额</td>
					<td class="td3">返款</td>
					<td class="td3">返款方式</td>
					<td class="td3">收款合计</td>
					<!--  <td  rowspan="2" colspan="9"></td> -->
					<td colspan="7" class="td3">备注:</td>
					<td colspan="2" class="td3">运单打印：</td>

				</tr>
				<tr>
					<td class="td5"><input id="destination_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="destination_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();" />
					</td>

					<td class="td5"><input placeholder="0.00"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						type="text" id="transport_pay" name="transport_pay"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();"
						readonly="readonly" />
					<td class="td5"><input id="back_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="back_fee" readonly="readonly" />
					</td>
					<td class="td5"><select id='type' class="combobox"
						name="fankuan_stata"
						data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现返</option>
							<option id="" value="1">到返</option>
					</select></td>
					<td class="td5"><input placeholder="0.00"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						type="text" id="gatheringhj" name="gatheringhj"
						onkeyup="value=value.replace(/[^\d\.]/g,'');" readonly="readonly" />
					</td>
					<td colspan="7" class="td6"><textarea class="easyui-textarea"
							cols="45" rows="2" name="remarks"></textarea></td>
					<td class="td" colspan="2"><input type="checkbox"
						name="printed" value="1" style="width:15px">机打运单 &nbsp; <input
						type="checkbox" name="printed" value="0" style="width:15px">机打标签
					</td>
				</tr>
				<tr>
					<td class="td3">受理网点:</td>
					<td colspan="2" class="td5"><input type="text"
						id="shouliwangdian" name="shouliwangdian" /></td>
					<td class="td3">制单人</td>
					<td colspan="2" class="td5"><input type="text" id="user"
						name="shipping_order_name" /></td>
					<td class="td3">包装人</td>
					<td colspan="2" class="td5"><input type="text" id=""
						name="baozhuang_name" /></td>
					<td class="td3">业务员</td>
					<td colspan="2" class="td5"><input type="text" id=""
						name="yewuyuan" /></td>
					<td colspan="2"></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
