<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
	String flg = (String) request.getAttribute("flg");
%>
<script type="text/javascript">
	var type;
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
 		
 		
 		var pid='<%=flg%>';
		$.ajax({
			url : 'ChangeO.do?method=getAddOrderFee',
			data : {
				id : pid
			},
			success : function(data) {
				//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
				//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
				type=data.agreement_type;
			if(data.agreement_type==2){
				$("#changeFee").removeAttr("style");
					$.ajax({
					url : 'ChangeO.do?method=getUpdateChangeOrder',
				data : {
				id : pid
				},
			success : function(data) {
			if(data.ischange_fee!=null){
				$('#changeFee').form('load', data);
					/* $("#ischange0").prop("checked");
			}else{
					$("#ischange1").prop("checked"); */
			}else{
				$("#oeder_id2").val(data.shiping_order_id);
			}
			}
				});
			}else {
				$("#Regform").removeAttr("style");
				$.ajax({
			url : 'ChangeO.do?method=getUpdateChangeOrder',
			data : {
				id : pid
			},
			success : function(data) {
			if(data.sends_fee!=null){
			$('#Regform').form('load', data);
				}else{
					$("#oeder_id10").val(data.shiping_order_id);
				}
			}	
				});
			}	
		}
		});
 		
	});
	//   		function saveDriver(){
	//   			var myform=document.forms[0];
	//   			myform.action="driver.do?method=saveDriver";
	//   			myform.submit();
	//   		}
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		if(type==2){
		//转运
			if($("#changeFee").validationEngine('validate')){		
	  			//可提交
				$pjq.messager.confirm('计费编辑','确定要编辑吗?',function(r){   
	    		if (r){    
					$.ajax({
					type: "POST",
		  			url:'ChangeO.do?method=saveChangeOrder',
		  			data:$('#changeFee').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('计费编辑','计费编辑成功','info'); 
									   $dialog.dialog('close');
									   $grid.datagrid('reload');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('计费编辑', '必填信息不可为空', 'info');
			  }
		
		
		}else {
		//配送和班线
			if($("#Regform").validationEngine('validate')){		
	  			//可提交
				$pjq.messager.confirm('计费编辑','确定要编辑吗?',function(r){   
	    		if (r){    
					$.ajax({
					type: "POST",
		  			url:'ChangeO.do?method=saveChangeOrder',
		  			data:$('#Regform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('计费编辑','计费编辑成功','info'); 
									   $dialog.dialog('close');
									   $grid.datagrid('reload');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('计费编辑', '必填信息不可为空', 'info');
			  }
		
		
		
		}
		/* $.ajax({
					type : "POST",
					url : 'shipOrder.do?method=getNumber',
					data : {
					number:num },
					success : function(data){
				///	alert(data.shiping_order_num==null)
						if(data.shiping_order_num!=null){
						 $pjq.messager.alert('计费编辑', '此订单号已经存在', 'info');
						}else{
						}
					}
				}); */
					
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
	<form action="" method="post" id="Regform"  style="display: none">
		<input type="hidden" name="shiping_order_id" id="oeder_id10">
		<fieldset>
		<legend>配送信息</legend>
			<table class="tableclass" id="table10"  >
				<!-- <tr>
				<th colspan="4">基本信息</th>
				</tr>
				 <tr>
				 <td ><font color="red" style="margin-right:10px">*</font>订单号:</td>
					<td  class="td2"><input type="text" class="validate[required]" id="num"
						name="shiping_order_num"></td>
					<td ><font color="red" style="margin-right:10px">*</font>起运地:</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="start_address"></td>
				</tr>
			
				<tr>
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
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货方：</td>
					<td  class="td2"><input type="text" class="validate[required]" id=""
						name="receipt"></td>
					<td ><font color="red" style="margin-right:10px">*</font>电话：</td>
					<td  class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="receipt_tel"></td>
						</tr>
				<tr>
					<td >手机：</td>	
					<td  colspan="3"class="td2"><input type="text"  class="validate[custom[phone],custom[number]]" id=""
						name="receipt_phone"></td>
				</tr>
				<tr>
					<td ><font color="red" style="margin-right:10px">*</font>收货地址/单位：</td>	
					<td colspan="3" class="td2">
					<textarea cols="45" rows="2" class="validate[required]" name="receipt_address" ></textarea>
					</td>
				</tr>
				 -->
				<tr>
					<th colspan="4">计费标准</th>
				</tr>
				<tr>
				
				</tr>
				<tr>
				<td >配送费：</td>
					<td  class="td2"><input id="trunk_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"   placeholder="0.00"   value="0.00"   name="sends_fee" /></td>
					<td >装车费：</td>
					<td class="td2"><input id="adorn_fee"  type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"   placeholder="0.00"    value="0.00"   name="loading_fee" /></td>	
				</tr>
				<tr>
					<td >卸车费：</td>
					<td  class="td2"><input id="trunk_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"   placeholder="0.00"   value="0.00"  name="unloading_fee" /></td>
					<td >运费差价：</td>
					<td  class="td2"><input type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00"   value="0.00"  name="trans_price" />
						<input  type="hidden" name="is_update" value="1">		
				</td> 	
			</table>
		</fieldset>
	</form>
	<form action=""  method="post"  style="display: none" id="changeFee">
		<input type="hidden" name="shiping_order_id"  id="oeder_id2">
		<fieldset>
		<legend>中转信息</legend>
		<table class="tableclass" id ="table2"  >
	
		<tr>
					 <th colspan="4">计费标准</th>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>应付中转费：</td>
					<td class="td2" colspan="3">
					<input type="text"  class="validate[required,custom[number],max[99999.99],min[0.00],custom[dd]]"   placeholder="0.00"  value="0.00" name="change_pay" style="width:150px">
					<input type="radio" id="ischange1"name="ischange_fee" value="1"  style="width:14px"/><label style="margin-left: 10px">已付</label>
					<input type="radio"  id="ischange0"name="ischange_fee" value="0"  style="width:14px" checked/><label  style="margin-left: 10px">未付</label>
					</td>
				</tr>
				<tr>
					<td >中转费：</td>
					<td class="td2"><input id="take_pay" type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]" placeholder="0.00"    value="0.00" name="change_fee" /></td>
					<td >卸货费：</td>
					<td class="td2"><input id="send_pay" type="text"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00"   value="0.00" name="unloadgoods_fee" /></td>
				</tr>
				<tr>
					<td >装车费：</td>
					<td class="td2"><input id="adorn_fee"  type="text" class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"   placeholder="0.00"    value="0.00" name="loading_fee" /></td>
					<td >卸车费：</td>
					<td  class="td2"><input id="trunk_fee" type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"   placeholder="0.00"   value="0.00"name="unloading_fee" /></td>
				</tr>
				<tr>
					<td >运费差价：</td>
					<td  class="td2" colspan="3"><input type="text"   class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  placeholder="0.00"   value="0.00"  name="trans_price" />
						<input  type="hidden" name="is_update" value="1">		
					</td> 	
				</tr> 	
		</table>
		</fieldset>
		</form>	
	
	
</body>
</html>
