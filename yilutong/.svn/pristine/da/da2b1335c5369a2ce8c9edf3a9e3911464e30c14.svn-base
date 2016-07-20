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

<title>添加下单</title>
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
  	String costomers=(String)request.getAttribute("costomers");
  	String flg = (String) request.getAttribute("flg");
  	String flg2 = (String) request.getAttribute("flg2");
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
				 var claimsid='<%=flg2%>';
				//根据form表单获取所以值
				$('#num').val(claimsid);
				//$('#editTravel').form('load', data);
				$('#shiping_order_num').val(claimsid);
		$("#custom_name").select2({
			placeholder : "请输入发货客户名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "overbook.do?method=inquireName",
					data : {
						custom_name : query.term
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
		}).on("select2-selecting", function(f) {
			 $("#costomers").val(f.object.text);
			 
		});	  
 		 $("#shiping_orders_id").val('<%=flg%>');
 		 //给select2  赋值name
 		  $("#costomers").val('<%=costomers%>');
 		 //select2  获取绑定的客户  
 		 var cid='<%=user.getCostomersid()%>';
 		 if(cid=="null"||cid==''){
 		 $("#custom_name").select2('val','')
 		 }else{
 		  $("#custom_name").select2('data',{id:'<%=user.getCostomersid()%>',text:'<%=costomers%>'});		 
 		 }
 			 
	});
	
	
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		var num=$.trim($("#num").val());
		$.ajax({
		type : "POST",
					url : 'overbook.do?method=getNumber',
					data : {
					number:num },
					success : function(data){
					console.log(data);
						if(data.flag){
						 $pjq.messager.alert('新增订单', '此订单号已经存在', 'info');
						}else{			
				if($("#Regform").validationEngine('validate')&&$("#custom_name").select2('val')!=''){		
	  			//可提交
				$pjq.messager.confirm('新增运单','确定要新增吗?',function(r){   
	    		if (r){    
					$.ajax({
					type: "POST",
		  			url:'overbook.do?method=insertInfo',
		  			data:$('#Regform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增运单','运单添加成功','info'); 
									   $dialog.dialog('close');
									   $grid.datagrid('reload');
		  				};
		  			}
				});
			}
		});
		 }else if($("#custom_name").select2('val')==''){
			    $pjq.messager.alert('新增运单', '发货客户不可为空', 'info');
			
		 }else{
			    $pjq.messager.alert('新增运单', '必填信息不可为空', 'info');
			  }
					}
					}
				});
		
	};

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
				
				 <td ><font color="red" style="margin-right:10px">*</font>下单号:</td>
					<td  class="td2"><input type="text" class="validate[required]" id="num"
						name="shiping_order_num" disabled="disabled">
						<input type="hidden" id ="shiping_order_num" name="shiping_order_num">
						</td>
					<td ><font color="red" style="margin-right:10px">*</font>发站:</td>
					<td class="td2"><input type="text"  class="validate[required]" id="send_station"
						name="send_station"></td> 
				</tr>
				<tr>
				<td ><font color="red" style="margin-right:10px">*</font>发货人名称：</td>
					<td  class="td2"><input type="text" class="" id="custom_name" style="width: 150px" name="user_id">
					<input type="hidden" class="" id="costomers" name="custom_name" ></td>
				<td><font color="red" style="margin-right:10px">*</font>发车时间:</td>
					<td class="td2"><input class="Wdate validate[required]"
							onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})"  id=""
							name="send_time" /></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>到站:</td>
					<td class="td2"><input type="text"  class="validate[required]" id=""
						name="end_address"></td> 
					<td ><font color="red" style="margin-right:10px">*</font>收货人名称：</td>
					<td  class="td2"><input type="text" class="validate[required]" id="receipt"
						name="receipt"></td>
				</tr>
				<tr>
				    <td ><font color="red" style="margin-right:10px">*</font>收货人电话：</td>
					<td  class="td2"><input type="text" class="validate[custom[number],[required]]" id=""
						name="receipt_tel"></td>
				    <td ><font color="red" style="margin-right:10px">*</font>收货人手机：</td>
					<td  class="td2"><input type="text" class="validate[required],[phone]custom[phone]" id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td >收货详细地址：</td>	
					<td colspan="3" class="td2">
					<textarea cols="45" rows="2" type="text" name="receipt_address" ></textarea>
					</td>
				</tr>
				<tr>
					<td  >品名：</td>
					<td class="td2"><input   type="text"  name="goods_name" /></td>
					<td  >包装：</td>
					<td  class="td2"><input  type="text"  name="goods_packing" /> 
					</td>
				</tr>

				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>总件数：</td>
					<td  class="td2"><input  type="text" type="text"  class="validate[required],validate[,custom[number],min[0]]" placeholder="0"  name="goods_num" /></td>
					<td ><font color="red" style="margin-right:10px">*</font>总重量(千克)：</td>
					<td  class="td2"><input type="text" type="text"  class="validate[required],validate[,custom[number],min[0]]" placeholder="0.0000"  name="goods_weight" /></td>	
			    </tr>
			    <tr>
					<td ><font color="red" style="margin-right:10px">*</font>总体积(立方米)：</td>
					<td  class="td2"><input type="text"  type="text"  class="validate[required],validate[custom[number],max[99999.9999],min[0.0000]]"   placeholder="0.0000"   name="goods_vol" /></td>
                		<td ><font color="red" style="margin-right:10px">*</font>交接方式：</td>
					<td class="td2"><select id='send' class="combobox" name="send_type" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">客户自提</option>
							<option id="" value="1">专车送货</option>
							<option id="" value="2">送货进仓</option>
							<option id="" value="3">送货上楼</option>
							<option id="" value="4">送货上门</option>
						
					</select> </td>
                </tr> 
			    <tr>
				<!-- 	<td ><font color="red" style="margin-right:10px">*</font>运输方式：</td>
					 <td class="td2">
					<select id='check' class="combobox" name="transport" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">普快</option>
							<option id="" value="1">特快</option>
					</select></td> -->
			
				<!-- 	<td ><font color="red" style="margin-right:10px">*</font>是否接收：</td>
					<td class="td2"><select id='shiping_accept_static' class="combobox" name="shiping_accept_static" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">未接收</option>
							<option id="" value="1">已接收</option>
					</select> </td> -->
				</tr>	
				<tr>
			
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
