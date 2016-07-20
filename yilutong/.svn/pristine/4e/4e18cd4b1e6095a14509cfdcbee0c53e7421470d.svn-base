<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>修改单票信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  
  </head>
  <%String flg = (String) request.getAttribute("flg"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		var pid='<%=flg%>';
		$.ajax({
			url : 'incomedp.do?method=getUpdateIncome',
			data : {
				id : pid
			},
			success : function(data) {
			 if(data.car_number==null){
				data.car_number='';
				}	
				//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
				//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
				$("#carid").prev("div").find("span.select2-chosen").text(data.car_number); 
				$('#Regform').form('load', data);
			}
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
				   url: "incomedp.do?method=getPlateNumber",
				   data: {phones:query.term},   //传递你输入框中的值
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
		}).on("select2-selecting", function(f) {
			$("#car").val(f.object.id);
			$("#carnum").val(f.object.text);				
		});	 		  	
  	}); 		
  var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
	  			//可提交
		$pjq.messager.confirm('修改总汇', '确定要修改吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'incomedp.do?method=updateIncome',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('修改总汇', '总汇信息修改成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		} else{
			    $pjq.messager.alert('修改单票', '必填信息不可为空', 'info');
			  }
	};
  </script>
  <body class="easyui-layout">
    <form action="" method="post" id="Regform">
  <div region="west" border="true" split="true">
    	
					<table class="tableclass">
						<tr>
							<th colspan="4">基本信息</th>
						</tr>
						<tr>
						
							<td><font color="red" style="margin-right:10px">*</font>订单号:</td>
							<td class="td2"><input type="text"  readonly="true"
								class="validate[required]" id="num" name="shiping_order_num">
							</td>
							<td><font color="red" style="margin-right:10px">*</font>到站:</td>
							<td class="td2"><input type="text"
								class="validate[required]" id="" name="end_address">
							</td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>收货人:</td>
							<td class="td2"><input type="text"
								class="validate[required]" id="" name="receipt">
							</td>
							<td><font color="red" style="margin-right:10px">*</font>品名:</td>
							<td class="td2"><input type="text"
								class="validate[required]" id="" name="goods_name">
							</td>
							<input type="hidden" name="tatal_id" /> 
							<input type="hidden" name="shiping_order_id" /> 
							</td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>发货地址/单位：</td>
							<td colspan="3" class="td2"><textarea cols="45" rows="2"
									class="validate[required]" name="start_address"></textarea></td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>总件数：</td>
							<td class="td2"><input type="text"
								class="validate[custom[integer],required,min[0],max[99999]]"
								placeholder="0" value="0" name="goods_num" />
							</td>
							<td><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
							<td class="td2"><input type="text"
								class="validate[required,custom[number],min[0],max[99999]]"
								placeholder="0.0000" value="0.0000" name="goods_weight" />
							</td>
						</tr>
						<tr>
							<td><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
							<td colspan="3" class="td2"><input type="text"
								class="validate[required,custom[number],min[0],max[99999]]" value="0.0000"
								placeholder="0.0000" name="goods_vol" />
							</td>
						</tr>
						<tr>
						<td >车牌号:</td>
					<td   class="td2"><input class="search-text"  id="carid" type="hidden" >
					<input class="search-text" type="hidden" id="car"  name="car_id" >
					<input type="hidden" class="validate[required] search-text" id="carnum"
						name="car_number" style="width:150px"></td>
							<td>交接方式：</td>
							<td class="td2"><select id='send' class="combobox"
								name="send_type" style="width:150px;height:22px"
								data-options="panelHeight : 'auto',editable:false">
									<option id="" value="0">自提</option>
									<option id="" value="1">送货</option>
							</select></td>
						</tr>
							<tr>
							<td ><font color="red" style="margin-right:10px">*</font>收款日期:</td>
					<td  class="td2"><input  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true})" id=""
						name="income_time" />
						</tr>
						<tr>
							<th colspan="4">计费标准</th>
						</tr>
						<tr>
							<td>代收运费：</td>
							<td class="td2"><input id="trade_total" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="trade_total" />
							</td>
							<td>落地费：</td>
							<td class="td2"><input id="land_total" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="land_total" />
							</td>
						</tr>
						<tr>
							<td>实收运费：</td>
							<td class="td2"><input id="trade_real" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="trade_real" />
							</td>
							<td>中转费：</td>
							<td class="td2"><input id="send_pay" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="change_total" />
							</td>
						</tr>
						<tr>
						<td>送货费：</td>
							<td class="td2"><input id="gain_send" type="text"
								class="validate[custom[number],min[0]max[99999]]" placeholder="0.00"
								value="0.00" name="sends_fee" />
							</td>
							<td><font color="red" style="margin-right:10px">*</font>付费方式：</td>
							<td class="td2"><select id='type' class="combobox"
								name="pay_type" style="width:150px;height:22px"
								data-options="panelHeight : 'auto',editable:false">
								<option id="" value="0">到付</option>
							<option id="" value="1">回付</option>
							<option id="" value="2">月结</option>
							<option id="" value="3">等通知</option>
							<option id="" value="4">打卡</option>

							</select>
							</td>
						</tr>
						<tr>
							<td>送货费小车：</td>
							<td class="td2"><input id="send_car" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="send_car" />
							</td>
							<td>中转单位：</td>
							<td class="td2"><input type="text" editable=""
								name="change_address" /></td>
						</tr>
						<td>中转费(公司)：</td>
							<td class="td2"><input id="send_pay" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="changes_pay" />
							</td>
							<td>装卸费：</td>
							<td class="td2"><input id="adorns_fee" type="text"
								class="validate[custom[number],min[0],max[99999],custom[dd]]" placeholder="0.00"
								value="0.00" name="adorns_fee" />
							</td>
						</tr>
						<tr>
						
							<td>备注:</td>
							<td colspan="3" class="td2"><textarea
									class="easyui-textarea" cols="45" rows="2" name="remarkes"></textarea>
							</td>
						</tr>
					</table>
					</div>
		  </form>	
  </body>
</html>