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
    <title>费用结算</title>
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
  <%String flg[] = (String[]) request.getAttribute("flg"); 
    String fees =(String) request.getAttribute("fee");
    String hfee = (String)request.getAttribute("hfee");
  %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var pid = [];
 		var userid;
 		var fee = '<%=fees%>';
 		var hfee = '<%=hfee%>';
 		if(hfee==null || hfee == ""){
 		    hfee ="0.0";
 		}
 		
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
				
		<%for(int i=0;i<flg.length;i++){
				%>
				pid.push('<%=flg[i]%>');
				<%
				}%> 
           if (fee == "") {
			$("#handling_charge").val(0);
		} else {
           $("#handling_charge").val(
			fee);
				}

			});
			var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
				if ($("#Regform").validationEngine('validate')) {
					$pjq.messager.confirm('费用结算', '确定要结算吗?', function(r) {
						var handling_charge = $('#handling_charge').val();

						var shihou = $('#handling_shihou').val();
						if (shihou == null || shihou == "") {
							shihou = "0.0";
						}
						var handling_shihou = parseFloat(shihou)
								+ parseFloat(hfee);

						/* 		    var radionum = document.getElementById("Regform").write_off;
						 for(var i=0;i<radionum.length;i++){
						 if(radionum[i].checked){
						 userid = radionum[i].value;
						
						 } 
						
						 }*/
						if (r) {
							$.ajax({
								type : "POST",
								url : 'Handling.do?method=updateCollect&pid='
										+ pid.join(","),
								data : {
									handling_shihou : handling_shihou,
									handling_charge : handling_charge,
								},

								//$('#Regform').serialize(),
								success : function(msg) {
									if (msg.flag == false) {
										$pjq.messager.alert('费用结算', '费用结算成功',
												'info');
										$dialog.dialog('close');
										$grid.datagrid('reload');
									}
									;
								}
							});
						}
					});
				} else {

					$pjq.messager.alert('费用结算', '必填信息不可为空', 'info');
				}
			};
			/* function xj(obj){
			 if(obj.checked){
			 document.getElementById("yhkh").style.display="none";	
			 document.getElementById("khh").style.display="none";	
			 document.getElementById('khbank').setAttribute("class", "");
			 document.getElementById('kahao').setAttribute("class", "");
			 document.getElementById('usernames').setAttribute("class", "");
			 }
			 }
			 function sk(obj){
			 if(obj.checked){
			 document.getElementById("yhkh").style.display="";	
			 document.getElementById("khh").style.display="";	
			 document.getElementById('khbank').setAttribute("class", "validate[required]");
			 document.getElementById('usernames').setAttribute("class", "validate[required]");
			 document.getElementById('kahao').setAttribute("class", "validate[required,custom[number]]");
			 }
			 } */
		</script>
  <body class="easyui-layout">
    <form action="" method="post"  id="Regform">
    <input type="hidden" id="customid"  name="custom_id"  >
 	<table class="tableclass">
 	    <tr>
		    <td >应收代收运费:</td>  
			<td class="td2">
				<input  id="handling_charge"	style="width:120px;" name="handling_charge" disabled="disabled">
			</td>
			</tr>
			<tr>	
			<td>实收代收运费:</td>
			<td class="td2">
			    <input  id="handling_shihou" style="width:120px;" name="handling_shihou" class="validate[custom[number],max[99999.99],min[0.00],custom[dd],required]">
			</td>			
		</tr>
<!-- 			<tr>
					<td>			
					<font color="red" style="margin-right:10px">*</font>付款方式：</td>
					<td class="td2" colspan="3">	
					<input type="radio" name="write_off" value="1"   style="width:14px" onclick="xj(this)"/><label style="margin-left: 10px">现金</label>
					<input type="radio"  name="write_off" value="0"   style="width:14px" onclick="sk(this)"/><label  style="margin-left: 10px">刷卡</label>
					</td> 
				</tr> 
				<tr id="khh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>开户行:
				</td><!--  style="color: blue;"
				<td colspan="1" class="td2"><input  id="khbank"	style="width:120px;" name="change_bank"></td>	
				<td><font color="red" style="margin-right:10px">*</font>开户名:
				</td><!--  style="color: blue;"
				<td colspan="1" class="td2"><input  id="usernames" style="width:120px;" name="change_sige_name"></td>			
			</tr>	
			<tr id="yhkh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>银行卡号:</td><!--  style="color: blue;"
				<td colspan="1" class="td2"><input  id="kahao"	style="width:120px;" 	name="change_card"></td>			
			</tr>
				<tr>
				<td style="color: blue;">备注:</td>
				<td colspan="3" class="td2"><textarea class="easyui-textarea" id="received_remarks"
						cols="40" rows="2" name="received_remarks"></textarea></td>
			</tr>	-->		
			</table>
		  </form>	
  </body>
</html>