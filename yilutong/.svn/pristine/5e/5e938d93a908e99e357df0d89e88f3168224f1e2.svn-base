<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>司机信息管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/function.js"></script>
<!--命名按钮方法  -->
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/truck_cloud/";
%>
</head>
<script type="text/javascript">
	var dialog;
	var grid;

	//回车查询
	document.onkeydown = function(event) {
		e = event ? event : (window.event ? window.event : null);
		if (e.keyCode == 13) {
			//执行的方法 
			searchDriver();
		}
	};

	$(function() {
		grid = $("#dg").datagrid({
			url : 'driver.do?method=getDriver',
			border : false,
			rownumbers : true,
			fit : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			rowStyler : function(index, row) {
				if (row.drivers_type == 1&&row.reviewed_state==1) {
					return 'color: purple';
				}
				/* if (row.audit_state==0){
						return 'color:black';
				}else if(row.audit_state==1){
				  return 'color: purple';
				}else if(row.audit_state==2){
				  return 'color: blue';
				}else if(row.audit_state==3){
				  return 'color: red';
				} */
			},
			columns : [ [ {
				field : 'ck',
				checkbox : true
			},
			//   				{field : 'stutas_id',title : '操作',width : 60,align:'center'},
			{
				field : 'plate_number',
				title : '车牌号',
				width : 80,
				align : 'center'
			}, {
				field : 'driverName',
				title : '姓名',
				width : 70,
				align : 'center'
			}, {
				field : 'gender',
				title : '性别',
				width : 50,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "男";
					} else if (val == 1) {
						return "女";
					}
				}
			}, {
				field : 'ptype',
				title : '类别',
				width : 70,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "司机";
					} else if (val == 1) {
						return "车主";
					} else if (val == 2) {
						return "司机、车主";
					}
				}
			}, {
				field : 'phoneNumber',
				title : '手机号',
				width : 90,
				align : 'center'
			}, {
				field : 'cardNumber',
				title : '身份证号',
				width : 120,
				align : 'center'
			}, {
				field : 'drivingLicense',
				title : '驾驶证号',
				width : 100,
				align : 'center'
			}, {
				field : 'drivingType',
				title : '准驾车型',
				width : 80,
				align : 'center'
			}, {
				field : 'employmentCertifiedCard',
				title : '上岗证从业资格证件号',
				width : 140,
				align : 'center'
			},
			//{field : 'employmentType',title : '从业类型',width : 80,align:'center'},
			{
				field : 'address',
				title : '住址',
				width : 100,
				align : 'center'
			}, {
				field : 'drivingRecord',
				title : '记录',
				width : 120,
				align : 'center'
			},
			//{field : 'updateDate',title : '更新日期',width : 80,align:'center'},
			{
				field : 'drivers_type',
				title : '来源',
				width : 120,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "PC注册";
					} else if (val == 1) {
						return "APP注册";
					}
				}
			}, {
				field : 'reviewed_state',
				title : '审核状态',
				width : 120,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "未提交";
					} else if (val == 1) {
						return "已提交未审核";
					} else if (val == 2) {
						return "审核通过";
					}
				}
			},

			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
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
		/*
		select框
		 */

		/*  $("#dname").select2({
		    placeholder: "请输入姓名",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    multiple: false,	//设置多项选择，false则只能单选
		    allowClear:true,		//允许清空	
		    maximumSelectionSize: 5, //最大选择个数
		    query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "driver.do?method=getDriverLength",
				   data: {search:query.term},   //传递你输入框中的值
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
		}); */

		$("#phone").select2({
			placeholder : "请输入车牌号", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "driver.do?method=getCarIdLength",
					data : {
						phones : query.term
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
		$("#type").combobox('setText', '全部');
	});

	//查询
	function searchDriver() {
		var carnumber = "";
		if ($.trim($("#phone").select2("data")) != "") {
			carnumber = $.trim($("#phone").select2("data").text);
		}
		$("#dg").datagrid('load', {
			//driver_name :$.trim($("#dname").select2("val")),
			driver_name : $.trim($("#dname").val()),
			phone_number : carnumber,
			//phone_number:$.trim($("#phone").val()),
			driving_type : $.trim($("#type").combobox('getValue')),
			drivers_type: $.trim($("#drivers_type").combobox('getValue')),
		//driving_type:$.trim($("#ptype").val()),
		});

	}
	//删除
	function deleteEver() {

		var array = $('#dg').datagrid('getSelections');
		var checkarray = [];
		if (array != "") {
			for ( var i = 0; i < array.length; i++) {
				checkarray.push(array[i].driverId);
			}

			$.ajax({
				type : "POST",
				url : 'driver.do?method=getselectagreement',
				data : {
					id : checkarray.join(",")
				},
				success : function(data) {

					if (data.flag) {
						$.messager.confirm('确认', '您确定要删除选中的记录吗？', function(r) {
							if (r) {
								$.ajax({
									url : "driver.do?method=deleteDriver",
									type : "POST",
									data : {
										del : checkarray.join(",")
									},
									success : function(data) {
										if (data.flag) {
											parent.$.messager.alert("信息删除",
													"信息删除成功", 'info', function(
															r) {
														$('#dg').datagrid(
																'reload');
													});
										}
									}
								});
							}
						});

					} else {
						$.messager.alert("司机管理", "此车辆已做协议", "info");
					}
				}
			});

		} else {
			$.messager.alert("司机管理", "请选择要删除的信息", "info");
		}
	}
	/*
	修改查询
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var id = row[i].driverId;
			}
			dialog = parent.jy.modalDialog({
				title : '信息修改',
				url : 'driver.do?method=EditDriverPage&pid=' + id,
				width : 680,
				buttons : [ {
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("司机管理", "请选择一行信息", "info");
		}
	}
	//修改
	function updateUser() {
		var myform = document.forms[1];
		myform.action = "driver.do?method=updateUser";
		myform.submit();

	}

	//导出
	function putoutfile() {
		var allRows = $("#dg").datagrid("getRows");
		alert(JSON.stringify(allRows));
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			colName.push(col.title);//把title列名到数组里去 
		}
		$("#datas").val(JSON.stringify(allRows));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}

	function add() {
		/* alert(document.getElementById("addbuttons"));
		alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '新增信息',
			url : 'driver.do?method=addDriver',
			/* 				 buttons :'#addbuttons'
			 */
			width : 680,
			buttons : [ {
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//重置
	function reset() {
		$("#phone").select2("val", '');
		$("#dname").val("");
		$("#type").combobox('setText', '全部');
		$("#type").combobox("setValue", "");
		$("#drivers_type").combobox('setText', '全部');
		$("#drivers_type").combobox("setValue", "");
	}
	//审核
	function shenhe() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			var type = row[0].drivers_type;
			var id = row[0].driverId;
			var reviewed_state = row[0].reviewed_state;
			if (type == 1) {
				if (reviewed_state == 2) {
					dialog = parent.jy
							.modalDialog({
								title : '司机信息审核',
								url : 'driver.do?method=shenHeDriverRegister&pid='
										+ id,
								width : 680,

							});
				} else {

					dialog = parent.jy
							.modalDialog({
								title : '司机信息审核',
								url : 'driver.do?method=shenHeDriverRegister&pid='
										+ id,
								width : 680,
								buttons : [
										{
											text : '<input type="button" class="btncss" value="不通过"/>',
											handler : function() {
												dialog.find('iframe').get(0).contentWindow
														.submitNotThrough(
																dialog, grid,
																parent.$);
											}
										},
										{
											text : '<input type="button" class="btncss" value="通过"/>',
											handler : function() {
												dialog.find('iframe').get(0).contentWindow
														.submitThrough(dialog,
																grid, parent.$);
											}
										} ]
							});
				}
			} else {
				$.messager.alert("司机管理", "请选择APP注册的司机", "info");
			}

		} else {
			$.messager.alert("司机管理", "请选择一行信息", "info");
		}
	}
</script>
<body class="easyui-layout">
	<div region="north" title="检索" class="st-north" border="false"
		collapsible="false">
		<lable>车牌号:</lable>
		<input type="hidden" style="width:150px" id="phone">
		<lable class="divlabel">姓名:</lable>
		<input type="text" id="dname" style="width:150px">
		<lable class="divlabel">来源:</lable>
		<select class="easyui-combobox" id="drivers_type" name="drivers_type"
			style="width:150px;height:22px"
			data-options="panelHeight : 'auto',editable:false">
			<option id="p0" value="">全部</option>
			<option id="p0" value="0">PC注册</option>
			<option id="p1" value="1">APP注册</option>
		</select>
		<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
		<!-- <lable class="divlabel">准驾车型:</lable> 
			 <input type="text"  id="ptype"  style="width:150px"  >-->
		<lable class="divlabel">类型:</lable>
		<select class="easyui-combobox" id="type" name="ptype"
			style="width:150px;height:22px"
			data-options="panelHeight : 'auto',editable:false">
			<option id="p0" value="">全部</option>
			<option id="p0" value="0">司机</option>
			<option id="p1" value="1">车主</option>
			<option id="p2" value="2">司机、车主</option>
		</select> <a class="easyui-linkbutton" onclick="searchDriver()"
			data-options="iconCls:'icon-search'" style="margin-left: 10px">查询</a>
	</div>
	<div region="center">
		<table id="dg" title="信息管理"></table>
	</div>
	<div id="tb">
		<!--  <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="addDriver()">新增</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateDriver" data-options="iconCls:'icon-edit',plain:true"onclick="getUpdateDriver()">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteDriver()">删除</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="getInputDriver" data-options="iconCls:'icon-input',plain:true"onclick="reset()">重置</a>
		 <a href="javascript:void(0)" class="easyui-linkbutton" id="outputDriver" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
 
      <div title='审核未通过' style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核未通过</span></div>
		    <div title='审核通过' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核通过</span></div>-->
		<div title='待审核'
			style='height: 16px;background:purple;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
			<span>待审核</span>
		</div>
		<!--   <div title='未审核' style='height: 16px;background:black;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未审核</span></div>
 -->
	</div>

	<div>
		<form action="driver.do" id="outputform" method="post">
			<input type="hidden" name="method" value="outDriverExcel"> <input
				type="hidden" id="datas" name="datas"> <input type="hidden"
				id="headtitle" name="headtitle">
		</form>
	</div>
</body>
</html>