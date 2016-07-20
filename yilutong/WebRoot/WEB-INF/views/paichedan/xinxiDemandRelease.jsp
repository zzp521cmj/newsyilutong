<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>编辑需求</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
  </head>
  <%String flg = (String)request.getAttribute("flg"); %>
  <script type="text/javascript">
  	$(function(){
  	/* //获取城市检索列表
	    $("#e1").select2({
		    placeholder: "输入汉字检索",	//默认文本框显示信息
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
		//卸货城市
		/* $("#e2").select2({
		    placeholder: "输入汉字检索",	//默认文本框显示信息
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
  		var pid='<%=flg%>';
  		$.ajax({
				type : "POST",
				async : false,
				url : 'temvehicle.do?method=getDemendDingdan',
				data : {
					dd : pid
				},
				success : function(data) {
					if(data==""||data==null){
					$("#font").text("未绑定订单");
					}else{
					$("#font").text("已绑定订单");
					}
				}
			});
  		$.ajax({
  		  	url: 'temvehicle.do?method=getSelectDemand_release',
  		  	data:{pid:pid},
  		  	success:function(data){
  		  		if(data.line_name!=""&&data.line_name!=null){
  		  		$("#line").prev("div").find("span.select2-chosen").text(data.line_name);
  		  		}
  		  		/* $("#e1").prev("div").find("span.select2-chosen").text(data.zhuang);
  		  		$("#e2").prev("div").find("span.select2-chosen").text(data.xie); */
 		  		$('#Editform').form('load', data);
 		  		$("#zhuangLabel").text(data.zhuangCity);
 		  		$("#xieLabel").text(data.xieCity);
  		  	}
  		});
		
  	});

  	//$dialog  关闭digkog
 	//$grid 数据显示  刷新
 	// $pjq 弹出提示
 	//$mainMenu 预留传的参数
 	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		$pjq.messager.confirm('修改发布','确定要修改吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'temvehicle.do?method=updateDemand_releaseInfo',
		  			data:$('#Editform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					$pjq.messager.alert('修改发布','修改发布成功','info');
						   	$grid.datagrid('reload');
						   	$dialog.dialog('close');
		  				};
		  			}
				});
			}
		});
	};
	function modifyDingdan(){
	var deid='<%=flg%>';
	dialog = parent.jy.modalDialog({
				title : '修改订单',
				url : 'temvehicle.do?method=getdingdan&deid='+ deid,
				width : 800,
				height:520,
				buttons : [{
					text : '<input type="button" class="btncss" value="关闭">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitxiangxiFormdingdan(dialog,parent.$);
					}
				}] 
			});
	}
  </script>
  <body>
  	<form action="" method="post" id="Editform">
  	<input type="hidden" id="" name="demandReleaseId"/>
   	<fieldset>
  	<table class="tableclass">
				<tr>
				<th colspan="4">详细信息</th>
				</tr>
	  <tr>
		<td><font color="red" style="margin-right:10px">*</font>绑定线路</td>
   				<td class="td2"><input type="hidden"  readonly="readonly" style="width:128px;"id="line" name="line_id" onchange="LineChange()"/>
   				
   			</td>
   			<td>货车类型:</td>
		    <td class="td2">
		    <select class="easyui-combobox"  readonly="readonly"  id='sect' name="truckTypeId" style="width:128px;" data-options="panelHeight : 'auto',editable:false">   
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
			</td>
		
			<td><font color="red" style="margin-right:10px">*</font>卸货城市:</td>
			<td class="td2">
			<label id="xieLabel"></label>
				<input type="hidden" id="e2" name="xieCity"/>
	      	</td>
	    </tr>
	   	<tr>
	   	 <td><font color="red" style="margin-right:10px">*</font>联系方式:</td>
			<td class="td2">
		        <input type="text"  readonly="readonly" class="validate[custom[phone]]" style="width: 128px" name="contactInformation" />
		    </td>
		    <td><font color="red" style="margin-right:10px">*</font>体积:</td>
		    <td class="td2" >
			 <input id="fxz"   readonly="readonly" type="text"class="validate[required]" style="width: 128px" name="ranges" /><label style="margin-left: 4px">立方</label>
	      	</td>
		 </tr>
		<tr>     	
		    <td  ><font color="red" style="margin-right:10px">*</font>重量:</td>
		    <td class="td2">
		        <input type="text" readonly="readonly"  id = "zhongliang" class="validate[required]" name="weight" style="width: 128px"><label style="margin-left: 4px">吨</label>
		    </td>
		    <td ><font color="red"   style="margin-right:10px">*</font>车长:</td>
		    <td class="td2">
		    	<input type="text"  readonly="readonly" id="carLength" class="validate[required]" name="models" style="width: 128px"/><label style="margin-left: 4px">米</label>
		    </td>
		 </tr>
		<tr>
			<td><font color="red" style="margin-right:10px">*</font>绑定订单:</td>
			<td class="td2" colspan="3" style="height:40px">
				 <a href="javascript:void(0)" onclick="modifyDingdan()"><img src="./images/dingdan.png" style="height:35px;"></a><font id="font" color="blue">未绑定订单</font>
			</td>
	    </tr>
		<tr>
			<td><font color="red" style="margin-right:10px">*</font>装货地址:</td>
			<td class="td2" colspan="3" style="height:60px">
				 <textarea   readonly="readonly" class="validate[required]" name="loadingAddress" style="width:414px;height:40px"></textarea>
			</td>
	    </tr>
	    <tr>
	    	<td><font color="red" style="margin-right:10px">*</font>卸货地址:</td>
			<td class="td2" colspan="3" style="height:60px">
	      	<textarea   readonly="readonly"  class="validate[required]" name="unloadingAddress" style="width:414px;height:40px"></textarea>
	      	</td>
	    </tr>
	    <tr>
			<td>备注:</td>
		    <td class="td2" colspan="3" style="height:60px">
		        <textarea  readonly="readonly" name="remarks" style="width:414px;height:40px"></textarea>
		    </td>
		</tr>
		</table>
    </fieldset>
	</form>
  		
  </body>
</html>
