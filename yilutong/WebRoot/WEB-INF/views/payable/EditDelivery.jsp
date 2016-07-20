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
    <title>费用核销</title>
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
  <%String flg = (String) request.getAttribute("flg"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
  		$(function(){
  			$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		var pid='<%=flg%>';
			
		$.ajax({
			url : 'payable.do?method=getUpdate',
			data : {
				id : pid,
			},
			
			success : function(data) {
				$('#Regform').form('load', data);
				
			}
		});
$("#pid").val(pid);

		$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "incomedp.do?method=getPlateNumber",
				   data: {phones:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});;
					});
			        query.callback(data);
				   }
				});
		    }
		}).on("select2-selecting", function(f) {
			$("#car").val(f.object.id);
			$("#carnum").val(f.object.text);				
		});	 		  	
  	}); 		
  var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
  
		if($("#Regform").validationEngine('validate')){
		$pjq.messager.confirm('费用核销', '确定要核销吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'payable.do?method=update',
					data : 
					$('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag ==false) {
							$pjq.messager.alert('费用核销', '费用核销成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						};
					}
				});   
			} 
		});
		} else{
			    $pjq.messager.alert('费用核销', '必填信息不可为空', 'info');
			  }
	};

  </script>
  <body class="easyui-layout">
    <form action="" method="post" id="Regform">
    <input type="hidden"   name="direction" >
    <input type="hidden"   name="source" >
    <input type="hidden"   name="project" >
    <input type="hidden"   name="happen" >
    <input type="hidden"   name="other_zhichu" >
    <input type="hidden"   name="fee_date" >
	<input type="hidden"   name=send_fee1 >
		<input type="hidden" id="pid"  name="shiping_order_id">
 	<table class="tableclass">
			<tr>
					<td><font color="red" style="margin-right:10px">*</font>付款方式：</td>
					<td class="td2" colspan="3">	
					<input type="radio" name="write_off1" value="1"   style="width:14px"/><label style="margin-left: 10px">现金</label>
					<input type="radio"  name="write_off1" value="0"  style="width:14px" /><label  style="margin-left: 10px">刷卡</label>
					</td> 
				</tr>
				<tr>
				<td style="color: blue;">备注:</td>
				<td colspan="3" class="td2"><textarea class="easyui-textarea" id="Send_remarks1"
						cols="40" rows="2" name="Send_remarks1"></textarea></td>
			</tr>				
			</table>
    		
				
		  </form>	
  </body>
</html>