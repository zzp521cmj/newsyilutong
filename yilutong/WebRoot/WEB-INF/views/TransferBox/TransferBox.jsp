<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <!-- /**
 * 中转箱基础信息界面
 * @author lx
 */  -->
    <title>中转箱基础信息管理</title>
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
  </head>
  <script type="text/javascript">
  	var grid;
  	var dialog;
  	$(function(){

  	 	var fs=$("#functionname").val().split(","); 
  		for(var i = 0;i<fs.length;i++){
  		if(fs[i]=="添加"){
  			$("#tbadd").removeAttr("style");
  		}else if(fs[i]=="修改"){
  		$("#tbmodify").removeAttr("style");
  		}else if(fs[i]=="删除"){
  		$("#tbdel").removeAttr("style");
  		}
  		else if(fs[i]=="导出"){
  		$("#tbput").removeAttr("style");
  		}
  		} 
  		/* var btnMoreSearch = $("#btnMoreSearch");
  		btnMoreSearch.click(function() {
  			 if (btnMoreSearch.attr("state") == "close") {
  			 //主要代码 
  				$('.easyui-layout').layout('panel', 'north').panel('resize',{height:90});
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
  			} */
  	});
  	$(function(){
  			/* 初始化页面 */
  			grid=$("#dg").datagrid({
  			url : 'TransferBox.do?method=getTransferBoxInfo',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true}, 
  				{field : 'transferBox_name',title : '中转箱名称',width : 80},
  				{field : 'transferBox_involume',title : '内容量',width : 80},
  				{field : 'transferBox_outervolume',title : '体积',width : 80},
  				{field : 'transferBox_inlength',title : '内廊长',width : 80},
		        {field : 'transferBox_inwidth',title : '内廊宽',width : 80},
		        {field : 'transferBox_inhigh',title : '内廊高',width : 80},
  				{field : 'transferBox_outerlength',title : '外廊长',width : 80},
  				{field : 'transferBox_outerwidth',title : '外廊宽',width : 80},
  				{field : 'transferBox_outerhigh',title : '外廊高',width : 80},
  				{field : 'transferBox_Singlebearing',title : '单箱承载',width : 80},
  				{field : 'transferBox_Multibearing',title : '堆码承载',width : 80}
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  		});
  	});
  	
  	/*  跳转到新增界面*/
  	function addBox(){
  		dialog = parent.jy.modalDialog({
			title : '新增信息',
			url : 'TransferBox.do?method=getAddBox',
			width:720,
			buttons : [{
				text : '<input type="button"  class="btncss" value="保存">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
  	};
  		/* 跳转到修改界面*/
  	function editBox(){
  		var row = $('#dg').datagrid('getSelections');
  		var transferBox_id=null;
  		if(row.length==1){
  			for(var i=0;i<row.length;i++){
  				transferBox_id = row[i].transferBox_id;
  			}
  			dialog = parent.jy.modalDialog({
				title : '修改信息',
				url : 'TransferBox.do?method=geteditBox&transferBox_id='+transferBox_id,
				width:720,
				buttons : [{
					text : '<input type="button" class="btncss" value="保存">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
		}else{
			$.messager.alert("车辆基本信息","请选择一行","info");
  		}
  	}
  	
  	/*
  				$.ajax({
						url: ".do?method=checkAgreement",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									alert("您选中的车辆已经被绑定，请解绑后再执行删除操作!");
  								}else{
  								
  								}
  						}
					});
  	 
  	*/
  	/* 批量删除 */
  	function deleteBox(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].transferBox_id);
  		}
  		
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){
    			if (r){ 
    				$.ajax({
						url: "TransferBox.do?method=deltetBoxs",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("车辆信息删除","车辆信息删除成功",'info',
									function(r) {
											$('#dg').datagrid('reload');
  										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("车辆基本信息","请选择要删除的信息","info");
  		}
  	}
  	function reset(){
  	$("#number_search").select2("val", "");
  	$("#cc2").combotree("setValue","");
  	}
  	
  	/* 查询 */
  	function searchTruck(){
  		$('#dg').datagrid('load',{
  			transferBox_name : $.trim($("#transferBox_name").val()),
  			transferBox_outervolume:$.trim($("#transferBox_outervolume").val())
  		});
  	}
  </script>
  <body class="easyui-layout">
  	<form action="" id="outputform" method="post">
    	<div region="north" title="车辆基础信息管理" class="st-north" border="false" data-options="collapsible:false">
			<div>
				<lable>中转箱名称：</lable><input type="text" id="transferBox_name" name="transferBox_name"style="width: 140px"/>
				<lable  class="divlabel" >体积：</lable><input id="transferBox_outervolume" name="transferBox_outervolume" style="width: 130px">
				&nbsp<a class="easyui-linkbutton" onclick="searchTruck()" data-options="iconCls:'icon-search'">查询</a>
			</div>
    	</div>
    	
    	<div region="center" title="中转箱信息列表" region="center" style="background:#eee;overflow-y:hidden">
    		<table id="dg"></table>
    	</div>
    	<div id="tb">
	   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbadd" onclick="addBox()" data-options="iconCls:'icon-add',plain:true" style="display: none">新增</a>
	   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbmodify" onclick="editBox()" data-options="iconCls:'icon-edit',plain:true" style="display: none">修改</a>
	   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbdel" onclick="deleteBox()" data-options="iconCls:'icon-remove',plain:true" style="display: none">删除</a>
	   	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="tbput" onclick="" data-options="iconCls:'icon-output',plain:true" style="display: none">导出</a> -->
	   	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="" onclick="VehicleAuction()" data-options="plain:true">车辆竞价</a> -->
	   	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
		</div>
		<input id="functionname"type="hidden" value=${function}>	
 	</form>
		
		
  </body>
</html>
