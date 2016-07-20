<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <link rel="stylesheet" type="text/css" href="./css/main.css">
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
  </head>
  <script type="text/javascript">
  $(function(){
  var da ="";
	var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	if(fs[i]=="授权"){
		$("#tbshouquan").removeAttr("style");
	}
	} 
	
  document.onkeydown=function(event){ 
		e = event ? event :(window.event ? window.event : null); 
		if(e.keyCode==13){ 
		
		searchUser();
		} 
		};
		  $('#dlg1').dialog({
			    title: '添加',
			    width: 400,
			    height: 350,
			    closed: true,
			    cache: false,
			    modal: true,
			    buttons:'#buttons'
			 });
  			 $('#tree').tree({
               url:"depn.do?method=getTree&&id=",
                  onClick: function(node) {
                  if (node == null) {
                    $('#tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                    $('#tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                    if(node.state=="closed"){
                    $(this).tree('expand',node.target);
                    }else{
                    $(this).tree('collapse',node.target);
                    }
                }
                  $("#did").val(node.id);
               		$('#dg').datagrid('load',{
						department_id:node.id 
			
		});
            },
            onBeforeLoad: function(node, param) {
                if (node == null) {
                    $('#tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                    $('#tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }  
           }); 
           
           $("#dg").datagrid({
	   	url:'user.do?method=getUser',
	   	fit : true,
	    rownumbers : true,
	    singleSelect:true,
	    toolbar:'#tb',
	    columns:[[
	    	{ field:'ck',checkbox:true },
	        {field:'username',title:'用户名',width:200},
	        {field:'realName',title:'真实姓名',width:200,align:'left'},
	        {field:'lastTime',title:'最后登入时间',width:400,align:'left',
	        formatter:function(val,row,index){
		        	if(val!=null){
						return val.substring(0,19); 
					}
		        }}
	    ]],
	    pagination : true,
		pageSize : 10,
		pageList : [ 5, 10, 15, 20 ] 
	});
 
  });
  function shouquan(){
  			var row=$("#dg").datagrid('getSelections');
	 		if(row.length==1){
	 				var userid=row[0].id;
		 			$('#tree2').tree({
		               checkbox:true,
		               url:"role.do?method=getRoleTree&&id="+userid+""
		           });  
		           $("#hidden").val(userid);
					$("#dlg1").dialog('open');
		 		}else{
		 			$.messager.alert("权限设置","请选择一行","info");
		 		}
  			
  		
  }
  function reset(){
		document.getElementById("user_name").value="";
		document.getElementById("user_realName").value="";
		document.getElementById("did").value="";
	}
  function searchUser(){
		$('#dg').datagrid('load',{
			user_name:$.trim($("#user_name").val()),
			user_realName:$.trim($("#user_realName").val()),
			user_did:$.trim($("#did").val())
		});
	}
  function save(){
  		var u =[];
			var nodes = $('#tree2').tree('getChecked');
			if(nodes!=null){
				for(var i=0;i<nodes.length;i++){
					u.push(nodes[i].id); 
				}
			}
			var userid = $("#hidden").val();
			
				$.ajax({
		  			type: "POST",
		  			async : false,
		  			url:'role.do?method=saveUserRole',
		  			data:{nodes:u.join(","),
		  				  id:userid},
		  			success:function(data){
		  			$("#dlg1").dialog('close');
		  			$("#dg").datagrid('reload');
		  			
		  			
		  			}
		  		}); 
  }
  function closeps(data){
	$("#dlg1").dialog('close');
	}
  </script>
  <body class="easyui-layout">
      <div data-options="region:'west',collapsible:false,selected:true,border:true,split:true" title="组织机构" style="width:220px" >
  	<ul id="tree" ></ul>
  </div>
  <div class="easyui-layout" data-options="region:'center'" >
  		<div region="north" title="检索" class="st-north" border="false" data-options="collapsible:false">
   			  <label>用户名：</label><input  id="user_name" type="text" class="search-text">     
    	      <label  class="divlabel" >真实姓名：</label><input  id="user_realName" type="text" class="search-text"> 
    	      <input type='hidden' id="did" name='did'>   
  	 		<a class="easyui-linkbutton"  onclick="searchUser()" data-options="iconCls:'icon-search'" id="searchId" >查询</a>
	 	</div>
 	 <div region="center" title="用户信息展示"  style="background: #eee; overflow-y:hidden">
	 	<table id="dg"></table>
     </div>
 
  </div>
  <div id="dlg1" >
  
  	<ul id="tree2" ></ul>
  	<input type="hidden" id="hidden" name="id">
      		 <div id="buttons">
				<input type="button" onclick="save()" value="保存" class="btncss" id="save"/>
				<!-- <input type="button" onclick="closeps('save');" value="关闭" class="btncss" /> -->
			</div>
   </div>
   <div id="tb">
   <a href="#" class="easyui-linkbutton" id="tbshouquan" onclick="shouquan()"data-options="iconCls:'icon-edit',plain:true" style="display: none">授权</a>
   <a href="#" class="easyui-linkbutton" id="tbreset" onclick="reset()"data-options="iconCls:'icon-reset',plain:true" >重置</a>
	</div>
	<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
