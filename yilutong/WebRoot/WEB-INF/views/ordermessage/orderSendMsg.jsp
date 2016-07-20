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
<style type="text/css">
	.search-text1 {
	vertical-align: middle;
  width: 150px;
  margin-right: 9px;
  height: 16px;
	}


</style>
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
		  var dialog;
		 	var grid;
	$(function(){
		 $("#Regform").validationEngine('attach', {
				 promptPosition:'topRight:-15,0'
				 });
		
  			grid=$("#dg").datagrid({
  			url : 'ChangeO.do?method=getOrderInfo',
  			border : false,
  			rownumbers : true,
  			fit : false,
  			height:450,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
	  	onSelect:function(index,data){
				var selectunum=$("#selectunum").text();
				var selectphone=$("#phone_number").text();
				/* if(selectunum.indexOf(data.shiping_order_num)!=-1){
					$.messager.alert("警告","不可以选择重复订单",'info');
					return;
				} */
				if(selectunum=="全部"){
					$("#selectunum").text("");
					$("#selectuserid").text("");
				}
				if($("#selectunum").text()!=""){
					$("#selectunum").append(",");
				}
				if($("#phone_number").text()!=""&&$("#phone_number").text()!=null){
					$("#phone_number").append(",");
				}
			/* 	if(data.shiping_order_num!=null&&data.shiping_order_num!=""){
					if($("#channelId").text()!=""){
						$("#channelId").append(",");
					}
					$("#channelId").append(data.channelId);
				} */
				$("#selectunum").append(data.shiping_order_num);
				$("#phone_number").append(data.receipt_tel);
				$("#cnid").val($("#channelId").text());
				$("#phone_number").val($("#phone_number").text());
				$("#message_touserid").val($("#selectuserid").text());
				$("#message_tousername").val($("#selectunum").text());
				$('#dg').datagrid('deleteRow', index);
			},
			
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shiping_order_num',title : '订单号',width : 60,align:'center'},
  				{field : 'send_station',title : '发站',width : 100,align:'center'},
  				{field : 'end_address',title : '到站',width : 55,align:'center'}, 
  				{field : 'custom_name',title : '客户名称',width : 60,align:'center'},
  				{field : 'car_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
  	 			{field : 'receipt_address',title : '收货地址',width : 100,align:'center'},
  				{field : 'goods_name',title : '货物',width : 60,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 70,align:'center'},
  				{field : 'send_type',title : '送货方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  						return "送货";
  						}
  					}
  				}, 
  			 	{field : 'shipping_order_state',title : '状态',width : 50,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "受理";
  						}else if(val==1){
  							return "在途";
  						}else if(val==2){
  						return "到达";
  						}else if(val==4){
  						return "签收";
  						}
  					}	
  				}, 
  				{field : 'shipping_order',title : '制单人',width : 60,align:'center',sortable:'true'},
  				{field : 'send_time',title : '发车时间',width : 120,align:'center',sortable:'true'},
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  				//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
				$("#phone").val("");
				$("#send_address").val("");
				$("#end_address").val("");
				$("#perpole").val("");
				$("#pay_state").combobox("setValue","");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
		$('#dlg1').dialog({
			title : '添加',
			width : 380,
			height : 150,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons'
		});
		$('#cc').combobox({ 
			url:'shipOrder.do?method=getMsgModel',
			valueField:'id', 
			textField:'text',
			editable:false,
			 onChange:function(newValue,oldValue){
        		$.ajax({
						type : "POST",
						url : 'shipOrder.do?method=getMsgContent',
						data : {
						msgid:newValue
						},
						success : function(msg) {
							if (msg!=null) { 
								$("#ordeMsgs").val(msg);
							};
						}
					});
    		}
		}); 
	});
	 function addMessage () {
		if($("#Regform").validationEngine('validate')){
			var phone=$("#phone_number").val();
	 		var ordeMsg=$("#ordeMsgs").val();
		  		$.messager.confirm('发送消息', '确定要发送该条消息吗?', function(r) {
				if (r) {
					$.ajax({
						type : "POST",
						url : 'shipOrder.do?method=sendOrderMsg',
						data : {
						phone:phone,
						orderMsg:ordeMsg
						},
						success : function(msg) {
							if (msg.flag) {
								$.messager.alert('发送消息', '发送消息成功', 'info');
							};
						}
					});
				}
			});
		}
	};
	function clearuser(){
		if($("#selectunum").text()!="全部"){
			$("#selectunum").text("全部");
			$("#selectuserid").text("");
			$("#channelId").text("");
			$("#phone_number").val("");
			$("#message_touserid").val("");
			$("#message_tousername").val("");
			$("#cnid").val("");
			$("#dg").datagrid('clearSelections');
			$("#dg").datagrid('reload');
		}
	}
	function searchUser() {
		$('#dg').datagrid('load', {
			num : $.trim($("#order_num").val()),
			receipt : $.trim($("#receipt").val()),
			phone : $.trim($("#phone").val()),
			send_type:$.trim($("#send_type").combobox("getValue")),
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
		function addMessageModel(){
			if($("#ordeMsgs").val()==null||$("#ordeMsgs").val()==""){
				$.messager.alert('发送消息', '消息内容不能为空', 'info');
			}else{
				$("#dlg1").dialog('open');	
			}
		}
		function addMsgModelTitle(){
		 	if($("#modeTitleId").val()==null||$("#modeTitleId").val()==""){
				$.messager.alert('发送消息', '消息标题不能为空', 'info');
			}else{
				$.messager.confirm('保存消息', '确定要保存该消息模板吗?', function(r) {
					if (r) {
						$.ajax({
							type : "POST",
							url : 'shipOrder.do?method=sendMsgModelInfo',
							data : {
							msgTitle:$("#modeTitleId").val(),
							msgContent:$("#ordeMsgs").val()
							},
							success : function(msg) {
								if (msg.flag) {
									$.messager.alert('保存消息', '保存消息模板成功', 'info');
									$("#dlg1").dialog('close');									$('#cc').combobox('reload');
									$('#cc').combobox('reload');
								};
							}
						});
					}
				});
			}
		}
</script>
<body  class="easyui-layout">
<div id="mainPanle" region="center"   data-options="region:'west',title:'信息内容',split:false" >
	<form action="" method="post" id="Regform">
		<fieldset>
			<table class="tableclass">
			<tr>
					<th colspan="4">基本信息							  
					</th>
				</tr>	
				<tr rowspan>
					<td><font color="red" style="margin-right:10px">*</font>手机号:</td>
					<td class="td2"   ><textarea type="text"class="validate[required]" id="phone_number" name="phone"   cols="20" rows="2"></textarea>
					<br><font color="red" style="margin-top:10px">*（可同时输入多个号码，号码之间用逗号隔开）</font>
					
					</td>
					
				</tr>
				<tr>
					<td><font color="red" style="margin-right:10px">*</font>消息内容:</td>
					<td class="td2">
					选择模板：<select id="cc" name="dept" style="width:200px;"><option>--请选择--</option></select><br><br>
					<textarea class="validate[required]"  id="ordeMsgs"  cols="40" rows="13"
						name="message_content" ></textarea>
					<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="addMessageModel()" id="tbadd" >添加为短信模板</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" style="float: right" data-options="iconCls:'icon-add',plain:true" onclick="addMessage()" id="tbadd" >发送短信消息</a>
					
					</td>
					
				</tr>
				<tr >
					<td><font color="red" style="margin-right:10px">*</font>选择订单号:</td>
					<td class="td2" ><span id="selectunum" style="word-wrap:break-word;word-break:break-all;">全部</span>&nbsp;&nbsp;<img alt="清除" src="./images/clear.png" style="cursor: pointer;width: 10px;height: 10px;" onclick="clearuser()">
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
	<div region="east" border="true"  title="检索"  style="width: 570px;"  id="eastId" data-options="collapsed:false">
	<div style="padding:10px;">
			<label >运单号：</label><input id="order_num" name="user_name" type="text"
			class="search-text1" >
			<label >收货人：</label><input id="receipt" name="user_name" type="text"
			class="search-text1">
			<a class="easyui-linkbutton" onclick="searchUser()"
			data-options="iconCls:'icon-search'" id="searchId">查询</a>	
			<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多</a>
	    	 <div id="searchInfoId" style="display: none">
	    	 <label >电&nbsp;话：</label><input id="phone" name="user_name" type="text"
			class="search-text1" >
			<label >交接方式：</label>
				<select class="easyui-combobox" id="send_type" name="agreement_type"
					style="width:150px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">自提</option>
					<option id="" value="1">送货</option>
				</select>
			
	    	 
	    	 
	    	 </div>
			
	</div>
		<table id="dg"  height="300px"  title="订单信息"></table>
	</div>
	<div id="dlg1">
		<table class="tableclass">
			<tr>
				<td>
					<font color="red" style="">*</font>请输入短信模板标题：<input type="text" style="height: 35px" id="modeTitleId">
				</td>
			</tr>
		</table>
	<div  id="buttons" >
  			<input type="button" onclick="addMsgModelTitle()" value="添加" class="btncss"/>   
  	</div>
	</div>
</body>
</html>