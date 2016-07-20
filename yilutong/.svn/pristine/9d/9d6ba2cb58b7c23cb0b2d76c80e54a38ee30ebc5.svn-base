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

<title>合同信息</title>
<meta charset="utf-8">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="./bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
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
				 var $target = $('input,textarea,select');
		 $target.bind('keydown', function (e) {
            var key = e.which;
            if (key == 13) {
                e.preventDefault();
                var nxtIdx = $target.index(this) + 1;
                    $target.eq(nxtIdx).focus();
            }
        });
		$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "agreement.do?method=searchAgreementNumber",
				   data: {number:query.term},   //传递你输入框中的值
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
		});
		$("#linId").select2({
		    placeholder: "请输入线路编码",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "agreement.do?method=searchAgreementLinId",
				   data: {linbm:query.term},   //传递你输入框中的值
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
		    
		});
		
		var pid='<%=flg%>';
		$.ajax({
			url : 'agreement.do?method=getUpdateAgreement',
			data : {
				agreement_id : pid
			},
			success : function(data) {
			if(data.linbh==null){
			data.linbh='';
			}
				//alert(data.plate_number);
				//$("#carid").select2('data',{id:data.travel_card_id,text:data.plate_number});
				$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number);
				$("#linId").prev("div").find("span.select2-chosen").text(data.linbh);
				$('#Regform').form('load', data);
			}
		});
	});
	
	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		var startDate=document.getElementById("startDate").value;
  			var endDate=document.getElementById("endDate").value;
  			if(startDate>endDate){  			
  			$pjq.messager.alert('修改合同', '合同起始时间大于结束时间', 'info');
  			}else{		
		if($("#Regform").validationEngine('validate')&&($("#carid").val()!=""))
		{
			$pjq.messager.confirm('修改合同', '确定要修改吗?', function(r) {
			if (r) {
				$.ajax({
					type : "POST",
					url : 'agreement.do?method=updateAgreement',
					data : $('#Regform').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$pjq.messager.alert('修改合同', '合同修改成功', 'info');
							$dialog.dialog('close');
							$grid.datagrid('reload');
						}
						;
					}
				});
			}
		});
		 }else if($("#carid").val()==""){
			    $pjq.messager.alert('修改合同', '车牌号不可为空', 'info');
			  }
			  else{
			    $pjq.messager.alert('修改合同', '必填信息不可为空', 'info');
			  }
		}
	};
</script>
<body style="padding: 0px;margin:0px;">
	<form action="" method="post" id="Regform">
		<input type="hidden" name="agreementId" />
		<fieldset>
			<table class="tableclass">
				<tr>
					<th colspan="4">基本信息</th>
				</tr>	
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>合同号:</td>
					<td class="td2"><input type="text"class="validate[required]" readonly="true" id="" name="agreementNumber"   />
					</td>
					<td><font color="red" style="margin-right:10px">*</font>合同名:</td>
					<td class="td2"><input type="text" class="validate[required]" id=""
						name="agreementName" />
					</td>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>甲方（托运方）:</td>
					<td class="td2"><input id="cc" type="text" class="validate[required]"
						name="owner" />
					</td>

					<td><font color="red" style="margin-right:10px">*</font>乙方（承运方）:</td>
					<td class="td2"><input id="fxz" type="text" class="validate[required]" 
						editable="false" name="side" />
					</td>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>车牌号码:</td>
					<td class="td2"><input type="hidden"  name="carId" readonly="true"style="width:150px" id="carid" >
					</td>

					<td>承运路线:</td>
					<td class="td2"><input type="hidden" id="linId" style="width:150px" name="route" />
					</td>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>履约保证金:</td>
					<td class="td2"><input id="fxz" type="text" value="0.00"class="validate[required,custom[number],custom[dd],mix[0],max[999999]]"
						editable="" name="money" />
					</td>
					<td>签订地点:</td>
					<td class="td2"><input type="text" id=""
						name="address" /></td>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>合同时间:</td>
					<td class="td2"><input  class="Wdate validate[required]"  readonly="readonly" id="startDate"onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" id=""
						name="agreementStartDate">
					</td>
					<td><font color="red" style="margin-right:10px">*</font>到:</td>
					<td class="td2"><input   class="Wdate validate[required]"  readonly="readonly" id="endDate" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" id=""
						name="agreementEndDate"/>
					</td>
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