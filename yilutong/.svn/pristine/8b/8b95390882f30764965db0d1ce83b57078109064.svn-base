<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>开票处理</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
    <jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
  </head>
  <%String flg = (String)request.getAttribute("flg");
  %>
  <script type="text/javascript">
  var pid=[ ];
  	$(function(){
  		$("#Editform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		<%-- <%for(int i=0;i<flg.length;i++){
				%>
				pid.push('<%=flg[i]%>');
				<%
				}%>  --%>
			$('#did').combotree(
						{
							url : "depn.do?method=getTree&&id=",
							width : 150,
							onBeforeLoad : function(node, param) {

								if (node == null) {
									$('#did').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {

									$('#did').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
  	/* 	$.ajax({
  		  	url: 'vehicleAuction.do?method=getSelectVehicle_auction',
  		  	data:{pid:pid},
  		  	success:function(data){
  		  		document.getElementById("demandReleaseId").value=pid;
 		  		$('#Editform').form('load', data);
  		  	}
  		}); */
  	});

  	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
 	
 	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
 		var pid='<%=flg%>';
 	 if($("#Editform").validationEngine('validate')){
 	 //可提交
		$pjq.messager.confirm('开票处理','确定要开票吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'receipt.do?method=disposereceipt',
		  			data:{
		  			pid:pid,
		  			receipt_number:$("#receipt_number").val(),
		  			remarks:$("#remarks2").val()
		  			},/* $('#Editform').serialize() */
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('开票处理','开票成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		 }
	};
	
  </script>
  <body>
  	<form method="post" id="Editform">
  	<input type="hidden" id="shiping_order_id" name="shiping_order_id"/>
   	<fieldset>
  	<table class="tableclass">
				<tr>
				<th colspan="4">开票处理</th>
				</tr>
		<tr>
		<td><font color="red" style="margin-right:10px">*</font>开票编号:</td>
			<td class="td2">
				<input type="text" class="validate[required]"  id="receipt_number"  name="receipt_number" />
	      	</td>
	    </tr>
	    	<tr>
			<td><font color="red" style="margin-right:10px">*</font>备注:</td>		
			<td colspan="1" class="td2">
					<input class="validate[required]"  id="remarks2" name="remarks2"/>
	    </tr>
		</table>
    </fieldset>
	</form>
  </body>
</html>
