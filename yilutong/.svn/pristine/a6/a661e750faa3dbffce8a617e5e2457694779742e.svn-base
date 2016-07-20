<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<script type="text/javascript" src="js/json2.js"></script>
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
</head>
<script type="text/javascript">
	var fids = [];
	$(function() {
		var fs = $("#functionname").val().split(",");
		for ( var i = 0; i < fs.length; i++) {
			if (fs[i] == "添加") {
				$("#tbadd").removeAttr("style");
			} else if (fs[i] == "修改") {
				$("#tbmodify").removeAttr("style");
			} else if (fs[i] == "删除") {
				$("#tbdel").removeAttr("style");
			} else if (fs[i] == "导出") {
				$("#tbput").removeAttr("style");
			} else if (fs[i] == "授权") {
				$("#tbshouquan").removeAttr("style");
			}
		}

		$('#dlg1').dialog({
			title : '操作',
			width : 400,
			height : 350,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons'
		});
		$('#dlg2').dialog({
			title : '权限控制',
			width : 600,
			height : 400,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons2'
		});
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {

				searchRole();
			}
		};
		$("#dg")
				.datagrid(
						{
							url : 'role.do?method=getRoles',
							fit : true,
							width : "auto",
							singleSelect : false,
							selectOnCheck : true,
							checkOnSelect : true,
							rownumbers : true,
							toolbar : '#tb',
							columns : [ [
									{
										field : 'ck',
										checkbox : true
									},
									{
										field : 'name',
										title : '角色名',
										width : 200
									},
									{
										field : 'ctime',
										title : '创建时间',
										width : 200,
										align : 'left',
										formatter : function(val, row, index) {
											if (val != null) {
												return val.substring(0, 19);
											}
										}
									},
									{
										field : 'ltime',
										title : '角色修改时间',
										width : 200,
										align : 'left',
										formatter : function(val, row, index) {
											if (val != null) {
												return val.substring(0, 19);
											}
										}
									},
									{
										field : 'remarks',
										title : '附加说明',
										width : 200,
										align : 'left',
										formatter : function(value, row, index) {
											var content = '<div  title="' + value + '">'
													+ value + '</div>';
											return content;
										}
									},
									{
										field : 'caozuo',
										title : '关联用户数',
										width : 200,
										align : 'center',
										formatter : function(index, row, value) {
											var i = 0;
											$
													.ajax({
														type : "POST",
														async : false,
														url : 'role.do?method=userRoleCount',
														data : {
															id : row.id
														},
														success : function(data) {

															i = data;
														}
													});
											return i;
										}
									}

							] ],
							pagination : true,
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							onDblClickRow : function(rowIndex, rowData) {
								dialog = parent.jy
										.modalDialog({
											title : '订单详情',
											url : 'role.do?method=getRoleUserInfo&roleId='
													+ rowData.id,
											width : 1000,
										});
							}

						});
		$("#dg2").datagrid({
			url : "role.do?method=getFunctions",
			title : "功能列表",
			fit : true,
			width : "auto",
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			rownumbers : true,
			//toolbar:'#tb',
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'function_name',
				title : '功能名称',
				width : 200
			} ] ],
			onLoadSuccess : function(data) {
				if (data) {
					$.each(data.rows, function(index, item) {
						for ( var i = 0; i < fids.length; i++) {
							if (item.function_id == fids[i]) {
								$('#dg2').datagrid('checkRow', index);
							}
						}

					});
				}
			}
		});

	});

	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			var roleid = row[0].id;
			$.ajax({
				type : "POST",
				url : 'role.do?method=getRole1',
				data : {
					id : roleid
				},
				success : function(data) {
					$("#rolename").val(data.name);
					$('#form').form('load', data);
				}
			});
			$("#hiddencaozuo").val("modify");
			$("#dlg1").dialog('open');
		} else {
			$.messager.alert("角色管理", "请选择一行信息", "info");
		}
	}
	function closeps(data) {
		if (data == 'save') {
			$("#dlg1").dialog('close');
		} else if (data == 'update') {
			$("#dlg2").dialog('close');
		}
	}
	//重置
	function reset() {
		document.getElementById("role_name").value = "";

	}
	//修改角色
	function update() {
		var u = [];
		var nodes = $('#tree').tree('getChecked');
		var nodes2 = $('#tree').tree('getChecked', 'indeterminate');
		if (nodes2 != null) {
			for ( var s = 0; s < nodes2.length; s++) {
				u.push(nodes2[s].id);
			}
		}
		if (nodes != null) {
			for ( var i = 0; i < nodes.length; i++) {
				u.push(nodes[i].id);
			}
		}
		var id = $("#hiddenid2").val();
		var menuid = $("#hiddenmenuid").val();
		$.ajax({
			type : "POST",
			async : false,
			url : 'role.do?method=saveMenu',
			data : {
				nodes : u.join(","),
				id : id
			},
			success : function(data) {
				var fids2 = [];
				var row = $("#dg2").datagrid('getSelections');
				for ( var s = 0; s < row.length; s++) {
					fids2.push(row[s].function_id);
				}
				$.ajax({
					type : "POST",
					async : false,
					url : 'role.do?method=saveMenuFunctions',
					data : {
						fids : fids2.join(","),
						rid : id,
						menuid : menuid
					},
					success : function(data) {

					}
				});

			}
		});
		$.messager.alert("角色管理", "授权成功", "info");

	}
	//删除角色
	function deleteRole() {
		var s;
		var b = false;
		var row = $("#dg").datagrid('getSelections');
		for ( var i = 0; i < row.length; i++) {
			var roleid = row[i].id;
			$.ajax({
				type : "POST",
				async : false,
				url : 'role.do?method=userRoleCount',
				data : {
					id : roleid
				},
				success : function(data) {
					s = data;
				}
			});
			if (s > 0) {
				b = true;
			}
		}

		if (b == true) {
			parent.$.messager.alert('警告!', '该角色下已绑定了用户', 'info');
		} else {
			if (row.length > 0) {
				$.messager.confirm('确认', '您确认想要删除这' + row.length + '条记录吗？',
						function(r) {
							if (r) {

								for ( var i = 0; i < row.length; i++) {
									var roleid = row[i].id;
									$.ajax({
										type : "POST",
										async : false,
										url : 'role.do?method=deleteRole',
										data : {
											id : roleid
										},
										success : function(data) {

										}
									});
								}
								$.messager.alert("角色管理", "删除成功", "info");
								$("#dg").datagrid('reload');
							} else {
							}
						});
			} else {
				$.messager.alert("角色管理", "请选择数据", "info");
			}
		}

	}
	//新增角色
	function save() {
		if ($("#hiddencaozuo").val() == "add") {
			var myform = document.getElementById("form");
			var r_name = document.getElementById("r_name").value;
			var b = "";
			$.ajax({
				type : "POST",
				async : false,
				url : 'role.do?method=checkRole',
				data : {
					name : r_name
				},
				success : function(data) {
					b = data;
				}
			});
			if (r_name == "") {
				parent.$.messager.alert('警告!', '请输入角色名称!', 'info');
			} else if (b == true) {
				parent.$.messager.alert('警告!', '角色名重复!', 'info');
			} else {
				myform.action = "role.do?method=saveRole";
				myform.submit();
				$("#dg").datagrid('reload');
			}
		} else if ($("#hiddencaozuo").val() == "modify") {
			var myform = document.getElementById("form");
			var r_name = document.getElementById("r_name").value;
			var r_name2 = $("#rolename").val();

			var b = "";
			$.ajax({
				type : "POST",
				async : false,
				url : 'role.do?method=checkRole',
				data : {
					name : r_name
				},
				success : function(data) {
					b = data;
				}
			});
			if (r_name == "") {
				parent.$.messager.alert('警告!', '请输入角色名称!', 'info');
			} else if (b == true && r_name != r_name2) {
				parent.$.messager.alert('警告!', '角色名以存在!', 'info');
			} else {
				myform.action = "role.do?method=modifyRole";
				myform.submit();
				$("#dg").datagrid('reload');
			}
		}
	}
	function add() {
		$("#form").form('clear');
		$("#dlg1").dialog('open');
		$("#hiddencaozuo").val("add");
	}
	//根据角色名查询
	function searchRole() {
		$('#dg').datagrid('load', {
			role_name : $.trim($("#role_name").val())

		});
	}
	//授权
	function shouquan() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			$("#dlg2").dialog('open');
			var roleid = row[0].id;
			$("#hiddenid2").val(roleid);
			$.getJSON("role.do?method=getTree&&id=" + roleid + "", function(
					data) {
				$('#tree').tree({
					checkbox : true,
					data : data,
					onClick : function(node) {
						if (node.state == "closed") {
							$(this).tree('expand', node.target);
						} else {
							$(this).tree('collapse', node.target);
						}
						// $("#tree").tree('check',node.target);
						$("#hiddenmenuid").val(node.id);
						$.ajax({
							type : "POST",
							async : false,
							url : 'role.do?method=getFids',
							data : {
								mid : node.id,
								rid : roleid
							},
							success : function(data) {
								fids = data;
							}
						});
						$('#dg2').datagrid('load', {
							mid : node.id
						});
					}
				});
			});

		} else {
			$.messager.alert("角色管理", "请选择一行", "info");

		}

	}
	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field); //把field列属性名到数组里去 
		}
		var checkarray = [];//定义数组存放id
		var array = $("#dg").datagrid('getSelections');
		for ( var i = 0; i < array.length; i++) {
			checkarray.push(array[i].id);
		}
		$("#aId").val(checkarray.join(","));
		//$("#datas").val(JSON.stringify(allRows));
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}
</script>
<body class="easyui-layout">
	<form action="role.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			data-options="collapsible:false">
			<label>角色名：</label><input id="role_name" type="text"
				class="search-text" name="role_name"> <a
				class="easyui-linkbutton" onclick="searchRole()"
				data-options="iconCls:'icon-search'" id="searchId">查询</a>
		</div>
		<input type="hidden" name="method" value="outputRole"> <input
			type="hidden" id="datas" name="datas"> <input type="hidden"
			id="headtitle" name="headtitle"> <input type="hidden"
			id="fieldName" name="fieldName"> <input id="aId" name="aid"
			value="">
		<div region="center" title="角色信息展示" region="center"
			style="background: #eee; overflow-y:hidden">
			<table id="dg"></table>
		</div>
	</form>

	<div id="dlg1">
		<div class="easyui-layout" data-options="fit:true">
			<div data-options="region:'center'">
				<form action="" method="post" id="form">
					<fieldset>
						<input type="hidden" id="rolename"> <input type='hidden'
							id="hiddenid" name='id'> <input type='hidden'
							id="hiddencaozuo">
						<table class="tableclass">
							<tr>
								<th colspan="4">详细信息</th>
							</tr>
							<tr>

								<td><font color="red" style="margin-right:10px">*</font>角色名称:</td>
								<td class="td2" colspan="2"><input id="r_name" type="text"
									name="name" class="search-text">
								</td>
							</tr>
							<tr>
								<td>详细描述:</td>
								<td class="td2" colspan="2"><textarea
										class="easyui-textarea" cols="22" rows="3.5" name="remarks"
										id="remarkId"></textarea>
								</td>
							</tr>
						</table>
					</fieldset>
				</form>
			</div>
			<div id="buttons">
				<input type="button" onclick="save()" value="保存" class="btncss"
					id="save" />
				<!-- <input type="button" onclick="closeps('save');" value="关闭" class="btncss" /> -->
			</div>
		</div>
	</div>
	<div id="dlg2">
		<div class="easyui-layout" data-options="fit:true">
			<div
				data-options="region:'west',collapsible:false,border:false,split:true"
				style="width:180px">
				<ul id="tree"></ul>
			</div>
			<div data-options="region:'center'">
				<input type='hidden' id="hiddenid2" name='id'> <input
					type='hidden' id="hiddenmenuid">
				<table id="dg2"></table>
			</div>
			<div id="buttons2">
				<input type="button" onclick="update()" value="授权" class="btncss"
					id="update" />
				<!-- <input type="button" onclick="closeps('update');" value="关闭" class="btncss" /> -->
			</div>
		</div>


	</div>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" id="tbadd" onclick="add()"
			data-options="iconCls:'icon-add',plain:true" style="display: none">添加</a>
		<a href="#" class="easyui-linkbutton" id="tbmodify" onclick="modify()"
			data-options="iconCls:'icon-edit',plain:true" style="display: none">修改</a>
		<a href="#" class="easyui-linkbutton" id="tbshouquan"
			onclick="shouquan()" data-options="iconCls:'icon-edit',plain:true"
			style="display: none">授权</a> <a href="#" class="easyui-linkbutton"
			id="tbdel" onclick="deleteRole()"
			data-options="iconCls:'icon-remove',plain:true" style="display: none">删除</a>
		<a href="#" class="easyui-linkbutton" id="tbput"
			onclick="putoutfile()"
			data-options="iconCls:'icon-output',plain:true" style="display: none">导出</a>
		<a href="#" class="easyui-linkbutton" id="tbreset" onclick="reset()"
			data-options="iconCls:'icon-reset',plain:true">重置</a>
	</div>
	<input id="functionname" type="hidden" value=${function}>
</body>
</html>
