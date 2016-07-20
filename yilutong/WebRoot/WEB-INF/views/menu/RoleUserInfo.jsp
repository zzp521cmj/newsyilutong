<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<script type="text/javascript" src="js/json2.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<!-- <script type="text/javascript" src="./js/function.js"></script> -->
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<%
	String roleId = (String) request.getAttribute("roleId");
%>
</head>
<script type="text/javascript">
	var roleId = '<%=roleId%>';
	$(function() {
		console.info(roleId);
		var da = "";
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
		//键盘回车事件
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchUser();
			}
		};
		//查询部门列表
		$("#cc1").combobox({
			panelHeight : 'auto',
			onChange : function(n, o) {
				$('#dg').datagrid('load', {
					user_did : n
				});
			}
		});
		$("#dg").datagrid({//初始化表格属性
			url : 'role.do?method=getRoleUsermeessage&roleId=' + roleId,
			fit : true,
			rownumbers : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			toolbar : '#tb',
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'username',
				title : '用户名',
				width : 200
			}, {
				field : 'realName',
				title : '真实姓名',
				width : 200,
				align : 'left'
			}, {
				field : 'did',
				title : '所在部门',
				width : 200,
				align : 'left',
				formatter : function(val, row, index) {
					$.ajax({
						type : "POST",
						async : false,
						url : 'user.do?method=getDepartment',
						data : {
							did : val
						},
						success : function(data) {
							da = data;
						}
					});
					val = da;
					return val;
				}
			}, {
				field : 'flag',
				title : '类型',
				width : 200,
				align : 'left',
				formatter : function(val, row, index) {
					if (val == "0") {
						return "其他";
					} else if (val == "1") {
						return "固定车辆";
					} else if (val == "2") {
						return "客户";
					}
				}
			}, {
				field : 'lastTime',
				title : '最后登入时间',
				width : 200,
				align : 'left',
				formatter : function(val, row, index) {
					if (val != null) {
						return val.substring(0, 19);
					}
				}
			} ] ],
			pagination : true,
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ]
		});
	});

	function reset() {//重置按钮
		document.getElementById("user_name").value = "";
		document.getElementById("user_realName").value = "";
		$("#cc3").combotree('setValue', "");
	}

	function searchUser() {
		$('#dg').datagrid('load', {
			user_name : $.trim($("#user_name").val()),
			user_realName : $.trim($("#user_realName").val()),
			department_id : $.trim($("#cc3").combotree("getValue"))

		});
	}
	function deleteRoleUser() {
		var row = $("#dg").datagrid('getSelections');
		var userId = [];
		for ( var i = 0; i < row.length; i++) {
			userId.push(row[i].id);
		}
		$.ajax({
			type : "POST",
			async : false,
			url : 'role.do?method=deleteRoleUserInfo',
			data : {
				userId : userId.join(","),
				roleId : roleId,
			},
			success : function(data) {
				if (data) {
					$.messager.alert("角色管理", "删除成功", "info");
					$("#dg").datagrid('reload');
				}

			}
		});
	}
</script>
<body class="easyui-layout">
	<form action="user.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			data-options="collapsible:false">
			<label class="divlabel">用户名：</label><input id="user_name"
				name="user_name" type="text" class="search-text"> <label>真实姓名：</label><input
				id="user_realName" type="text" name="user_realName"
				class="search-text"> <label>所在部门：</label><input id="cc3"
				name="department_id"> &nbsp;<a class="easyui-linkbutton"
				onclick="searchUser()" data-options="iconCls:'icon-search'"
				id="searchId">查询</a>
		</div>
		<input type="hidden" name="method" value="outputUser"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">

		<div region="center" title="用户信息展示" region="center"
			style="background: #eee; overflow-y:hidden">
			<table id="dg"></table>
		</div>
	</form>
	<div id="tb">
		<a href="#" class="easyui-linkbutton" id="tbdel"
			onclick="deleteRoleUser()"
			data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>
	<input id="functionname" type="hidden" value=${function}>
</body>
</html>
