<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>城市信息管理</title>
    
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./My97DatePicker/WdatePicker.js"></script>

  </head>
 	<script type="text/javascript">
 		
 		var dialog;
 		var grid;
	$(function(){
		grid = $("#dg").datagrid({
			url : 'city.do?method=getCity',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'citycode',title : '城市编号',width : 60,align:'center'},
  				{field : 'cityname',title : '城市名',width : 80,align:'center'},
  				{field : 'city_type',title : '城市类型',width : 100,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "国";
  						}else if(val==1){
  						return "省";
  						}else if(val==2){
  						return "市";
  						}else if(val==3){
  						return "县";
  						}
  					}
  				},
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
 			
 			});
 			
 			$("#aname").select2({
		    placeholder: "请输入合同名",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "city.do?method=getCityLength",
				   data: {agreementName:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data= {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});;
					});
			        query.callback(data);
				   }
				});
		    }
		    
		});	 		 
			 
 	});	
 		//查询
  	function searchCity(){
  		$("#dg").datagrid('load',{
	 	 		cityname :$.trim($("#cityname").val()),
	 	 		cityzm:$("#type").combobox("getValue"),	
	 	});	  
	 	
  	}
  	//删除
  	function deleteCity(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].citycode);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "city.do?method=deleteCity",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("城市信息删除","城市信息删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("城市信息","请选择要删除的信息","info");
  		}
  	}
  	/*
  	修改查询
  	*/
  	function getUpdateCity(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].citycode;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '城市修改',
				url : 'city.do?method=getEditCityPage&pid=' + pid,
				width : 640,
				height : 195,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("城市信息","请选择一行信息","info");
  		}	
  	}
  	//修改
  	function updateCity(){
	 var myform=document.forms[1];
  	 myform.action="city.do?method=updateCity";
  	 myform.submit();
	
	}
	
	//添加
	function addCity() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '城市新增',
			url : 'city.do?method=addCity',
/* 				 buttons :'#addbuttons'
*/
			width : 740,
			height : 450,
			buttons : [{
				//text : '<input type="button" value="保存" class="btncss"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
 	</script>
  <body class="easyui-layout">
   	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable >城市名字：</lable>
	    	 <input type="text"  class="search-text" id="cityname"  style="width:140px"  >
	    	 <lable >城市类型：</lable>
	    	<select  class="easyui-combobox" id="type"name="monitorType" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
						 <option id="" value="">全部类型</option>
							<option id="" value="1">省</option>
							<option id="" value="2">市</option>
							<option id="" value="3">县</option>
					</select>
			<a class="easyui-linkbutton" onclick="searchCity()" data-options="iconCls:'icon-search'">查询</a>
    	</div>
    	<div region="center" >
    		<table id="dg" title="城市信息"></table>
    	</div>
    	<div id="tb">		  
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"onclick="addCity()">编辑</a>
		</div>	
	<div>
		<form action="agreement.do" id="outputform" method="post">
		<input type="hidden" name="method" value="outDriverExcel">
		<input type="hidden" id="datas" name="datas">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
	</div>
  </body>
</html>
