<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>车主信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  	<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/truck_cloud/"; 
 	%>
  </head>
  <script type="text/javascript">
  
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'car_owner.do?method=getCar_owner',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'carOwnerName',title : '车主姓名',width : 80,align:'center'},
  				{field : 'gender',title : '性别',width : 40,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "男";
  						}else if(val==1){
  						return "女";
  						}
  					}
  				},
  				{field : 'phoneNumber',title : '手机号',width : 90,align:'center'},
  				{field : 'cardNumber',title : '身份证号',width : 120,align:'center'},
  				{field : 'plate_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'drivingLicense',title : '驾驶证号',width : 100,align:'center'},
  				{field : 'drivingType',title : '准驾车型',width : 80,align:'center'},
  				{field : 'employmentCertifiedCard',title : '上岗证从业资格证件号',width : 140,align:'center'},				
  				//{field : 'employmentType',title : '从业类型',width : 80,align:'center'},
  				{field : 'address',title : '住址',width : 100,align:'center'},
  				{field : 'drivingRecord',title : '记录',width : 120,align:'center'},
  				//{field : 'updateDate',title : '更新日期',width : 80,align:'center'},
  				
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
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
		/*
  		select框
  	*/
		
		 $("#cname").select2({
		    placeholder: "请输入车主姓名",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    multiple: false,	//设置多项选择，false则只能单选
		    allowClear:true,		//允许清空	
		    maximumSelectionSize: 5, //最大选择个数
		    query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "car_owner.do?method=getCar_ownerLength",
				   data: {search:query.term},   //传递你输入框中的值
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
  	
		$("#phone").select2({
		    placeholder: "请输入车主电话",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "car_owner.do?method=getPhoneLength",
				   data: {phones:query.term},   //传递你输入框中的值
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
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var phone="";
  		if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			}
  		//alert($("#phone").select2("data").text);
  		$("#dg").datagrid('load',{
	 	 		car_owner_name:$.trim($("#cname").select2("val")),
	 	 		phone_number:phone,
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				//driver_name :$.trim($("#dname").val()),
  				//phone_number:$.trim($("#phone").val()),
  				driving_type:$.trim($("#drivingType").val())
	 	});	  
	 	
  	}
  	//删除
  	function deleteCar_owner(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].carOwnerId);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "car_owner.do?method=deleteCar_owner",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("车主信息删除","车主信息删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			alert("请选择要删除的信息");
  		}
  	}
  	
  	/*
  	修改查询 
  	*/
  	function getUpdateCar_owner(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].carOwnerId;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '车主修改',
				url : 'car_owner.do?method=getEditCar_ownerPage&pid=' + id,
				width : 680,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			alert("请选择一行信息");
  		}	
  	}
  	//详情查询
  	function SearchCar_owner(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].carOwnerId;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '车主修改',
				url : 'car_owner.do?method=getSearchCar_ownerPage&pid=' + id,
				width : 680,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			alert("请选择一行信息");
  		}	
  	}
  	//修改
  	function updateUser(){
	 var myform=document.forms[1];
  	 myform.action="car_owner.do?method=updateCar_owner";
  	 myform.submit();
	
	}
  	
  	//导出
  	function putoutfile(){
		var allRows = $("#dg").datagrid("getRows");
		alert(JSON.stringify(allRows));
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			colName.push(col.title);//把title列名到数组里去 
		} 
  		$("#datas").val(JSON.stringify(allRows));
  		$("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit();
  	}
  	
 	function addCar_owner() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '车主新增',
			url : 'car_owner.do?method=addCar_owner',
/* 				 buttons :'#addbuttons'
*/
			width : 680,
			buttons : [{
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
  	
  </script>
  <body class="easyui-layout">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>车主姓名:</lable>
	    	 <input type="hidden"  id="cname"  style="width:150px"  >
	    	<lable class="divlabel">手机号码:</lable>
	    	<input type="hidden"  style="width:150px"   id="phone" >
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable class="divlabel">准驾车型:</lable>
			<input type="text" class="search-text" id="drivingType" >
			<a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'">查询</a>	
    	</div>
    	<div region="center" >
    		<table id="dg" title="车主信息" ></table>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="addCar_owner()">新增</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="getUpdateCar_owner()">修改</a>
		   		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteCar_owner()">删除</a>
		 <!--   <a href="javascript:void(0)" class="easyui-linkbutton" id="getInputCar_owner" data-options="iconCls:'icon-input',plain:true"onclick="inputfile()">导入</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
 -->
		  <!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="SearchCar_owner()">详细</a>-->
		</div>
		
	<div>
		<form action="driver.do" id="outputform" method="post">
		<input type="hidden" name="method" value="outDriverExcel">
		<input type="hidden" id="datas" name="datas">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
	</div>
  </body>
</html>