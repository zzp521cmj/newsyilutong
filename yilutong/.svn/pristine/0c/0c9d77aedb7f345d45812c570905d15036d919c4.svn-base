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
    <title>司机结算审核</title>
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
  <% String id = (String) request.getAttribute("id");
     String [] pids = id.split(",");
   %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var pid=[];
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
	   });
				 
		<%for(String s:pids){
		%>
		pid.push('<%=s%>');
		<%
		}%>;
		var id ='<%=id%>';
		console.log(id);
		 $.ajax({
			url : 'DriverClose.do?method=getShippingDriver',
			data : {
				id : id
			},
			success : function(data) {
				$('#Regform').form('load', data);
				
			} 
		});
			$("#receiptid").select2({
		    placeholder: "请输入用户名称",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "collect.do?method=getUser",
				   data: {username:query.term},   //传递你输入框中的值
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
		}).on("select2-selecting", function(f){
			 	$("#receiptid").val(f.object.id);
			 	$("#cname").val(f.object.text); 
					});			 
			
  	}); 
  	
  	//审核	
  var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
  if($("#Regform").validationEngine('validate')&&$("#receiptid").select2("val")!=""){	
		//if($("#Regform").validationEngine('validate')){
		var remarks = $("#close_recheck_remarks").val();
		var username = $("#receiptid").select2("val");
		var name = $("#cname").val(); 
		//var trade_agency = $("#trade_agency").val();
		var change_fee1 = $("#paid_fee").val();
		var change_pay = $("#transport_pay").val();
		$pjq.messager.confirm('结算审核', '确定要审核吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'DriverClose.do?method=getDriverCheckedClose',
					//data :{id:pid.join(","),close_recheck_remarks:remarks,username:name,change_fee1:change_fee1,change_pay:change_pay},
					data : $('#Regform').serialize(),
					success : function(msg) {		
						if (msg.flag==true) {
							$pjq.messager.alert('结算审核', '审核成功！', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		}else if($("#receiptid").select2("val")==""||$("#receiptid").select2("val")==null){
		    $pjq.messager.alert('结算审核', '审核人不可为空', 'info');
		 }else{
				
			    $pjq.messager.alert('结算审核', '必填信息不可为空', 'info');
			  }
	
	};
	//驳回
  var submitFormReject = function($dialog, $grid, $pjq, $mainMenu) {
  if($("#Regform").validationEngine('validate')&&$("#receiptid").select2("val")!=""){	
	    var remarks = $("#close_recheck_remarks").val();
		var username = $("#receiptid").select2("val");
		var name = $("#cname").val(); 
		var change_fee1 = $("#paid_fee").val();
		var change_pay = $("#transport_pay").val();
		$pjq.messager.confirm('结算审核', '确定要驳回吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'DriverClose.do?method=getDriverCheckedReject',
					data : $('#Regform').serialize(),
					//data :{id:pid.join(","),close_recheck_remarks:remarks,username:name,change_fee1:change_fee1,change_pay:change_pay},
					success : function(msg) {		
						if (msg.flag==true) {
							$pjq.messager.alert('结算审核', '驳回成功！', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		}else if($("#receiptid").select2("val")==""||$("#receiptid").select2("val")==null){
		    $pjq.messager.alert('结算审核', '审核人不可为空', 'info');
		 }else{
				
			    $pjq.messager.alert('结算审核', '必填信息不可为空', 'info');
			  }
	
	};

  </script>
  <body class="easyui-layout">
      <form action="" method="post"  id="Regform">
          <input type="hidden" id="driver_id"  name="driver_id">          
 	      <table class="tableclass">
<!--               <tr>
			    <td>				
					<font color="red" style="margin-right:10px">*</font>审核人名称:</td>
					<td  class="td2"><input type="text" class=" search-text" id="receiptid" name="id">
					<input type="hidden"  id="cname" name="username">
					</td> 
				    <td >实付中转费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" name="change_fee1" id="paid_fee"/> 
					</td>
				</tr> -->
				<tr>
				    <td >应付直送费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="send_fee" name="send_fee"/> 
					</td>
					 <td >实付直送费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="paid_deliver_fee" name="paid_deliver_fee"/> 
					</td>
				</tr>
				<tr>
				    <td >应付装卸费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="payble_coolie" name="payble_coolie" /> 
					</td>
					 <td >实付装卸费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="paid_ground_fee" name="paid_ground_fee" /> 
					</td>
				</tr>
				<tr>
				    <td >应付上楼费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="pay_upstairs_fee" name="pay_upstairs_fee" disabled="disabled"/> 
					</td>
					 <td >实付上楼费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id=paid_upstairs_fee name="paid_upstairs_fee" disabled="disabled"/> 
					</td>
				</tr>
				<tr>
				    <td >应付其他费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="payble_other" name="payble_other" disabled="disabled"/> 
					</td>
					 <td >实付其他费：</td>
					<td  class="td2">
					    <input    placeholder="0.00"  class="validate[custom[number],max[99999.99],min[0.00],custom[dd]]"  type="text" id="paid_adorn_fee" name="paid_adorn_fee" disabled="disabled"/> 
					</td>
				</tr>
				<tr>
				    <td style="color: blue;">审核备注:</td>
				    <td colspan="3" class="td2"><textarea class="easyui-textarea" id="close_recheck_remarks"
						cols="40" rows="2" name="close_recheck_remarks"></textarea></td>
			   </tr>			
	      </table>
      </form>	
  </body>
</html>