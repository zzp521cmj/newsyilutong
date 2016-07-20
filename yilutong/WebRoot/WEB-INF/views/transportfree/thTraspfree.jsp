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
  <%String[] flg = (String[])request.getAttribute("pid");
  %>
  <script type="text/javascript">
  var pid=[];
  	$(function(){
  		$("#Editform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
			<%for(int i=0;i<flg.length;i++){
				%>
				pid.push('<%=flg[i]%>');
				<%
				}%>  
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
 	
 	 if($("#Editform").validationEngine('validate')&&$('#did').combotree('getValue')!=null&&$('#did').combotree('getValue')!=''){
 	 //可提交
		$pjq.messager.confirm('运费调整','确定要提交吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'transpfree.do?method=delTransportfree',
		  			data:{
		  			dds:pid.join(","),
		  			did:$.trim($("#did").combotree("getValue")),
		  			notes:$("#remarks").val()
		  			},/* $('#Editform').serialize() */
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('运费调整','运单运费调整提审成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('运费调整', '请选择提审部门', 'info');
			  }
	};
	
  </script>
  <body>
  	<form method="post" id="Editform">
  	<input type="hidden" id="shiping_order_id" name="shiping_order_id"/>
   	<fieldset>
  	<table class="tableclass">
				<tr>
				<th colspan="4">调整提审</th>
				</tr>
		<tr>
		<td><font color="red" style="margin-right:10px">*</font>审核部门:</td>
			<td class="td2">
				<input type="text" class="validate[required]"  id="did"  name="did" />
	      	</td>
	    </tr>
	    	<tr>
			<td>提审备注:</td>		
			<td colspan="1" class="td2">
					<textarea class="easyui-textarea" cols="25" rows="2"  id="remarks" name="remarks"></textarea>
	    </tr>
		</table>
    </fieldset>
	</form>
  </body>
</html>
