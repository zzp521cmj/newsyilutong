<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>确定车辆</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
  <%String flg = (String)request.getAttribute("flg"); %>
  <script type="text/javascript">
	var grid;
	var dialog;
	var p=0;
 	$(function(){
 	var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:85});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:62});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
  		grid=$("#dg").datagrid({
  			url : 'temvehicle.do?method=getDemand_releasePage&determine=0',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : true,
  			//selectOnCheck : true,
  			//checkOnSelect :true,
  			columns : [[
  				//{field : 'ck',checkbox : true},
  				//{field : 'demandReleaseId',title : '操作',width : 60,align:'center'},
  				{field : 'zhuangCity',title : '装货城市',width : 80,align:'center'},
  				{field : 'xieCity',title : '卸货城市',width : 80,align:'center'},
  				{field : 'loadingAddress',title : '装货地址',width : 140,align:'center'},
  				{field : 'unloadingAddress',title : '装货地址',width : 140,align:'center'},
  				{field : 'truckTypeId',title : '货车类型',width : 60,align:'center',
  					formatter:function(val,row,index){
		        		if(val == 0){
							return "厢车"; 
						}else if(val == 1){
							return "高栏";
						}else if(val == 2){
							return "平板";
						}
		        	}
  				},
  				{field : 'ranges',title : '方位(m³)',width : 70,align:'center'},
  				{field : 'weight',title : '重量(T)',width : 70,align:'center'},
  				{field : 'models',title : '车长(m)',width : 70,align:'center'},
  				{field : 'contactInformation',title : '联系方式',width : 80,align:'center'},
  				{field : 'remarks',title : '备注',width : 100,align:'center'},
  				{field : 'createTime',title : '创建时间',width : 130,align:'center',
  				formatter:function(val,row,index){
		        	if(val!=null){
						return val.substring(0,19); 
					}
		        }},
  				{field : 'publisher',title : '发布人',width : 60,align:'center'},
  				{field : 'determine',title : '是否确定',width : 60,align:'center',
  					formatter:function(val,row,index){
  					var da;
  						$.ajax({
						type : "POST",
						async : false,
						url : 'temvehicle.do?method=getDetermine',
						data : {
							id : row.demandReleaseId
						},
						success : function(data) {
							da = data.flag;
						}
					});
						if(da){
						return "是";
						}else{
						return "否";
						}  					
  					
  					}
  				}
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  		});
  		
  		//获取城市检索列表   装货地址
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
		
		//获取城市检索列表   卸货地址
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
		});
  	});
  	
  	
  	//查询
  	function searchDemandRelease(){
		$('#dg').datagrid('load',{
			zhuang : $.trim($("#e1").select2("val")),
			xie : $.trim($("#e2").select2("val")),
			models :  $.trim(document.getElementById("car_lengthId").value),
			truckTypeId :$("#truckTypeId").combobox("getValue"),
			publisher : $.trim(document.getElementById("publisherId").value)
			
		});
  	}
  	
	//重置按钮
	function equimentRuset(){
		$("#e1").select2("val", "");
		$("#e2").select2("val", "");
		document.getElementById("publisherId").value="";
		document.getElementById("car_lengthId").value="";
		$("#truckTypeId").combobox("setValue","");
	}
	
	
	function showIcons() {
	var xx;
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
			$.ajax({
						type : "POST",
						async : false,
						url : 'temvehicle.do?method=getDetermine',
						data : {
							id : row.demandReleaseId
						},
						success : function(data) {
							xx = data.flag;
						}
					});
			if(xx){
			 $pjq.messager.alert('警告', '改需求已经确定了车辆', 'info');
			}else{
			for(var i=0;i<row.length;i++){
			   		var pid=row[i].demandReleaseId;
			}
			dialog = parent.jy.modalDialog({
				title : '车辆竞价',
				url : 'temvehicle.do?method=getEditVehicleAuction&pid=' + pid,
				width : 600,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="竞价">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
			}
		}else{
			$.$.messager.alert("确认车辆","请选择一行","info");
		}
	};
	
  </script>
    <body class="easyui-layout">
	<div region="north" title="检索条件" class="st-north" border="false" data-options="collapsible:false" style="height:62px">
		<label>装货城市：<input type="hidden" id="e1" /></label>
		<label  class="divlabel">卸货城市：<input type="hidden" id="e2" /></label>
		<label  class="divlabel">车长：<input type="text" class="search-text"  id="car_lengthId"></label>		
		<a class="easyui-linkbutton"  onclick="searchDemandRelease()" data-options="iconCls:'icon-search'">查询</a>
		<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button"  href="javascript:void(0)" state="close">更多条件</a>
		<div id="searchInfoId" style="display: none">
			<label>箱型：
		</label>
			<select class="easyui-combobox"  id='truckTypeId' name="truckTypeId" style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">厢车</option>
					<option id="" value="1">高栏</option>
					<option id="" value="2">平板</option>
				</select>
		<label  class="divlabel">发布人：</label><input type="text" class="search-text"  id="publisherId" >
				<!-- <label>是否确定：
			<select class="easyui-combobox"  id='determine'  style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">未确定</option>
					<option id="" value="1">确定</option>
				</select>
		</label> -->
				</div>
		
	</div>
   	 <div region="center" title="发布信息" region="center" style="background: #eee; overflow-y:hidden">
	 	<table id="dg"></table>
	 </div>
	<!-- ========================================================================================================= -->
	<div id="tb">
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="" onclick="showIcons()" data-options="iconCls:'icon-add',plain:true">竞价</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
	</div>
	<input id="functionname"type="hidden" value=${function}>
<!--     <div id="updateDialog" class="easyui-dialog" title="操作" style="width:690px;height:490px;"  data-options="iconCls:'icon-edit',resizable:true,modal:true,collapsible:true,closed:true,buttons:'#buttons'">  -->
<!-- 		<form id="ff" method="post"> -->
<!-- 		<input type="hidden" name="demandReleaseId"> -->
<!-- 		<table class="tableclass"> -->
<!-- 			<tr> -->
<!-- 				<td>价格：</td> -->
<!-- 				<td class="td2"><input type="text" class="search-text" name="price" id="" /></td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 		<div id="buttons"> -->
<!-- 		<input type="button" onclick="updateplaninfo()" value="修改" class="btncss"> -->
<!-- 		</div> -->
<!-- 		</form> -->
<!-- 	</div> -->
  </body>
</html>
