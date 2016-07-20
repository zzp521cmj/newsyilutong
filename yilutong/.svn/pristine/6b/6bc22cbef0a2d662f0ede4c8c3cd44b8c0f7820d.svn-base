<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>编辑竞价</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
    <jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
  </head>
  <%String  flg = (String)request.getAttribute("pid");
  %>
  <script type="text/javascript">
  var pid='<%=flg%>';
  	$(function(){
  		$("#Editform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
	 		<%-- 	<%for(String id:flg){
				%>
				pid.push('<%=id%>');
				alert(id)
				<%
				}%>  --%>
  	/* 	$.ajax({
  		  	url: 'vehicleAuction.do?method=getSelectVehicle_auction',
  		  	data:{pid:pid},
  		  	success:function(data){
  		  		document.getElementById("demandReleaseId").value=pid;
 		  		$('#Editform').form('load', data);
  		  	}
  		}); */
  		
	 	$("#price").val('<%=flg.split(",")[1]%>'); 
  	});

  	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
 	
 	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
 	 if($("#Editform").validationEngine('validate')){
 	 //可提交
		$pjq.messager.confirm('运费调整','确定要提交吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'transpfree.do?method=changePrice',
		  			data:{
		  			dds:pid,
		  			price:$("#price").val(),
		  			price1:$("#price1").val(),
		  			remarks:$("#remarks").val()
		  			},/* $('#Editform').serialize() */
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('运费调整','运单运费调整成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('运费调整', '必填信息不可为空', 'info');
			  }
	};
	
  </script>
  <body>
  	<form method="post" id="Editform">
  	<input type="hidden" id="shiping_order_id" name="shiping_order_id"/>
   	<fieldset>
  	<table class="tableclass">
				<tr>
				<th colspan="4">运费调整</th>
				</tr>
		<tr>
	<!-- 	<td><font color="red" style="margin-right:10px">*</font>订单号:</td>
			<td class="td2">
				<input type="text"  id="price" name="price" />
	      	</td>
			<td><font color="red" style="margin-right:10px">*</font>现调运费:</td>
			<td class="td2">
				<input type="text" class="validate[required,custom[number],max[9999999]]" id="price1" name="price" />
	      	</td>
	    </tr> -->
		<td><font color="red" style="margin-right:10px">*</font>原运费:</td>
			<td class="td2">
				<input type="text" class="validate[required,custom[number],max[9999999]]" 	readonly="true" id="price" name="price" />
	      	</td>
			<td><font color="red" style="margin-right:10px">*</font>现调运费:</td>
			<td class="td2">
				<input type="text" class="validate[required,custom[number],max[9999999]]" id="price1" name="price" />
	      	</td>
	    </tr>
	    	<tr>
			<td><font color="red" style="margin-right:10px">*</font>调整原因:</td>
			<td colspan="3" class="td2">
					<textarea class="easyui-textarea validate[required]" cols="48" rows="2"  id="remarks" name="remarks"></textarea>
	    </tr>
		</table>
    </fieldset>
	</form>
  </body>
</html>
