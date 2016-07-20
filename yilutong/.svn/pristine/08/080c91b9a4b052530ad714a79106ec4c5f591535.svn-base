<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <!-- /**
 * 新增保险
 * @author lx
 */  -->
    <title>新增保险</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./My97DatePicker/WdatePicker.js"></script>
  </head>
  <script type="text/javascript">
	  	$(function(){
	  	 $("#addForm").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
	  		 $("#number_add").select2({
    		 placeholder: "请选择车辆",	//默认文本框显示信息
   			 minimumInputLength: 1,	//最小输入字符长度
   			 allowClear:true,
   			 multiple: false,				//设置多项选择，false则只能单选
    		 maximumSelectionSize: 5,
    		 query: function (query) {
			    	$.ajax({
					   type: "POST",
					   url: "insurance.do?method=getCarNum",
					   data: {search:query.term},   //传递输入框中的值
					   success: function(msg){
			 		   	var msg=$.parseJSON(msg);		
			 			var data = {results: []};
						$.each(msg,function(x,y){
							data.results.push({id: y.id, text: y.name});
						});
				        query.callback(data);
					   }
					});
			    }
			    });
	  	});
  		var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
  		 if(($("#addForm").validationEngine('validate'))&&($("#number_add").val()!="")){
		$pjq.messager.confirm('新增车辆','确定要新增吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'insurance.do?method=addInsurance',
		  			data:$('#addForm').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增车辆','新增车辆成功','info'),
									   $grid.datagrid('reload');
									   $dialog.dialog('close');
									    
		  				};
		  			}
				});
			}
		});
		 }else if(($("#number_add").val())==""){
		  $pjq.messager.alert('新增保险', '车牌号信息不可为空', 'info');
		 }else{
			    $pjq.messager.alert('新增保险', '必填信息不可为空', 'info');
			  }
  	};
  </script>
  <body>
   <form action="" method="post" id="addForm">
   <fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">基本信息</th>
				</tr>	
   			<tr>
   				<td><font color="red" style="margin-right:10px">*</font>车牌号码</td>
   				<td class="td2"><input type="hidden" id="number_add" style="width:150px"  name="travelCardId"/></td>
   				<td><font color="red" style="margin-right:10px">*</font>被保险人</td>
   				<td class="td2"><input type="text" class="validate[required]" name="insured"/></td>
   			</tr>
   			<tr>
   				<td><font color="red" style="margin-right:10px">*</font>保险人</td>
   				<td class="td2"><input class="validate[required]" name="insurer"/></td>
   				<td><font color="red" style="margin-right:10px">*</font>被保险人身份证号码</td>
   				<td class="td2"><input type="text" class="validate[custom[chinaId],required]" name="insuredCard"/></td>
   			</tr>
   			</table>
   			</fieldset>
   			<fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">交强险信息</th>
				</tr>	
   			<tr>
   				<td>保费金额</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="premiumAmountCompulsory"/></td>
   				<td>保险单单号</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceNumberCompulsory"/></td>
   			</tr>
   			<tr>
   				<!-- <td>保险期间（交强险）</td>
   				<td class="td2"><input type="text" class="search-text" name="insurancePeriodCompulsory"/></td> -->
   				<td>保险开始时间</td>
   				<td class="td2"><input type="text" name="jiaoqiangstart" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				<td>保险结束时间</td>
   				<td class="td2"><input type="text" name="jiaoqiangend" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				
   			</tr>
   			<tr>
   			<td>车船税</td>
   			<td class="td2"><input type="text" class="search-text" name="carTax"/></td>
   			</tr>
   			</table>
   			</fieldset>
   			 <fieldset>
   			<table class="tableclass">
			<tr>
					<th colspan="4">商业险信息</th>
				</tr>	
   			<tr>
   				<td>承保险别</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceCategory"/></td>
   				<td>保险单单号</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceNumberBusiness"/></td>
   			</tr>
   			<tr>
   				<td>保险金额</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="premiumAmountBusiness"/></td>
   				<td>签单保费</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="signPremium"/></td>
   			</tr>
   			<tr>
   				<td>保险开始时间</td>
   				<td class="td2"><input type="text" name="shangyestart" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				<td>保险结束时间</td>
   				<td class="td2"><input type="text" name="shangyeend" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   			</tr>
   			<tr>
   				<td>签单保费合计</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="signPremiumTotal"/></td>
   			</tr>
   			</table>
   			</fieldset>
   			<fieldset>
   			<table class="tableclass">
			<tr>
					<th colspan="4">货物险信息</th>
				</tr>	
   			<tr>
				<td>保险开始时间</td>
   				<td class="td2"><input type="text" name="huowustart" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				<td>保险结束时间</td>
   				<td class="td2"><input type="text" name="huowuend" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>  			
   			</tr>
   			<tr>
   				<td>保费金额</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="premiumAmountCargo"/></td>
   				<td>保险单单号</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceNumberCargo"/></td>
   			</tr>
   		</table>
   		</fieldset>
   </form>
  </body>
</html>
