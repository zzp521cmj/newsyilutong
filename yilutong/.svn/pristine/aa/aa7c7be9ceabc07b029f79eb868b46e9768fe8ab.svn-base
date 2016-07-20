<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title></title>
<script type="text/javascript" src="js/json2.js"></script>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<script type="text/javascript" src="./js/function.js"></script>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>

</head>
<script type="text/javascript">
	var reg = /^0?1[3|4|5|8][0-9]\d{8}$/;//手机号验证
	$(function() {
		var da = "";
		$("#number_search2").select2({//初始化添加车牌号选择
			placeholder : "请选择司机", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			multiple : false, //设置多项选择，false则只能单选
			allowClear : true,
			maximumSelectionSize : 5,//最多选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "user.do?method=getDrivers",//请求路径
					data : {
						search : query.term,//传递输入框中的值
					},
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
						});
						query.callback(data);
					}
				});
			}
		});
		$("#number_search4").select2({//初始化修改车牌号的选择
			placeholder : "请选择车辆", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			multiple : false, //设置多项选择，false则只能单选
			allowClear : true,
			maximumSelectionSize : 5,
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "user.do?method=getDrivers",
					data : {
						search : query.term,//传递输入框中的值
					},
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
						});
						query.callback(data);
					}
				});
			}
		});

		$("#costomers").select2({//添加客户信息选择
			placeholder : "请选择客户", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			multiple : false, //设置多项选择，false则只能单选
			allowClear : true,
			maximumSelectionSize : 5,
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "orderC.do?method=getCustomer",
					data : {
						name : query.term
					}, //传递输入框中的值
					success : function(msg) {
					   console.info(msg);
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.id,
								text : y.name
							});
						});
						query.callback(data);
					}
				});
			}
		});

		$("#costomers1").select2({//修改客户信息选择
			placeholder : "请选择客户", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			multiple : false, //设置多项选择，false则只能单选
			allowClear : true,
			maximumSelectionSize : 5,
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "orderC.do?method=getCustomer",
					data : {
						name : query.term
					}, //传递输入框中的值
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
						});
						query.callback(data);
					}
				});
			}
		});
		$('#flag2').combobox({//添加切换下拉框是调整显示内容
			onChange : function(newValue, oldValue) {
				if (newValue == "1") {
					$("#td2").removeAttr("style");
					$("#td2s").removeAttr("style");
					$("#d4").removeAttr("style");
					$("#td1").attr("style", "display:none");
					$("#td1s").attr("style", "display:none");
				   // $("#costomers1").select2("val", "");
				} else if (newValue == "2") {
					$("#td1").removeAttr("style");
					$("#td1s").removeAttr("style");
					$("#d5").removeAttr("style");
					$("#td2").attr("style", "display:none");
					$("#td2s").attr("style", "display:none");
					//$("#number_search4").select2("val", "");
				} else {
				   // $("#number_search4").select2("val", "");
				    //$("#costomers1").select2("val", "");
					$("#td2").attr("style", "display:none");
					$("#d4").attr("style", "display:none");
					$("#td2s").attr("style", "display:none");
					$("#td1").attr("style", "display:none");
					$("#td1s").attr("style", "display:none");
					$("#d4").attr("style", "display:none");
				}
			}
		});
		$('#flag').combobox({//修改时改变下拉框调整显示内容
			onChange : function(newValue, oldValue) {
				if (newValue == "1") {
					$("#td").removeAttr("style");
					$("#tds").removeAttr("style");
					$("#d2").removeAttr("style");
					$("#costomers").select2("val", "");
					$("#td3").attr("style", "display:none");
					$("#td3s").attr("style", "display:none");
				} else if (newValue == "2") {
					$("#td3").removeAttr("style");
					$("#td3s").removeAttr("style");
					$("#d3").removeAttr("style");
					$("#number_search2").select2("val", "");
					$("#td").attr("style", "display:none");
					$("#tds").attr("style", "display:none");
				} else {
					$("#number_search2").select2("val", "");
					$("#costomers").select2("val", "");
					$("#td").attr("style", "display:none");
					$("#tds").attr("style", "display:none");
					$("#costomers").select2("val", "");
					$("#td3").attr("style", "display:none");
					$("#td3s").attr("style", "display:none");
					$("#d3").attr("style", "display:none");
					$("#d2").attr("style", "display:none");
				}
			}
		});

		$('#dlg1').dialog({//添加用户信息弹出框
			title : '添加用户信息',
			width : 680,
			height : 300,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons',
			onClose : function() {//当关闭时，清空文本框内容
				$("#costomers").select2("val", "");
				$("#number_search2").select2("val", "");
				$("#flag").combobox("setValue", "4");
			}
		});
		$('#dlg2').dialog({//修改用户信息弹出框
			title : '修改用户信息',
			width : 680,
			height : 300,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons2'
		});
		$('#dlg3').dialog({//修改密码弹出框
			title : '修改密码',
			width : 360,
			height : 280,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons3'
		});
		$('#cc')
				.combotree(
						{//部门combotree
							url : "depn.do?method=getTree&&id=",//请求路径
							width : 150,//宽度
							onBeforeLoad : function(node, param) {
								if (node == null) {
									$('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
								} else {
									$('#cc').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
											+ node.id;//加载下层节点
								}

							}
						});
		$('#cc2')
				.combotree(
						{//部门树
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
			url : 'user.do?method=getUser',
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
				field : 'phone',
				title : '手机号',
				width : 200,
				align : 'left'
			},  
			{
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
						return "司机";
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
	//修改
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		$(':input','#form2').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked') .removeAttr('selected');  
		if (row.length == 1) {
			var userid = row[0].id;
			var flag = row[0].flag;
			var flag2;
			$.ajax({
				type : "POST",
				async : false,
				url : 'user.do?method=getOneUser',
				data : {
					id : userid
				},
				success : function(data2) {
					if (data2.flag == "1") {
						/* if (data2.plate_number == null) {
							data2.plate_number = "";
						} */
						$("#number_search4").select2('data', {
							id : data2.driver_id,
							text : data2.driver_name
						});
						$("#costomers1").select2('data','');
					}
					if (data2.flag == "2") {
						if (data2.costomers == null) {
							data2.costomers = "";
						}
						$("#costomers1").select2('data', {
							id : data2.costomersid,
							text : data2.costomers
						});
						$("#number_search4").select2('data','');
					}
					if (data2.didname == null || data2.didname == "") {
						data2.did = "";
						
					}
					
					/* if (data2.flag != "0") {
					} else {
					} */
					$('#form2').form('load', data2);
					$("#cc2").combotree("setValue", data2.didname);
				}
			});
			$("#hiddenid").val(name);
			//$("#flag2").combobox("setValue", "4");
			$("#flag2").combobox("setValue", flag);
			
			$("#dlg2").dialog('open');
		} else {
			$.messager.alert("用户管理", "请选择一行信息", "info");
		}
	}
	//用户信息修改请求
	function update() {
		var myform = document.getElementById("form2");
		var realName = document.getElementById("user_realName2").value;
		var did = $("#cc2").combobox('getValue');
		var gpnumberd = $.trim($("#number_search4").select2("val"));
		var costomers = $.trim($("#costomers1").select2("val"));
		var flag = $("#flag2").combobox('getValue');
		var phone = $.trim($("#phone1").val());
		
		if (realName == "") {
			parent.$.messager.alert('警告!', '请输入真实姓名!', 'info');
		} else if (did == "") {
			parent.$.messager.alert('警告!', '请选择部门!', 'info');
		} else if (flag == 1 && gpnumberd == "") {
			parent.$.messager.alert('警告!', '请绑定司机!', 'info');
		} else if (flag == 2 && costomers == "") {
			parent.$.messager.alert('警告!', '请绑定客户!', 'info');
		} else if (phone == null || phone == "") {
			parent.$.messager.alert('警告!', '请绑定手机号!', 'info');
		} else if (!reg.test(phone)) {
			parent.$.messager.alert('警告!', '请输入正确的手机号!', 'info');
		}else {
			if (flag == 2) {
				$("#number_search4").select2("val", "");
			} else if (flag == 1) {
				$("#costomers1").select2("val", "");
			} else {
				$("#costomers1").select2("val", "");
				$("#number_search4").select2("val", "");
			}
			$.ajax({
				type : "POST",
				async : false,
				url : 'user.do?method=modifyUser',
				data : $('#form2').serialize(),
				success : function(data) {
					console.info(data);
					if (data) {
						$.messager.alert('用户信息修改', '用户信息修改成功', 'info');
						$("#dlg2").dialog('close');
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert('用户信息修改', '用户信息修改失败', 'warning');
						$("#dlg2").dialog('close');
						$("#dg").datagrid('reload');
					}
				}
			});
		}
	}
	//删除用户
	function deleteEver() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length > 0) {
			$.messager.confirm('确认', '您确认想要删除这' + row.length + '条记录吗？',
					function(r) {
						if (r) {
							var flag = row[0].flag;
							var user=[];
							for ( var i = 0; i < row.length; i++) {
								 user.push(row[i].id);
							}
                            	$.ajax({
									type : "POST",
									async : false,
									url : 'user.do?method=deleteUser',
									data : {
										id : user.join(",")
									},
									success : function(data) {
										if (data) {
											$.messager.alert('用户信息删除',
													'用户信息删除成功', 'info');
											$("#dg").datagrid('reload');
										} else {
											$.messager.alert('用户信息删除',
													'用户信息删除失败', 'warning');
											$("#dg").datagrid('reload');
										}

									}
								});
						} else {
						}
					});
		} else {
			$.messager.alert("用户管理", "请选择一行信息", "info");
		}

	}
	//新增用户
	function save() {
		var flag = $("#flag").combobox('getValue');
		var myform = document.getElementById("form");
		var name = document.getElementById("user_name1").value;
		var password = document.getElementById("password").value;
		var realName = document.getElementById("user_realName1").value;
		var did = $("#cc").combotree('getValue');
		var gpnumberd = $.trim($("#number_search2").select2("val"));
		var costomers = $.trim($("#costomers").select2("val"));
		var phone = $.trim($("#phone").val());
		
		var b = "";
		$.ajax({
			type : "POST",
			async : false,
			url : 'user.do?method=checkUser',
			data : {
				name : name
			},
			success : function(data) {
				b = data;
			}
		});
		if (name == "") {
			parent.$.messager.alert('警告!', '请输入用户名称!', 'info');
		} else if (password == "") {
			parent.$.messager.alert('警告!', '请输入密码!', 'info');
		} else if (realName == "") {
			parent.$.messager.alert('警告!', '请输入真实姓名!', 'info');
		} else if (did == "") {
			parent.$.messager.alert('警告!', '请选择部门!', 'info');
		} else if (b == true) {
			parent.$.messager.alert('警告!', '用户名重复!', 'info');
		} else if (flag == null || flag == "") {
			parent.$.messager.alert('警告!', '请选择类型!', 'info');
		} else if (flag == 1 && gpnumberd == "") {
			parent.$.messager.alert('警告!', '请绑定司机!', 'info');
		} else if (flag == 2 && costomers == "") {
			parent.$.messager.alert('警告!', '请绑定客户!', 'info');
		} else if (phone== ""||phone==null) {
			parent.$.messager.alert('警告!', '请绑定手机号!', 'info');
		} else if (!reg.test(phone)) {
			parent.$.messager.alert('警告!', '请输入正确的手机号!', 'info');
		} else {			
			$.ajax({
				type : "POST",
				async : false,
				url : 'user.do?method=saveUser',
				data : $('#form').serialize(),
				success : function(data) {
					if (data) {
						$.messager.alert('用户信息添加', '用户信息添加成功', 'info');
						$("#dlg1").dialog('close');
						$("#dg").datagrid('reload');
					} else {
						$.messager.alert('用户信息添加', '用户信息添加失败', 'info');
						$("#dlg1").dialog('close');
						$("#dg").datagrid('reload');
					}
				}
			});
		}
		
	}
	function add() {//添加用户信息
		$("#form").form('clear');
		$("#dlg1").dialog('open');
	}
	function reset() {//重置按钮
		document.getElementById("user_name").value = "";
		document.getElementById("user_realName").value = "";
		$("#cc3").combotree('setValue', "");
	}
	function resetpassword() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			$.messager.confirm('确认', '您确认想要重置密码吗？', function(r) {
				if (r) {
					var userid = row[0].id;
					$.ajax({
						type : "POST",
						async : false,
						url : 'user.do?method=resetpassword',
						data : {
							id : userid
						},
						success : function(data) {
							$.messager.alert('用户密码重置', '密码重置成功，密码为666666', 'info');
						}
					});
				}
			});

		} else {
			$.messager.alert("用户管理", "请选择一行信息", "info");

		}

	}
	function searchUser() {
		$('#dg').datagrid('load', {
			user_name : $.trim($("#user_name").val()),
			user_realName : $.trim($("#user_realName").val()),
			department_id : $.trim($("#cc3").combotree("getValue"))

		});
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
		var checkarray=[];//定义数组存放id
        var array = $("#dg").datagrid('getSelections');
        for(var i=0;i<array.length;i++){
            checkarray.push(array[i].id);
        }
        $("#aId").val(checkarray.join(","));
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}
	function json2str(o) {
		var arr = [];
		var fmt = function(s) {
			if (typeof s == 'object' && s != null)
				return json2str(s);
			return /^(string|number)$/.test(typeof s) ? "'" + s + "'" : s;
		};
		for ( var i in o)
			arr.push("'" + i + "':" + fmt(o[i]));
		return '{' + arr.join(',') + '}';
	}
	function modifypassword() {//修改密码
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			var userid = row[0].id;
			$("#hiddenid3").val(userid);
			$("#dlg3").dialog('open');
		} else {
			$.messager.alert("用户管理", "请选择一行信息", "info");
		}
	}
	function updatepassword() {//更新密码
		var myform = document.getElementById("form3");
		var password = document.getElementById("user_password3").value;

		if (password == "") {
			parent.$.messager.alert('警告!', '请输入修改密码!', 'info');
		} else {
			myform.action = "user.do?method=modifypassword";
			myform.submit();
		}
	}
</script>
<body class="easyui-layout">
	<form action="user.do" id="outputform" method="post">
	    <input id="aId" name="aid" value="">
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
	<div id="dlg1">
		<form action="" method="post" id="form">
			<fieldset>
				<input type='hidden' id="hiddenid" name='id'>
				<table class="tableclass">
					<tr>
						<th colspan="4">添加用户</th>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>用户名称:</td>
						<td class="td2"><input id="user_name1" type="text"
							name="username" class="search-text">
						</td>
						<td><font color="red" style="margin-right:10px">*</font>用户密码:</td>
						<td class="td2"><input id="password" type="password"
							name="password" class="search-text">
						</td>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>真实姓名:</td>
						<td class="td2"><input class="search-text" name="realName"
							id="user_realName1">
						</td>
						<td><font color="red" style="margin-right:10px">*</font>所在部门:</td>
						<td class="td2"><input id="cc" name="did">
						</td>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>类型:</td>
						<td class="td2"><select id="flag" class="easyui-combobox"
							name="flag" data-options="panelHeight : 'auto',editable:false"
							style="width:150px;">
								<option value="0">其他</option>
								<option value="1">司机</option>
								<option value="2">客户</option>
						</select></td>
						<td id="tds" style="display: none"><font color="red"
							style="margin-right:10px">*</font>绑定司机:</td>
						<td class="td2" id="td" style="display: none">
							<div id="d2" style="display: none">
								<input type="hidden" style="width:150px;" id="number_search2"
									name="car" />
							</div>
						</td>
						<td id="td3s" style="display: none"><font color="red"
							style="margin-right:10px">*</font>绑定客户:</td>
						<td class="td2" id="td3" style="display: none">
							<div id="d3" style="display: none">
								<input type="hidden" style="width:150px;" id="costomers"
									name="costomersid" />
							</div>
						</td>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>绑定手机号:</td>
						<td class="td2"><input class="text" name="phone"
							id="phone" class="">
						</td>
						
					</tr>
				</table>
			</fieldset>
			<div id="buttons">
				<input type="button" onclick="save()" value="保存" class="btncss"
					id="save" />
				<!-- <input type="button" onclick="closeps('save');"
					value="关闭" class="btncss" /> -->
			</div>
		</form>
	</div>
	<div id="dlg2">
		<form action="" method="post" id="form2">
			<fieldset>
				<input type='hidden' id="hiddenid2" name='id'>
				<table class="tableclass">
					<tr>
						<th colspan="4">修改用户</th>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>用户名称:</td>
						<td class="td2"><input id="user_name2" type="text"
							name="username" disabled="disabled" class="search-text">
						</td>
						<td><font color="red" style="margin-right:10px">*</font>真实姓名：</td>
						<td class="td2"><input class="search-text" name="realName"
							id="user_realName2">
						</td>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>所在部门：</td>
						<td class="td2" colspan="3"><input id="cc2" name="did">
						</td>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>类型:</td>
						<td class="td2"><select id="flag2" class="easyui-combobox"
							name="flag" data-options="panelHeight : 'auto',editable:false"
							style="width:150px;">
								<option value="0">其他</option>
								<option value="1">司机</option>
								<option value="2">客户</option>
						</select></td>
						<td id="td2s" style="display: none"><font color="red"
							style="margin-right:10px">*</font>绑定司机:</td>
						<td class="td2" id="td2" style="display: none">
							<div id="d4" style="display: none">
								<input type="hidden" style="width:150px;" id="number_search4"
									name="car" />
							</div>
						</td>
						<td id="td1s" style="display: none"><font color="red"
							style="margin-right:10px">*</font>绑定客户:</td>
						<td class="td2" id="td1" style="display: none">
							<div id="d5" style="display: none">
								<input type="hidden" style="width:150px;" id="costomers1"
									name="costomersid" />
							</div>
						</td>

					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>绑定手机号:</td>
						<td class="td2"><input class="search-text" name="phone"
							id="phone1" class="validate[custom[number],[required]]">
						</td>
						
					</tr>
				</table>
			</fieldset>
			<div id="buttons2">
				<input type="button" onclick="update()" value="更新" class="btncss"
					id="update" />
				<!-- <input type="button" onclick="closeps('update');"
					value="关闭" class="btncss" /> -->
			</div>
		</form>
	</div>
	<div id="dlg3">
		<form action="" method="post" id="form3">
			<fieldset>
				<input type='hidden' id="hiddenid3" name='id'>
				<table class="tableclass">
					<tr>
						<th colspan="4">修改密码</th>
					</tr>
					<tr>
						<td><font color="red" style="margin-right:10px">*</font>修改密码:</td>
						<td class="td2"><input id="user_password3" type="password"
							name="password" class="search-text">
						</td>
					</tr>
				</table>
			</fieldset>
			<div id="buttons3">
				<input type="button" onclick="updatepassword()" value="更新"
					class="btncss" id="update" />
				<!-- <input type="button"
					onclick="closeps('password');" value="关闭" class="btncss" />-->
			</div>
		</form>
	</div>
	<div id="tb"></div>
	<input id="functionname" type="hidden" value=${function}>


</body>

</html>
