<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>新增派车单</title>
   	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
  </head>
  <script type="text/javascript">
  var dialog;
 	$(function(){
 		$("#Regform").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
				  $("#line").select2({
    		 placeholder: "请选择线路",	//默认文本框显示信息
   			 minimumInputLength: 1,	//最小输入字符长度
   			 multiple: false,				//设置多项选择，false则只能单选
   			 allowClear:true,
    		 maximumSelectionSize: 5,
    		 query: function (query) {
			    	$.ajax({
					   type: "POST",
					   url: "temvehicle.do?method=getLine",
					   data: {search:query.term
					  },   //传递输入框中的值
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
			    /* 根据车牌号查询 */
  		  $("#number_search").select2({
    		 placeholder: "请选择车辆",	//默认文本框显示信息
   			 minimumInputLength: 1,	//最小输入字符长度
   			 multiple: false,				//设置多项选择，false则只能单选
   			 allowClear:true,
    		 maximumSelectionSize: 5,
    		 query: function (query) {
			    	$.ajax({
					   type: "POST",
					   url: "travel.do?method=getCarNum",
					   data: {search:query.term},   //传递输入框中的值
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
		/* //获取城市检索列表
	    $("#e1").select2({
		    placeholder: "输入城市检索",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,		
		    multiple: false,		//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
		    query: function (query) {
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
		    }
		});
		//卸货城市
		$("#e2").select2({
		    placeholder: "输入城市检索",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,		
		    multiple: false,		//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
		    query: function (query) {
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
		    }
		}); */
 	});
 	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
 	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
 		if($("#Regform").validationEngine('validate')&&($("#line").val()!="")){
 		//可提交
		$pjq.messager.confirm('新增发布','确定要新增吗?',function(r){  
	    	if (r){
	    	var dingdanid = $("#dingdanhao").val();
				$.ajax({
					type: "POST",
		  			url:'paichedan.do?method=addDemand_release',
		  			data:$('#Regform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('新增发布','新增发布成功','info');
									   $grid.datagrid('reload');
									   $dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
		}/* else if(($("#e1").val()=="")||($("#e2").val()=="")){
				 $pjq.messager.alert('新增发布', '装货城市、卸货城市信息不可为空', 'info');
		} */else if($("#line").val()==""){
			$pjq.messager.alert('修改发布', '绑定线路不能为空', 'info');
		}else{
			    $pjq.messager.alert('新增发布', '必填信息不可为空', 'info');
			  }
	};
	function addDingdan(){
	var xx = $("#dingdanhao").val();
	dialog = parent.jy.modalDialog({
				title : '绑定订单',
				url : 'paichedan.do?method=getdingdan&&xxx='+xx,
				width : 800,
				height:520,
				buttons : [{
					text : '<input type="button" class="btncss" value="保存">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormdingdan(dialog,parent.$);
					}
				}] 
			});
	
	
	}
	function LineChange(){
		$.ajax({
			type : "POST",
			async : false,
			url : 'temvehicle.do?method=getLineCity',
			data : {
				id : $("#line").val()
			},
			success : function(data) {
			if(data==""||data==null){
				$("#zhuangLabel").text("");
				$("#xieLabel").text("");
				$("#e1").val("");
				$("#e2").val("");
			}else{
				$("#zhuangLabel").text(data.scity);
				$("#xieLabel").text(data.ecity);
				$("#e1").val(data.scity);
				$("#e2").val(data.ecity);
			}
				
			}
		});
	}
  </script>
   <body>
  	<form action="" method="post" id="Regform">
   	<fieldset>
		<table class="tableclass">
				<tr>
				<th colspan="4">新增需求</th>
				</tr>
		<tr>
		<td><font color="red" style="margin-right:10px">*</font>绑定线路</td>
   				<td class="td2"><input type="hidden"  style="width:128px;"id="line" name="line_id" onchange="LineChange()"/>
   				
   			</td>
   			<td>货车类型:</td>
		    <td class="td2">
		    <select class="easyui-combobox"  id='sect' name="truckTypeId" style="width:128px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">厢车</option>
					<option id="" value="1">高栏</option>
					<option id="" value="2">平板</option>
				</select>
	      	</td>
		</tr>
	  	<tr>
			<td><font color="red" style="margin-right:10px">*</font>装货城市:</td>
			<td class="td2">
				<input type="hidden" id="e1" name="zhuangCity" />
				<label id="zhuangLabel"></label>
				<!-- <input name="cityOfLoadingId" id = "city1"style="width: 248px" readonly="readonly"/> -->
			</td>
		
			<td><font color="red" style="margin-right:10px">*</font>卸货城市:</td>
			<td class="td2">
			<label id="xieLabel"></label>
				<input type="hidden" id="e2" name="xieCity"/>
	      	<!-- <input name="unloadingCityId"  id ="city2" style="width: 248px" readonly="readonly"/> -->
	      	</td>
	    </tr>
	   	<tr>
	   	 <td><font color="red" style="margin-right:10px">*</font>车牌号:</td>
	   	 <td class="td2">
	   	 <input type="hidden" id="number_search" name="car_id"style="width: 140px"/>
	   	 </td>
		    <td><font color="red" style="margin-right:10px">*</font>体积:</td>
		    <td class="td2" >
			 <input id="fxz" type="text"class="validate[required]" style="width: 128px" name="ranges" /><label style="margin-left: 4px">立方</label>
	      	</td>
		 </tr>
		<tr>     	
		    <td  ><font color="red" style="margin-right:10px">*</font>重量:</td>
		    <td class="td2">
		        <input type="text" id = "zhongliang" class="validate[required]" name="weight" style="width: 128px"><label style="margin-left: 4px">吨</label>
		    </td>
		    <td ><font color="red" style="margin-right:10px">*</font>车长:</td>
		    <td class="td2">
		    	<input type="text" id="carLength" class="validate[required]" name="models" style="width: 128px"/><label style="margin-left: 4px">米</label>
		    </td>
		 </tr>
		<tr>
			<td><font color="red" style="margin-right:10px">*</font>联系方式:</td>
			<td class="td2">
		        <input type="text"class="validate[custom[phone]]" style="width: 128px" name="contactInformation" />
		    </td>
			<td><font color="red" style="margin-right:10px">*</font>绑定订单:</td>
			<td class="td2" colspan="3" style="height:40px">
				 <a href="javascript:void(0)" onclick="addDingdan()"><img src="./images/dingdan.png" style="height:35px;"></a><font id="font" color="blue">未绑定订单</font>
			</td>
	    </tr>
		<tr>
			<td><font color="red" style="margin-right:10px">*</font>装货地址:</td>
			<td class="td2" colspan="3" style="height:60px">
				 <textarea class="validate[required]" name="loadingAddress" style="width:414px;height:40px"></textarea>
			</td>
	    </tr>
	    <tr>
	    	<td><font color="red" style="margin-right:10px">*</font>卸货地址:</td>
			<td class="td2" colspan="3" style="height:60px">
	      	<textarea  class="validate[required]" name="unloadingAddress" style="width:414px;height:40px"></textarea>
	      	</td>
	    </tr>
	    <tr>
			<td>备注:</td>
		    <td class="td2" colspan="3" style="height:60px">
		        <textarea name="remarks" style="width:414px;height:40px"></textarea>
		    </td>
		</tr>
		
	</table>
    </fieldset>
    <input id="dingdanhao" type="hidden" name="ids">
	</form>
	
  </body>
</html>
