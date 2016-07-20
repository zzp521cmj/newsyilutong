<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
</head>
<script type="text/javascript">
	$(function() {
		var fs = $("#functionname").val().split(",");
		for ( var i = 0; i < fs.length; i++) {
			if (fs[i] == "添加") {
				$("#searchaddId").removeAttr("style");
			} else if (fs[i] == "修改") {
				$("#modifytrue").removeAttr("style");
			} else if (fs[i] == "删除") {
				$("#searchdelId").removeAttr("style");
			}
		}
		$('#saveDialog').dialog({
			title : '部门添加',
			width : 580,
			height : 380,
			closed : true,
			cache : false,
			modal : true
		});
		$('#delDialog').dialog({
			title : '部门删除',
			width : 480,
			height : 280,
			closed : true,
			cache : false,
			modal : true
		});
		$('#cc2')
				.combotree(
						{
							url : "depn.do?method=getTree&&id=",
							width : 150,
							onBeforeLoad : function(node, param) {

								if (node == null) {
									$('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {

									$('#cc2').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
		$('#cc3')
				.combotree(
						{
							url : "depn.do?method=getTree&&id=",
							width : 150,
							onBeforeLoad : function(node, param) {

								if (node == null) {
									$('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {

									$('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
		$('#tree')
				.tree(
						{
							url : "depn.do?method=getTree&&id=",
							onClick : function(node) {
								if (node != null) {
									$
											.ajax({
												type : "POST",
												async : false,
												url : 'depn.do?method=getDepnfname',
												data : {
													department_id : node.id
												},
												success : function(data1) {
													if (data1.depnc.address == null
															|| data1.depnc.address == "") {
														document
																.getElementById("address").value = "";
													} else {
														document
																.getElementById("address").value = data1.depnc.address;
													}
													if (data1.depnc.tel == null
															|| data1.depnc.tel == "") {
														document
																.getElementById("tel").value = "";
													} else {
														document
																.getElementById("tel").value = data1.depnc.tel;
													}
													if (data1.depnf.department_name == null
															|| data1.depnf.department_name == "root") {

														$("#cc")
																.combotree(
																		'setValue',
																		data1.depnf.department_name);
														$('#cc').combotree(
																'disable');

													} else {
														$('#cc').combotree(
																'enable');
														$("#cc")
																.combotree(
																		'setValue',
																		data1.depnf.department_id);
														$("#cc")
																.combotree(
																		'setText',
																		data1.depnf.department_name);
													}
												}
											});
									document.getElementById("department_id").value = node.id;
									document.getElementById("department_name").value = node.text;
									if (node == null) {
										$('#tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
									} else {
										$('#tree').tree('options').url = "depn.do?method=getTree&&id="
												+ node.id;//加载下层节点
										if (node.state == "closed") {
											$(this).tree('expand', node.target);
										} else {
											$(this).tree('collapse',
													node.target);
										}
									}
								}
							},
							onBeforeLoad : function(node, param) {
								if (node == null) {
									$('#tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {
									$('#tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
		$('#cc')
				.combotree(
						{
							url : "depn.do?method=getTree&&id=",
							width : 150,
							onBeforeLoad : function(node, param) {

								if (node == null) {
									$('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {

									$('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchUser();
			}
		};

	});

	function modifyDepartment() {

		var myform = document.forms[0];
		var name = document.getElementById("department_name").value;
		var address = document.getElementById("address").value;
		var tel = document.getElementById("tel").value;
		var fid = $("#cc").combotree('getValue');
		var t = $("#cc").combotree('tree');
		var id = document.getElementById("department_id").value;
		if (fid == "root") {
			$("#cc").combotree('setValue', 1);
		}
		if (name == "") {
			parent.$.messager.alert('警告!', '请输入部门名称!', 'info');
		} else if (fid == "") {
			parent.$.messager.alert('警告!', '请选择上级部门!', 'info');
		} else if (id == "") {
			parent.$.messager.alert('警告!', '请选择您要修改的部门!', 'info');
		} else {
		   var leva = t.tree('getSelected').attributes;
			$("#eidtleva").val(leva);
			console.info($("#eidtleva").val());
			myform.action = "depn.do?method=modifyDepartment";
			myform.submit();

		}
	}

	function saveDepartment() {
		var b = "";
		var myform = document.forms[1];
		var name = document.getElementById("department_name2").value;
		var address = document.getElementById("address2").value;
		var tel = document.getElementById("tel2").value;
		var fid = $("#cc2").combotree('getValue');
		var id = document.getElementById("department_id2").value;
		var t = $('#cc2').combotree('tree');
		$.ajax({
			type : "POST",
			async : false,
			url : 'depn.do?method=checkDepn',
			data : {
				name : name,
				fid : fid
			},
			success : function(data) {
				b = data;
			}
		});
		if (fid == "无") {
			$("#cc").combotree('setValue', 0);
		}
		if (name == "") {
			parent.$.messager.alert('警告!', '请输入部门名称!', 'info');
		} else if (fid == "") {
			parent.$.messager.alert('警告!', '请选择上级部门!', 'info');
		} else if (b == true) {
			parent.$.messager.alert('警告!', '部门名重复!', 'info');
		} else {
           var leva = t.tree('getSelected').attributes;
			$("#addleva").val(leva);
			console.info($("#addleva").val());
			myform.action = "depn.do?method=saveDepartment";
			myform.submit();

		}
	}
	function delDepn() {
		/* var myform=document.forms[2];
		var fid = $("#cc3").combotree('getValue');
			if(fid=="root"){
			  $("#cc").combotree('setValue',0);
			}
			if(fid==""){
				parent.$.messager.alert('警告!','请选择要删除的部门!','info');
			}else if (fid=="2"){
			$.messager.confirm('确认', '您确认想要删除这整个组织结构吗？',
						function(r) {
							if (r) {
							myform.action="depn.do?method=deleteDepn";
							myform.submit();
							}});
			}else{
			myform.action="depn.do?method=deleteDepn";
			myform.submit();
			} */
		var myform = document.forms[2];
		var fid = $("#cc3").combotree('getValue');
		if (fid == "root") {
			$("#cc").combotree('setValue', 0);
		}
		var b;
		$.ajax({
			type : "POST",
			async : false,
			url : 'depn.do?method=getDepnkids',
			data : {
				id : fid
			},
			success : function(data) {
				b = data;
			}
		});
		if (fid == "") {
			parent.$.messager.alert('警告!', '请选择要删除的部门!', 'info');
		} else if (b) {
			parent.$.messager.alert('警告!', '请先删除子节点!', 'info');
		} else {
			myform.action = "depn.do?method=deleteDepn";
			myform.submit();
		}
	}
	function addDepartment() {
		$("#saveDialog").dialog('open');
	}
	function delDepartment() {
		$("#delDialog").dialog('open');
	}
</script>
<body class="easyui-layout">
	<div
		data-options="region:'west',collapsible:false,selected:true,border:true,split:true"
		title="组织机构" style="width:250px">
		<ul id="tree"></ul>
	</div>
	<div data-options="region:'center',title:'操作面板'" align="center">
		<div align="left" style="margin-top:10px">
			<a class="easyui-linkbutton" onclick="addDepartment()"
				data-options="iconCls:'icon-add',width:80" id="searchaddId"
				style="display: none">添加</a> <a class="easyui-linkbutton"
				onclick="delDepartment()"
				data-options="iconCls:'icon-remove',width:80" id="searchdelId"
				style="display: none">删除</a>
		</div>
		<form action="" method="post" id="form">
			<fieldset>
				<legend>部门修改</legend>
				<input type='hidden' id="department_id" name='department_id'>
				<div style="margin-top: 40px">
					<label>机构名称：</label><input id="department_name" type="text"
						class="search-text" name=department_name><font color="red">*</font>
				</div>
				<div style="margin-top: 30px;margin-right: 8px">
					<label>上级机构：</label><input id="cc" name="father_id">
				</div>
				<div style="margin-top: 30px">
					<label>机构地址：</label><input id="address" name="address" type="text"
						class="search-text">
				</div>
				<div style="margin-top: 30px">
					<label>机构电话：</label><input id="tel" name="tel" type="text"
						class="search-text">
				</div>
				<div style="margin-top: 30px">
					<input type="button" onclick="modifyDepartment()" value="更新"
						class="btncss" id="modifytrue" style="display: none" />
				</div>
			</fieldset>
			<input type="hidden" name="leva" id="eidtleva">
		</form>
	</div>
	<div id="saveDialog">
		<form id="saveform" method="post">
			<fieldset>
				<legend>添加</legend>
				<div align="center">
					<input type='hidden' id="department_id2" name='department_id'>
					<div style="margin-top: 40px">
						<label>机构名称：</label><input id="department_name2" type="text"
							class="search-text" name=department_name><font
							color="red">*</font>
					</div>
					<div style="margin-top: 30px;margin-right: 8px">
						<label>上级机构：</label><input id="cc2" name="father_id">
					</div>
					<div style="margin-top: 30px">
						<label>机构地址：</label><input id="address2" name="address"
							type="text" class="search-text">
					</div>
					<div style="margin-top: 30px">
						<label>机构电话：</label><input id="tel2" name="tel" type="text"
							class="search-text">
					</div>
					<div style="margin-top: 30px">
						<input type="button" onclick="saveDepartment()" value="保存"
							class="btncss" />
					</div>
				</div>
			</fieldset>
			<input type="hidden" name="leva" id="addleva">
		</form>
	</div>
	<div id="delDialog">
		<form id="delform" method="post">
			<fieldset style="margin-top: 25px">
				<legend>删除</legend>
				<div align="center">
					<div style="margin-top: 30px;margin-right: 8px">
						<label>组织机构：</label><input id="cc3" name="father_id">
					</div>
					<div style="margin-top: 35px;margin-bottom: 35px">
						<input type="button" onclick="delDepn()" value="删除" class="btncss" />
					</div>
				</div>
			</fieldset>
		</form>
	</div>
	<input id="functionname" type="hidden" value="${function}"/>
</body>
</html>
