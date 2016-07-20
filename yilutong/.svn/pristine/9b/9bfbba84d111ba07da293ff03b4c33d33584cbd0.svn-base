<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>		
    <title></title>
    
	
  </head>
  <script type="text/javascript">
  $(function(){
  	var da ="";
	var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	if(fs[i]=="添加"){
		$("#tbadd").removeAttr("style");
	}else if(fs[i]=="修改"){
	$("#tbmodify").removeAttr("style");
	}else if(fs[i]=="删除"){
	$("#tbdel").removeAttr("style");
	}
	
	} 
	var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:85});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:61});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
		});
	   	$("#dg").datagrid({
	    url:'warehouse.do?method=getRemarks',
	   	fit : true,
	    rownumbers : true,
	    //singleSelect: true,
		selectOnCheck: true,
		checkOnSelect: true,
	    toolbar:'#tb',
	    columns:[[
	    	{ field:'ck',checkbox:true },
	    	{field:'warehouse_num',title:'仓库编码',width:130},
	        {field:'warehouse_name',title:'仓库名称',width:130},
	        {field:'warehouse_type',title:'仓库类型',width:110,align:'left',
	         formatter: function(value, row, index){
	         if(value=="0"){
	         return "散支库（C库）";
	         }else if(value=="1"){
	         	return "整箱库（D库）";
	         }
	         }},
	        {field:'warehouse_address',title:'地址',width:200,align:'left',
	         formatter: function(value, row, index) {
                   var content = '<div  title="' + value + '">' + value + '</div>';
                    return content;
                }},
	        {field:'warehouse_createtime',title:'创建时间',width:160,align:'left',
	        formatter:function(val,row,index){
		        	if(val!=null){
						return val.substring(0,19);
					}
		        }}
		       /*   {field:'user_name',title:'修改人',width:100,align:'left'} */
	    ]],
	    pagination : true,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20 ] 
	}); 
  });
  function searchRemark(){
   $('#dg').datagrid('load',{
			warehouse_name:$.trim($("#serchname").val()),
			warehouse_tel:$.trim($("#serchtel").val()),
			warehouse_address:$.trim($("#serchaddress").val())
			});
  }
  function reset(){
  	$("#serchname").val("");
  	$("#serchtel").val("");
  	$("#serchaddress").val("");
	}
	function deleteRemark(){
		 	var row=$("#dg").datagrid('getSelections');
		 	var b;
 		if(row.length>0){
			$.messager.confirm('确认','您确认想要删除这'+row.length+'条记录吗？',function(r){    
    			if (r){ 
 	  				for(var i=0;i<row.length;i++){
 	  				var remarkid=row[i].warehouse_id;
 	  				$.ajax({
			  			type: "POST",
			  			async : false,
			  			url:'warehouse.do?method=deleteRemark',
			  			data:{id:remarkid},
			  			success:function(data){
			  			
			  			}
			  		}); 
 	 			 	$("#dg").datagrid('reload');
    			}
    			}
    		});
    	}else{
    	alert("请选择数据");
    	}   
 
	}
  function modify(){
   					var row=$("#dg").datagrid('getSelections');
   					if(row.length==1){
		 			var remarkid=row[0].warehouse_id;
		 			location.href="warehouse.do?method=remarkMapmodify&&id="+remarkid;
  					}else{
  					alert("请选择一行!");
  					}
  }
  </script>
  <body class="easyui-layout">
  <a href="warehouse.do?method=getRemarkMap"></a>
 <div region="north" title="检索" class="st-north" border="false" style="height:61px" data-options="collapsible:false">
   <lable class="divlabel">仓库名称：</lable><input type="text" id="serchname" style="width:150px"/>
   <lable class="divlabel">仓库类型：</lable>
   <select class="easyui-combobox"  id='serchtel'  style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
					<option id="" value="">所有</option>
					<option id="" value="0">散支库（C库）</option>
					<option id="" value="1">整箱库（D库）</option>
	</select>
   <lable class="divlabel">地址：</lable><input type="text" id="serchaddress" style="width:150px;"/>
   &nbsp <a class="easyui-linkbutton"  onclick="searchRemark()" data-options="iconCls:'icon-search'" id="searchId" >查询</a>
	
 </div>
 <div region="center" title="仓库信息展示" region="center" style="background: #eee; overflow-y:hidden">
	 	<table id="dg"></table>
	 </div>
   <div id="tb">
   <a href="warehouse.do?method=getRemarkMap" class="easyui-linkbutton" id="tbadd" data-options="iconCls:'icon-add',plain:true" style="display: none">新增</a>
   <a href="#" class="easyui-linkbutton" id="tbmodify" onclick="modify()" data-options="iconCls:'icon-edit',plain:true" style="display: none">修改</a>
   <a href="#" class="easyui-linkbutton" id="tbdel" onclick="deleteRemark()"data-options="iconCls:'icon-remove',plain:true" style="display: none">删除</a>
   <a href="#" class="easyui-linkbutton" id="tbreset" onclick="reset()"data-options="iconCls:'icon-reset',plain:true">重置</a>
	</div>
	 <input id="functionname"type="hidden" value=${function}>
  </body>
</html>
