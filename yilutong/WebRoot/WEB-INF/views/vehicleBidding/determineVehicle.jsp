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
<title>确定车辆</title>
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
<!-- <script type="text/javascript" src="./js/function.js"></script> -->
<!--命名按钮方法  -->


</head>
<%
	String cid = (String) request.getAttribute("id");
	String agreement_number = (String) request.getAttribute("agreement_number");
%>
<script type="text/javascript">
    var dialog;
    var grid;
    var cid='<%=cid%>';
    var agreement_number='<%=agreement_number%>';
	$(function() {
		grid = $("#dg")
				.datagrid(
						{
							url : 'vehicleBidding.do?method=getDetermineVehicleMessage&cid='
									+ cid,
							border : false,
							rownumbers : true,
							fit : true,
							// sortName:'transport_pay,check_time,shipping_order',
							//sortOrder:'desc',
							singleSelect : false,
							selectOnCheck : true,
							checkOnSelect : true,
							multiSort : true,
							/* 	remoteSort:true, */
							rowStyler : function(index, row) {
				                if (row.is_vehbid == 1) {
					            return 'color:blue';
				                }
							},
							columns : [ [
									{
										field : 'agreement_id',
										checkbox : true
									},
									{
										field : 'vehiclebidding_price',
										title : '竞价价格',
										width : 80
									},{
										field : 'vehiclebidding_message',
										title : '竞价信息',
										width : 80
									},{
										field : 'is_vehbid',
										title : '是否竞价',
										width : 80,
										formatter : function(val, row, index) {
											if (val == 0) {
												return "未竞价";
											} else if (val == 1) {
												return "已竞价";
											}
										}
									},
									{
										field : 'driver_name',
										title : '司机姓名',
										width : 120,

									},
									{
										field : 'plate_number',
										title : '车牌号',
										width : 120,

									},
									{
										field : 'card_number',
										title : '身份证',
										width : 120
									},

									/*      {field : 'departmentId',title : '所属部门',width : 140,

									         formatter:function(val,row,index){
									             $.ajax({
									                 type: "POST",
									                 async : false,
									                 url:'user.do?method=getDepartment',
									                 data:{did:val},
									                 success:function(data){
									                     da=data;
									                 }
									             });
									             val = da;
									             return val;
									         } }, */
									{
										field : 'phone_number',
										title : '司机手机号',
										width : 120
									},/* , {
									                                field : 'car_height',
									                                title : '车高',
									                                width : 160
									                            }, */
									{
										field : 'car_length',
										title : '车长',
										width : 80,
									},
									{
										field : 'length_name',
										title : '厢型',
										width : 80
									},
									{
										field : 'tonnage',
										title : '吨位',
										width : 80,
									},
									{
										field : 'is_receipt_free',
										title : '是否接受回单结算',
										width : 120,
										formatter : function(val, row, index) {
											if (val == 0) {
												return "是";
											} else {
												return "否";
											}
										}
									},
									{
										field : 'is_edit',
										title : '是否修改价格',
										width : 80,
										formatter : function(val, row, index) {
											if (val == 1) {
												return "是";
											} else if(val=0) {
												return "否";
											}else{
											    return "未";
											}
										}
									} ] ],
							pagination : true,//分页
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							toolbar : '#tb'
						});

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
				$("#agreement_type option:first").prop("selected", 'selected');
				$("#end_address").val("");
				$("#company_id").val("");
				$("#phone_number").val();
				$("#order_state option:first").prop("selected", 'selected');
			} else {
				$('.easyui-layout').layout('panel', 'north').panel('resize', {
					height : 60
				});
				$('.easyui-layout').layout('resize');
				btnMoreSearch.text("更多条件");
				btnMoreSearch.attr("state", "close");
				$("#searchInfoId").css("display", "none");
				$("#agreement_type option:first").prop("selected", 'selected');
				$("#end_address").val("");
				$("#company_id").val("");
				$("#phone_number").val("");
				$("#order_state option:first").prop("selected", 'selected');
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
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
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
		// var startDate=document.getElementById("startDate").value;
		//var endDate=document.getElementById("endDate").value;
		/* if($.trim($("#phone").select2("data"))!=""){
		 phone=$.trim($("#phone").select2("data").text);
		 } */
		$("#dg").datagrid('load', {
			// start_date :startDate,
			// end_date :endDate,
			car_name : $.trim($("#car_name").val()),
			car_number1 : $.trim($("#car_number1").val()),
			//agreement_type:$.trim($("#agreement_type").val()),
			// end_address:$.trim($("#end_address").val()),
			//company_id:$.trim($("#company_id").val()),
			phone_number : $.trim($("#phone_number").val()),
		// order_state:$.trim($("#order_state").val()),
		//institution:$.trim($("#cc3").combotree("getValue")),
		});

	}
	//删除
	function deleteEver() {
		var checkarray = [];
		var check = [];
		var array = $('#dg').datagrid('getSelections');
		for ( var i = 0; i < array.length; i++) {
			if (array[i].isagain == 1) {
				check.push(array[i].agreement_id);
			} else {
				checkarray.push(array[i].agreement_id);
			}

		}
		if (array != "") {
			$.messager.confirm('确认', '您确定作废选中的记录吗？', function(r) {
				if (r) {
					$.ajax({
						url : "createA.do?method=deleCreateA",
						type : "POST",
						data : {
							del : checkarray.join(","),
							dela : check.join(",")
						},
						success : function(data) {
							if (data.flag) {
								parent.$.messager.alert("协议信息", "协议信息已作废",
										'info', function(r) {
											$('#dg').datagrid('reload');
										});
							}
						}
					});
				}
			});
		} else {
			$.messager.alert("协议制作", "请选择要作废的信息", "info");
		}
	}

	/*
	 详细
	 */
	function modify() {
		var row = $("#dg").datagrid('getSelections');
	
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var id = row[i].agreement_id;
			}
			if(row[0].is_vehbid!=0){
			//console.info(row);
			var allMoney = row[0].vehiclebidding_price;
			var agreement_id = row[0].agreement_id;
			var driver_id = row[0].driver_id;
			var plate_number = row[0].plate_number;
			var driver_name = row[0].driver_name;
			var car_id = row[0].car_id;
			var phone_number = row[0].phone_number;
			$.messager.confirm('确认车辆', '确定选择此车配送？', function(r){
	         if (r){
	            $.ajax({
				type : "POST",
				url : "vehicleBidding.do?method=determineVehicleDriver",
				data : {
					allMoney : allMoney,
					agreement_id : agreement_id,
					driver_id : driver_id,
					plate_number : plate_number,
					driver_name : driver_name,
					car_id : car_id,
					phone_number : phone_number,
					agreement_number : agreement_number
				}, //传递你输入框中的值
				success : function(msg) {
					if (msg) {
						$.messager.alert('确认车辆', '车辆确定成功,请关闭', 'info');
						$("#dg").datagrid('loadData', {
							total : 0,
							rows : []
						});
						//company.dialog('close');
						//$grid.datagrid('reload');
					}
				}
			  });
	         }
           
            });

			

          }else{
            $.messager.alert("确定车辆", "请选择已竞价的记录", "info");
          }
          
		} else {
			$.messager.alert("确定车辆", "请选择一行信息", "info");
		}
	}
	//详情查询
	function xiangxixinxi() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			for ( var i = 0; i < row.length; i++) {
				var id = row[i].shiping_order_id;
			}
			dialog = parent.jy.modalDialog({
				title : '订单详情',
				url : 'shipOrder.do?method=getShipOrderPage&pid=' + id,
				width : 930,
				height : 600,
				buttons : [ {
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});
		} else {
			$.messager.alert("协议制作", "请选择一行信息", "info");
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
		/* var colName=[];
		 var fieldName=[];
		 for(i=1;i<allRows2.length;i++)
		 {
		 var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
		 if(col.field!="check_type"&&col.field!="send_type"){
		 colName.push(col.title);//把title列名到数组里去 
		 fieldName.push(col.field); //把field列属性名到数组里去 
		 } 
		 } 
		 $("#fieldName").val(fieldName.join(","));
		 $("#headtitle").val(colName.join(",")); */
		var checkarray = [];
		var array = $('#dg').datagrid('getSelections');
		for ( var i = 0; i < array.length; i++) {
			checkarray.push(array[i].agreement_id);
		}
		$("#agId").val(checkarray.join(","));
		var outputform = $("#outputform");
		outputform.submit();
	}
	//制作承运协议
	function add() {
		dialog = parent.jy.modalDialog({
			title : '承运协议制作',
			url : 'createA.do?method=getCreateAgreePage',
			/* 				 buttons :'#addbuttons'
			 */
			resizable : true,
			height : 600,
			width : 1100,
			buttons : [ {
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ],
			onClose : function() {
				$('#dg').datagrid('reload');
			}
		});
	};

	function ow(owurl) {
		var tmp = window.open("about:blank", "", "fullscreen=1");
		tmp.moveTo(0, 0);
		tmp.resizeTo(screen.width + 20, screen.height);
		tmp.focus();
		tmp.location = owurl;
	}
	//导入
	function putintfile() {
		dialog = parent.jy.modalDialog({
			title : '导入订单',
			url : 'shipOrder.do?method=imp',
			width : 600,
			height : 300,
			buttons : [ {
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	};
	//重置
	function reset() {
		$("#startDate").val("");
		$("#endDate").val("");
		$("#car_name").val("");
		$("#car_number1").val("");
		$("#agreement_type option:first").prop("selected", 'selected');
		$("#end_address").val("");
		$("#company_id").val("");
		$("#phone_number").val("");
		$("#order_state option:first").prop("selected", 'selected');
	}

	function createLin() {
		var row = $("#dg").datagrid('getSelections');
		if (row.length == 1) {
			var aid = row[0].agreement_id;//协议id
			$("#aid").val(aid);
			document.getElementById("clform").action = "maplin.do?method=createLin";
			document.getElementById("clform").submit();
		} else {
			$.messager.alert("请选择一行信息");
		}
	}
	//修改价格
	function eidtPrice(){
	   var checkarray = [];
	   var ca="";
	   var row = $("#dg").datagrid('getSelections');
	   
	   for ( var i = 0; i < row.length; i++) {
	   	   //if(row[i].is_vehbid==1){
	   	      checkarray.push(row[i].driver_id);
	   	  //} 
	   	  
	   }
	   ca=row[0].agreement_id;
	   if(checkarray!=""&&checkarray!=null){
	   	dialog = parent.jy.modalDialog({
			title : '修改价格',
			url : 'vehicleBidding.do?method=editPrice&id='+checkarray.join(",")+'&ca='+ca,
			width : 400,
			height : 200,
			buttons : [ {
				text : '<input type="button" value="确认" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	  }else {
			$.messager.alert("修改价格","请选择已竞价的信息",'info');
	  }
	  
	   
	}
</script>
<body class="easyui-layout">
	<form action="" name="clform" id="clform" method="post">
		<input id="aid" name="aid" value="">
	</form>
	<form action="createA.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			collapsible="false">
			<!-- 		<lable>制单时间:</lable>
			<input id="startDate" name="start_date" class="Wdate" readonly="readonly"
				style="width:150px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="endDate" name="end_date" class="Wdate" readonly="readonly"
				style="width:150px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /> -->
			<lable class="divlabel">司机:</lable>
			<input type="text" class="search-text" name="car_name" id="car_name"
				style="width:150px">
			<lable class="divlabel">车牌号:<input type="text"
				name="car_number1" class="search-text" id="car_number1"
				style="width:150px"></lable>
			<lable id="phone_number1" class="divlabel">联系方式:<input
				type="text" class="search-text" name="phone_number"
				id="phone_number" style="width:150px"></lable>
			<a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a>
			<!-- <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<lable class="divlabel1">协议类型:<select id="agreement_type"
					name="agreement_type">
					<option value="" selected="selected">请选择</option>
					<option value="0">班线</option>
					<option value="1">配送</option>
					<option value="2">转运</option>
				</select></lable>
				<lable id="end_address1" class="divlabel">到达地:<input
					type="text" class="search-text" name="end_address" id="end_address"
					style="width:150px"></lable>
				<lable id="company_id1" class="divlabel">中转公司:<input
					type="text" class="search-text" name="company_id" id="company_id"
					style="width:150px"></lable>
				
				<lable id="order_state1" class="divlabel">状态: <select
					id="order_state" name="order_state">
					<option value="" selected="selected">请选择</option>
					<option value="0">未出库</option>
					<option value="1">配送中</option>
					<option value="2">转运中</option>
					<option value="4">已签收</option>
					<option value="3">已到达</option>
				</select> </lable> -->
		</div>
		</div>
		<div region="center">
			<table id="dg" title="竞价信息"></table>
		</div>
		<div id="tb">
			<div title='已竞价'
				style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '>
				<span>已竞价</span>
			</div>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true" onclick="modify()">确定车辆</a>
			<a href='javascript:void(0)' class='easyui-linkbutton' id='tbreset'
				onclick="reset()" data-options="iconCls:'icon-reset',plain:true">重置</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" id="modify"
				data-options="iconCls:'icon-edit',plain:true" onclick="eidtPrice()">修改价格</a> 
			<!-- 			<a href="javascript:void(0)" class="easyui-linkbutton" id="modify"
				data-options="iconCls:'icon-edit',plain:true" onclick="modify()">查看记录</a> -->

			<!-- <a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-remove',plain:true"
				onclick="deleteEver()">作废</a> -->
			<!--<a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>
          -->
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton"
				id="outputCar_owner" data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a> -->
			<!--<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a>
          <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="daShipOrder()">打印</a> -->
			<!-- <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-redo',plain:true"   onclick="createLin()">创建路线</a> -->

		</div>
		<input type="hidden" name="agreementIds" id="agId"> <input
			type="hidden" name="method" value="outAgreement"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
	
</body>
</html>