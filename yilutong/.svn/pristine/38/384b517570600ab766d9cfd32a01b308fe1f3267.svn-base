<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>发车计划导入</title>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
	<!-- 线路号	线路名称	
	 -->
<script type="text/javascript">
	var dialog;
	var grid;
	$(function() {
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
	}else if(fs[i]=="导入"){
	$("#tbru").removeAttr("style");
	}else if(fs[i]=="下载模板"){
	$("#tbxiazai").removeAttr("style");
	}
	}
		grid = $("#dg").datagrid({
			url : 'linplan.do?method=getallLin',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			columns : [ [ {
				field : 'linno',
				checkbox : true
			}, {
				field : 'linnumber',
				title : '班线编号',
				width : 175,
				align : 'center'
			},  {
				field : 'linname',
				title : '班线名称',
				width : 175,
				align : 'center'
			},{
				field : 'lincarno',
				title : '车号',
				width : 166,
				align : 'center'
			}, {
				field : 'lincartype',
				title : '车型',
				width : 120,
				align : 'center'
			}, {
				field : 'lincarowner',
				title : '车主',
				width : 100,
				align : 'center'
			}, {
				field : 'linmoney',
				title : '总运费',
				width : 166,
				align : 'center'
			} , {
				field : 'lintime',
				title : '导入时间',
				width : 200,
				align : 'center'
			} ] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 10, 20, 50, 100 ],
			toolbar : '#tb'
		});

		/*
		select框
		 */

		$("#dname").select2({
			placeholder : "请输入线路名称", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			multiple : false, //设置多项选择，false则只能单选
			allowClear : true, //允许清空	
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "linplan.do?method=getLinName",
					data : {
						linname : query.term
					}, //传递你输入框中的值
					success : function(msg) {
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.id,
								text : y.name
							});
							;
						});
						query.callback(data);
					}
				});
			}
		});
	});

	//查询
	function searchDriver() {
		 $("#dg").datagrid('load',{
			linname :$.trim($("#dname").select2("val")),
			st :$.trim($("#st").val()),
			ed :$.trim($("#ed").val())
 		});	
	}
	//删除
	function deleteDriver() {
		var checkarray = [];
		var array = $('#dg').datagrid('getSelections');
		for (var i = 0; i < array.length; i++) {
			checkarray.push(array[i].linno);
		}
		if (array != "") {
			$.messager.confirm('确认', '您确定要删除选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "linplan.do?method=deletebyid",
						type : "POST",
						data : {
							del : checkarray.join(",")
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("线路删除", "线路删除成功",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}else{
								parent.$.messager.alert("线路删除", "线路删除失败",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			alert("请选择要删除的信息");
		}
	}
	/*
	修改查询
	 */
	function upLin() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			dialog = parent.jy.modalDialog({
				title : '修改线路信息',
				url : 'linplan.do?method=getlinplanbyid&linnumber=' + row[0].linno,
				width : 600,
				height: 310,
				buttons : [{
					text : '<input type="button" value="保存" class="btncss">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
		} else {
			alert("请选择一行信息");
		} 
	}
	//导出
	function putoutfile() {
	/* 	var allRows = $("#dg").datagrid("getColumnFields");
		alert(JSON.stringify(allRows)); */
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName=[];
		for (var i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去
		}
		//$("#datas").val(JSON.stringify(allRows));
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}

	
	function showIcons() {
		dialog = parent.jy.modalDialog({
			title : '导入发车计划',
			url : 'linplan.do?method=imp',
			width : 600,
			height: 300,
			buttons : [{
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	
	function downmb(){
		 var form = $("<form></form>"); 
		 form.attr('style','display:none');  
		 form.attr('method','post');
	     form.attr('action','linplan.do?method=downloadfile');
	     form.submit();   //表单提交
	     form.remove();
	}
</script>

<style type="text/css">
	.Wdate {
    border: #95B8E7 1px solid;
    height: 24px;
    background: #fff url(datePicker.gif) no-repeat right;
}
</style>
</head>

<body class="easyui-layout">
 <form action="linplan.do" id="outputform" method="post">
	<div region="north" title="检索" class="st-north" border="false"
		collapsible="false">
		<lable>线路名称:</lable>
		<input type="text" id="dname" name="name" style="width:170px"> 
		<lable>开始时间:</lable>
		<input id="st" name="st" type="text"readonly="readonly" class="Wdate"
		onClick="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
		<lable>结束时间:</lable>
		<input id="ed" name="ed" type="text"readonly="readonly" class="Wdate"
		onClick="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
		<a class="easyui-linkbutton" onclick="searchDriver()"
			data-options="iconCls:'icon-search'">查询</a>
	</div>
	<div region="center">
		<table id="dg" title="发车计划导入"></table>
	</div>
	<div id="tb">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			id="tbmodify" data-options="iconCls:'icon-edit',plain:true"
			onclick="upLin()" style="display: none" >修改</a> <a href="javascript:void(0)"
			class="easyui-linkbutton" id="tboutput"
			data-options="iconCls:'icon-output',plain:true"
			onclick="putoutfile()" style="display: none" >导出</a> <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="deleteDriver()" style="display: none" id="tbdel">删除</a>
			 <a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-input',plain:true"
			onclick="showIcons()" id="tbru"style="display: none">导入班线</a>
			<a href="javascript:void(0)"
			class="easyui-linkbutton"
			data-options="iconCls:'icon-dowload',plain:true"
			onclick="downmb()" style="display: none" id="tbxiazai">下载模版</a>
	</div>
	<input type="hidden" name="method" value="getallLinss">
	<input type="hidden" id="fieldName" name="fieldName">
	<input type="hidden" id="headtitle" name="headtitle">
</form>

<div>
<form id="linplanform" method="post" action="">
		<input type="hidden" id="linplanid" name="linnumber"  >
	</form>
	<input id="functionname"type="hidden" value=${function}>
	</div>
	
</body>

</html>
