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
    <title>修改汇总信息管理</title>
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
			url : 'income.do?method=getUpdateIncome',
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
				   url: "income.do?method=getPlateNumber",
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
					url : 'income.do?method=updateIncome',
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
			    $pjq.messager.alert('修改总汇', '必填信息不可为空', 'info');
			  }
	};
  </script>
  <body class="easyui-layout">
    <form action="" method="post" id="Regform">
		<input type="hidden" name="tatal_id">
		<input type="hidden" id="ship" name="shiping_order_id">
		<fieldset>
			<table class="tableclass">
			<tr>
				<th colspan="4">基本信息</th>
				</tr>
				 <tr>
				 <td ><font color="red" style="margin-right:10px">*</font>客户名称:</td>
					<td  class="td2"><input type="text" class="validate[required] search-text" id="num"
						name="checkp"></td>
					<td ><font color="red" style="margin-right:10px">*</font>发货地址:</td>
					<td  class="td2"><input type="text" class="validate[required] search-text" id=""
						name="start_address"></td>
						
				</tr>
				<tr>
					<td >车牌号:</td>
					<td   class="td2"><input class="search-text"  id="carid" type="hidden" >
					<input class="search-text" type="hidden" id="car"  name="car_id" >
					<input type="hidden" class="validate[required] search-text" id="carnum"
						name="car_number" style="width:150px"></td>
				
					<td ><font color="red" style="margin-right:10px">*</font>到货时间:</td>
					<td  class="td2"><input  class="Wdate validate[required] search-text" onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id=""
						name="sended_time" />
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
					<td  >代收运费：</td>
					<td  class="td2"><input type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00" value="0.00"  id=""
						name="trade_total"></td>			
				</tr>
				<tr>
					<th colspan="4">收入</th>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>送货费：</td>
					<td  class="td2"><input type="text"  class="validate[required,custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00"  value="0.00" id=""
						name="sends_fee"></td>
					<td >中转费：</td>
					<td  class="td2"><input type="text" id=""  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00" value="0.00" 
						name="change_total"></td>
						</tr>
				<tr>
					<td >落地费：</td>
					<td  class="td2"><input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00"   id="" value="0.00" 
						name="land_total"></td>
						
				</tr>
				<tr>
					<th colspan="4">支出</th>
				</tr>
				<tr>
					<td >送货费：</td>
					<td  class="td2"><input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00" value="0.00"  id=""
						name="send_pay"></td>
					<td >中转费：</td>
					<td  class="td2"><input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00"  value="0.00" id=""
						name="changes_pay"></td>
						</tr>
				<tr>
					<td >落地费：</td>
					<td  class="td2"><input type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]] search-text" placeholder="0.00"  id="" value="0.00"
						name="land_pay">
						<input name="isincome" type="hidden" value="1">	
						</td>						
				</tr>
					
				<!-- <tr>
				<th colspan="4">基本信息</th>
				</tr>
				 <tr>
				 <td ><font color="red" style="margin-right:10px">*</font>客户名称:</td>
					<td  class="td2"><input type="text" class="validate[required]" id="num"
						name="checkp"></td>
					<td ><font color="red" style="margin-right:10px">*</font>发货地址:</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="start_address"></td>
						
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>车牌号:</td>
					<td   class="td2"><input class="search-text" type="hidden" id="carid"  name="car_id" style="width:150px">
					<input type="hidden"  class="validate[required]" id=""
						name="car_number"></td>
				
					<td ><font color="red" style="margin-right:10px">*</font>到货时间:</td>
					<td  class="td2"><input  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true})" id=""
						name="sended_time" />
					</td>
					 <td>性别:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="gender" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="">请选择</option>
							<option  value="0">男</option>
							<option  value="1">女</option>
					</select></td>  
				</tr>
				<tr>
					<td  ><font color="red" style="margin-right:10px">*</font>代收运费：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="trade_total"></td>			
				</tr>
				<tr>
					<th colspan="4">收入</th>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>送货费：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="sends_fee"></td>
					<td >中转费：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="change_total"></td>
						</tr>
				<tr>
					<td >落地费：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="land_total"></td>
					<td ><font color="red" style="margin-right:10px">*</font>合计：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="income_total"></td>
						
				</tr>
				<tr>
					<th colspan="4">支出</th>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>送货费：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="send_pay"></td>
					<td >中转费：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="changes_pay"></td>
						</tr>
				<tr>
					<td >落地费：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="land_pay"></td>
					<td ><font color="red" style="margin-right:10px">*</font>合计：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="pay_total"></td>
						
				</tr>
				<tr>
					<th colspan="4">利润</th>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>送货费：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="gain_send"></td>
					<td >中转费：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="gain_change"></td>
						</tr>
				<tr>
					<td >落地费：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="gain_land"></td>
					<td ><font color="red" style="margin-right:10px">*</font>合计：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="gain_total"></td>
						
				</tr>	-->
				</table> 
			</fieldset>
		  </form>	
  </body>
</html>