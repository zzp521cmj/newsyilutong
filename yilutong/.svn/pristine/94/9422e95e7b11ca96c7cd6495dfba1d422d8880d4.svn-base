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

<title>自动计划表信息</title>
<meta charset="utf-8">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./My97DatePicker/WdatePicker.js"></script>
<%
	String flg = (String) request.getAttribute("flg");
%>
</head>
<script type="text/javascript">
	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
$(function(){
	 $("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
	var pid='<%=flg%>';
	if(pid!=null){
		$.ajax({
  		  	url: 'autoclassline.do?method=getUpdateAutoclassline',
  		  	data:{linnumber:pid},
  		  	success:function(data){
  		  		//var data=$.parseJSON(data);
  		  		//$("#postline").select2("data", {id:data.classline_id, text:data.classline_name});
  		  		//showpostline(data.classline_id);
  		  		//获取车牌号
  		  		/*var cars = data.plate_number ? data.plate_number.split(',') : ''; 
  		  		if(cars.length == 1){
					$("#truck_id").select2("data", {id:data.car_id, text:data.plate_number});
				}else if(cars.length > 1){
					 var morecar = [],moretruckids = [];
					$.each(cars, function(k,v){
						morecar.push({id:truckids[k], text:v});
					});
					$('#more_carnum').select2('data', morecar);
					$('#moretruckids').val(data.truckids);
					$("#moreResult span").html('已选择'+cars.length+'辆车');
					$("#moreResult").show();     
				}*/
				//$("#truck_id").select2('data',{id:data.travel_card_id,text:data.plate_number});
				if(!data.classline_name){
					$.messager.show({
					title:'修改自动计划',
					msg:'该班线已经被删除!',
					width:150,
					height:70,
					timeout:5000,
					showType:'slide'}
					);
					//$.messager.alert('修改自动计划','该班线已经被删除!','info')
					$("#postline").prev("div").find("span.select2-chosen").text(data.linname);
					$("#truck_id").prev("div").find("span.select2-chosen").text(data.lincarno);
					$('#Regform').form('load', data);
				}else{
					$("#postline").prev("div").find("span.select2-chosen").text(data.classline_name);
					$("#truck_id").prev("div").find("span.select2-chosen").text(data.lincarno);
					$('#Regform').form('load', data);
				}
  		  	}	
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
		/* 		$("#truckpk").val(f.object.truckpk);
 */	});
  		
	}
	});
	
	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')&&($("#postline").val()!="")){
			  	//可提交
			  
			  $pjq.messager.confirm('修改自动计划', '确定要修改吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'autoclassline.do?method=updateAutoclassline',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('修改自动计划', '自动计划修改成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						}
						;
					}
				});
			}
		});
		//}else if($("#truck_id").val()==""&&($("#postline").val()!="")){
			//    $pjq.messager.alert('修改自动计划', '车牌号不可为空', 'info');
			  }else if($("#postline").val()==""){
			    $pjq.messager.alert('修改自动计划', '班线不可为空', 'info');
			 // }else if($("#postline").val()==""&&($("#truck_id").val()=="")){
			 //   $pjq.messager.alert('修改自动计划', '班线车牌号不可为空', 'info');
			  }
			  else{
			    $pjq.messager.alert('修改自动计划', '必填信息不可为空', 'info');
			  }
	};
</script>
<body style="padding: 0px;margin:0px;">
	<form action="" method="post" id="Regform">
		<input type="hidden" name="linnumber" />
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
					<input type="hidden" id="postline" name="linId"style="width: 150px;"/>
					<input type="hidden" id="postlinename" name="linname">
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
		<!-- <div style="padding: 12px " align="center">
			<input type="reset" value="重置" class="btncss"
				style="margin-left: 30px" />
		</div> -->
	</form>
</body>
</html>