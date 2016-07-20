<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'phoneBooking.jsp' starting page</title>
    
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
  	String flg = (String) request.getAttribute("flg");
  	String[] flgs= flg.split(",");
   %>
   <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var pid=[];
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });		
		
		<%for(String s:flgs){
		%>
		pid.push('<%=s%>');
		<%
		}%>;
 		  	
  	}); 		
  var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
  		var tiem=$("#time_appointment").val();
  		//alert(tiem);
  		var maeks=$("#appointment_remarks").val();
	if($("#Regform").validationEngine('validate')){
		$pjq.messager.confirm('电话预约', '确定预约吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'shipOrder.do?method=updatePhone',
					data : 
					{del:pid.join(","),
					tiem:tiem,
					maeks:maeks				
					},
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('电话预约', '预约成功！', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		} else{
			    $pjq.messager.alert('电话预约', '必填信息不可为空', 'info');
			  }
	};

  </script>
  <body class="easyui-layout">
    <form action="" method="post" id="Regform">
        <input type="hidden" id="pid"  name="shiping_order_id">
 	    <table class="tableclass">
	      <tr>
              <td >配送时间:</td>
			  <td  class="td2"><input  class="Wdate validate[required]" onfocus="WdatePicker({isShowWeek:true})" id="time_appointment" name="time_appointment" /></td>
		  </tr>
		  <tr>
	          <td >配送备注:</td>
			  <td colspan="3" class="td2">
			  <textarea class="easyui-textarea" cols="45" rows="2" id="appointment_remarks" name="appointment_remarks"></textarea></td>
		  </tr>				
		</table>
     </form>	
  </body>
</html>
