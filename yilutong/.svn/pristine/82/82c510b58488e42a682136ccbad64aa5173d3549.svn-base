<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>消息信息管理</title>
    
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  </head>
 	<script type="text/javascript">
 		
 		var dialog;
 		var grid;
	$(function(){
	var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	 if(fs[i]=="添加"||fs[i]=="添加消息"){
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
			url : 'pushMessage.do?method=getPushMessage',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'message_title',title : '消息标题',width : 300,align:'left'},
  				{field : 'message_content',title : '消息内容',width : 450,align:'left'},
  				{field : 'username',title : '消息发送人',width : 80,align:'center'},
  				{field : 'message_tousername',title : '消息接受人',width : 150,align:'center'},
  				{field : 'message_time',title : '消息创建时间',width : 120,align:'center'}
  				
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
 			
 			});
 				 
 	});	
 		//查询
  	function searchAgreement(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;  	
  		$("#dg").datagrid('load',{
	 	 		message_title :$.trim($("#message_title").val()),
	 	 		message_createuser:$.trim($("#message_createuser").val()),
	 	 		start_date :startDate,
	 	 		end_date :endDate
	 	});	  
	 	
  	}
  	//删除
  	function deleteMessage(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].id);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的消息吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "pushMessage.do?method=deleteMessage",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("删除消息","删除消息成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("消息","请选择要删除的信息","info");
  		}
  	}

	//添加
	function addMessage() {
		dialog = parent.jy.modalDialog({
			title : '消息添加',
			url : 'pushMessage.do?method=addMessagePage',
			width : 940,
			height : 485,
			buttons : [{
				text : '<input type="button"  class="btncss" value="发送"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	

	
 	</script>
  <body class="easyui-layout">
	<form action="agreement.do" id="outputform" method="post">
   	<div region="north" title="检索" class="st-north" border="false" style="height:60px"  collapsible="false"  >
   		
	    	<lable >消息标题:</lable>
	    	 <input  class="search-text"  id="message_title"  style="width:150px"  >
	    	<lable>消息创建者:</lable>
	    	<input  class="search-text"  id="message_createuser"  style="width:150px"  >
	    	<lable>消息日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; margin: 5px 5px 5px 1px;" onfocus="WdatePicker({skin:'twoer'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;margin: 5px 5px 5px 1px;" onfocus="WdatePicker({skin:'twoer'})" />
			<a class="easyui-linkbutton" onclick="searchAgreement()" data-options="iconCls:'icon-search'">查询</a>
			</div>
			
    	</div>
    	<div region="center" >
    		<table id="dg" title="消息信息"></table>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="addMessage()" id="tbadd" style="display: none;">添加消息</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="deleteMessage()"id="tbdel" style="display: none;">删除</a>
		   
		</div>	
		
		<input type="hidden" name="method" value="outAgreement">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
		<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
