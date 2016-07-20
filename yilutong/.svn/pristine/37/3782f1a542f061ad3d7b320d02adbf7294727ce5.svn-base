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
  $("#editTravel").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
  $("#box_add").combobox({
			url : 'temcar.do?method=getLength',
			valueField : 'id',
			textField : 'text',
			panelHeight : 'auto',
			editable : false
		});
  $('#cc2').combotree({    
    		url: "depn.do?method=getTree&&id=",    
    		width: 150,
    		onBeforeLoad: function(node, param) {
    		
                if (node == null) {
                    $('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
			}); 
  		var travelCardId='<%=flg%>';
  		$.ajax({
  		  	url: 'travel.do?method=editTravel',
  		  	data:{travelCardId : travelCardId},
  		  	success:function(data){
  		  	
  		  	$('#editTravel').form('load', data.insu);
  		  	$('#editTravel').form('load', data);
			$('#editTravel').form('load', data.tran);
			
			$('#editTravel').form('load', data.reg);
			
			$('#editTravel').form('load', data.invoice);
			$('#editTravel').form('load', data.main);
			$("#phone").val(data.tels);
				$("#phonetoo").val(data.telstoo);
			$("#idid").val(travelCardId);
  		  	}
  		});
		
  	});
  
  	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
  	
  	var bumen=$("#cc2").combotree('getValues');
  	if($("#editTravel").validationEngine('validate')){
		$pjq.messager.confirm('修改车辆','确定要修改吗?',function(r){   
	    	if (r){ 
				$.ajax({
					type: "POST",
		  			url:'travel.do?method=updateTravel',
		  			data:$('#editTravel').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('修改车辆','修改车辆信息成功','info');
									   $grid.datagrid('reload');
									   $dialog.dialog('close');
		  				}else{
		  				}
		  			}
				});
			}
		});
		 }else{
			    $pjq.messager.alert('编辑车辆', '必填信息不可为空', 'info');
			  }
  	};
  	//自动填写二次维护日期
  function cDayFunc(){
  	cFunc("d");
  }
  function cFunc(who){
 	 var addDate= $dp.cal.getNewDateStr();
  	if(addDate!=''){
  	
  	 var str1=addDate; 				
				// 转换日期格式 
					str1 = str1.replace(/-/g, '/'); // "2010/08/01";
				// 创建日期对象 
					var date = new Date(str1); 
				// 加一天 
					//date.setDate(date.getMonth() +5); 
				// 没有格式化的功能，只能一个一个取 
				if((parseInt(date.getMonth()) + 6)<13){
				
				addDate1 = date.getFullYear() + '-' 
				    // 因为js里month从0开始，所以要加1 
				    + (parseInt(date.getMonth()) + 6) + '-' 
				    + date.getDate(); 
				}else{
					addDate1 = (parseInt(date.getFullYear())+1) + '-' 
				    // 因为js里month从0开始，所以要加1 
				    + ((parseInt(date.getMonth()) + 6)%12) + '-' 
				    + (parseInt(date.getDate())-1); 
				    }
				  // $("#addDate1").val(addDate1);
				   $dp.$('addDate1').value=addDate1;
		  }
  	}
  
  </script>
  <body>
    <form action="" method="post" id="editTravel">
    <input type="hidden"  id ="idid" name="travelCardId">
    	<fieldset>
    	<table class="tableclass">
    	<tr>
				<th colspan="4">基本信息</th>
			</tr>
    		<tr>    		
	    		<td><font color="red" style="margin-right:10px">*</font>车牌号</td>
	    		<td class="td2"><input type="text" class="validate[required,minSize[7],maxSize[7],custom[carnumber]]" id ="traCarid" name="plateNumber"/></td>
	    		<td><font color="red" style="margin-right:10px">*</font>所属部门</td>
	    		<td class="td2"><input id="cc2" name="departmentId"   class="validate[required]"/></td>
    		</tr>
    		<tr>
    			<td><font color="red" style="margin-right:10px">*</font>电话</td>
	    		<td class="td2"><input type="text" class="validate[custom[phone],required]"  id="phone" name="tels"/></td>
	    		<td><font color="red" style="margin-right:10px">*</font>备用电话</td>
	    		<td class="td2"><input type="text" class="validate[custom[phone],required]" id="phonetoo" name="telstoo"/></td>
	    		</tr>
    		<tr>
    			<td><font color="red" style="margin-right:10px">*</font>地址</td>
	    		<td class="td2"><input type="text" class="search-text" name="address"/></td>
    			<td><font color="red" style="margin-right:10px">*</font>厢型</td>
   				<td class="td2"><input class="easyui-combobox" id="box_add" name="boxType"/></td>
	    		</tr>
    			<tr>
	    		<td><font color="red" style="margin-right:10px">*</font>车长</td>
	    		<td class="td2"><input type="text" class="validate[required,custom[number]]" name="carLength"/><label style="margin-left: 4px">米</label></td>
	    		
    	
	    		<td>所有人</td>
	    		<td class="td2"><input type="text" class="" name="carOwner"/></td>
	    		</tr>
    		<tr>
	    		<td>身份证</td>
	    		<td class="td2"><input type="text" class="validate[custom[chinaId]]" name="user_idcard"/></td>
    		
    			<td>保险人</td>
   				<td class="td2"><input class="" name="insurer"/></td>
    		</tr>
    		<tr>
    		<td>识别代码</td>
	    		<td class="td2"><input type="text" class="search-text" name="identificationCode"/></td>
    	
    		<td>车辆类型</td>
	    		<td class="td2">
	    		 <select class="easyui-combobox"  name="carType" style="width:150px" data-options="panelHeight : 'auto',editable:false">   
				  <option value="A">市内车</option>
	   			  <option value="B">干线车</option>
				</select>
	    		</td>
	    		</tr>
    		<tr>
	    		<td>品牌型号</td>
	    		<td class="td2"><input type="text" class="search-text" name="brand"/></td>
	    		
    		
	    		<td>使用性质</td>
	    		<td class="td2"><input type="text" class="search-text" name="usingProperties"/></td>
	    	</tr>
    		<tr>
	    		<td>发动机号</td>
	    		<td class="td2"><input type="text" class="search-text" name="engineNumber"/></td>
    		
	    		<td>核定人数</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="approveNumber"/><label style="margin-left: 4px">人</label></td>
	    	</tr>
    	</tr>
    		<tr>
    		<tr>
	    		<td>核载重量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="approveWeight"/><label style="margin-left: 4px">吨</label></td>
    		
	    		<td>总重量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="carWeight"/><label style="margin-left: 4px">吨</label></td>
	    		</tr>
    		<tr>
	    		<td>整备质量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="equipmentWeight"/><label style="margin-left: 4px">吨</label></td>
    	
	    		<td>牵引总质量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="tractionWeight"/><label style="margin-left: 4px">吨</label></td>
    		</tr>
    		<tr >
    		<td >车辆类别</td>
	    		<td class="td2">
	    		<select class="easyui-combobox"  name="car_kind" style="width:150px" data-options="panelHeight : 'auto',editable:false">   
				  <option value="0">自有车辆</option>
	   			  <option value="1">外部车辆</option>
				</select></td>
    		<td >是否启用</td>
	    		<td class="td2">
	    		<select class="easyui-combobox"  name="enabled" style="width:150px" data-options="panelHeight : 'auto',editable:false">   
				  <option value="0">启用</option>
	   			  <option value="1">停用</option>
				</select></td>
				
    			</tr>
    	
    	<!-- 	
    		<tr>
				<th colspan="4">基本信息</th>
			</tr>
    		<tr>
    			<input type="hidden"  id ="idid" name="travelCardId">
	    		<td><font color="red" style="margin-right:10px">*</font>车牌号</td>
	    		<td class="td2"><input type="text" class="validate[required]" name="plateNumber" id="traCarid" readonly="readonly"/>
	    		</td>
	    		
	    		<td><font color="red" style="margin-right:10px">*</font>所属部门</td>
	    		<td class="td2"><input id="cc2"name="departmentId" class="validate[required]"/></td>
    		</tr>
    		<tr>
    		<tr>
    			<td><font color="red" style="margin-right:10px">*</font>电话</td>
	    		<td class="td2"><input type="text" class="validate[custom[phone],required]"  id="phone" name="tels"/></td>
    			<td><font color="red" style="margin-right:10px">*</font>地址</td>
	    		<td class="td2"><input type="text" class="validate[required]" name="address"/></td>
	    		
    		</tr>
    		
    		<tr>
    		<td><font color="red" style="margin-right:10px">*</font>厢型</td>
   				<td class="td2"><input class="easyui-combobox validate[required]" id="box_add" name="boxType"/></td>
	    		<td><font color="red" style="margin-right:10px">*</font>车长</td>
	    		<td class="td2"><input type="text" class="validate[required,custom[number]]" name="carLength"/><label style="margin-left: 4px">米</label></td>
	    		
    		</tr>
    		<tr>
	    		<td>所有人</td>
	    		<td class="td2"><input type="text" class="" name="carOwner"/></td>
	    		<td>身份证</td>
	    		<td class="td2"><input type="text" class="validate[custom[chinaId]]" name="user_idcard"/></td>
    		</tr>
    		<td>保险人</td>
   				<td class="td2"><input type="text" class="" name="insured"/></td>
   				<td>识别代码</td>
	    		<td class="td2"><input type="text" class="search-text" name="identificationCode"/></td>
    		</tr>
    		<tr>
    		<td>车辆类型</td>
	    		<td class="td2">
	    		<select class="easyui-combobox"  name="carType" style="width:150px" data-options="panelHeight : 'auto',editable:false">   
						<option value="A">市内车</option>
	   					<option value="B">干线车</option>
				</select>
	    		</td>
	    		<td>品牌型号</td>
	    		<td class="td2"><input type="text" class="search-text" name="brand"/></td>
	    		
    		</tr>
    		<tr>
	    		<td>使用性质</td>
	    		<td class="td2"><input type="text" class="search-text" name="usingProperties"/></td>
	    		<td>发动机号</td>
	    		<td class="td2"><input type="text" class="search-text" name="engineNumber"/></td>
    		</tr>
    		<tr>
	    		<td>核定人数</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="approveNumber"/><label style="margin-left: 4px">人</label></td>
	    		<td>核载重量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="approveWeight"/><label style="margin-left: 4px">吨</label></td>
    		</tr>
    		<tr>
	    		<td>总重量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="carWeight"/><label style="margin-left: 4px">吨</label></td>
	    		<td>整备质量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="equipmentWeight"/><label style="margin-left: 4px">吨</label></td>
    		</tr>
    		<tr>
	    		<td>牵引总质量</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="tractionWeight"/><label style="margin-left: 4px">吨</label></td>
	    		<td>是否启用</td>
	    		<td class="td2">
	    		<select class="easyui-combobox"  name="enabled" style="width:150px" data-options="panelHeight : 'auto',editable:false">   
				  <option value="0">启用</option>
	   			  <option value="1">停用</option>
				</select></td>
    		</tr> -->
    	</table>
    	</fieldset>
    	
    	<input type="hidden" name="registrationCardId"/>
    	<fieldset>
    	<table class="tableclass">
    		<tr>
				<th colspan="4">行驶证信息</th>
			</tr>
    		<tr>
	    		<td>注册日期</td>
	    		<td class="td2"><input type="text" name="registrationDate" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
	    		<td>发证日期</td>
	    		<td class="td2"><input type="text" name="travelCertificateDate" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
    		</tr>
    		<tr>
	    		<td>外廓长</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="outlineLength"/><label style="margin-left: 4px">米</label></td>
	    		<td>外廓宽</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="outlineWidth"/><label style="margin-left: 4px">米</label></td>
    		</tr>
    		<tr>
	    		<td>外廓高</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="outlineHeight"/><label style="margin-left: 4px">米</label></td>
	    		<td>内廓长</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="inlineLength"/><label style="margin-left: 4px">米</label></td>
    		</tr>
    		<tr>
	    		<td>内廓宽</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="inlineWidth"/><label style="margin-left: 4px">米</label></td>
	    		<td>内廓高</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="inlineHeight"/><label style="margin-left: 4px">米</label></td>
    		</tr>
    		<tr>
	    		<td>档案编号</td>
	    		<td class="td2"><input type="text" class="search-text" name="fileNumber"/></td>
	    		<td>车型</td>
	    		<td class="td2"><input type="text" class="search-text" name="carModel"/></td>
    		</tr>
    		<tr>
	    		<td>备注</td>
	    		<td class="td2"><input type="text" class="search-text" name="notes"/></td>
	    		<td>检查记录</td>
	    		<td class="td2"><input type="text" class="search-text" name="inspectionRecords"/></td>
    		</tr>
    	</table>
    	</fieldset>
    	
    	<input type="hidden" name="roadTransportCardId"/>
    	<fieldset>
    	<table class="tableclass">
    		<tr>
				<th colspan="4">道路运输证信息</th>
			</tr>
    		<tr>
	    		<td>道路运输证证号</td>
	    		<td class="td2"><input type="text" class="search-text" name="roadTransportCardNumber"/></td>
	    		<td>业户名称</td>
	    		<td class="td2"><input type="text" class="search-text" name="roadOwner"/></td>
    		</tr>
    		<tr>
	    		<td>经营许可证号</td>
	    		<td class="td2"><input type="text" class="search-text" name="operatingLicenseNumber"/></td>
	    		<td>吨（座）位</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="tonnage"/></td>
    		</tr>
    		<tr>
	    		<td>车宽</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="carWidth"/><label style="margin-left: 4px">米</label></td>
	    		<td>车高</td>
	    		<td class="td2"><input type="text" class="validate[custom[number]]" name="carHeight"/><label style="margin-left: 4px">米</label></td>
    		</tr>
    		<tr>
	    		<td>经营范围</td>
	    		<td class="td2"><input type="text" class="search-text" name="businessScope"/></td>
	    		<td>发证日期</td>
	    		<td class="td2"><input type="text" name="transportCertificateDate" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
    		</tr>
    		<tr>
	    		<td>核发机关</td>
	    		<td class="td2"><input type="text" class="search-text" name="issuingAuthorities"/></td>
	    		<td>车辆审验记录</td>
	    		<td class="td2"><input type="text" class="search-text" name="records"/></td>
    		</tr>
    		<tr>
	    		<td>有效期限</td>
	    		<td class="td2" colspan="3"><input type="text" class="search-text" name="validityTerm"/></td>
    		</tr>
    	</table>
    	</fieldset>
    	
    	<input type="hidden" name="temporaryCarId"/>
    	<fieldset>
    	<table class="tableclass">
    		<tr>
				<th colspan="4">注册登记证信息</th>
			</tr>
    		<tr>
	    		<td>登记机关</td>
	    		<td class="td2"><input type="text" class="search-text" name="registrationAuthority"/></td>
	    		<td>登记日期</td>
	    		<td class="td2"><input type="text" name="registration_Date" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
    		</tr>
    		<tr>
	    		<td>机动车登记编号</td>
	    		<td class="td2"><input type="text" class="search-text" name="registrationNumber"/></td>
	    		<td>车身颜色</td>
	    		<td class="td2"><input type="text" class="search-text" name="carColor"/></td>
    		</tr>
    		<tr>
	    		<td>国产/进口</td>
	    		<td class="td2">
	    			<select class="easyui-combobox"  name="made" style="width:150px" data-options="panelHeight : 'auto',editable:false">   
						<option value="">请选择</option>
	    				<option value="1">国产</option>
	    				<option value="2">进口</option>
				</select>
	    		</td>
	    		<td>发动机型号</td>
	    		<td class="td2"><input type="text" class="search-text" name="engineModel"/></td>
    		</tr>
    		<tr>
	    		<td>燃料种类</td>
	    		<td class="td2"><input type="text" class="search-text" name="fuelType"/></td>
	    		<td>排量/功率</td>
	    		<td class="td2"><input type="text" class="search-text" name="carPower"/></td>
    		</tr>
    		<tr>
	    		<td>制造厂名称</td>
	    		<td class="td2"><input type="text" class="search-text" name="manufacturerName"/></td>
	    		<td>转向形式</td>
	    		<td class="td2"><input type="text" class="search-text" name="turnForm"/></td>
    		</tr>
    		<tr>
	    		<td>轮距</td>
	    		<td class="td2"><input type="text" class="search-text" name="trackWidth"/></td>
	    		<td>轮胎数</td>
	    		<td class="td2"><input type="text" class="search-text" name="tiresNumber"/></td>
    		</tr>
    		<tr>
	    		<td>轮胎规格</td>
	    		<td class="td2"><input type="text" class="search-text" name="tiresSpecifications"/></td>
	    		<td>钢板弹簧片数</td>
	    		<td class="td2"><input type="text" class="search-text" name="steelSpringNumber"/></td>
    		</tr>
    		<tr>
	    		<td>轴距</td>
	    		<td class="td2"><input type="text" class="search-text" name="wheelbase"/></td>
	    		<td>轴数</td>
	    		<td class="td2"><input type="text" class="search-text" name="hubNumber"/></td>
    		</tr>
    		<tr>
	    		<td>车辆获得方式</td>
	    		<td class="td2"><input type="text" class="search-text" name="carAccess"/></td>
	    		<td>车辆出厂日期</td>
	    		<td class="td2"><input type="text" name="carManufacturedDate" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
    		</tr>
    		<tr>
	    		<td>发证日期</td>
	    		<td class="td2"><input type="text" name="issuanceDate" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
	    		<td>发证机关</td>
	    		<td class="td2"><input type="text" class="search-text" name="issuanceAuthority"/></td>
    		</tr>
    	</table>
    	</fieldset>
    	
    	<input type="hidden" name="invoiceId"/>
    	<fieldset>
    	<table class="tableclass">
    		<tr>
				<th colspan="4">机动车销售统一发票信息</th>
			</tr>
    		<tr>
	    		<td>开票日期</td>
	    		<td class="td2"><input type="text" name="invoiceDate" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
	    		<td>发票代码</td>
	    		<td class="td2"><input type="text" class="search-text" name="invoiceCode"/></td>
    		</tr>
    		<tr>
	    		<td>发票号码</td>
	    		<td class="td2"><input type="text" class="search-text" name="invoiceNumber"/></td>
	    		<td>购货单位</td>
	    		<td class="td2"><input type="text" class="search-text" name="buyUnits"/></td>
    		</tr>
    		<tr>
	    		<td>身份证号码</td>
	    		<td class="td2"><input type="text" class="search-text" name="idCard"/></td>
	    		<td>产地</td>
	    		<td class="td2"><input type="text" class="search-text" name="origin"/></td>
    		</tr>
    		<tr>
	    		<td>合格证号</td>
	    		<td class="td2"><input type="text" class="search-text" name="certificateNumber"/></td>
	    		<td>商检单号</td>
	    		<td class="td2"><input type="text" class="search-text" name="inspectionNumber"/></td>
    		</tr>
    		<tr>
	    		<td>进口证明书号</td>
	    		<td class="td2"><input type="text" class="search-text" name="importNumber"/></td>
	    		<td>价税合计</td>
	    		<td class="td2"><input type="text" class="search-text" name="taxTotal"/></td>
    		</tr>
    		<tr>
	    		<td>销售单位名称</td>
	    		<td class="td2"><input type="text" class="search-text" name="saleUnits"/></td>
	    		<td>电话</td>
	    		<td class="td2"><input type="text" class="search-text" name="tel"/></td>
    		</tr>
    		<tr>
	    		<td>纳税人识别号</td>
	    		<td class="td2"><input type="text" class="search-text" name="taxpayerIdentificationNumber"/></td>
	    		<td>账号</td>
	    		<td class="td2"><input type="text" class="search-text" name="account"/></td>
    		</tr>
    		<tr>
	    		<td>开户地址</td>
	    		<td class="td2"><input type="text" class="search-text" name="openingAddress"/></td>
	    		<td>开户银行</td>
	    		<td class="td2"><input type="text" class="search-text" name="openingBank"/></td>
    		</tr>
    		<tr>
	    		<td>增值税税率</td>
	    		<td class="td2"><input type="text" class="search-text" name="vatRate"/></td>
	    		<td>增值税税额</td>
	    		<td class="td2"><input type="text" class="search-text" name="vatAmount"/></td>
    		</tr>
    		<tr>
	    		<td>主管税务机关</td>
	    		<td class="td2"><input type="text" class="search-text" name="competentVatAuthorities"/></td>
	    		<td>不含税价</td>
	    		<td class="td2"><input type="text" class="search-text" name="notIncludeTax"/></td>
    		</tr>
    		
    	</table>
    	</fieldset>
    	
    	<input type="hidden" name="secondaryMaintenanceCardId"/>
    	<fieldset>
    	<table class="tableclass">
    		<tr>
				<th colspan="4">二级维护卡信息</th>
			</tr>
    		<tr>
	    		<td>维护日期</td>
	    		<td class="td2"><input  id="addDate"    name="maintenanceDate" class="Wdate" onfocus="WdatePicker({skin:'twoer',dchanging:cDayFunc})" style="width: 150px;"/>
	    		</td>
	    		<td>下次维护日期</td>
	    		<td class="td2"><input type="text" id="addDate1"name="nextMaintenanceDate" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
    		</tr>
    		<tr>
	    		<td>管理部门章</td>
	    		<td class="td2" colspan="3"><input type="text" class="search-text" name="departmentSeal"/></td>
    		</tr>
    	</table>
    	</fieldset>
    	<fieldset>
   			<table class="tableclass">
			<tr>
					<th colspan="4">交强险信息</th>
				</tr>	
   			<tr>
   				<td>保费金额</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="premiumAmountCompulsory"/></td>
   				<td>保险单单号</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceNumberCompulsory"/></td>
   			</tr>
   			<tr>
   				<!-- <td>保险期间（交强险）</td>
   				<td class="td2"><input type="text" class="search-text" name="insurancePeriodCompulsory"/></td> -->
   				<td>保险开始时间</td>
   				<td class="td2"><input type="text" name="jiaoqiangstart" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				<td>保险结束时间</td>
   				<td class="td2"><input type="text" name="jiaoqiangend" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				
   			</tr>
   			<tr>
   			<td>车船税</td>
   			<td class="td2"><input type="text" class="search-text" name="carTax"/></td>
   			</tr>
   			</table>
   			</fieldset>			
   			<fieldset>
   			<table class="tableclass">
			<tr>
					<th colspan="4">商业险信息</th>
				</tr>	
   			<tr>
   			<tr>
   				<td>承保险别</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceCategory"/></td>
   				<td>保险单单号</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceNumberBusiness"/></td>
   			</tr>
   			<tr>
   				<td>保险金额</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="premiumAmountBusiness"/></td>
   				<td>签单保费</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="signPremium"/></td>
   			</tr>
   			<tr>
   				<td>保险开始时间</td>
   				<td class="td2"><input type="text" name="shangyestart" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				<td>保险结束时间</td>
   				<td class="td2"><input type="text" name="shangyeend" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   			</tr>
   			<tr>
   				<td>签单保费合计</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="signPremiumTotal"/></td>
   			</tr>
   			</table>
   			</fieldset>
   			<fieldset>
   			<table class="tableclass">
			<tr>
					<th colspan="4">货物险信息</th>
				</tr>	
   			<tr>
				<td>保险开始时间</td>
   				<td class="td2"><input type="text" name="huowustart" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>
   				<td>保险结束时间</td>
   				<td class="td2"><input type="text" name="huowuend" class="Wdate" onfocus="WdatePicker({skin:'twoer'})" style="width: 150px;"/></td>  			
   			</tr>
   			<tr>
   				<td>保费金额</td>
   				<td class="td2"><input type="text" class="validate[custom[number]]" name="premiumAmountCargo"/></td>
   				<td>保险单单号</td>
   				<td class="td2"><input type="text" class="search-text" name="insuranceNumberCargo"/></td>
   			</tr>
   		</table>
   		</fieldset>
    </form>
  </body>
</html>