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
    <title>结算</title>
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
  <%String[] flg = (String[]) request.getAttribute("flg"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var obj;
 		var pid = [];
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		<%for(int i=0;i<flg.length;i++){
				%>
				pid.push('<%=flg[i]%>');
				<%
				}%> 
		$.ajax({
			//url : 'write_off.do?method=getUpdateShippingOrder',
			data : {
				id : pid
			},
			success : function(data) {
				$('#Regform').form('load', data);
				
			}
		});		  	
  	}); 
  			
  var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
	  			//可提交
		$pjq.messager.confirm('费用结算', '确定要结算吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'DriverClose.do?method=UpdateCloseDriver&pid='+pid,
					data : $('#Regform').serialize(),
					success : function(msg) {
					
						if (msg.flag == true) {
							$pjq.messager.alert('费用结算', '费用结算成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		} else{
				
			    $pjq.messager.alert('费用结算', '必填信息不可为空', 'info');
			  }
	};
	function xj(obj){
		if(obj.checked){
		document.getElementById("yhkh").style.display="none";	
		document.getElementById("khh").style.display="none";
		document.getElementById("youk").style.display="none";			
		document.getElementById('khbank').setAttribute("class", "");
		document.getElementById('kahao').setAttribute("class", "");
		document.getElementById('usernames').setAttribute("class", "");
		document.getElementById('youka').setAttribute("class", "");
		document.getElementById('youin').setAttribute("class", "");
		}
		}
	function sk(obj){
		if(obj.checked){
		document.getElementById("yhkh").style.display="";	
		document.getElementById("khh").style.display="";
		document.getElementById("youk").style.display="none";		
		document.getElementById('khbank').setAttribute("class", "validate[required]");
		document.getElementById('usernames').setAttribute("class", "validate[required]");
		document.getElementById('kahao').setAttribute("class", "validate[required,custom[number]]");
		document.getElementById('youka').setAttribute("class", "");
		document.getElementById('youin').setAttribute("class", "");
		}
		}
	function yk(obj){
		if(obj.checked){
		document.getElementById("yhkh").style.display="none";	
		document.getElementById("khh").style.display="none";
		document.getElementById("youk").style.display="";		
		document.getElementById('khbank').setAttribute("class", "");
		document.getElementById('usernames').setAttribute("class", "");
		document.getElementById('kahao').setAttribute("class", "");
	    document.getElementById('youka').setAttribute("class", "validate[required]");
		document.getElementById('youin').setAttribute("class", "validate[required,custom[number]]");
		}
		}

  </script>
  <body class="easyui-layout">
    <form action="" method="post" id="Regform">
	    <input type="hidden"   name="direction" >
	    <input type="hidden"   name="source" >
	    <input type="hidden"   name="project" >
	    <input type="hidden"   name="happen" >
	   	<input type="hidden" id="pid"  name="shiping_order_id">
	    <input type="hidden"   name="other_zhichu" >
	    <input type="hidden"   name="fee_date" >
		<input type="hidden"   name="change_fee1" >
	 	<table class="tableclass">
		    <tr>
		        <td><font color="red" style="margin-right:10px">*</font>付款方式：</td>
				<td class="td2" colspan="3">	
					<input type="radio" name="settlement_modes" value="0"  style="width:14px" onclick="xj(this)"/><label style="margin-left: 10px" >现金</label>
					<input type="radio"  name="settlement_modes" value="1"  style="width:14px" onclick="yk(this)"/><label  style="margin-left: 10px">油卡</label>
					<input type="radio"  name="settlement_modes" value="3"  style="width:14px" onclick="sk(this)"><label  style="margin-left: 10px">转账</label>
				</td> 
		    </tr>
		    <tr id="khh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>开户行:
				</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="khbank"	style="width:120px;" name="driv_bank"></td>	
				<td><font color="red" style="margin-right:10px">*</font>开户名:
				</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="usernames" style="width:120px;" name="driv_sige_name"></td>			
			</tr>	
			<tr id="yhkh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>银行卡号:</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="kahao"	style="width:120px;" 	name="driv_card"></td>			
			</tr>
		    <tr id="youk"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>姓名:
				</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="youka"	style="width:120px;" name="oil_card_name"></td>	
				<td><font color="red" style="margin-right:10px">*</font>油卡号:
				</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="youin" style="width:120px;" name="oil_card"></td>			
			</tr>
			<tr>
				<td style="color: blue;">备注:</td>
				<td colspan="3" class="td2"><textarea class="easyui-textarea" id="fee_remarks" cols="40" rows="2" name="fee_remarks"></textarea></td>
			</tr>				
	   </table>
	</form>	
  </body>
</html>