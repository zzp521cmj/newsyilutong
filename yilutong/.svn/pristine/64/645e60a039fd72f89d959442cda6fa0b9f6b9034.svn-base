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

<title>城市信息</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<style type="text/css">
	.tree-node{
		height:23px;
	}
	fieldset{
		padding: 10px;
	}
	
	</style>
</head>
<script type="text/javascript">
	//   		function saveDriver(){
	//   			var myform=document.forms[0];
	//   			myform.action="driver.do?method=saveDriver";
	//   			myform.submit();
	//   		}
	//$dialog  关闭digkog
	//$grid 数据显示  刷新
	// $pjq 弹出提示
	//$mainMenu 预留传的参数
	var grid;
	$(function(){
		$("#city1").bind('contextmenu',function(e){
                $('#rightCliMean2').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
             $("#citytype").val("1");
        });
		$("#city2").bind('contextmenu',function(e){
                $('#rightCliMean2').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
                $("#citytype").val("2");
        });
		$("#citytype1").tree({
			lines:true,
    		url:'city.do?method=citytype1',
    		onClick: function(node){
    		   $('#citytype2').tree('options').url = "city.do?method=citytype2&id=" + node.id;//加载下层节点
			   tollval(node.id,node.text,node.citytype,node.parent_id);
			   $("#citytype2").tree("reload");
 			},onContextMenu : function(e, node) {
				e.preventDefault();
 				$(this).tree('select', node.target);
 				tollval(node.id,node.text,node.citytype,node.parent_id);
 				$('#rightCliMean').menu('show',{
					left: e.pageX,
					top: e.pageY
				});
			}
		});
		$("#citytype2").tree({
			lines:true,
			animate : true,
			url:'city.do?method=citytype2',
	 		onClick: function(node){
	 		 	tollval(node.id,node.text,node.citytype,node.parent_id);
    		  	$("#dg").datagrid('load',{
		 	 		id :node.id
	 			});
 			},
 			onContextMenu : function(e, node) {
				e.preventDefault();
 				$(this).tree('select', node.target);
 				tollval(node.id,node.text,node.citytype,node.parent_id);
 				$('#rightCliMean').menu('show',{
					left: e.pageX,
					top: e.pageY
				});
			}
		});
		grid = $("#dg").datagrid({
			url : 'city.do?method=citytype3',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'cityname',title : '区县名称',width : 100,align:'center'}
  			]],
  			toolbar : '#tb'
 		});
 		$('#adddialog').dialog({
			title : '添加',
			width : 300,
			height : 150,
			closed : true,
			cache : false,
			modal : true,
			buttons : [{
				text : '<input type="button"  class="btncss" value="添加"/>',
				handler : function() {
					$("#cityname").val($("#addcityname").val());
					$.ajax({
						type : "POST",
						url : 'city.do?method=addcity',
						data : $('#forminfo').serialize(),
						success : function(msg) {
							if (msg.flag) {
								$.messager.alert('新增城市', '添加成功', 'info');
								$('#adddialog').dialog('close');
								if($("#citytype").val()==1){
									$("#citytype1").tree("reload");
								}else if($("#citytype").val()==2){
									$("#citytype2").tree("reload");
								}else{
									grid.datagrid('reload');
								}
							};
						}
					});
					
				}
			}]
		});
		$('#updatedialog').dialog({
			title : '修改',
			width : 300,
			height : 150,
			closed : true,
			cache : false,
			modal : true,
			buttons : [{
				text : '<input type="button"  class="btncss" value="修改"/>',
				handler : function() {
					$("#cityname").val($("#editcityname").val());
					
					$.ajax({
						type : "POST",
						url : 'city.do?method=updatecity',
						data : $('#forminfo').serialize(),
						success : function(msg) {
							if (msg.flag) {
								$.messager.alert('修改城市', '修改成功', 'info');
								$('#updatedialog').dialog('close');
								if($("#citytype").val()==1){
									$("#citytype1").tree("reload");
								}else if($("#citytype").val()==2){
									$("#citytype2").tree("reload");
								}else{
									grid.datagrid('reload');
								}
							};
						}
					});
					
				}
			}] 
		});
	});

	//添加
	function addtreenode(flg){
		if($("#citytype1").tree("getSelected")==null){
			$.messager.alert('警告', '请先在省份列表中，选择所归属的省份', 'info');
			return;
		}
		else if(flg==1){
			tollval($("#citycode").val(),$("#cityname").val(),'3',$("#citycode").val());
		}
		//省份空白处点击添加
		else if($("#citycode").val()==null||$("#citycode").val()==""&&$("#citytype").val()==1){
			tollval(0,$("#cityname").val(),1,1);
		}
		else if($("#citytype2").tree("getSelected")!=null){
			
		}else{
			tollval($("#citycode").val(),$("#cityname").val(),$("#citytype").val(),$("#citycode").val());
		}
		$("#addcityname").val("");
		$("#adddialog").dialog('open');
	}
	//修改
	function updatetreenode(){
		$("#editcityname").val($("#cityname").val());
		$("#updatedialog").dialog('open');
	}
	//删除
	function deletetreenode(){
		$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){
	    	if (r){
				$.ajax({
					type : "POST",
					url : 'city.do?method=deletecity',
					data : $('#forminfo').serialize(),
					success : function(msg) {
						if (msg.flag) {
							$.messager.alert('删除城市', '删除成功', 'info');
							if($("#citytype").val()==1){
								$("#citytype1").tree("reload");
							}else{
								$("#citytype2").tree("reload");
							}
						}else if(msg.ans=="1"){
							$.messager.alert('删除城市', '该删除的城市下边有其他城市信息，需要将其下的其他城市信息删除后，才可删除该城市', 'info');
						};
					},
					error:function(){
						alert("网络连接异常，请刷新页面或者重新登录");
					}
				});
			}
		});
	}
	//赋值给临时隐藏域
	function tollval(citycode,cityname,citytype,parent_id){
		$("#citycode").val(citycode);
		$("#cityname").val(cityname);
		$("#citytype").val(citytype);
		$("#parent_id").val(parent_id);
	}
	//删除区县
	function deleteCity(flg){
		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].citycode);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "city.do?method=deleteqx",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("删除","删除成功",'info',
										function(r) {
											grid.datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			alert("请选择要删除的信息");
  		}
	}
	//区县修改
	function getUpdateCity(flg){
		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].citycode;
		  			var cityname=row[i].cityname;
		  		}
		  	$("#citytype").val('3');
		  	$("#citycode").val(pid);
	  		$("#editcityname").val(cityname);
			$("#updatedialog").dialog('open');
  		}else{
  			alert("请选择一行信息");
  		}	
	}
</script>
<body style="padding: 0px;margin:0px;" class="easyui-layout"  oncontextmenu=self.event.returnValue=false>
	
	
	 <div data-options="region:'west',split:true,title:'省份列表'" style="width:150px" id="city1">
	 	<ul id="citytype1"></ul>
	 </div>
    <div data-options="region:'center',split:true,title:'城市列表'" id="city2">
    	<ul id="citytype2"></ul>
    	<form name="form" action="person.do?method=uploadHeadImage"
	      method="post"  id="forminfo" >
			<input type="hidden" id="citycode" name="citycode">
			<input type="hidden" id="cityname" name="cityname">
			<input type="hidden" id="citytype" name="city_type">
			<input type="hidden" id="parent_id" name="citye_parent_id">
		</form>
    </div>
    <div data-options="region:'east',title:'区县',split:true" style="width:350px;">
    	<table id="dg"></table>
    </div>
    <div id="tb">
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="addtreenode('1')">新增</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"onclick="getUpdateCity('1')">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteCity('1')">删除</a>
		</div>
	<div id="rightCliMean" class="easyui-menu" style="width:120px;">
		<div onclick="addtreenode();" data-options="iconCls:'icon-add'">新增</div>
		<div onclick="updatetreenode();" data-options="iconCls:'icon-edit'">修改</div>
		<div onclick="deletetreenode();" data-options="iconCls:'icon-tip'">删除</div>
	</div>
	<div id="rightCliMean2" class="easyui-menu" style="width:120px;">
		<div onclick="addtreenode();" data-options="iconCls:'icon-add'">新增</div>
	</div>
	<!-- 临时存放信息 -->
	
	<!-- -------------添加-------------- -->
	<div id="adddialog">
		<fieldset>
	   		名称：<input type="text" name="cityname" id="addcityname">
	   	</fieldset>
    </div>
    <!-- -------------修改-------------- -->
	<div id="updatedialog">
		<fieldset>
	   	名称：<input type="text" name="cityname" id="editcityname">
	   	</fieldset>
	   	
    </div>
</body>
</html>