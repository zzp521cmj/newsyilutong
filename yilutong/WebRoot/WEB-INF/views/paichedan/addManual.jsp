<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <title>新增竞价</title>
   	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	    <jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	
  </head>
  <script type="text/javascript">
 	$(function(){
 	  $("#Regform").validationEngine('attach', { 
			 promptPosition:'topRight:-15,0',
			 scroll:false,//不滚动
			 autoHidePrompt:true,//	是否自动隐藏提示信息
		 	 autoHideDelay:2000 //两秒
		});
 	/* $('#car').combobox({
			url : 'Manual.do?method=getCars',
			valueField : 'id',
			textField : 'text',
			panelHeight : 'auto',
			editable:false
			//width:85
		}); */
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
		
		
 	});
 	
 	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
 	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
 		 if($('#e1').val()==null||$('#e1').val()==''){
			$.messager.alert('错误','请选择装货城市','error');
			return ;
		}
		if($('#e2').val()==null||$('#e2').val()==''){
			$.messager.alert('错误','请选择卸货城市','error');
			return ;
		}
		if($("#number_search").val()==""){
		$.messager.alert('错误','请选择车牌号','error');
		}
		/* if($('#car').combobox("getValue")==null||$('#car').combobox("getValue")==''){
			$.messager.alert('错误','请选择车辆','error');
			return ;
		} */
		if($("#Regform").validationEngine('validate')){
			$pjq.messager.confirm('新增发布','确定要新增吗?',function(r){   
		    	if (r){    
					$.ajax({
						type: "POST",
			  			url:'Manual.do?method=addManual',
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
		}
	};
	function addDingdan(){
	var xx = $("#dingdanhao").val();
	dialog = parent.jy.modalDialog({
				title : '绑定订单',
				url : 'temvehicle.do?method=getdingdan&&xxx='+xx,
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
				<th colspan="4">新增手动竞价</th>
				</tr>
		<tr>
		<td><font color="red" style="margin-right:10px">*</font>绑定线路</td>
   				<td class="td2"><input type="hidden"  style="width:128px;"id="line" name="line_id" onchange="LineChange()" />
   		</td>
   		 <td><font color="red">*&nbsp;</font>选定车辆:</td>
		    <td class="td2">
		    	<input type="hidden" style="width: 150px"  name="temporary_car_id" class="search-text"id="number_search"/>
		    </td>
		</tr>
	  	<tr>
			<td><font color="red">*&nbsp;</font>装货城市:</td>
			<td class="td2">
				<input type="hidden" id="e1" name="zhuangCity" />
				<label id="zhuangLabel"></label>
			</td>
		
			<td><font color="red">*&nbsp;</font>卸货城市:</td>
			<td class="td2">
				<label id="xieLabel"></label>
				<input type="hidden" id="e2" name="xieCity"/>
	      	</td>
	    </tr>
	    <tr>     	
		    <td ><font color="red">*&nbsp;</font>价格:</td>
		    <td class="td2">
		    	<input class=" validate[required,custom[number],min[1],max[999999]]"  name="price" style="width: 150px;text-align: right;"/>
		    </td>
		    <td><font color="red" style="margin-right:10px">*</font>发布人:</td>
			<td class="td2">
				 <input class="validate[required]"  name="publisher" style="width: 150px" />
			</td>
		 </tr>
	   	<tr>
		    <td>货车类型:</td>
		    <td class="td2">
			 <select class="easyui-combobox"  id='sect' name="truckTypeId" style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">厢车</option>
					<option id="" value="1">高栏</option>
					<option id="" value="2">平板</option>
				</select>
	      	</td>
	      	
		    <td><font color="red" style="margin-right:10px">*</font>体积:</td>
		    <td class="td2" >
			 <input id="fxz" class="validate[required,custom[number],min[1],max[9999]]" style="width: 150px" name="ranges" /><label style="margin-left: 2px">立方</label>
	      	</td>
		 </tr>
		<tr>     	
		    <td  ><font color="red" style="margin-right:10px">*</font>重量:</td>
		    <td class="td2">
		        <input class="validate[required,custom[number],min[1],max[9999]]" name="weight" style="width: 150px"><label style="margin-left: 4px">吨</label>
		    </td>
		    <td ><font color="red" style="margin-right:10px">*</font>车长:</td>
		    <td class="td2">
		    	<input class="validate[required,custom[number],min[1],max[999]]" name="models" style="width: 150px"/><label style="margin-left: 4px">米</label>
		    </td>
		 </tr>
		<tr>  
		    <td><font color="red" style="margin-right:10px">*</font>联系方式:</td>
			<td class="td2">
		        <input class="validate[custom[phone]]" style="width: 150px" name="contactInformation" />
		    </td>
		    <td><font color="red" style="margin-right:10px">*</font>绑定订单:</td>
			<td class="td2" style="height:40px">
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
