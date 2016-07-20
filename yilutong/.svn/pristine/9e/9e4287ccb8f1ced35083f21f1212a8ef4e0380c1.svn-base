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

<title>添加设备</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>

<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
<style type="text/css">

</style>
</head>
<script type="text/javascript">
	$(function(){
		 $("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-30,0'
				 });
				 /* 根据车牌号查询 */
  		 $("#carid").select2({
    		 placeholder: "请选择车辆",	//默认文本框显示信息
   			 minimumInputLength: 1,	//最小输入字符长度
   			 multiple: false,				//设置多项选择，false则只能单选
   			 allowClear:true,
    		 maximumSelectionSize: 5,
    		 query: function (query) {
			    	$.ajax({
					   type: "POST",
					   url: "equipment.do?method=getCarIdlengthAdd",
					   data: {carid:query.term},   //传递输入框中的值
					   success: function(msg){
			 		   	var msg=$.parseJSON(msg);		
			 			var data = {results: []};		
						$.each(msg,function(x,y){
							data.results.push({id: y.id, text: y.name});
						});
				        query.callback(data);
					   }
					});
			    }
			    });
	
		$('#cc').combotree({    
    		url: "depn.do?method=getTree&&id=",
    		panelHeight:100,
    		onBeforeLoad: function(node, param) {
                if (node == null) {
                    $('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
			});
	});


	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
			
			if($("#Regform").validationEngine('validate')){
	  			//可提交
	  		$pjq.messager.confirm('新增设备', '确定要新增吗?', function(r) {
			
			if (r) {
				$.ajax({
					type : "POST",
					url : 'equipment.do?method=saveEquipment',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if(msg.ans!=null&&msg.ans!=''){
							$pjq.messager.alert('新增设备', '设备号已存在', 'info');
						}else{
							if (msg.flag) {
								$pjq.messager.alert('新增设备', '设备添加成功', 'info');
								$dialog.dialog('close');
								$grid.datagrid('reload');
							}
						}
					}
				});
			}
		});
	}
			 
		
	};
</script><!--  position: fixed;样式，没有滚动条 -->
<body style="padding: 0px;margin:0px;height: 100%; ">
	<form action="" method="post" id="Regform">
		<input type="hidden" name="agreementId" />
		<fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">基本信息</th>
				</tr>	
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>设备号:</td>
					<td class="td2" style="padding-right: 10px;"><input class="validate[required]" id="" name="equipment_number"  />
					</td>
					<td>所属机构:</td>
					<td class="td2" style=""><input class="validate[required]"  name="institutions_id" id="cc" />
					</td>
				</tr>
				<tr>
					<td>车牌号:</td>
					<td class="td2" style="padding-right: 10px;"><input name="car_id" id="carid" style="width: 150px;"/>
					</td>

					<td><font color="red" style="margin-right:10px">*</font>服务到期时间:</td>
					<td class="td2" style="padding-right: 10px;"><input id="fxz" class="Wdate validate[required]" name="end_date"  readonly="readonly" onfocus="WdatePicker({isShowWeek:true})"/>
					</td>
				</tr>
				
			</table>
		</fieldset>
	</form>
</body>
	<style type="text/css">
		#xxz{
		  z-index: 2;
		  position: fixed;
		}
	</style>
</html>