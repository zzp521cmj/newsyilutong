<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>合同信息管理</title>
    
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  </head>
  <% String number=(String)request.getAttribute("number");%>
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
			url : 'agreement.do?method=getAgreement',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'agreementNumber',title : '合同号',width : 100,align:'center'},
  				{field : 'agreementName',title : '合同名',width : 80,align:'center'},
  				{field : 'owner',title : '甲方',width : 80,align:'center'},
  				{field : 'side',title : '乙方',width : 80,align:'center'},
  				{field : 'plate_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'money',title : '履约保证金',width : 80,align:'center'},
  				{field : 'linbh',title : '承运路线',width : 80,align:'center'},
  				{field : 'address',title : '签订地点',width : 80,align:'center'},
  				{field : 'agreementStartDate',title : '合同开始日期',width : 100,align:'center',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'agreementEndDate',title : '合同截止日期',width : 100,align:'center',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
 			
 			});
 			
 			$("#1name").select2({
		    placeholder: "请输入合同名",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "agreement.do?method=getAgreementLength",
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
			 
		$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "agreement.do?method=getCar_idLength",
				   data: {plate_number:query.term},   //传递你输入框中的值
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
 		var number='<%= number%>';
 		if(number != "null"){
			$("#dg").datagrid('load',{ 	 		
	 	 		plate_number:number	
		 	});	  	
		}
		
		//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#startDate").val("");
			$("#endDate").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
 	});	
 		//查询
  	function searchAgreement(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		
  	/* 	if(startDate!=''&&endDate!=''){
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
				    
		    } */
  		$("#dg").datagrid('load',{
	 	 		agreement_name :$.trim($("#aname").val()),
	 	 		plate_number:$.trim($("#carid").select2("val")),
	 	 		address:$.trim($("#address").val()),
	 	 		start_date :startDate,
	 	 		end_date :endDate
	 	 		
	 	});	  
	 	
  	}
  	//删除
  	function deleteAgreement(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].agreementId);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "agreement.do?method=deleteAgreement",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("合同信息删除","合同信息删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("合同管理","请选择要删除的信息","info");
  		}
  	}
  	/*
  	修改查询
  	*/
  	function getUpdateAgreement(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].agreementId;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '合同修改',
				url : 'agreement.do?method=getEditAgreementPage&pid=' + pid,
				width : 640,
				height : 380,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("合同管理","请选择一行信息","info");
  		}	
  	}
  	//修改
  	function updateAgreement(){
	 var myform=document.forms[1];
  	 myform.action="Agreement.do?method=updateAgreement";
  	 myform.submit();
	
	}
	
	//添加
	function addAgreement() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '合同新增',
			url : 'agreement.do?method=addAgreement',
/* 				 buttons :'#addbuttons'
*/
			width : 640,
			height : 380,
			buttons : [{
				text : '<input type="button"  class="btncss" value="保存"/>',
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
	<form action="agreement.do" id="outputform" method="post">
   	<div region="north" title="检索" class="st-north" border="false" style="height:60px"  collapsible="false"  >
   		
	    	<lable >合同名字:</lable>
	    	 <input  class="search-text"  id="aname"  style="width:150px"  >
	    	<lable>车牌号码:</lable>
	    	<input type="hidden"  style="width:150px"   id="carid" >
			<lable class="divlabel" >签订地点:</lable>
			<input type="text"  class="search-text" style="width:150px" id="address" >
			<a class="easyui-linkbutton" onclick="searchAgreement()" data-options="iconCls:'icon-search'">查询</a>
			<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
			<lable>合同日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; margin: 5px 5px 5px 1px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;margin: 5px 5px 5px 1px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			</div>
			
    	</div>
    	<div region="center" >
    		<table id="dg" title="合同信息"></table>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="addAgreement()" id="tbadd" style="display: none">新增</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true" id="tbmodify" onclick="getUpdateAgreement()" style="display: none">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteAgreement()"id="tbdel" style="display: none">删除</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-output',plain:true" id="tboutput" onclick="putoutfile()" style="display: none">导出</a>
		</div>	
		
		<input type="hidden" name="method" value="outAgreement">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>	
		<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
