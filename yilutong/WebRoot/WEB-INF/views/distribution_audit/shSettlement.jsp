<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>配送费结算审核</title>
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
  var pids=[];
 	pids.push(pid);
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
  		$.ajax({
  		  	url: 'distribu.do?method=getSettlout',
  		  	 data:{id:pids.join(",")
  		  	 },
  		  	success:function(data){
 		  		/* $('#Editform').form('load', data); */
 		  	data.all_money=parseFloat(data.all_money)-parseFloat(data.payment_fu.split(",")[1]);
  		  	data.receivable_fee=parseFloat(data.payment_fu.split(",")[0])-parseFloat(data.payment_fu.split(",")[1]); 	
 		  	$('#Editform').form('load', data);
  		  	}
  		}); 
  	});

  	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
 	
 	var submitFormEdit= function($dialog, $grid, $pjq, $mainMenu) {	
 	 if($("#Editform").validationEngine('validate')){
 	 //可提交
		$pjq.messager.confirm('配送费结算','确定要提交吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'distribu.do?method=settlementYfTG',
		  			data:{
		  			ids:pids.join(","),
		  			notes:$("#remarks").val()
		  			},/* $('#Editform').serialize() */
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('结算审核','运单配送费结算审核通过成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('结算审核', '必填信息不可为空', 'info');
			  }
	};
	
	var submitForm= function($dialog, $grid, $pjq, $mainMenu) {
 	 if($("#Editform").validationEngine('validate')){
 	 //可提交
		$pjq.messager.confirm('配送费结算','确定要提交吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'distribu.do?method=settlementYfBH',
		  			data:{
		  			ids:pids.join(","),
		  			notes:$("#remarks").val()
		  			},/* $('#Editform').serialize() */
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('结算审核','运单配送费结算审核驳回成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('结算审核', '必填信息不可为空', 'info');
			  }
	};
	
  </script>
  <body>
  	<form method="post" id="Editform">
  	<input type="hidden" id="shiping_order_id" name="shiping_order_id"/>
   	<fieldset>
  	<table class="tableclass">
				<tr>
				<th colspan="4">结算审核</th>
				</tr>
		<tr>
	 	<td><font color="red" style="margin-right:10px">*</font>协议单号:</td>
			<td class="td2">
				<input type="text" readonly="true" name="agreement_number" />
	      	</td>
			<td><font color="red" style="margin-right:10px">*</font>应付配送费:</td>
			<td class="td2">
				<input type="text" class="validate[required]" 	readonly="true" id="price" name="all_money" />
	      	</td>
	    </tr>
	    <tr>			
			<td><font color="red" style="margin-right:10px">*</font>实收配配送费:</td>
			<td class="td2">
				<input type="text" class="validate[required]" readonly="true" id="price1" name="receivable_fee" />
	      	</td>
	      	<td>			
					<font color="red" style="margin-right:10px">*</font>付款方式：</td>
					<td class="td2" colspan="3">	
					<input type="radio" name="paytypes" disabled="disabled" value="1"  style="width:14px" onclick="xj(this)" /><label style="margin-left: 10px">现金</label>
					<input type="radio"  name="paytypes" disabled="disabled" value="2"  style="width:14px" onclick="sk(this)"/><label  style="margin-left: 10px">油卡</label>
					<br><input type="radio"  name="paytypes" disabled="disabled" value="3"  style="width:14px" onclick="zp(this)"/><label  style="margin-left: 10px">转账</label>
									
					</td> 	      
	    </tr>
	    <tr>
	    <td>结算备注:</td>
			<td colspan="3" class="td2">
					<textarea class="easyui-textarea" readonly="true" cols="48" rows="2"  name="settlyf_remaks"></textarea>
			</td>
	    
	    </tr>
	    	<tr>
			<td>提审备注:</td>
			<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="48" readonly="true"  rows="3" name="settlyf_th_remaks"></textarea>
			</td>
	    </tr>
	    <tr>
			<td>审核备注:</td>
			<td colspan="3" class="td2">
					<textarea class="easyui-textarea" cols="48" rows="2"  id="remarks" name="settlyf_sh_remaks"></textarea>
			</td>
	    </tr>
		</table>
    </fieldset>
	</form>
  </body>
</html>
