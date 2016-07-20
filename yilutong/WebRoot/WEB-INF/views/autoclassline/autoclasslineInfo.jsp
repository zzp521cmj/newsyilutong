<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>自动生成计划信息管理</title>
    
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
	var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	if(fs[i]=="添加"){
		$("#tbadd").removeAttr("style");
	}else if(fs[i]=="修改"){
	$("#tbmodify").removeAttr("style");
	}else if(fs[i]=="删除"){
	$("#tbdel").removeAttr("style");
	}else if(fs[i]=="导出"){
	$("#tboutput").removeAttr("style");
	}
	}
		grid = $("#dg").datagrid({
			url : 'autoclassline.do?method=getAutoclassline',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'linname',title : '班线名称',width : 100,align:'center'},
  				{field : 'lincarno',title : '车牌号',width : 100,align:'center'},
  				{field : 'linmoney',title : '总运费',width : 100,align:'center'},
  				{field : 'linno',title : '班线编码',width : 100,align:'center'},
  				{field : 'create_time',title : '创建时间',width : 140,align:'center'},
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
 			
 			});
 			
 	$("#classlineNameId").select2({
	    placeholder: '请选择班线',  
	    minimumInputLength: 1,  
	    multiple:false,  
	    allowClear : true,
	    //数据加载
	    query: function (query){
	      $.ajax({
				   type: "POST",
				   url: "autoclassline.do?method=searchgetClassLineLength",
				   data: {name:query.term},   //传递你输入框中的值
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
		
		$("#lincarno").select2({  //自动完成
		placeholder: "请选择车辆",
		minimumInputLength: 1,  
	    multiple:false,  
	    allowClear : true,
		query: function(query) {
		 $.ajax({
				   type: "POST",
				   url: "autoclassline.do?method=searchAutoclasslineNumber",
				   data: {name:query.term},   //传递你输入框中的值
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
			 
 	});	
 		//查询
  	function searchAutoclassline(){
  		var lincarno="";
  		var classlineName="";
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		if($.trim($("#classlineNameId").select2("data"))!=""){
  		classlineName=$.trim($("#classlineNameId").select2("data").text);
  			}
  		if($.trim($("#lincarno").select2("data"))!=""){
  		lincarno=$.trim($("#lincarno").select2("data").text);
  			}
  			if(startDate!=''&&endDate!=''){
		var str =startDate; 
		// 转换日期格式 
		str = str.replace(/-/g, '/'); // "2010/08/01"; 
		// 创建日期对象 
		var date = new Date(str); 
		// 加一天 
		date.setDate(date.getDate() - 1); 
		// 没有格式化的功能，只能一个一个取 
		startDate = date.getFullYear() + '-' 
		    // 因为js里month从0开始，所以要加1 
		    + (parseInt(date.getMonth()) + 1) + '-' 
		    + date.getDate(); 
		    
			 var str1 =endDate; 
		// 转换日期格式 
			str1 = str1.replace(/-/g, '/'); // "2010/08/01";
		// 创建日期对象 
			var date = new Date(str1); 
		// 加一天 
			date.setDate(date.getDate() +1); 
		// 没有格式化的功能，只能一个一个取 
			endDate = date.getFullYear() + '-' 
		    // 因为js里month从0开始，所以要加1 
		    + (parseInt(date.getMonth()) + 1) + '-' 
		    + date.getDate(); 
		    }else if(endDate!=''&&startDate==''){
				     var str1=endDate; 				
				// 转换日期格式 
					str1 = str1.replace(/-/g, '/'); // "2010/08/01";
				// 创建日期对象 
					var date = new Date(str1); 
				// 加一天 
					date.setDate(date.getDate() +1); 
				// 没有格式化的功能，只能一个一个取 
					endDate = date.getFullYear() + '-' 
				    // 因为js里month从0开始，所以要加1 
				    + (parseInt(date.getMonth()) + 1) + '-' 
				    + date.getDate(); 
		    }else if(startDate!=''&&endDate==''){
		   		 var str =startDate; 
				// 转换日期格式 
				str = str.replace(/-/g, '/'); // "2010/08/01"; 
				// 创建日期对象 
				var date = new Date(str); 
				// 加一天 
				date.setDate(date.getDate() - 1); 
				// 没有格式化的功能，只能一个一个取 
				startDate = date.getFullYear() + '-' 
				    // 因为js里month从0开始，所以要加1 
				    + (parseInt(date.getMonth()) + 1) + '-' 
				    + date.getDate(); 
				    }	   
  		$("#dg").datagrid('load',{
	 	 		linname :classlineName,
	 	 		lincarno:lincarno,
	 	 		start :startDate,
	 	 		end:endDate,
	 	});	  
	 	
  	}
  	//删除
  	function deleteAutoclassline(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].linnumber);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "autoclassline.do?method=deleteAutoclassline",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("自动计划删除","自动计划删除成功",'info',
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
  	function getUpdateAutoclassline(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].linnumber;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '自动计划修改',
				url : 'autoclassline.do?method=getEditAutoclasslinePage&pid=' + pid,
				width : 640,
				height : 240,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改">',
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
  	function updateAutoclassline(){
	 var myform=document.forms[1];
  	 myform.action="autoclassline.do?method=updateAutoclassline";
  	 myform.submit();
	
	}
	
	//添加
	function addAutoclassline() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '自动计划新增',
			url : 'autoclassline.do?method=addAutoclassline',
/* 				 buttons :'#addbuttons'
*/
			width : 640,
			height : 240,
			buttons : [{
				text : '<input type="button" value="保存" class="btncss"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	
	//导出
  	function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去 
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
 	</script>
  <body class="easyui-layout">
  <form action="autoclassline.do" id="outputform" method="post">
   	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<label>班线名称：</label><input type="text" class="search-text" name="linname" id="classlineNameId"/>
			<label class="divlabel">车牌号：</label><input type="text" class="search-text" name="car_num" id="lincarno"/>
			<label class="divlabel">制作时间：</label><input  id="startDate" class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer'})" />-
			<input  id="endDate" class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({skin:'twoer'})" />
			<a class="easyui-linkbutton" onclick="searchAutoclassline()" data-options="iconCls:'icon-search'">查询</a>
    	</div>
    	<div region="center" >
    		<table id="dg" title="自动计划表信息"></table>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"  id="tbadd" onclick="addAutoclassline()" style="display: none" >新增</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="tbmodify" onclick="getUpdateAutoclassline()" style="display: none" >修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="tbdel"  onclick="deleteAutoclassline()" style="display: none" >删除</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-output',plain:true" id="tboutput"  onclick="putoutfile()" style="display: none" >导出</a>

		</div>	
		<input type="hidden" name="method" value="autoclasslineExcel">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
		<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
