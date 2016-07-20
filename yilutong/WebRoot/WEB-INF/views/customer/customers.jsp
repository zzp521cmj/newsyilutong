<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
		<script type="text/javascript" src="./js/function.js"></script><!--命名按钮方法  -->
<title></title>


</head>
<script type="text/javascript">
	var dialog;
	var grid;
 			//回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchRemark();
			}
		};
	$(function() {
		var da = "";
		var fs = $("#functionname").val().split(",");
		for (var i = 0; i < fs.length; i++) {
			if (fs[i] == "添加") {
				$("#tbadd").removeAttr("style");
			} else if (fs[i] == "修改") {
				$("#tbmodify").removeAttr("style");
			} else if (fs[i] == "删除") {
				$("#tbdel").removeAttr("style");
			}

		}
		var btnMoreSearch = $("#btnMoreSearch");
		btnMoreSearch.click(function() {
			if (btnMoreSearch.attr("state") == "close") {
				//主要代码 
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 85
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("收起条件");
				btnMoreSearch.attr("state", "open");
				$("#searchInfoId").css("display", "block");
			} else {
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 61
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("更多条件");
				btnMoreSearch.attr("state", "close");
				$("#searchInfoId").css("display", "none");
			}
		});

		grid = $("#dg")
				.datagrid(
						{
							url : 'remarkMap.do?method=getRemarks',
							fit : true,
							rownumbers : true,
							//singleSelect: true,
							selectOnCheck : true,
							checkOnSelect : true,
							toolbar : '#tb',
							columns : [ [
									{
										field : 'ck',
										checkbox : true
									},
									{
										field : 'customer_num',
										title : '客户编码',
										width : 130
									},
									{
										field : 'customer_name',
										title : '客户名称',
										width : 130
									}, {
									field : 'customer_grade',
									title : '客户层级',
									width : 80,
									align : 'center',
								formatter : function(val, row, index) {
									if (val == 0) {
									return "散货";
									} else if (val == 1) {
									return "大宗";
									} else if (val == 2) {
									return "项目落仓";
							}
						}
				},
									{
										field : 'customer_tel',
										title : '联系方式',
										width : 110,
										align : 'left'
									},
									{
										field : 'customer_teltoo',
										title : '备用联系方式',
										width : 110,
										align : 'left'
									},
									{
										field : 'customer_address',
										title : '地址',
										width : 200,
										align : 'left',
										formatter : function(value, row, index) {
											var content = '<div  title="' + value + '">'
													+ value + '</div>';
											return content;
										}
									}, {
										field : 'customer_createtime',
										title : '创建时间',
										width : 160,
										align : 'left',
										formatter : function(val, row, index) {
											if (val != null) {
												return val.substring(0, 19);
											}
										}
									}
							/*   {field:'user_name',title:'修改人',width:100,align:'left'} */
							] ],
							pagination : true,
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ]
						});
	});
	function searchRemark() {
		$('#dg').datagrid('load', {
		customer_grade : $.trim($("#customer_grade").combobox('getValue')),
			customer_name : $.trim($("#serchname").val()),
			customer_tel : $.trim($("#serchtel").val()),
			customer_address : $.trim($("#serchaddress").val())
		});
	}
	function reset() {
		$("#serchname").val("");
		$("#serchtel").val("");
		$("#serchaddress").val("");
		$("#customer_grade").combobox("setText","全部"); 
		$("#customer_grade").combobox("setValues",""); 
	}

	function add() {
		dialog = parent.jy.modalDialog({
			title : '客户新增',
			url : 'remarkMap.do?method=getRemarkMap',
			width : 680,
			height : 340,
			buttons : [ {
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	}
	function deleteEver() {
		var row = $("#dg").datagrid('getSelections');
		var b=0;
		if (row.length > 0) {
			$.messager.confirm('确认', '您确认想要删除这' + row.length + '条记录吗？',
					function(r) {
						if (r) {
							for (var i = 0; i < row.length; i++) {
							if(row.uid==null){
								var remarkid = row[i].customer_id;
								$.ajax({
									type : "POST",
									async : false,
									url : 'remarkMap.do?method=deleteRemark',
									data : {
										id : remarkid
									},
									success : function(data) {

									}
								});
								$("#dg").datagrid('reload');
								}else{
								b++;
								}
							}
							if(b>0){
							$.messager.alert('删除客户', '已有'+b+'个客户被绑定用户，暂时不能删除！', 'info');
							}							
						}
					});
		} else {
				$.messager.alert('删除客户','请选择数据','info');
		}

	}
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			var remarkid = row[0].customer_id;
			dialog = parent.jy.modalDialog({
				title : '客户修改',
				url : 'remarkMap.do?method=updateCustomer&cid='+remarkid,
				width : 680,
				height : 350,
				buttons : [ {
					text : '<input type="button" class="btncss" value="保存"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitForms(
								dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert('修改客户', '请选择一行!', 'info');
		}
	}
</script>
<body class="easyui-layout">
	<a href="remarkMap.do?method=getRemarkMap"></a>
	<div region="north" title="检索" class="st-north" border="false"
		style="height:61px" data-options="collapsible:false">
		<lable class="divlabel">客户名称：</lable>
		<input type="text" id="serchname" style="width:150px" />
		<lable class="divlabel">联系方式：</lable>
		<input type="text" id="serchtel" style="width:150px" />
		<lable class="divlabel">地址：</lable>
		
		<input type="text" id="serchaddress" style="width:150px;" /> 
		<lable class="divlabel">客户层级：</lable>
			<select class="easyui-combobox" id="customer_grade" name="customer_grade"  style="width:130px;height:22px"  data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">散货</option>
				<option id="" value="1">大宗</option>
				<option id="" value="2">项目落仓</option>
			</select>&nbsp <a
			class="easyui-linkbutton" onclick="searchRemark()"
			data-options="iconCls:'icon-search'" id="searchId">查询</a>

	</div>
	<div region="center" title="客户信息" region="center"
		style="background: #eee; overflow-y:hidden">
		<table id="dg"></table>
	</div>
	<div id="tb">
<!-- 		<a href="#" class="easyui-linkbutton" id="tbadd" onclick="add()"
			data-options="iconCls:'icon-add',plain:true" style="display: none">新增</a>
		<a href="#" class="easyui-linkbutton" id="tbmodify" onclick="modify()"
			data-options="iconCls:'icon-edit',plain:true" style="display: none">修改</a>
		<a href="#" class="easyui-linkbutton" id="tbdel"
			onclick="deleteRemark()"
			data-options="iconCls:'icon-remove',plain:true" style="display: none">删除</a> -->
	<!-- 	<a href="#" class="easyui-linkbutton" id="tbreset" onclick="reset()"
			data-options="iconCls:'icon-reset',plain:true">重置</a> -->
<!-- 		<form action="" id="cform" method="post">
			<input id="cid" name='cid' value=""  type="hidden" >
		</form> -->
	</div>
	<input id="functionname" type="hidden" value=${function}>
</body>
</html>
