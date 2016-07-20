<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>班线管理</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="js/json2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  <script type="text/javascript" src="./js/Validform/Validform_v5.3.2_min.js"></script>
  <script type="text/javascript">

	var grid;
	var dialog;
 	$(function(){
 	var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	if(fs[i]=="添加"){
		$("#tbadd").removeAttr("style");
	}else if(fs[i]=="修改"){
	$("#tbmodify").removeAttr("style");
	}else if(fs[i]=="删除"){
	$("#tbdel").removeAttr("style");
	}else if(fs[i]=="导出"){
	$("#tboutput").removeAttr("style");
	}
	}
 		//更多搜索条件按钮!
	var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:84});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:62});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		} 
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
  		grid=$("#dg").datagrid({
  			url : 'postline.do?method=getPostLine',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'classlineName',title : '班线名称',width : 140},
  				{field : 'classlineCode',title : '班线编码',width : 100},
  				
  				{field : 'organizationName',title : '所属机构',width : 100},
  				
  				{field : 'shouzhandian',title : '首站点',width : 120,
					formatter:function(value,rec,index){ 
						 var shouzhandian='';
					if(typeof(rec.postClassLineInfo)!="undefined"){
						shouzhandian=rec.postClassLineInfo.shouzhandian;
					}
						return shouzhandian;
					}
				},
   				{field : 'endzhandian',title : '到达站点',width : 120,
					formatter:function(value,rec,index){ 
						var endzhandian='';
						if(typeof(rec.postClassLineInfo)!="undefined"){
							
							endzhandian=rec.postClassLineInfo.endzhandian;
						}
							return endzhandian;
						}
				},
  				{field : 'passdian',title : '途经点',width : 200,
					formatter:function(value,rec,index){
						var passdian='';
						if(typeof(rec.postClassLineInfo)!="undefined"){
							passdian=rec.postClassLineInfo.passdian;
						}
							return "<span title="+passdian+">"+passdian+"</span>";
						}
				}, 
				{field : 'site_run',title : '运行时间(分钟)',width : 150,
					formatter:function(value,rec,index){
						var site_run='';
						if(typeof(rec.postClassLineInfo)!="undefined"){
							site_run=rec.postClassLineInfo.site_run;
						}
							return site_run;
						}
				},
				/* {field : 'postClassLineInfo.site_mlg',title : '计算总里程(公里)',width : 150,
					formatter:function(value,rec,index){
						var site_mlg='';
						if(typeof(rec.postClassLineInfo)!="undefined"){
							site_mlg=rec.postClassLineInfo.site_mlg;
						}
							return site_mlg;
						}
				}, */
				{field : 'linname',title : '绑定行驶线路',width : 150,
					formatter:function(value,rec,index){
						var linname='';
						if(typeof(rec.classLineToLinstandard)!="undefined"){
							linname=rec.classLineToLinstandard.linname;
						}
							return linname;
						}
				}/* ,
  				{field : 'departure_time',title : '发车时间',width : 70,align:'center',
	  				formatter:function(val,row,index){
	  					if(val!=null){
							return val.substring(11,16); 
						}
				    }
				},
  				{field : 'plate_number',title : '车牌号',width : 70,align:'center'},
  				{field : 'effective_date',title : '生效开始日期',width : 80},
  				{field : 'end_date',title : '生效结束日期',width : 80,
	  				formatter:function(val,row,index){
			        		if(val == null||val=='')
								return "永不结束";
							else
								return val;
			        }
		        },
				{field : 'update_datetime',title : '最后更新日期',width : 110,
					formatter:function(val,row,index){
						if(val!=null){
							return val.substring(0,19); 
						}
					}
				} */
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  		});

  	});
  	
  	
  	//查询
  	function searchClassInfo(){
		$('#dg').datagrid('load',{
			classlineName : $.trim($("#classlineNameId").val()),
			organization : $.trim($("#organizationId").combotree('getValue')),
			chufadian : $.trim($("#chufadianId").val()),
			zhongdian : $.trim($("#zhongdianId").val())
		});
  	}
  
	
	//新增
	function showIcons() {
		dialog = parent.jy.modalDialog({
			title : '新增班线表',
			url : 'postline.do?method=addPostLine',
			width : 1300,
			height:650,
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
			   		var pid=row[i].classlineId;
			   	}
			dialog = parent.jy.modalDialog({
				title : '修改班线',
				url : 'postline.do?method=editPostLine&pid=' + pid,
				width : 1300,
				height:650,
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
	//查看详细
	function classlineinfo(){
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
			for(var i=0;i<row.length;i++){
			   		var pid=row[i].classlineId;
			   	}
			dialog = parent.jy.modalDialog({
				title : '详细信息',
				url : 'postline.do?method=lookPostLineInfo&pid=' + pid,
				width : 400,
				height:615
				/* ,
				buttons : [{
					text : '<input type="button" value="保存" class="btncss">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submiteditForm(dialog, grid, parent.$);
					}
				}]  */
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
								$.messager.alert('班线删除', '班线信息删除成功', 'info',
								function(r) {
									$('#dg').datagrid('reload');
 								});
						}
    				});
    			}    
			});  
		} else{
			alert('请选中要删除的信息');
		}
	}
	//导出
  	function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		var colName=[];
		var fieldName=[];
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			colName.push(col.title);//把title列名到数组里去 
			fieldName.push(col.field);
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  	//重置按钮
	function equimentRuset(){
		//$("#classlineNameId").select2("val", "");
		document.getElementById("classlineNameId").value="";
		document.getElementById("chufadianId").value="";
		document.getElementById("zhongdianId").value="";
		$("#organizationId").combotree("setValue","");
	}
  </script>
    <body class="easyui-layout">
    <form action="postline.do" id="outputform" method="post">
    
	<div region="north" title="检索条件" class="st-north" border="false" style="height: 62px" data-options="collapsible:false">
		<label>班线名称：</label><input type="text" class="search-text" name="classlineName" id="classlineNameId" />
		<label>所属机构：</label><input type="text" class="search-text" name="organizationId" id="organizationId"/>
		<label class="divlabel">出发站点：</label><input type="text" class="search-text" name="chufadian" id="chufadianId"/>
		<a class="easyui-linkbutton"  onclick="searchClassInfo()" data-options="iconCls:'icon-search'">查询</a>   
		<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="" href="javascript:void(0)" state="close">更多条件</a>
		<div id="searchInfoId" style="display: none">
		<label>到达站点：</label><input type="text" class="search-text" name="zhongdian" id="zhongdianId"/>
		</div>
	</div>
   	 <div region="center" title="班线管理" region="center" style="background: #eee; overflow-y:hidden">
	 	<table id="dg"></table>
	 </div>
	 
	<!-- ========================================================================================================= -->
	<div id="tb">
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbadd" onclick="showIcons()"style="display: none" data-options="iconCls:'icon-add',plain:true">新增</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbmodify" onclick="EditshowIcons()"  style="display: none" data-options="iconCls:'icon-edit',plain:true">修改</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbdel" onclick="delpostLine()" style="display: none" data-options="iconCls:'icon-remove',plain:true">删除</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="" onclick="classlineinfo()" data-options="iconCls:'icon-edit',plain:true">详细信息</a>
   	
    <a href="javascript:void(0)" class="easyui-linkbutton" id="tboutput" onclick="putoutfile()" style="display: none" data-options="iconCls:'icon-output',plain:true">导出</a> 
   	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
	</div>
<!-- 	<input id="functionname"type="hidden" value=${function}>
 -->    
 <!-- 导出 -->
			<input type="hidden" name="method" value="outputPostLine">
			<input type="hidden" id="fieldName" name="fieldName">
			<input type="hidden" id="headtitle" name="headtitle">
		</form>
		<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
