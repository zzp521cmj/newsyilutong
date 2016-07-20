<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <!-- /**
 * 编辑临时车辆
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
	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="UE/ueditor.config.js"></script>
	<script type="text/javascript" src="UE/ueditor.all.min.js"></script>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
  <%String flg = (String)request.getAttribute("flg"); %>
  <script type="text/javascript">
  	$(function(){
  		$("#editForm").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
		$("#Route").select2({  //自动完成
		placeholder: "请选择路线",
		minimumInputLength: 1,  
	    multiple:true,
	    allowClear : true,
	    maximumSelectionSize: 5,
		query: function(query) {
		$.ajax({
				   type: "POST",
				   url: "temvehicle.do?method=getCity_info",
				   data: {cityinfo:query.term},   //传递你输入框中的值
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
	});
  	$('#cc3').combotree({    
    		url: "depn.do?method=getTree&&id=",    
    		width: 150,
    		onBeforeLoad: function(node, param) {
    		
                if (node == null) {
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
			}); 
  		var temporaryCarId='<%=flg%>';
  		$.ajax({
  		  	url: 'temcar.do?method=getEditTemCar',
  		  	data:{temporaryCarId : temporaryCarId},
  		  	success:function(data){
  		  		if(data.institutionId==null){
  		  		data.institutionId="";
  		  		}
 		  		$('#editForm').form('load', data);
 		  		var normalRoute = data.normalRoute ? data.normalRoute.split(',') : ''; 
  		  		var route_id=data.route_id ? data.route_id.split(',') : ''; 
 		  		if(normalRoute.length == 1){
					$("#Route").select2("data", {id:data.route_id, text:data.normalRoute});
				}else if(normalRoute.length > 1){
					var morecar = [],moretruckids = [];
					$.each(normalRoute, function(k,v){
 						morecar.push({id:route_id[k], text:v});
 					});
 					$('#Route').select2('data', morecar);
					$('#route_id').val(data.route_id);
 				}
  		  	}
  		});
  		//$("#cc3").combotree("setText",);
		/* 获取车辆来源信息 */
		$("#source_edit").combobox({
			url : 'temcar.do?method=getSource',
			valueField : 'id',
			textField : 'text',
			panelHeight : 'auto',
			editable:false
		});
		
		/* 获取车长信息 */
		$("#box_edit").combobox({
			url : 'temcar.do?method=getLength',
			valueField : 'id',
			textField : 'text',
			panelHeight : 'auto',
			editable:false
		});
  	});

  	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
 	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
 	var data=$("#Route").select2('data');
		var datastring = "";
	    $.each(data, function (key, val) {
	        datastring = datastring + val.text + ",";
	    });
	    datastring=datastring.substring(0,datastring.length-1);
	   	$("#route_id").val($('#Route').val());
		$("#route_name").val(datastring);
 	 if($("#editForm").validationEngine('validate')){
  		 //可提交
		$pjq.messager.confirm('修改车辆','确定要修改吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'temcar.do?method=updateTem',
		  			data:$('#editForm').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('修改车辆','修改车辆信息成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		}else{
			    $pjq.messager.alert('修改车辆', '必填信息不可为空', 'info');
			  }
	};
  </script>
  <body>
   <form action="" method="post" id="editForm">
   		<input type="hidden" name="temporaryCarId"/>
   		<fieldset>
			<table class="tableclass">
				<tr>
				<th colspan="4">基本信息</th>
				</tr>
   			<tr>
   				<td><font color="red" style="margin-right:10px">*</font>车牌号码</td>
   				<td class="td2"><input type="text" class="validate[required]" name="plateNumber" readonly="readonly"/></td>
   				<td><font color="red" style="margin-right:10px">*</font>手机号</td>
   				<td class="td2"><input type="text" class="validate[custom[phone],required,custom[number]]" name="tel"/></td>
   			</tr>
   			<tr>
   				<td><font color="red" style="margin-right:10px">*</font>司机姓名</td>
   				<td class="td2"><input type="text" class="validate[required]" name="userName"/></td>
   				<td><font color="red" style="margin-right:10px">*</font>身份证号码</td>
   				<td class="td2"><input type="text" class=" validate[custom[chinaId],required]" name="user_idcard"/></td>
   			</tr>
   			<tr>
   				<td>来源</td>
   				<td class="td2"><input calss="easyui-combobox" style="width:150px" name="source" id="source_edit" data-options="valueField:'id',textField:'text',url:'temcar.do?method=getSource'"/></td>
   				<td>所属机构</td>
   				<td class="td2"><input id="cc3" name="institutionId"/></td>
   			</tr>
   			<tr>
   				<td><font color="red" style="margin-right:10px">*</font>车长</td>
   				<td class="td2"><input type="text" class="validate[required,custom[number]]" id="length_add" name="carLength"/><label style="margin-left: 4px">米</label></td>
   				<td>厢型</td>
   				<td class="td2"><input calss="easyui-combobox" id="box_edit" name="boxType"/></td>
   			</tr>
   			<tr>
   				<td><font color="red" style="margin-right:10px">*</font>额定体积</td>
   				<td class="td2"><input type="text" class="validate[required,custom[number]]" name="volume"/><label style="margin-left: 4px">立方</label></td>
   				<td><font color="red" style="margin-right:10px">*</font>额定载重</td>
   				<td class="td2"><input type="text"class="validate[required,custom[number]]" name="load_s"/><label style="margin-left: 4px">吨</label></td>
   			</tr>
   			<tr>
   				<td>类型</td>
   				<td class="td2">
   					<select id="cc" class="easyui-combobox" name="registrationType" style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option value="1">PC</option>  
				</select>
   				</td>
   				<td>车辆类型</td>
   				<td class="td2">
	   				<select id="cc" class="easyui-combobox" name="carType" style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				    <option value="A">市内车</option>   
				   <option value="B">干线车</option>   
				</select>
   				</td>
   			</tr>
   			<tr>
   			<td>常跑线路</td>
   				<td class="td2"><input id="Route" type="text" class="search-text" style="width:230px;"/>
   				<input type="hidden" id="route_name" name="normalRoute">
				<input type="hidden" id="route_id" name="route_id">
   				</td>
   			</tr>
   			<tr>
   				<td>备注</td>
   				<td class="td2"  colspan="3">
   					<textarea class="easyui-textarea" cols="60" rows="2.5" name="notes">
   				
   					</textarea>
   				</td>
   			</tr>
   		</table>
   		</fieldset>
   </form>
  </body>
</html>
