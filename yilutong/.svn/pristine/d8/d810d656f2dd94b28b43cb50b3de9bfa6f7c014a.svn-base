<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>
   	
 	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
 	 	   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
 	
 	<link rel="stylesheet" type="text/css" href="./css/menu.css">
 	<link rel="stylesheet" type="text/css" href="./css/main.css">
 	
 	<style type="text/css">
 		.menutr{
 			height:40px;
 		}
 		*{
 			font-size: 12px
 		}
 		
 	</style>
</head>
  <script type="text/javascript">
  $(function(){
  var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	if(fs[i]=="添加"){
		$("#tbadd").removeAttr("style");
	}
	} 
	$('#dg').treegrid({    
    url:'menu.do?method=menus',    
    idField:'id',  
    treeField:'text',
    iconCls:'icon-role',
    animate:true,
    nowrap: false,
    border:false,
    rownumbers : true,
    fit:true,
    columns:[[
        {field:'text',title:'菜单名称',width:200,align:'center'},
        {field:'iconCls',title:'图片名称',width:200,align:'center'},
        {field:'pageurl',title:'请求路径',width:250,align:'center',
        formatter:function(val,row,index){
        			if(val=="null"){
		        		return "";
		        	}else{
		        		return val;
		        	}
		        }},
        {field:'menuDescribe',title:'菜单描述',width:260,align:'left',
        formatter:function(val,row,index){
        			if(val=="null"){
		        		return "";
		        	}else{
		        		return val;
		        	}
		        }},
        {field:'caozuo',title:'操作',width:150,align:'center',
        	formatter:function(val,row,index){
        			if(row.fid!=0){
        			var ss="";
        			for(var i = 0;i<fs.length;i++){
						if(fs[i]=="修改"){
							ss+="<a href='#' onclick='updatemenu("+row.id+");'>更改</a>&nbsp;";
						}else if(fs[i]=="删除"){
							ss+="<a href='#' onclick='deletemenu("+row.id+")'>删除</a>&nbsp";
						}
						} 
		        		return ss;
		        	}else{
		        		if(row.leaf){
		        		var ss2="";
        				for(var i = 0;i<fs.length;i++){
						if(fs[i]=="删除"){
							ss2+="&nbsp<a href='#' onclick='deletemenu("+row.id+")'>删除</a>";
						}
						}
		        			return ss2;
		        		}
		        		return "";
		        	}
		        }
        }
   	]],
   	toolbar: '#tb'
});
	
	//菜单更新dialog
	$('#updateDialog').dialog({
	    title: '菜单更新',
	    width: 500,
	    height: 370,
	    closed: true,
	    cache: false,
	    modal: true,
	    buttons:'#upbuttons'
	 });
	 //菜单添加dialog
	$('#saveDialog').dialog({
	    title: '菜单添加',
	    width: 700,
	    height: 350,
	    closed: true,
	    cache: false,
	    modal: true,
	    buttons:'#buttons'
	 });
	 //comboxtree，获取上级资源树
	 $('#fuId').combotree({
	    url: 'menu.do?method=getmenucombo',
	   // panelHeight:'auto',
	    width:150
	  });
  });
  //打开并获取选中行的菜单项dialog
  function add(){
   			 $('#saveform').form('clear');
			 $('#siId').numberspinner('setValue','0');
			 $('#saveDialog').dialog('open');
  }
  function updatemenu(mid){
  		$.ajax({
  			type: "POST",
  			url:'menu.do?method=getUpdatemenuInfo',
  			data:{menuid:mid},
  			success:function(data){
  				$('#ff').form('load',data);
  			}
  		});
  		$('#updateDialog').dialog("open");
  }
  	
	//关闭菜单dialog
	function closemenudialog(flg){
		if(flg=='save'){
			$('#saveDialog').dialog("close");
		}else{
			$('#updateDialog').dialog("close");
		}
	}
	//修改菜单项
	function updatemenuinfo(){
		parent.$.messager.confirm('菜单修改','确定要修改此菜单吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'menu.do?method=updatemenuInfo',
		  			data:$('#ff').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					parent.$.messager.alert('菜单修改','菜单修改成功','info',
			  					function(r){  
									   $('#dg').treegrid('reload');
									   closemenudialog();
			  					}
		  					);
		  				};
		  			}
				});
			}   
		});
	}
	//保存menu
	function savemenuinfo(){
		if($('#fuId').combotree('getValue')==""){
			$('#fuId').combotree('setValue','0');
		}
		parent.$.messager.confirm('菜单新增','确定要保存此菜单吗?',function(r){   
	    	if (r){    
				$.ajax({
					type: "POST",
		  			url:'menu.do?method=savemenuInfo',
		  			data:$('#saveform').serialize(),
		  			success:function(msg){
		  				if(msg.flag){
		  					parent.$.messager.alert('菜单新增','菜单新增成功','info',
			  					function(r){
									   $('#dg').treegrid('reload');
									   closemenudialog('save');
			  					}
		  					);
		  				};
		  			}
				});
			}else{
				$('#fuId').combotree('setValue','');
			}
		});
	}
	//删除menu
	function deletemenu(mid){
	 parent.$.messager.confirm('删除菜单','确定要删除此菜单吗?',function(rs){
	    	if (rs){	    	
				$.ajax({
					type: "POST",
		  			url:'menu.do?method=deletemenuInfo',
		  			data:{mid:mid},
		  			success:function(msg){
		  				if(msg.flag){
		  					parent.$.messager.alert('菜单删除','菜单删除成功','info',
			  					function(r){  
									   $('#dg').treegrid('reload');
			  					}
		  					);
		  				};
		  			}
				});
			}   
		}); 
	}
	function clearcombobox(){
		 $('#fuId').combotree('setValue','');
	}
  </script>
  <body style="padding: 0px;margin:0px;">
	<table id="dg" ></table>
	<div id="updateDialog">
	
	<form id="ff" method="post">
	<fieldset>
	<input type="hidden" id="midId" name="id">
		<table class="tableclass">
			<tr class="menutr">
				<td ><label>菜单名称：</label></td>
				<td class="td2"><input  name="text" id="menuNameId"/></td>
			</tr>
			<tr class="menutr">
				<td ><label>请求路径：</label></td>
				<td class="td2"><input  name="pageurl" id="menuUrlId"/></td>
			</tr>
			<tr class="menutr">
				<td ><label>图片名称：</label></td>
				<td class="td2"><input  name="iconCls" id="iconNameId"/></td>
			</tr>
			
			<tr class="menutr">
				<td ><label>详细描述：</label></td>
				<td class="td2"><textarea  cols="22" rows="3.5" name="menuDescribe" id="menudeId"></textarea></td>
			</tr>
			
		</table>
		</fieldset>
		<div id="upbuttons">
		<input type="button" onclick="updatemenuinfo();" value="保存" class="btncss" />
		<!-- <input type="button" onclick="closemenudialog();" value="关闭" class="btncss" /> -->
		</div>
		</form>
		
	</div>
	
	<div id="saveDialog">
	<form id="saveform" method="post">
	<fieldset>
		<table class="tableclass">
			<tr>
				<td><label>菜单名称：</label></td>
				<td class="td2"><input name="text" id="savemenuNameId"/></td>
				<td><label>请求路径：</label></td>
				<td class="td2"><input  name="pageurl" id="savemenuUrlId"/></td>
			</tr>
			<tr>
				<td><label>图片名称：</label></td>
				<td class="td2"><input  name="iconCls" id="saveiconNameId"/></td>
				<td><label>上级资源：</label></td>
				<td class="td2"><input id="fuId" name="fid" class="easyui-combotree">&nbsp;<img onclick="clearcombobox();" src="./images/clear.png" style="width: 10xp;height: 10px;cursor: hand"></td>
				
			</tr>
			<tr>
			 	<td><label>菜单顺序：</label></td>
			 	<td class="td2" colspan="3"><input class="easyui-numberspinner" data-options="min:0,max:100,editable:false" value="0" name="sid" id="siId"/></td>
			</tr>
			<tr>
				<td><label>详细描述：</label></td>
				<td class="td2" colspan="3"><textarea  cols="60" rows="4" name="menuDescribe" id="savemenudeId"></textarea></td>
			</tr>
			
			
		</table>
		</fieldset>
		<div id="buttons">
				<input type="button" onclick="savemenuinfo()" value="保存" class="btncss" />
				<!-- <input type="button" onclick="closemenudialog('save');" value="关闭" class="btncss" /> -->
		</div>
		</form>
	</div>
	<div id="tb">
   <a href="#" class="easyui-linkbutton" id="tbadd" onclick="add()"data-options="iconCls:'icon-add',plain:true" style="display: none">添加</a>
	</div>
	<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
 