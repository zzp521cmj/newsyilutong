<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>添加订单信息</title>
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
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
</head>
 <%
  	User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
  	String flg = (String) request.getAttribute("flg");
   %>
<script type="text/javascript">
	$(function(){
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
		var num=$.trim($("#num").val());
		$.ajax({
					type : "POST",
					url : 'shipOrder.do?method=getNumber',
					data : {
					number:num },
					success : function(data){
				///	alert(data.shiping_order_num==null)
						if(data.shiping_order_num!=null){
						 $pjq.messager.alert('新增订单', '此订单号已经存在', 'info');
						}else{
							
							if($("#Regform").validationEngine('validate')){		
	  			//可提交
				$pjq.messager.confirm('新增订单','确定要新增吗?',function(r){   
	    		if (r){    
					$.ajax({
					type: "POST",
		  			url:'shipOrder.do?method=saveShipOrder',
		  			data:$('#Regform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增订单','订单添加成功','info'); 
									   $dialog.dialog('close');
									   $grid.datagrid('reload');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('新增订单', '必填信息不可为空', 'info');
			  }
						}
					}
				});
		
	};

	/* document.onkeydown= function(e) { e=e||window.event;
                                  kc=e.keyCode||e.charCode;
                                if ((kc == 83&&e.ctrlKey)) {
                                alert('^s');
                            }
                        }
	 */
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
				 <td ><font color="red" style="margin-right:10px">*</font>订单号:</td>
					<td  class="td2"><input type="text" class="validate[required]" id="num"
						name="shiping_order_num"></td>
					<!-- <td ><font color="red" style="margin-right:10px">*</font>起运地:</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="start_address"></td>
				</tr>
				<tr> -->
					<td ><font color="red" style="margin-right:10px">*</font>到站:</td>
					<td   class="td2"><input type="text"  class="validate[required]" id=""
						name="end_address"></td>
				
				<!-- 	<td ><font color="red" style="margin-right:10px">*</font>创建时间:</td>
					<td  class="td2"><input  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id=""
						name="check_time" />
					</td> -->
					<!--  <td>性别:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="gender" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="">请选择</option>
							<option  value="0">男</option>
							<option  value="1">女</option>
					</select></td> -->  
				</tr>
				<!-- <tr>
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
				</tr> -->
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货方：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="receipt"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="receipt_tel"></td>
						</tr>
				<!-- <tr>
					<td >手机：</td>	
					<td  colspan="3"class="td2"><input type="text"  class="validate[custom[phone],custom[number]]" id=""
						name="receipt_phone"></td>
				</tr> -->
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货地址/单位：</td>	
					<td colspan="3" class="td2">
					<textarea cols="45" rows="2" class="validate[required]" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>品名：</td>
					<td class="td2"><input   type="text" class="validate[required]" name="goods_name" /></td>
					<td  ><font color="red" style="margin-right:10px">*</font>包装：</td>
					<td  class="td2"><input  type="text"   class="validate[required]" name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总件数：</td>
					<td  class="td2"><input  type="text" class="validate[custom[integer],required,min[0]]" placeholder="0"  value="0" name="goods_num" /></td>
					<td ><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number],min[0]]" placeholder="0.0000"  value="0.0000"  name="goods_weight" /></td>	
				</tr>
				
			<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
					<td  class="td2"><input type="text"  class="validate[required,custom[number],max[99999.9999],min[0.0000]]"   placeholder="0.0000"  value="0.0000" name="goods_vol" /></td>
			<!-- 	</tr> 
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>发货方式：</td>
					<td class="td2">
					<select id='check' class="combobox" name="check_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">发货人门点</option>
							<option id="" value="1">起运货运站</option>
					</select></td> -->
					<td ><font color="red" style="margin-right:10px">*</font>提货方式：</td>
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
					<td class="td2"><input id="take_pay" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" value="0.00" name="take_fee" /></td>
					<td >配送费：</td>
					<td class="td2"><input id="send_pay" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" value="0.00" name="send_fee" /></td>
				</tr>
				<tr>
					<td >应收其他费：</td>
					<td class="td2"><input id="adorn_fee"  type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00" value="0.00" name="adorn_fee" /></td>
					<td >应收中转费：</td>
					<td  class="td2"><input id="trunk_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  value="0.00"name="trunk_fee" /></td>
				</tr> 
				<tr>
					<!-- <input id="take_pay" type="hidden"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"   value="0.00" name="take_fee" />
					<input id="send_pay" type="hidden"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00" value="0.00" name="send_fee" />
					<input id="adorn_fee"  type="hidden"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00" value="0.00" name="adorn_fee" />
					<input id="trunk_fee" type="hidden"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"  value="0.00"name="trunk_fee" />
					<input type="hidden"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  value="0.00"  name="insurance" /> 
					 <td >保险费：</td>
					<td  class="td2"><input type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  value="0.00"  name="insurance" /></td>  -->
					<td><font color="red" style="margin-right:10px">*</font>付费方式：</td>
					<td class="td2"><select id='type' class="combobox" name="pay_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">回付</option>
							<option id="" value="1">现付</option>
							<option id="" value="2">到付</option>
							<option id="" value="3">货到前付</option>
					</select></td>
					<td ><font color="red" style="margin-right:10px">*</font>运费总额：</td>
					<td  class="td2"><input    placeholder="0.00" value="0.00" class="validate[required,custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text"
						editable="" name="transport_pay" /> 
					</td>
				</tr> 
				<tr>
					<td >代收货款：</td> 
					<td >
					<input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] "  placeholder="0.00"  value="0.00" name="trade_agency"  style="width:150px">
						<input   type="hidden"  id="user" editable="" name="shipping_order" /> 
						<input   type="hidden"  id="cid"	editable="" name="custom_id" /> 
						<td>回单：</td>
					<td class="td2">
						<input type="text"  id='' name="is_recept" />
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
			 	<td >订单状态：</td>
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
				<!-- <tr>
				<td >制单人：</td>
					<td   colspan="3" class="td2"><input   type="text"
						editable="" name="shipping_order" /> 
					</td>
				</tr> -->
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks"></textarea></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
