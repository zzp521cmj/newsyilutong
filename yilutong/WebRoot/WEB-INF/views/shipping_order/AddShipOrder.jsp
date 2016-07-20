·<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>添加运单信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/tableCss.css">

<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>

</head>
<%
	User user = (User) request.getSession().getAttribute(
			SessionInfo.SessionName);
	String flg = (String) request.getAttribute("flg");
%>
<script type="text/javascript">
	$(function(){
	 getNowFormatDate();
	var $target = $('input,textarea,select');
		 $target.bind('keydown', function (e) {
            var key = e.which;
            if (key == 13) {
                e.preventDefault();
                var nxtIdx = $target.index(this) + 1;
                    $target.eq(nxtIdx).focus();
            }
        });
		 $("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "shipOrder.do?method=getPlateNumberLength",
				   data: {number:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});;
					});
			        query.callback(data);
				   }
				});
		    }
		});	 		 
 		 $("#user").val('<%=user.getUsername()%>');
 		 $("#cid").val('<%=flg%>');
	});
	//   		function saveDriver(){
	//   			var myform=document.forms[0];
	//   			myform.action="driver.do?method=saveDriver";
	//   			myform.submit();
	//   		}
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		var num = $.trim($("#num").val());
		$.ajax({
			type : "POST",
			url : 'shipOrder.do?method=getNumber',
			data : {
				number : num
			},
			success : function(data) {
				///	alert(data.shiping_order_num==null)
				if (data.shiping_order_num != null) {
					$pjq.messager.alert('新增运单', '此运单号已经存在', 'info');
				} else {

					if ($("#Regform").validationEngine('validate')) {
						//可提交
						$pjq.messager.confirm('新增运单', '确定要新增吗?', function(r) {
							if (r) {
								$.ajax({
									type : "POST",
									url : 'shipOrder.do?method=saveShipOrder',
									data : $('#Regform').serialize(),
									success : function(msg) {
										if (msg.flag) {
											$pjq.messager.alert('新增运单',
													'运单添加成功', 'info');
											$dialog.dialog('close');
											$grid.datagrid('reload');
										}
										;
									}
								});
							}
						});
					} else {
						$pjq.messager.alert('新增运单', '必填信息不可为空', 'info');
					}
				}
			}
		});

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
		};
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
		};
		;
		sumValue = a + b + c + d + e + f + g + h + i;
		self['transport_pay'].value = sumValue;
	}
	function rideroo(values) {
		$("#is_recept").attr("readonly", false);
	}
	function rideroo1(values) {
		$("#is_recept").attr("readonly", true);
		$("#is_recept").val("0");
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
		var j = sumnuber.toFixed(2);
		i = b * c;
		self['insurance_fee'].value = j;
		//self['handling_charge'].value =i;
	}
	function SumNumber1() {
		var i;
		a = eval(trade_agency.value);
		b = eval(shouxu_feelv.value);

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

	}
	function getNowFormatDate() {
		var date = new Date();
		var seperator1 = "-";
		var seperator2 = ":";
		var month = date.getMonth() + 1;
		var strDate = date.getDate();
		if (month >= 1 && month <= 9) {
			month = "0" + month;
		}
		if (strDate >= 0 && strDate <= 9) {
			strDate = "0" + strDate;
		}
		var currentdate = date.getFullYear() + seperator1 + month + seperator1
				+ strDate + " " + date.getHours() + seperator2
				+ date.getMinutes() + seperator2 + date.getSeconds();
		$("#weituo_time").val(currentdate);
		return currentdate;
	}
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
					<%-- <%
                String data2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
                %> --%>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>委托时间:</td>
					<td colspan="2" class="td5"><input
						class="Wdate validate[required]"
						<%-- value="<%=data2%>"  --%>onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						id="weituo_time" name="weituo_time" /></td>
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
						class="validate[required]" id="num" name="shiping_order_num">
					</td>

					<td colspan="4"></td>
				</tr>

				<tr>
					<th colspan="14"><b>发货人</b>
					</th>
				</tr>
				<tr>
					<td class="td3">单位名称:</td>
					<td colspan="2" class="td5"><input type="text"
						id="fhdanweiname" name="fhdanweiname">
					</td>
					<!-- 				 	<td ><font color="red" style="margin-right:5px">*</font>发货联系人:</td>
					<td colspan="2" class="td5">
					    <input type="text"  id="custom_name" name="custom_name">
					<input type="hidden"  id="cname" name="custom_name">
					</td>	 -->
					<td class="td3"><font color="red" style="margin-right:5px">*</font>发货人电话:</td>
					<td colspan="2" class="td5"><input type="text"
						class="validate[required]" id="send_phone" name="send_phone">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>发货人手机:</td>
					<td colspan="2" class="td5"><input type="text"
						class="validate[required]" id="send_shouji" name="send_shouji">
					</td>
					<!-- 					<td><font color="red" style="margin-right:5px">*</font>发站:</td>
					<td class="td5"><input type="text"  class="validate[required]" id=""
						name="send_station">			
				    </td>
 					 -->
					<td colspan="5"></td>
				</tr>
				<tr>
					<td colspan="2" class="td3">发货详细地址：</td>
					<td colspan="6" class="td6"><textarea cols="60" rows="2"
						 name="fahuo_address"></textarea></td>
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
					<td colspan="2" class="td5"><input type="text"
						class="validate[required]" id="receipt" name="receipt">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人电话：</td>
					<td colspan="2" class="td5"><input type="text"
						class="validate[custom[number],[required]]" id="receipt_tel"
						name="receipt_tel">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>收货人手机：</td>
					<td colspan="2" class="td5"><input type="text"
						id="receipt_phone" name="receipt_phone" class="validate[required]">
					</td>
					<td class="td3"><font color="red" style="margin-right:5px">*</font>到站:</td>
					<td class="td5"><input type="text" class="validate[required]"
						id="" name="end_address"></td>
				</tr>
				<tr>
					<td colspan="2" class="td3">收货详细地址：</td>
					<td colspan="6" class="td6"><textarea cols="60" rows="2"
							name="receipt_address"></textarea></td>
					<td colspan="6"></td>
				</tr>
				<tr>
					<!-- <th colspan="4">运单基本信息</th> 
				</tr> -->
				<tr>
					<td  class="td3"><font color="red"
						style="margin-right:5px">*</font>货品名称</td>
					<td  class="td3">包装</td>
					<td  class="td3"><font color="red"
						style="margin-right:5px">*</font>总件数</td>
					<td  class="td3"><font color="red"
						style="margin-right:5px">*</font>总重量(公斤)</td>
					<td  class="td3"><font color="red"
						style="margin-right:5px">*</font>总体积(立方米)</td>
					<td  class="td3"><font color="red"
						style="margin-right:5px">*</font>运费</td>
					<td  class="td3">提货费</td>
					<td  class="td3">装卸费</td>
					<td  class="td3">上楼费</td>
					<td  class="td3">直送费</td>
					<td  class="td3">理货费</td>
					<td  class="td3">开箱验货费</td>
					<td  class="td3">其他费</td>
					<td class="td3">其他费><font color="red" style="margin-right:5px">*</font>付费方式：</td>



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
						placeholder="0.00" name="goods_weight" />
					</td>
					<td class="td5"><input type="text" type="text"
						class="validate[custom[number],max[99999.99],min[0.0000],required]"
						placeholder="0.00" name="goods_vol" />
					</td>
					<td class="td5"><input id="freight_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd],required]"
						placeholder="0.00" value="0.00" name="freight_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="picking_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" value="0.00" name="picking_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="receivable_ground_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" value="0.00" name="receivable_ground_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="upstairs_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" value="0.00" name="upstairs_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="deliver_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" value="0.00" name="deliver_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="seized_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" value="0.00" name="seized_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="inspect_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" value="0.00" name="inspect_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();SumNum3();" />
					</td>
					<td class="td5"><input id="adorn_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" value="0.00" name="adorn_fee"
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
					<td  class="td3">投保价值</td>
					<td  class="td3">费率</td>
					<td  class="td3">保价费</td>
					<td  class="td3">代收货款</td>
					<td  class="td3">费率</td>
					<td  class="td3">手续费</td>
					<td  class="td3">手续费付款方式</td>
					<td colspan="2" class="td3">到货时间</td>
					<!--  <td  class="td3">代收运费</td>	
					<td  class="td3">运费总额</td>					
					<td  class="td3">返款</td>
				    <td>付款方式</td> -->
					<td class="td3">是否发票</td>
					<!--  <td  rowspan="2"  colspan="4" ></td> -->
					<td id="" class="td3">是否控货：</td>
					<td class="td3">是否回单：</td>
					<td id="is_recept_id" class="td3">回单份数：</td>
					<td id="" class="td3">是否急货：</td>

				</tr>
				<tr>
					<td class="td5"><input id="affirm_value" type="text"
						value="0.00"
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
						placeholder="0.00" value="0.00" readonly="readonly"
						name="insurance_fee"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();SumNum2();" />
					</td>
					<td class="td5"><input type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "
						placeholder="0.00" value="0.00" name="trade_agency"
						id="trade_agency"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber1();SumNum3();">
					</td>
					<td class="td5"><input type="text"
						class="validate[custom[number],max[99999.99],min[0.000],custom[dd]] "
						value="5" id="shouxu_feelv" style="width: 50px"
						name="shouxu_feelv"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber1();SumNum3();" />‰
					</td>
					<td class="td5"><input type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "
						placeholder="0.00" id="handling_charge" value="0.00"
						name="handling_charge" readonly="readonly" /></td>
					<td class="td5"><select id='type' class="combobox"
						name="trade_agency_stata"
						data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现付</option>
							<option id="" value="1">到付</option>
					</select></td>
					<td colspan="2" class="td5"><input class="Wdate"
						onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
						id="" name="daohuo_time" /></td>

					<!-- <td class="td5"><input id="destination_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="destination_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();"/></td>						   			   
                    
				    <td  class="td5"><input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="transport_pay"	name="transport_pay" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();"/> 				   
					<td class="td5"><input id="back_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="back_fee"/></td>						   			
				    <td class="td5">
                        <select id='type' class="combobox" name="fankuan_stata"  data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现反</option>
							<option id="" value="1">欠反</option>
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
						style="width:15px" onclick="rideroo1(this)" checked="true">&nbsp;否
					</td>
					<td class="td5"><input type="text" value="0" id="is_recept"
						name="is_recept" readonly="readonly"></td>
					<td class="td" colspan=""><input type="radio"
						name="most_urgent" value="1" style="width:15px">&nbsp;是 <input
						type="radio" name="most_urgent" value="0" style="width:15px"
						checked="true">&nbsp;否</td>
				</tr>
				<tr>
					<td  class="td3">代收运费</td>
					<td  class="td3">运费总额</td>
					<td  class="td3">返款</td>
					<td class="td3">返款方式</td>
					<td class="td3">收款合计</td>
					<!--  <td  rowspan="2" colspan="9"></td>	 -->
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
						readonly="readonly"
						onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum2();" />
					<td class="td5"><input id="back_fee" type="text"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						placeholder="0.00" name="back_fee" />
					</td>
					<td class="td5"><select id='type' class="combobox"
						name="fankuan_stata"
						data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现返</option>
							<option id="" value="1">欠返</option>
					</select></td>
					<td class="td5"><input placeholder="0.00"
						class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"
						type="text" id="gatheringhj" readonly="readonly"
						name="gatheringhj" onkeyup="value=value.replace(/[^\d\.]/g,'');" />
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
				<!-- <tr>
					
					
                    <td >开发票：</td>
					<td  class="td2"><select id='state'  class="combobox" name="invoice_state" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">是</option>
							<option id="" value="1">否</option>

					</select> 
					</td>
               
                </tr>  -->
				<!--  <tr>
					<td ><font color="red" style="margin-right:10px">*</font>运输方式：</td>
					<td class="td2">
					<select id='check' class="combobox" name="transport_mode" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">普快</option>
							<option id="" value="1">特快</option>
					</select></td> 
					
				</tr>
				<tr>
				    <td >要回单：</td>
					<td class="td2">
					    <input type="radio"  name="is_recept_no" value="1" style="width:15px" onclick="rideroo(this)">&nbsp;是 &nbsp;&nbsp;
					    <input type="radio"  name="is_recept_no" value="0" style="width:15px" onclick="rideroo1(this)" checked  = "true">&nbsp;否
					</td>
				   <td id="">急货：</td>
					<td class="td2">
	                    <input type="radio"  name="most_urgent" value="1" style="width:15px" >&nbsp;是 &nbsp;&nbsp;
					    <input type="radio"  name="most_urgent" value="0" style="width:15px" checked = "true">&nbsp;否
					</td>					
				</tr>
				<tr>
	
				    <td id="is_recept_id">回单份数：</td>
					<td class="td2"><input type="text" value="0" id="is_recept"  name="is_recept" style="width:150px" disabled = "true">
					</td>				    
				    <td >运单打印：</td> 
				    <td class="td2">
				        <input type="checkbox"  name="printed" value="1" style="width:15px" >&nbsp;机打运单  
					    <input type="checkbox"  name="printed" value="0" style="width:15px" >&nbsp;机打标签
					</td>
				</tr>
				<tr>
					<th colspan="4">计费标准</th>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>运费：</td>
					<td class="td2">
					<input id="take_fee" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="take_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					<input id="freight_fee" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd],required]" placeholder="0.00"  name="freight_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					
					
					<td >提货费：</td>
					<td class="td2"><input id="picking_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="picking_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();" />
					<input id="send_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" name="send_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();" /></td>
				
				</tr>
				<tr>
					<td >投保价值：</td>
					<td class="td2">
					<input id="affirm_value" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="affirm_value" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber();"/></td>
					
					<td >费率：</td>
					<td class="td2"><input id="rates"  type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  value="0.05%"  name="rates" disabled="disabled"/></td>
				
					<input id="change_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="change_fee" /></td>
				</tr> 
				<tr>
					<td >保价费：</td>
					<td class="td2">
					<input id="insurance_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="insurance_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
					
					<td >其他费：</td>
					<td class="td2"><input id="adorn_fee"  type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00"  name="adorn_fee" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNum();"/></td>
				
					<input id="change_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="change_fee" /></td>
				</tr> 
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
					<td >代收货款：</td> 
					<td >
					    <input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "  placeholder="0.00"  name="trade_agency" id="trade_agency"  style="width:150px" onkeyup="value=value.replace(/[^\d\.]/g,'');SumNumber1();">
                    </td>
                    <td>付款方式：</td>
                    <td class="td2">
                        <select id='type' class="combobox" name="trade_agency_stata" style="width:150px;height:22px" data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现付</option>
							<option id="" value="1">到付</option>
					    </select>
                    </td>
				</tr>				
				<tr>
				   <td >手续费：</td> 
				   <td class="td2">
					    <input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "  placeholder="0.00" id="handling_charge"  name="handling_charge"  style="width:150px">
				   </td> 
				   <td >到货时间：</td> 
				   <td class="td2">代收货款：</td>  
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
					<td >应收备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks_fee"></textarea></td>
				</tr>				
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks"></textarea>
					-->

				<!-- 		</td>
				</tr>  -->
			</table>
		</fieldset>
		<input type="hidden" name="creat_type" value="4" style="width:150px">
		<input type="hidden" id="cid" name="custom_id" />
	</form>
</body>
</html>
