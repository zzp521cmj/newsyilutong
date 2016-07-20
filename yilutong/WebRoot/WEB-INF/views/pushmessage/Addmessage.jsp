<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>消息推送</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>

</head>
<script type="text/javascript">
	$(function(){
		 $("#Regform").validationEngine('attach', {
				 promptPosition:'topRight:-15,0'
				 });
		$("#dg").datagrid({
			url : 'user.do?method=getUser',
			rownumbers : true,
			singleSelect : false,
			selectOnCheck : true,
			checkOnSelect : true,
			border:false,
			height:333,
			toolbar : '#tb',
			onSelect:function(index,data){
				var selectuser=$("#selectuser").text();
				var selectuserid=$("#selectuserid").text();
				if(selectuser.indexOf(data.username)!=-1){
					$.messager.alert("警告","不可以选择重复人员",'info');
					return;
				}
				if(selectuser=="全部"){
					$("#selectuser").text("");
					$("#selectuserid").text("");
				}
				if($("#selectuser").text()!=""){
					$("#selectuser").append(",");
					$("#selectuserid").append(",");
				}
				if(data.channelId!=null&&data.channelId!=""){
					if($("#channelId").text()!=""){
						$("#channelId").append(",");
					}
					$("#channelId").append(data.channelId);
				}
				$("#selectuser").append(data.username);
				$("#selectuserid").append(data.id);
				$("#cnid").val($("#channelId").text());
				$("#message_touserid").val($("#selectuserid").text());
				$("#message_tousername").val($("#selectuser").text());
				$('#dg').datagrid('deleteRow', index);
			},
			
			columns : [ [ {
				field : 'ck',
				checkbox : true
			}, {
				field : 'username',
				title : '用户名',
				width : 100
			}, {
				field : 'did',
				title : '所在部门',
				width : 100,
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
				width : 100,
				align : 'left',
				formatter : function(val, row, index) {
					if (val == "0") {
						return "其他";
					} else if (val == "1") {
						return "固定车辆";
					}
				}
			} ] ],
			pagination : true,
			pageSize : 5,
			pageList : [ 5, 10, 15, 20 ]
		});
	});
	var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
		if($("#Regform").validationEngine('validate')){
		  		$pjq.messager.confirm('发送消息', '确定要发送该条消息吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'pushMessage.do?method=pushMessage',
						data : $('#Regform').serialize(),
						success : function(msg) {
							if (msg.flag) {
								$pjq.messager.alert('发送消息', '发送消息成功', 'info');
								$dialog.dialog('close');
								$grid.datagrid('reload');
							};
						}
					});
				}
			});
		}
	};
	function clearuser(){
		if($("#selectuser").text()!="全部"){
			$("#selectuser").text("全部");
			$("#selectuserid").text("");
			$("#channelId").text("");
			$("#message_touserid").val("");
			$("#message_tousername").val("");
			$("#cnid").val("");
			$("#dg").datagrid('clearSelections');
			$("#dg").datagrid('reload');
		}
	}
	function searchUser() {
		$('#dg').datagrid('load', {
			user_name : $.trim($("#user_name").val())
		});
	}
	//键盘回车事件
		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchUser();
			}
		};
</script>
<body style="padding: 0px;margin:0px;" class="easyui-layout">
<div id="mainPanle" region="center" >
	<form action="" method="post" id="Regform">
		<input type="hidden" name="agreementId" />
		<fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">基本信息</th>
				</tr>	
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>消息标题:</td>
					<td class="td2"><input type="text"class="validate[required]" id="message_titleId" name="message_title"   />
					</td>
					
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>消息内容:</td>
					<td class="td2"><textarea class="validate[required]" id="" cols="40" rows="13"
						name="message_content" ></textarea>
					</td>
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>选择接受人:</td>
					<td class="td2"><span id="selectuser" style="word-wrap:break-word;word-break:break-all;">全部</span>&nbsp;&nbsp;<img alt="清除" src="./images/clear.png" style="cursor: pointer;width: 10px;height: 10px;" onclick="clearuser()">
					<span  id="selectuserid" style="display: none;"></span>
					<span  id="channelId" style="display: none;" ></span>
					<input type="hidden" id="message_touserid" name="message_touser">
					<input type="hidden" id="message_tousername" name="message_tousername">
					<input type="hidden" id="cnid" name="channelId">
					</td>
				</tr>
				
			</table>
		</fieldset>
	</form>
	</div>
	<div region="east" border="false"  title="用户选择"  style="width:420px;" id="eastId" data-options="collapsed:false">
		<label class="divlabel">用户名：</label><input id="user_name" name="user_name" type="text"
			class="search-text" style="margin: 5px;">
			<a class="easyui-linkbutton" onclick="searchUser()"
			data-options="iconCls:'icon-search'" id="searchId">查询</a>
		<table id="dg"></table>
	</div>
</body>
</html>