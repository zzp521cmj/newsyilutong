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

<title>司机信息</title>
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
<%
	String flg = (String) request.getAttribute("flg");
%>
</head>
<script type="text/javascript">
	$(function(){
		$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
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
				   url: "driver.do?method=getCar_idLength",
				   data: {num:query.term},   //传递你输入框中的值
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
			url : 'driver.do?method=getUpdateDriver',
			data : {
				driver_id : pid
			},
			success : function(data) {
			if(data.plate_number==null){
				data.plate_number='';
				}
				//$("#sect").prev("div").find("span.textbox combo").text(gender);
				$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number);
				$('#Regform').form('load', data);
			}
		});
	});

	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		ptype= $.trim($("#type").combobox('getValue'));
		if(ptype!=0){
		if($("#carid").val()!==""){
			plateNumber=$.trim($("#carid").select2("val"));
			carid=$("#driverid").val();
			$.ajax({
					type: "POST",
		  			url:'driver.do?method=ptype',
		  			data:{car:plateNumber
		  			},
		  			success:function(data){
		  				type=data.ptype;
		  				id=data.driverId;
		  				if((type==1||type==2)&&carid!=id){
				 			$pjq.messager.alert('修改信息', '该车辆已经有车主', 'info');
						}else{
							if($("#Regform").validationEngine('validate')){
							
								$pjq.messager.confirm('修改信息','确定要修改吗?',function(r){   
						    	if (r){    
									$.ajax({
										type: "POST",
							  			url:'driver.do?method=updateDriver',
							  			data:$('#Regform').serialize(),
							  			success:function(msg){
							  				if(msg.flag){
							  					$pjq.messager.alert('修改信息', '修改成功', 'info');
														   $dialog.dialog('close');
														   $grid.datagrid('reload');
							  				}else{
							  					$pjq.messager.alert('修改失败', '修改失败：姓名和车牌号重复', 'info');
							  				};
							  			}
									});
								}
							});
							}
						
						}
		  			}	
			});
			}else{
				 $pjq.messager.alert('修改失败', '车主车牌号不可为空', 'info');
			}
		}else{
		
		if($("#Regform").validationEngine('validate')){
	  			//可提交
		$pjq.messager.confirm('修改信息','确定要修改吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'driver.do?method=updateDriver',
		  			data:$('#Regform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('修改信息', '修改成功', 'info');
									   $dialog.dialog('close');
									   $grid.datagrid('reload');
		  				}else{
		  					$pjq.messager.alert('修改失败', '修改失败：姓名和车牌号重复', 'info');
		  				};
		  			}
				});
			}
		});
		
		}
		}
	};
</script>
<body>
	<form action="" method="post" id="Regform">
		<input type="hidden" name="driverId" id="driverid">
		<fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">基本信息</th>
				</tr>	
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>司机姓名:</td>
					<td class="td2"><input type="text" class="validate[required]" id=""
						name="driverName"></td>

					<td>性别:</td>
					<td class="td2"><select id='sect' class="easyui-combobox"  name="gender" style="width:150px"
					 data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">男</option>
							<option id="" value="1">女</option>
					</select></td>
					</tr>
				<tr>
					<td>出生日期:</td>
					<td class="td2"><input id="fxz"  class="Wdate " readonly="readonly" onfocus="WdatePicker({skin:'twoer'})"
						editable="false" name="birthday" /></td>
					<td>车牌号:</td>
					<td class="td2"><input type="hidden"  id="carid" name="carId"style="width:150px">
						</td>
						</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>联系方式:</td>
					<td class="td2"><input type="text"class="validate[custom[phone],required,custom[number]]" id=""
						name="phoneNumber" /></td>

					<td>住址:</td>
					<td class="td2"><input id="fxz"type="text"
						editable="" name="address" /> <input type="hidden" name="" id="">
					</td>
				</tr>
				 <tr>
					<td><font color="red" style="margin-right:10px">*</font>类别:</td>
					<td class="td2" colspan="3"><select  class="easyui-combobox" id="type"name="ptype" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
							<option id="p0" value="0">司机</option>
							 <option id="p1" value="1">车主</option>
							<option id="p2" value="2">司机、车主</option> 
					</select></td>
				</tr> 
			</table>
		</fieldset>

		<fieldset >
			<table class="tableclass">
			<tr>
					<th colspan="4">身份证信息</th>
				</tr>
				<tr>
					<td>民族:</td>
					<td class="td2"><input type="text" id=""
						name="cardNation" />
					</td>
					<td><font color="red" style="margin-right:10px">*</font>身份证号:</td>
					<td class="td2"><input  type="text" class="validate[required,custom[chinaId]]" id=""
						name="cardNumber" />
					</td>
					</tr>
				<tr>
					<td>签发机关:</td>
					<td class="td2"><input type="text" id=""
						name="cardIssuingAuthorityAuthority" />
					</td>
					<td>有效日期:</td>
					<td class="td2"><input class="Wdate " readonly="readonly" onfocus="WdatePicker({skin:'twoer'})"editable="false"
						name="cardValidityDate" />
					</td>
				</tr>
			</table>
		</fieldset>
		<fieldset >
			<table class="tableclass">
			<tr>
					<th colspan="4">上岗证信息</th>
				</tr>	
				<tr>
					<td>从业资格证件号:</td>
					<td class="td2"><input type="text" id=""
						name="employmentCertifiedCard" />
					</td>
					<td>从业资格类别:</td>
					<td class="td2"><input type="text" id=""
						name="employmentType" />
					</td>
				</tr>
				<tr>
					<td>初次领证日期:</td>
					<td class="td2"><input  class="Wdate " readonly="readonly" onfocus="WdatePicker({skin:'twoer'})"editable="false"
						name="employmentLicensingDate" />
					</td>
					<td>发证机关:</td>
					<td class="td2"><input type="text"  id=""
						name="employmentIssuingAuthority" />
					</td>
				</tr>
				<tr>
					<td>发证日期:</td>
					<td class="td2"><input  class="Wdate"  readonly="readonly" onfocus="WdatePicker({skin:'twoer'})" id=""
						name="employmentLicenseDate" />
					</td>
					<td>有效日期:</td>
					<td class="td2"><input class="Wdate " readonly="readonly" onfocus="WdatePicker({skin:'twoer'})"editable="false"
						name="employmentValidityDate" />
					</td>
				</tr>
			</table>
		</fieldset>

		<fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">驾驶证信息</th>
				</tr>	
				<tr>
					<td>国籍:</td>
					<td class="td2"><input type="text" id=""
						name="driverNationality">
					</td>

					<td>驾驶证号:</td>
					<td class="td2"><input id="" type="text" 
						editable="false" name="drivingLicense" />
					</td>
					</tr>
				<tr>
					<td>初次领证日期:</td>
					<td class="td2"><input id="fxz"  class="Wdate " readonly="readonly" onfocus="WdatePicker({skin:'twoer'})"
						editable="false" name="drvingLicensingDate" /></td>
					<td>有效日期:</td>
					<td class="td2"><input  class="Wdate " readonly="readonly" onfocus="WdatePicker({skin:'twoer'})"editable="false"
						name="driverLicenseDate" data-options=""></td>
						</tr>
				<tr>
					<td>准驾车型:</td>
					<td class="td2"><input type="text"id=""
						name="drivingType" /></td>

					<td>档案编号:</td>
					<td class="td2"><input id="fxz" type="text" 
						editable="" name="driverLicenseArchivesnumber"
						data-options="valueField:'id',textField:'text',url:'bug.do?method=getProject'" />
				</tr>
				<tr>
					<td>记录:</td>
					<td class="td2" colspan="3"><input type="text" style="width:400px" class="easyui-textarea"  name="drivingRecord"  />
					
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>
