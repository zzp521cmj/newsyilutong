<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<!-- /**
 * 新增固定车辆
 * @author lx
 */  -->
    <title>新增车辆</title>
    
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
	<script type="text/javascript" src="./My97DatePicker/WdatePicker.js"></script>
  </head>
  <script type="text/javascript">
  var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
	  	var name =  $("#traCarid").val();
	  	var flag;
	  	$.ajax({
							type : "POST",
							async : false,
							url : 'TransferBox.do?method=checkBoxName',
							data : {
								name : name
							},
							success : function(data) {
								flag = data.flag;
							}
						});
	  	
	  	 if($("#addBox").validationEngine('validate')&&flag!=true){
			$pjq.messager.confirm('新增中转箱','确定要新增吗?',function(r){   
		    	if (r){ 
					$.ajax({
						type: "POST",
			  			url:'TransferBox.do?method=addBox',
			  			data:$('#addBox').serialize(),
			  			success:function(msg){
			  				if(msg.flag){
			  					$pjq.messager.alert('新增中转箱','新增中转箱成功','info'),
										   $grid.datagrid('reload');
										   $dialog.dialog('close');
			  				};
			  			}
					});
				}
			});
			 }else if(flag==true){
			 	$pjq.messager.alert('新增中转箱', '重复', 'info');
			 }else{
				    $pjq.messager.alert('新增中转箱', '必填信息不可为空', 'info');
				  }
	  	};
  </script>
  <body>
    <form action="" method="post" id="addBox">
    	<fieldset>
    	<table class="tableclass">
    		<tr>
				<th colspan="4">基本信息</th>
			</tr>
    		<tr>
	    		<td>名称</td>
	    		<td class="td2"><input type="text" id ="traCarid" name="transferBox_name"/></td>
	    		<td>内容量</td>
	    		<td class="td2"><input id="cc2" name="transferBox_involume" class=""/><label style="margin-left: 4px">升</label></td>
    		</tr>
    		<tr>
    			<td>体积</td>
	    		<td class="td2"><input type="text" name="transferBox_outervolume"/><label style="margin-left: 4px">立方</label></td>
    			<td>内廊长度</td>
	    		<td class="td2"><input type="text" name="transferBox_inlength"/><label style="margin-left: 4px">毫米</label></td>
	    		
    		</tr>
    		<tr>
    			<td>内廊宽度</td>
   				<td class="td2"><input class="text" id="box_add" name="transferBox_inwidth"/><label style="margin-left: 4px">毫米</label></td>
	    		<td>内廊高度</td>
	    		<td class="td2"><input type="text" name="transferBox_inhigh"/><label style="margin-left: 4px">米</label></td>
	    		
    		</tr>
    			<tr>
	    		<td>外廊长度</td>
	    		<td class="td2"><input type="text" class="" name="transferBox_outerlength"/><label style="margin-left: 4px">毫米</label></td>
	    		<td>外廊宽度</td>
	    		<td class="td2"><input type="text" class="" name="transferBox_outerwidth"/><label style="margin-left: 4px">毫米</label></td>
    		</tr>
    		<tr>
    			<td>外廊高度</td>
   				<td class="td2"><input class="" name="transferBox_outerhigh"/><label style="margin-left: 4px">毫米</label></td>
	    		<td>单箱承载</td>
   				<td class="td2"><input class="" name="transferBox_Singlebearing"/></td>
	    		
    		<tr>
    			<td>堆码承载</td>
	    		<td class="td2"><input class="" name="transferBox_Multibearing"/></td>
    		</tr>
    	</table>
   		</fieldset>
    </form>
  </body>
</html>
