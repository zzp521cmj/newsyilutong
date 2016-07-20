<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>自动计划管理</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="js/json2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  <script type="text/javascript" src="./js/Validform/Validform_v5.3.2_min.js"></script>
  <style type="text/css">

  </style>
  <script type="text/javascript">

	var grid;
	var dialog;
 	$(function(){
  		grid=$("#dg").datagrid({
  			url : 'automaticPlan.do?method=getClassPlanInfo',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'department_name',title : '所属机构',width : 140},
  				{field : 'classline_name',title : '班线名称',width : 140},
  				{field : 'departure_time',title : '发车时间',width : 140,
	  				formatter:function(val,row,index){
	  					if(val!=null){
							return val.substring(11,16); 
						}
				    }
			    },
  				{field : 'plate_number',title : '车牌号',width : 140},
   				{field : 'effective_date',title : '生效开始日期',width : 150},
  				{field : 'end_date',title : '生效结束日期',width : 150,
	  				formatter:function(val,row,index){
			        		if(val == null)
								return "永不结束"; 
							else
								return val;
							
			        }
		        },
				{field : 'update_datetime',title : '最后更新日期',width : 150,
					formatter:function(val,row,index){
						if(val!=null){
							return val.substring(0,19); 
						}
					}
				}
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  		});
 	$('#organizationId').combotree({    
   		url: "depn.do?method=getTree&&id=",    
   		width: 158,
   		onBeforeLoad: function(node, param) {
               if (node == null) {
                   $('#organizationId').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
               } else {
               
                   $('#organizationId').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
               }
              }     
	});
	
 });
  	
  	
  	//查询
  	function searchClassInfo(){
		$('#dg').datagrid('load',{
			classlineName : $.trim($("#classlineNameId").val()),
			organization : $.trim($("#organizationId").combotree("getValue")) ,
			car_num:$.trim($("#car_numId").val())
		});
  	}
  
	
	//新增
	function showIcons() {
		dialog = parent.jy.modalDialog({
			title : '新增发车计划表',
			url : 'automaticPlan.do?method=addClassPlan',
			width : 1100,
			height:640,
			buttons : [{
				text : '<input type="button" value="保存" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	
	//修改页面
	function EditshowIcons() {
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
			for(var i=0;i<row.length;i++){
			   		var pid=row[i].classplan_id;
			   	}
			dialog = parent.jy.modalDialog({
				title : '名称',
				url : 'automaticPlan.do?method=editClassPlan&pid=' + pid,
				width : 1100,
				height:640,
				buttons : [{
					text : '<input type="button" value="保存" class="btncss">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submiteditForm(dialog, grid, parent.$);
					}
				}] 
			});
		}else{
			alert("请选择一行");
		}
	};

	
	//批量删除
	function delpostLine(){
		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
	 	for(var i=0;i<array.length;i++){
	 		checkarray.push(array[i].classlineId);
		}
		if (array != "") {
			$.messager.confirm('确认','您确认想要删除选中的记录吗？',function(r){    
    			if (r){ 
    				$.ajax({
			    		url:"postline.do?method=deletePostLine",
			    		type: "POST",
			    		data:{del:checkarray.join(",")},
		  				success:function(data){
		  					alert(data);
		  					if (data.flag) {
								parent.$.messager.alert('班线删除', '班线信息删除成功', 'info',
								function(r) {
									$('#dg').datagrid('reload');
 								});
							} 
						}
    				});
    			}    
			});  
		} else{
			alert('请选中要删除的信息');
		}
	}
  </script>
    <body class="easyui-layout">
	<div region="north" title="检索条件" class="st-north" border="false" data-options="collapsible:false">
		<label>班线名称：</label><input type="text" class="search-text" name="classlineName" id="classlineNameId"/>
		<label>所属机构：</label><input class="search-text" name="organization" id="organizationId"/>
		<label>车牌号：</label><input type="text" class="search-text" name="car_num" id="car_numId"/>
		 <a class="easyui-linkbutton"  onclick="searchClassInfo()" data-options="iconCls:'icon-search',width:80">查询</a>   
		<!--<a href="#">更多条件</a> -->
		
	</div>
   	 <div region="center" title="发布信息" region="center" style="background: #eee; overflow-y:hidden">
	 	<table id="dg"></table>
	 </div>
	 
	<!-- ========================================================================================================= -->
	<div id="tb">
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="" onclick="showIcons()" data-options="iconCls:'icon-add',plain:true">新增</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="" onclick="EditshowIcons()" data-options="iconCls:'icon-edit',plain:true">修改</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="" onclick="delpostLine()" data-options="iconCls:'icon-remove',plain:true">删除</a>
   	<a href="#" class="easyui-linkbutton" id="" onclick="" data-options="plain:true">导出</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
	</div>
	<input id="functionname"type="hidden" value=${function}>
    
  </body>
</html>
