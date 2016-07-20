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

<title>添加客户信息</title>
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
	<%-- 	$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "order.do?method=getPlateNumberLength",
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
		});	 	--%>	 
		$("#receiptid").select2({
		    placeholder: "请输入客户名称",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "orderC.do?method=getCustomer",
				   data: {name:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id:y.id, text:y.name,customer_grade:y.customer_grade,car_time:y.car_time});
					});
			        query.callback(data);
				   }
				});
		    }
		}).on("select2-selecting", function(f){
			 	$("#receiptid").val(f.object.id);
			 	$("#cname").val(f.object.text); 
			 	$("#customer_grades").val(f.object.customer_grade);
			 	$("#car_time").val(f.object.car_time); 
			 	if(f.object.customer_grade==0){
			 	$("#customer_grade").val("散货"); 
			 	} else if (f.object.customer_grade==1) {
					$("#customer_grade").val("大宗"); 
				}else if (f.object.customer_grade==2) {
					
					$("#customer_grade").val("项目落仓"); 
				} 
			 	
			 	
					});	 	
 		 $("#user").val('<%=user.getUsername()%>'); 
	});
	//   		function saveDriver(){
	//   			var myform=document.forms[0];
	//   			myform.action="driver.do?method=saveDriver";
	//   			myform.submit();
	//   		}
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {		
				if($("#Regform").validationEngine('validate')&&$("#receiptid").select2("val")!=""){		
	  			//可提交
				$pjq.messager.confirm('新增信息','确定要新增吗?',function(r){   
	    		if (r){    
					$.ajax({
					type: "POST",
		  			url:'orderC.do?method=saveOrderCustom',
		  			data:$('#Regform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增信息','客户车辆信息添加成功','info'); 
									   $dialog.dialog('close');
									   $grid.datagrid('reload');
		  				};
		  			}
				});
			}
		});
		 }else if($("#receiptid").select2("val")==""||$("#receiptid").select2("val")==null){
		    $pjq.messager.alert('新增信息', '客户名称不可为空', 'info');
		 } else{
			    $pjq.messager.alert('新增信息', '必填信息不可为空', 'info');
			  }
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
		<input type="hidden" name="custom_id">
		<fieldset>
			<table class="tableclass">
				<tr>
				<th colspan="4">基本信息</th>
				</tr>
				 <tr>
				 <td ><font color="red" style="margin-right:10px">*</font>客户名称:</td>
					<td  class="td2"><input type="text" class=" search-text" id="receiptid"
						name="customer_id">
					<input type="hidden"  id="cname" name="custom_name">
						</td>
					<td >客户发车车次:</td>
					<td  class="td2"><input type="text" id="car_time"
						name="car_time" readonly="readonly"></td>
				</tr>
				<tr>
					<td >发站:</td>
					<td   class="td2"><input type="text"  id=""
						name="send_station"></td>
				
					
					<!--  <td>性别:</td>
					<td class="td2"><select id='sectaa' class="easyui-combobox" name="gender" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option  value="">请选择</option>
							<option  value="0">男</option>
							<option  value="1">女</option>
					</select></td> -->  
				
					<td  ><font color="red" style="margin-right:10px">*</font>车牌号：</td>
					<td  class="td2"><input type="text" class="validate[required,minSize[7],maxSize[7],custom[carnumber]]" id=""
						name="car_number"></td>
				</tr>
					<tr>
			 		<td>车长:</td>
			 		<td     class="td2"><input id="" type="text"  name="car_length" class="validate[custom[number]]"></td>
			 		<td>大车车型:</td>
			 		<td    class="td2">
			 		
			 		<!-- <input id="" type="text"  name="car_type"> -->
			 		<select id='jiesuStata'  name="car_type"  style="width:100px;height:22px">
				    <option value="平板">平板</option>
				    <option value="高栏">高栏</option>
				    <option value="厢式">厢式</option>
				    <option value="面包">面包</option>
				    <option value="三轮车">三轮车</option>
				    <option value="其他">其他</option>
				</select>			
			 		</td>
			 	</tr>
				<tr>
					<td >司机姓名：</td>
					<td class="td2" ><input type="text" id=""
						name="driver_name"></td>
					<td  >电话：</td>	
					<td class="td2"><input type="text" class="validate[custom[phone],custom[number]]" id=""
						name="driver_phone"></td>
				</tr>
				<tr>
				<td ><font color="red" style="margin-right:10px">*</font>发车时间:</td>
					<td  class="td2"><input  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id=""
						name="send_time" />
					</td>
						<td >到车日期:</td>
					<td  class="td2"><input  class="Wdate" onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id=""
						name="receipt_time" />
					</td>
				</tr>
				<tr>
					 <td >应付装卸费:</td>
					<td class="td2"> <input id="take_pay"  type="text"  class="validate[custom[number],max[9999999.99],min[0.00],custom[dd]]" placeholder="0.00"  name="adorn_fee2" />
					 <td >应收落地费:</td>
					<td class="td2"> <input id="send_pay" type="text"   class="validate[custom[number],max[9999999.99],min[0.00],custom[dd]]" placeholder="0.00"   name="born_fee" />
			 	</tr>
				
				<tr>
				    <td >客户层级:</td>
					<td  class="td2">
					    <input type="text" id="customer_grade" readonly="readonly">
					    <input type="hidden" id="customer_grades" name="customer_grade">
					    </td>
				</tr>
				<tr>
				<td >备注:</td>
					<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="45" rows="2" name="car_remarks"></textarea></td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
