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

<title>修改运单信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<%
  User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
  	String costomers=(String)request.getAttribute("costomers");
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
        
		var shiping_orders_id='<%=flg%>';
		$("#shiping_orders_id").val(shiping_orders_id);
		$.ajax({
			url : 'overbook.do?method=updateId',
			data : {
				id : shiping_orders_id
			},
			success : function(data) {
			 if(data.plate_number==null){
					$("#carid").select2("val",'');
				}else{
					$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number); 					
				}
				//给select2  赋值name
 		  		$("#custom_nameid").val(data.custom_name);
				 $("#custom_name").select2('data',{id:'<%=user.getCostomersid()%>',text:data.custom_name});		
				$('#Regform').form('load', data);
			}
		});

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
			 $("#custom_nameid").val(f.object.text);
		});
		
				 
 		 $("#shiping_orders_id").val('<%=flg%>');
 		 
 
	});
   $("#custom_name").val('<%=user.getUsername()%>');
	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
	  			//可提交
		$pjq.messager.confirm('修改运单', '确定要修改吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'overbook.do?method=getupdate',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('修改运单', '运单修改成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});
			}
		});
		} else{
			    $pjq.messager.alert('修改运单', '必填信息不可为空', 'info');
			  }
			  
	};
</script>
     <body>
		<form action="" method="post" id="Regform">
		<input type="hidden" id="shiping_orders_id" name="shiping_orders_id">
		<fieldset>
			<table class="tableclass">
				<tr>
				<th colspan="4">基本信息</th>
				</tr>
				 <tr>
				 <td ><font color="red" style="margin-right:10px">*</font>下单号:</td>
					<td  class="td2"><input type="text" class="validate[required]" id="num"
						name="shiping_order_num" disabled="disabled"></td>
					<td ><font color="red" style="margin-right:10px">*</font>发站:</td>
					<td class="td2"><input type="text"  class="validate[required]" id="send_station"
						name="send_station"></td> 
				</tr>
				<tr>
				<td ><font color="red" style="margin-right:10px">*</font>发货人客户：</td>
					<td  class="td2"><input type="text" class="" id="custom_name"	style="width: 150px"					>
						<input type="hidden" id="custom_nameid" name="custom_name"></td>
							<td>发车时间:</td>
					<td class="td2"><input class="Wdate validate[required]"
							onfocus="WdatePicker({isShowWeek:true})" id=""
							name="send_time" /></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>到站:</td>
					<td class="td2"><input type="text"  class="validate[required]" id=""
						name="end_address"></td> 
					<td ><font color="red" style="margin-right:10px">*</font>收货人名称：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
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
					</select></td --> 
				
					<!-- <td ><font color="red" style="margin-right:10px">*</font>是否接收：</td>
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

