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
    <title>中转费结算</title>
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
  <%String[] flg = (String[]) request.getAttribute("pid"); 
  %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var pid=[];
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });				
		<%for(int i=0;i<flg.length;i++){%>
			pid.push('<%=flg[i]%>');
		<%}%>;	
  	}); 	
 
 	function xj(obj){
		if(obj.checked){
		$("#zpnum").val("");
		$("#khbank").val("");
		$("#kahao").val("");
		$("#usernames").val("");
		
		document.getElementById("yhkh").style.display="none";	
		document.getElementById("khh").style.display="none";
		document.getElementById("zp").style.display="none";	
		document.getElementById('zpnum').setAttribute("class", "");
		document.getElementById('khbank').setAttribute("class", "");
		document.getElementById('kahao').setAttribute("class", "");
		document.getElementById('usernames').setAttribute("class", "");
		}
		}
		function sk(obj){
		if(obj.checked){
		$("#zpnum").val("");
		document.getElementById("yhkh").style.display="";	
		document.getElementById("khh").style.display="";	
		document.getElementById('khbank').setAttribute("class", "validate[required]");
		document.getElementById('usernames').setAttribute("class", "validate[required]");
		document.getElementById('kahao').setAttribute("class", "validate[required,custom[number]]");
		document.getElementById("zp").style.display="none";	
		document.getElementById('zpnum').setAttribute("class", "");
		}
		}
		function zp(obj){
		if(obj.checked){
		$("#khbank").val("");
		$("#kahao").val("");
		$("#usernames").val("");
		document.getElementById("zp").style.display="";	
		document.getElementById('zpnum').setAttribute("class", "validate[required]");
		document.getElementById("yhkh").style.display="none";	
		document.getElementById("khh").style.display="none";
		document.getElementById('khbank').setAttribute("class", "");
		document.getElementById('kahao').setAttribute("class", "");
		document.getElementById('usernames').setAttribute("class", "");
		}
		}
  var submitFormEditss=function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
		$pjq.messager.confirm('中转费结算', '确定要结算提交吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'settleTC_fu.do?method=addSettlementYf',
					data : /* $('#Regform').serialize() */
					{dds:pid.join(","),
					type:$('input[name="type"]:checked').val(),
					remarks:$("#remarks_fee1").val(),
					khbank:$("#khbank").val(),
					usernames:$("#usernames").val(),
					kahao:$("#kahao").val(),
					zpnum:$("#zpnum").val()
					},
					success : function(msg) {		
						if (msg.flag) {
							$pjq.messager.alert('中转费结算', '中转费结算成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		} else{				
			    $pjq.messager.alert('中转费结算', '必填信息不可为空', 'info');
			  }
	};	

  </script>
  <body class="easyui-layout">
    <form action="" method="post"  id="Regform">
 	<table class="tableclass">
			<tr>
					<td>			
					<font color="red" style="margin-right:10px">*</font>付款方式：</td>
					<td class="td2" colspan="3">	
					<input type="radio" name="type" value="1"  style="width:14px" onclick="xj(this)" checked/><label style="margin-left: 10px">现金</label>
					<input type="radio"  name="type" value="2"  style="width:14px" onclick="sk(this)"/><label  style="margin-left: 10px">转账</label>
					<input type="radio"  name="type" value="3"  style="width:14px" onclick="zp(this)"/><label  style="margin-left: 10px">支票</label>
					<input type="radio"  name="type" value="4"  style="width:14px" onclick="xj(this)"/><label  style="margin-left: 10px">其他</label>				
					</td> 
				</tr>
			<tr id="khh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>开户行:</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="khbank"	style="width:120px;" 	name="khbank"></td>	
				<td><font color="red" style="margin-right:10px">*</font>开户名:</td><!--  style="color: blue;"-->
				<td colspan="1" class="td2"><input  id="usernames"		style="width:120px;" name="usernames"></td>			
			</tr>						
			<tr id="yhkh"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>银行卡号:</td><!--  style="color: blue;"-->
				<td colspan="3" class="td2"><input  id="kahao"	style="width:200px; height:24px" 	name="kahao"></td>				
				<tr>
				<tr id="zp"  style="display: none;">
				<td ><font color="red" style="margin-right:10px">*</font>支票编号:</td><!--  style="color: blue;"-->
				<td colspan="3" class="td2"><input  id="zpnum"	style="width:160px;height:24px" 	name="zpnum"></td>								
			</tr>	
			<tr>
				<td >结算备注:</td><!--  style="color: blue;"-->
				<td colspan="3" class="td2">
				<textarea class="easyui-textarea" id="remarks_fee1"
						cols="30" rows="2" name="remarks_fee1"></textarea></td>
			</tr>			
			</table>
		  </form>	
  </body>
</html>