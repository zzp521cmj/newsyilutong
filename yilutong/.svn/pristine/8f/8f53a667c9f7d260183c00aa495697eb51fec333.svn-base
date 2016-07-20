<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/surmax/";
%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>协议接单管理</title>
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


</head>
<%
	User user = (User) request.getSession().getAttribute(
			SessionInfo.SessionName);
%>
<script type="text/javascript">
	  	var dialog;
 		var grid;
 		var departid='<%=user.getDid()%>';
	$(function() {
		grid = $("#dg").datagrid({
			url : 'changeA.do?method=getChangeA&departid=' + departid,
			border : false,
			rownumbers : true,
			fit : true,
			sortName : 'transport_pay,check_time,shipping_order',
			sortOrder : 'desc',
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			multiSort : true,
			/* 	remoteSort:true, */
			columns : [ [ {
				field : 'agreement_id',
				checkbox : true
			}, {
				field : 'agreement_number',
				title : '协议编号',
				width : 90,
				align : 'center'
			}, {
				field : 'agreement_type',
				title : '协议类型',
				width : 60,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "班线";
					} else if (val == 1) {
						return "配送";
					} else if (val == 2) {
						return "转运";
					}
				}

			}, {
				field : 'end_address',
				title : '到达地',
				width : 60,
				align : 'center'
			}, {
				field : 'ndp_id',
				title : '托运机构',
				width : 90,
				align : 'center',
				formatter : function(val, row, index) {
					var de = '';
					$.ajax({
						type : "POST",
						async : false,
						url : 'depn.do?method=getDepn',
						data : {
							department_id : val
						},
						success : function(data) {
							de = data.department_name;
							//$("#ndpid").val(data.department_id);
							//$("#departments").append("<li>"+data+"</li>");
						}
					});
					return de;
				}

			}, {
				field : 'ldp_id',
				title : '上一机构',
				width : 90,
				align : 'center',
				formatter : function(val, row, index) {
					var de = '';
					$.ajax({
						type : "POST",
						async : false,
						url : 'depn.do?method=getDepn',
						data : {
							department_id : val
						},
						success : function(data) {
							de = data.department_name;
							//$("#ndpid").val(data.department_id);
							//$("#departments").append("<li>"+data+"</li>");
						}
					});
					return de;
				}

			}, {
				field : 'car_number1',
				title : '车牌号',
				width : 70,
				align : 'center'
			}, {
				field : 'car_name',
				title : '司机',
				width : 65,
				align : 'center'
			}, {
				field : 'all_money',
				title : '总运费',
				width : 70,
				align : 'center'
			}, {
				field : 'phone_number',
				title : '联系方式',
				width : 80,
				align : 'center'
			}, {
				field : 'order_state',
				title : '状态',
				width : 50,
				align : 'center',
				formatter : function(val, row, index) {
					if (val == 0) {
						return "未出库";
					} else if (val == 1) {
						return "配送中";
					} else if (val == 2) {
						return "转运中";
					} else if (val == 4) {
						return "已签收";
					} else if (val == 3) {
						return "已到达";
					}
				}
			}, {
				field : 'number',
				title : '运单数',
				width : 60,
				align : 'center'
			}, {
				field : 'remarks',
				title : '备注',
				width : 100,
				align : 'center'
			},
			//{field : 'create_user',title : '协议制作者',width : 90,align:'center',sortable:'true'},
			{
				field : 'create_time',
				title : '协议制作时间',
				width : 140,
				align : 'center',
				sortable : 'true',
				formatter: function(value,row,index){
		  				if(value!=undefined){
		  					value=value.substr(0,19);
		  				}
		  				return value;
		  		} 	
			},
			//{field : 'updateDate',title : '更新日期',width : 80,align:'center'},

			] ],
			pagination : true,//分页
			pageSize : 10,
			pageList : [ 5, 10, 15, 20 ],
			toolbar : '#tb'
		});

		
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
		//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
		btnMoreSearch.click(function() {
			if (btnMoreSearch.attr("state") == "close") {
				//主要代码 
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 92
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("收起条件");
				btnMoreSearch.attr("state", "open");
				$("#searchInfoId").css("display", "block");
			} else {
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 60
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("更多条件");
				btnMoreSearch.attr("state", "close");
				$("#searchInfoId").css("display", "none");
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
		/*
		select框
		 */

		$("#carid").select2({
			placeholder : "请输入车主电话", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			allowClear : true,
			multiple : false, //设置多项选择，false则只能单选
			maximumSelectionSize : 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "shipOrder.do?method=getPhoneLength",
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
	});

	//查询
	function searchCar_owner() {
		var startDate = document.getElementById("startDate").value;
		var endDate = document.getElementById("endDate").value;
		/* if($.trim($("#phone").select2("data"))!=""){
		phone=$.trim($("#phone").select2("data").text);
			} */
		$("#dg").datagrid('load', {
			start_date : startDate,
			end_date : endDate,
			name : $.trim($("#ddId").val()),
		//institution:$.trim($("#cc3").combotree("getValue")),
		});

	}
	//删除
	function addJs() {
		var checkarray = [];
		var array = $('#dg').datagrid('getSelections');
		for (var i = 0; i < array.length; i++) {
			checkarray.push(array[i].agreement_id);
		}
		if (array != "") {
			$.messager.confirm('确认', '您确定接收选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "changeA.do?method=delchangeA",
						type : "POST",
						data : {
							del : checkarray.join(",")
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("协议信息", "协议信息已接收",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("协议转接", "请选择要接收的信息", "info");
		}
	}

	/*
	详细
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for (var i = 0; i < row.length; i++) {
				var id = row[i].agreement_id;
			}
			dialog = parent.jy.modalDialog({
				title : '协议详情',
				url : 'createA.do?method=xiangxiEditCreateA&pid=' + id,
				width : 930,
				buttons : [ {
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("协议转接", "请选择一行信息", "info");
		}
	}
	//详情查询
	function xiangxixinxi() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for (var i = 0; i < row.length; i++) {
				var id = row[i].shiping_order_id;
			}
			dialog = parent.jy.modalDialog({
				title : '订单详情',
				url : 'shipOrder.do?method=getShipOrderPage&pid=' + id,
				width : 930,
				buttons : [ {
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("协议转接", "请选择一行信息", "info");
		}
	}
	//修改
	function updateUser() {
		var myform = document.forms[1];
		myform.action = "car_owner.do?method=updateCar_owner";
		myform.submit();

	}

	//导出
	function putoutfile() {
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName = [];
		var fieldName = [];
		for (i = 1; i < allRows2.length; i++) {
			var col = $('#dg').datagrid("getColumnOption", allRows2[i]);
			if (col.field != "check_type" && col.field != "send_type") {
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			}
		}
		$("#fieldName").val(fieldName.join(","));
		$("#headtitle").val(colName.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}

	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}

	//重置
	function reset() {
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
	}
</script>
<body class="easyui-layout">
	<form action="shipOrder.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<lable>制单时间:</lable>
			<input id="startDate" class="Wdate" readonly="readonly"
				style="width:150px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="endDate" class="Wdate" readonly="readonly"
				style="width:150px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable class="divlabel">协议编号:</lable>
			<input type="text" class="search-text" id="ddId" style="width:150px">
			<a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a>
		</div>
		<div region="center">
			<table id="dg" title="协议信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onclick="addJs()">协议接收</a>
			<!--<a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a>
		     <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="daShipOrder()">打印</a> -->
		</div>
		<input type="hidden" name="method" value="outShipOrder"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
</body>
</html>