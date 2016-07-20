<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String id=(String)request.getAttribute("flg");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <!-- /**
 * 编辑固定车辆
 * @author lx
 */  -->
    <title>编辑车辆</title>
    
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
  <%String flg = (String)request.getAttribute("flg"); %>
  <script type="text/javascript">
	$(function(){
		$.ajax({
			url : 'TransferBox.do?method=getTransfer',
			data : {
				transferBox_id : '<%=id%>'
			},
			success : function(data) {
				$("#transferBox_id").val(data.transferBox_id);
				$("#transferBox_name").val(data.transferBox_name);
				$("#transferBox_involume").val(data.transferBox_involume);
				$("#transferBox_outervolume").val(data.transferBox_outervolume);
				$("#transferBox_inlength").val(data.transferBox_inlength);
				$("#transferBox_inwidth").val(data.transferBox_inwidth);
				$("#transferBox_inhigh").val(data.transferBox_inhigh);
				$("#transferBox_outerlength").val(data.transferBox_outerlength);
				$("#transferBox_outerwidth").val(data.transferBox_outerwidth);
				$("#transferBox_outerhigh").val(data.transferBox_outerhigh);
				$("#transferBox_Singlebearing").val(data.transferBox_Singlebearing);
				$("#transferBox_Multibearing").val(data.transferBox_Multibearing);
			}
		});
	});
	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if(true){
			$pjq.messager.confirm('修改中转箱','确定要修改吗?',function(r){   
		    	if (r){ 
					$.ajax({
						type: "POST",
			  			url:'TransferBox.do?method=editBox',
			  			data:$('#editTravel').serialize(),
			  			success:function(msg){
			  				if(msg.flag){
			  					$pjq.messager.alert('修改中转箱','修改中转箱信息成功','info');
										   $grid.datagrid('reload');
										   $dialog.dialog('close');
			  				}else{
			  				}
			  			}
					});
				}
			});
			 }else{
				    $pjq.messager.alert('编辑中转箱', '必填信息不可为空', 'info');
				  }
		};
  </script>
  <body>
    <form action="" method="post" id="editTravel">
    	<fieldset>
    	<table class="tableclass">
    		<tr>
				<th colspan="4">基本信息</th>
			</tr>
    		<tr>
	    		<td>名称</td>
	    		<input type="hidden" name="transferBox_id" id="transferBox_id">
	    		<td class="td2"><input type="text" name="transferBox_name" id="transferBox_name"/></td>
	    		<td>内容量</td>
	    		<td class="td2"><input id="transferBox_involume" name="transferBox_involume" class=""/><label style="margin-left: 4px">升</label></td>
    		</tr>
    		<tr>
    			<td>体积</td>
	    		<td class="td2"><input type="text" id="transferBox_outervolume" name="transferBox_outervolume"/><label style="margin-left: 4px">立方</label></td>
    			<td>内廊长度</td>
	    		<td class="td2"><input type="text" id="transferBox_inlength" name="transferBox_inlength"/><label style="margin-left: 4px">毫米</label></td>
	    		
    		</tr>
    		<tr>
    			<td>内廊宽度</td>
   				<td class="td2"><input class="text" id="transferBox_inwidth" name="transferBox_inwidth"/><label style="margin-left: 4px">毫米</label></td>
	    		<td>内廊高度</td>
	    		<td class="td2"><input type="text" id="transferBox_inhigh" name="transferBox_inhigh"/><label style="margin-left: 4px">毫米</label></td>
	    		
    		</tr>
    			<tr>
	    		<td>外廊长度</td>
	    		<td class="td2"><input type="text" id="transferBox_outerlength" class="" name="transferBox_outerlength"/><label style="margin-left: 4px">毫米</label></td>
	    		<td>外廊宽度</td>
	    		<td class="td2"><input type="text" id="transferBox_outerwidth" class="" name="transferBox_outerwidth"/><label style="margin-left: 4px">毫米</label></td>
    		</tr>
    		<tr>
    			<td>外廊高度</td>
   				<td class="td2"><input class="" id="transferBox_outerhigh" name="transferBox_outerhigh"/><label style="margin-left: 4px">毫米</label></td>
	    		<td>单箱承载</td>
   				<td class="td2"><input class="" id="transferBox_Singlebearing" name="transferBox_Singlebearing"/></td>
	    		
    		<tr>
    			<td>堆码承载</td>
	    		<td class="td2"><input class="" id="transferBox_Multibearing" name="transferBox_Multibearing"/></td>
    		</tr>
    	</table>
   		</fieldset>
    </form>
  </body>
</html>