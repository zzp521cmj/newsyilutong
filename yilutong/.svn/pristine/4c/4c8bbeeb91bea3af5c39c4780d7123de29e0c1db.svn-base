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

<title>添加信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript"
	src="./js/select2/Company.js"></script>
</head>

<script type="text/javascript">
	
	$(function() {

	var oneid = 0;
	var twoid = 0;

	$('#start_province').combobox(
			{
				url : 'company.do?method=getNewFinalPositionCounty',
				valueField : 'id',
				textField : 'text',
				width : 120,
				editable : false,
				onSelect : function(record) {
				
					oneid = record.citye_parent_id;
					twoid=0;
					$('#start_city').combobox("clear");
					$('#start_county').combotree("clear");
					$('#start_city').combobox(
							'reload',
							'company.do?method=getNewFinalpositionCity&&citye_parent_id='
									+ oneid);
					$('#start_county').combotree('reload',
							'company.do?method=getNewFinalpositioncounty&&citye_parent_id='
							+ twoid);
				}
			});
					$('#start_city')
		.combobox(
				{
					url : 'company.do?method=getNewFinalpositionCity&&citye_parent_id='
							+ oneid,
					valueField : 'id',
					width : 120,
					textField : 'text',
					editable : false,
					onSelect : function(record) {
						twoid = record.citye_parent_id;
						$('#start_county').combotree("clear");
						$('#start_county').combotree(
								'reload',
								'company.do?method=getNewFinalpositioncounty&&citye_parent_id='
										+ twoid);
					}
				});
				
					
					$('#start_county')
		.combotree(
				{
					multiple : false,
					url : 'company.do?method=getNewFinalpositioncounty&&citye_parent_id='
							+ twoid,

				});


	var oneid1 = 0;
	var twoid1 = 0;

$('#end_province').combobox(
		{
			url : 'company.do?method=getNewFinalPositionCounty',
			valueField : 'id',
			textField : 'text',
			width : 120,
			editable : false,
			onSelect : function(record1) {
				oneid1 = record1.citye_parent_id;
				twoid1=0;
				$('#end_city').combobox("clear");
				$('#end_county').combotree("clear");
				$('#end_city').combobox(
						'reload',
						'company.do?method=getNewFinalpositionCity&&citye_parent_id='
								+ oneid1);
				$('#end_county').combotree('reload',
						'company.do?method=getNewFinalpositioncounty&&citye_parent_id='
							+ twoid1);
			}
		});
$('#end_city')
		.combobox(
				{
					url : 'company.do?method=getNewFinalpositionCity&&citye_parent_id='
							+ oneid1,
					valueField : 'id',
					width : 120,
					textField : 'text',
					editable : false,
					onSelect : function(record1) {
						twoid1 = record1.citye_parent_id;
						$('#end_county').combotree("clear");
						$('#end_county').combotree(
								'reload',
								'company.do?method=getNewFinalpositioncounty&&citye_parent_id='
										+ twoid1);
					}
				});
$('#end_county')
		.combotree(
				{
					multiple : false,
					url : 'company.do?method=getNewFinalpositioncounty&&citye_parent_id='
							+ twoid1,

				});


	$("#carid").select2({
		placeholder : "请输入车牌号", //默认文本框显示信息
		minimumInputLength : 1, //最小输入字符长度
		allowClear : true,
		multiple : false, //设置多项选择，false则只能单选
		maximumSelectionSize : 5, //最大选择个数
		query : function(query) {
			$.ajax({
				type : "POST",
				url : "incomedp.do?method=getPlateNumber",
				data : {
					phones : query.term
				}, //传递你输入框中的值
				success : function(msg) {
					var msg = $.parseJSON(msg);
					var data = {
						results : []
					};
					$.each(msg, function(x, y) {
						data.results.push({
							id : y.id,
							text : y.name
						});
						;
					});
					query.callback(data);
				}
			});
		}
	}).on("select2-selecting", function(f) {
		$("#car").val(f.object.id);
		$("#carnum").val(f.object.text);
	});
	function searchOrder() {
		$("#dg").datagrid('load', {
			id : $.trim($("#num").val()),

		/* end_date :endDate,
		name:$.trim($("#ddId").val()),//运单编号
		phone_number:$.trim($("#phone").val()),//收货人
		institution:$.trim($("#cc3").combotree("getValue")),
		type:$.trim($("#address").val()), */
		});
	}
	var pid = '';
	function xiangxiseach() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var id = row[i].shiping_order_id;
				pid = id;
			}
			$.ajax({
				url : 'incomedp.do?method=getUpdateShipOrder',
				data : {
					id : id
				},
				success : function(data) {
					if (data.plate_number == null) {
						data.plate_number = '';
					}
					//$("#sect").select2('data',{id:data.travel_card_id,text:data.plate_number});
					//$("#sect").prev("div").find("span.textbox combo").text(data.gender);
					$("#carid").prev("div").find("span.select2-chosen").text(
							data.plate_number);
					$('#Regform').form('load', data);
				}
			});
		} else {
			$pjq.messager.alert('新增中转公司', '请选中一条信息', 'info');
		}
	}
	});
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		 var poin = $("#start_province").combobox('getText');
        var city = $("#start_city").combobox('getText');
        var county = $("#start_county").combotree('getText');
          var street = document.getElementById("start_street");
 
        $("#start_area").val(poin+city+county+street.value);
         var poin1 = $("#end_province").combobox('getText');
        var city1 = $("#end_city").combobox('getText');
        var county1 = $("#end_county").combotree('getText');
           var street1 = document.getElementById("end_street");
        $("#end_area").val(poin1+city1+county1+street1.value);

        if($("#start_area").val()==null||$("#start_area").val()==""){
        	$pjq.messager.alert('新增中转公司', '请选择起始站位置', 'info');
        
        }else{
        if($("#end_area").val()==null||$("#end_area").val()==""){
        $pjq.messager.alert('新增中转公司', '请选择到达站位置', 'info');
        }else{
		if ($("#Regform").validationEngine('validate')) {
			//可提交
			$pjq.messager.confirm('中转公司信息新增', '确定要新增吗?', function(r){
				if (r) {
					$.ajax({
						type : "POST",
						url : 'company.do?method=addCompany',
						data : $('#Regform').serialize(),
						success : function(msg) {
							if (msg.flag) {
								$pjq.messager.alert('新增中转公司', '中转公司添加成功', 'info');
								$grid.datagrid('reload');
								$dialog.dialog('close');
							}
							;
						}
					});
				}
			});
		} else {
			$pjq.messager.alert('新增中转公司', '必填信息不可为空', 'info');
		}
		}
		}
	};
</script>
<body class="easyui-layout">

	<table id="dg" height="340px" title="中转公司信息"></table>
		<div region="center">
		<form action="" method="post" id="Regform">
		 <input type="hidden" id="start_area" name="start_area" >
 		 <input type="hidden" id="end_area" name="end_area" >
			<input type="hidden" name="company_id">
			<fieldset>
				<table class="tableclass">
					<tr>
						<th colspan="4">基本信息</th>
					</tr>
					<tr>
						<td><font style="color: red">* </font>承运单位:</td>
						<td class="td2"><input type="text" class="validate[required]" id="num"
							name="company_name"></td>
						<td><font style="color: red">* </font>承运地址:</td>
						<td class="td2"><input type="text" class="validate[required]"
							id="num" name="company_area"></td>
					</tr>
					<tr>
						<td><font style="color: red">* </font>起始站联系人:</td>
						<td class="td2"><input type="text" class="validate[required]" id=""
							name="start_people"></td>
						<td><font style="color: red">* </font>起始站联系电话:</td>
						<td class="td2"><input type="text"
							class="validate[required]custom[phone]" id="" name="start_phone">
						</td>
					</tr>
					<tr>
						<td><font style="color: red">* </font>起始站备用电话:</td>
						<td class="td2"><input type="text"
							class="validate[required]custom[phone]" id="" name="start_phonetoo">
						</td>
						<td><font style="color: red">* </font>创建时间:</td>
						<td class="td2">
						<input class="Wdate validate[required]"
							onfocus="WdatePicker({isShowWeek:true})" id=""
							name="company_time" />
							</td>
					</tr>
					<tr>
						<td><font style="color: red">* </font>起始站地址:</td>

						<td class="td2" colspan="3" style="height:40px" class="validate[required]"><input
							id="start_province" name="start_province">省 <input id="start_city"
							name="start_city">市 <input id="start_county"
							name="start_county">区<br/><br/>详细街道：
							<input type="text" name="start_street" id="start_street" style="width: 340px"/>
							
							</td>
					<tr />
					<tr>
						<td><font style="color: red">* </font>到达站联系人:</td>
						<td class="td2"><input type="text" 
						 class="validate[required]"
							name="end_people"></td>
							<td><font style="color: red">* </font>到达站联系电话:</td>
						<td class="td2"><input type="text"
							class="validate[required]custom[phone]"  id="" name="end_phone">
						</td>
					
					</tr>
					<tr>
						
						<td><font style="color: red">* </font>到达站备用电话:</td>
						<td class="td2"><input type="text"
							class="validate[required]custom[phone]" id="" name="end_phonetoo">
						</td>
					</tr>
					<tr>

						<td><font style="color: red">* </font>到达站地址:</td>
						<td class="td2" colspan="3" style="height:40px" > <input
							id="end_province" name="end_province" class="validate[required]">省 <input id="end_city"
							name="end_city">市 <input id="end_county"
							name="end_county">区<br/><br/>详细街道：
							<input type="text" name="end_street" id="end_street" style="width: 340px"/> 
							</td>
					</tr>
				</table>
			</fieldset>
		</form>
	</div>
</body>
</html>
