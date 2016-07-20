<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>自动计划信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="./bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./My97DatePicker/WdatePicker.js"></script>

</head>
<script type="text/javascript">
	//   		function saveDriver(){
	//   			var myform=document.forms[0];
	//   			myform.action="driver.do?method=saveDriver";
	//   			myform.submit();
	//   		}
	//$dialog  关闭digkog
	//$grid 数据显示  刷新
	// $pjq 弹出提示
	//$mainMenu 预留传的参数
	$(function(){
	 $("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
	$("#postline").select2({
	    placeholder: '请选择班线',  
	    minimumInputLength: 1,  
	    multiple:false,  
	    allowClear : true,
	    //数据加载
	    query: function (query){
	      $.ajax({
				   type: "POST",
				   url: "autoclassline.do?method=searchgetClassLineLength",
				   data: {name:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});
					});
			        query.callback(data);
				   }
				});     
	    },
	}).on("select2-selecting", function(f) {	
			$("#postlinename").val(f.object.text);
			//showpostline(f.object.id);
	}); 
$("#truck_id").select2({  //自动完成
		placeholder: "请选择车辆",
		minimumInputLength: 1,  
	    multiple:false,  
	    allowClear : true,
		query: function(query) {
		 $.ajax({
				   type: "POST",
				   url: "autoclassline.do?method=searchAutoclasslineNumber",
				   data: {name:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);	
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});
					});
			        query.callback(data);
				   }
			});     
	    },
	}).on("select2-selecting", function(f) {
			$("#carnum").val(f.object.text);
			/*$("#truckpk").val(f.object.truckpk);
 */	});

	
	
	
	});
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		 if($("#Regform").validationEngine('validate')&&($("#postline").val()!="")){
			  	//可提交
			  	$pjq.messager.confirm('新增自动计划', '确定要新增吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'autoclassline.do?method=saveAutoclassline',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('新增自动计划', '自动计划添加成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						}
						;
					}
				});
			}
		});
			  }else if($("#postline").val()==""){
			    $pjq.messager.alert('新增自动计划', '班线不可为空', 'info');}
			  else{
			    $pjq.messager.alert('新增自动计划', '必填信息不可为空', 'info');
			  }
		
	};
</script>
<body style="padding: 0px;margin:0px;">
	<form action="" method="post" id="Regform">
		<input type="hidden" name="lincartype" />
		<input type="hidden" name="lincarowner" />
		<fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">基本信息</th>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>班线名称:</td>
					<td class="td2">
					<input type="hidden" id="postline"  name="linId" style="width: 150px;"/>
					<input type="hidden" id="postlinename" name="linname">
					</td>
					<td><font color="red" style="margin-right:10px">*</font>车牌号:</td>
					<td class="td2">
					<input type="hidden" id="truck_id" name="car_id" style="width: 150px;"/>
					<input type="hidden" id="carnum" name="lincarno">
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>总运费:</td>
					<td class="td2"><input type="text" class="validate[required,custom[number]]" id=""
						name="linmoney" /></td>
					<td>班线编码:</td>
					<td class="td2">
					<input type="text" id="" name="linno" />
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>