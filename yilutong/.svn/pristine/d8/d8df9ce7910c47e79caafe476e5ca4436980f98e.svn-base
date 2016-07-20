<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>派车单</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
  <%String flg = (String)request.getAttribute("flg"); %>
  <script type="text/javascript">
	var grid;
	var dialog;
 	$(function(){
 	/* var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	if(fs[i]=="添加"){
		$("#tbadd").removeAttr("style");
	}else if(fs[i]=="修改"){
	$("#tbmodify").removeAttr("style");
	}else if(fs[i]=="删除"){
	$("#tbdel").removeAttr("style");
	}
	else if(fs[i]=="导出"){
	$("#tbput").removeAttr("style");
	}
	}  */
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
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:62});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
  		grid=$("#dg").datagrid({
  			url : 'paichedan.do?method=getDemand_release',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				//{field : 'demandReleaseId',title : '操作',width : 60,align:'center'},
  				{field : 'zhuangCity',title : '装货城市',width : 110,align:'center'},
  				{field : 'xieCity',title : '卸货城市',width : 110,align:'center'},
  				{field : 'loadingAddress',title : '装货地址',width : 140,align:'center'},
  				{field : 'unloadingAddress',title : '装货地址',width : 140,align:'center'},
  				{field : 'truckTypeId',title : '货车类型',width : 60,align:'center',
  					formatter:function(val,row,index){
		        		if(val == 0){
							return "厢车"; 
						}else if(val == 1){
							return "高栏";
						}else if(val == 2){
							return "平板";
						}
		        	}
  				},
  				{field : 'ranges',title : '方位(m³)',width : 70,align:'center'},
  				{field : 'weight',title : '重量(T)',width : 70,align:'center'},
  				{field : 'models',title : '车长(m)',width : 70,align:'center'},
  				{field : 'contactInformation',title : '联系方式',width : 80,align:'center'},
  				//{field : 'remarks',title : '备注',width : 100,align:'center'},
  				{field : 'createTime',title : '创建时间',width : 125,align:'center',
  				formatter:function(val,row,index){
  						if(val!=null){
  							return val.substring(0,19);
  						}
  					}},
  				{field : 'publisher',title : '发布人',width : 60,align:'center'},
  				{field : 'determine',title : '是否确定',width : 60,align:'center',
  					formatter:function(val,row,index){
  					var da;
  						$.ajax({
						type : "POST",
						async : false,
						url : 'paichedan.do?method=getDetermine',
						data : {
							id : row.demandReleaseId
						},
						success : function(data) {
							da = data.flag;
						}
					});
						if(da){
						return "是";
						}else{
						return "否";
						}  					
  					
  					}
  				}
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  		});
  	
  	});
  	
  	
  	//查询
  	function searchDemandRelease(){
		$('#dg').datagrid('load',{
			zhuang : $.trim(document.getElementById("e1").value),
			xie : $.trim(document.getElementById("e2").value),
			models :  $.trim(document.getElementById("car_lengthId").value),
			truckTypeId :$("#truckTypeId").combobox("getValue"),
			publisher : $.trim(document.getElementById("publisherId").value),
			determine : $("#determine").combobox("getValue")
		});
  	}
  	
	//重置按钮
	function equimentRuset(){
		document.getElementById("e1").value="";
		document.getElementById("e2").value="";
		document.getElementById("publisherId").value="";
		document.getElementById("car_lengthId").value="";
		$("#truckTypeId").combobox("setValue","");
		$("#determine").combobox("setValue","");
	}
	
	
	function showIcons() {
		dialog = parent.jy.modalDialog({
			title : '新增需求',
			url : 'paichedan.do?method=getAddDemandRelease',
			width : 800,
			height:520,
			id:"addRelease",
			buttons : [{
				text : '<input type="button" class="btncss" value="发布">',
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
			if(row[0].determine==1){
				parent.$.messager.alert('警告', '该条需求已被确定', 'info');
			}else{
				for(var i=0;i<row.length;i++){
	   				var pid=row[i].demandReleaseId;
	   			}
				dialog = parent.jy.modalDialog({
				title : '修改需求',
				url : 'paichedan.do?method=getEditDemandRelease&pid=' + pid,
				width : 800,
				height:520,
				id:"modifyRelease",
				buttons : [{
					text : '<input type="button" class="btncss" value="修改">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
				});
			}
		}else{
			$.messager.alert("需求发布","请选择一行","info");
		}
	};
	//详细信息页面
	function xiangxixinxi() {
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
			for(var i=0;i<row.length;i++){
			   		var pid=row[i].demandReleaseId;
			   	}
			dialog = parent.jy.modalDialog({
				title : '详细信息',
				url : 'paichedan.do?method=getxinxiDemandRelease&pid=' + pid,
				width : 800,
				height:480,
				/* buttons : [{
					text : '<input type="button" class="btncss" value="保存">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}]  */
			});
		}else{
			$.messager.alert("需求发布","请选择一行","info");
		}
	};
	//批量删除
	function delDemand_release(){
		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
	 	for(var i=0;i<array.length;i++){
	 		checkarray.push(array[i].demandReleaseId);
		}
		if (array != "") {
			$.messager.confirm('确认','您确认想要删除选中的记录吗？',function(r){    
    			if (r){ 
    				$.ajax({
			    		url:"paichedan.do?method=delDemand_release",
			    		type: "POST",
			    		data:{del:checkarray.join(",")},
		  				success:function(data){
		  					if (data.flag) {
								parent.$.messager.alert('需求删除', '需求删除成功', 'info',
								function(r) {
									$('#dg').datagrid('reload');
 								});
							} 
						}
    				});
    			}    
			});  
		} else{
			$.messager.alert("需求发布","请选中要删除的信息","info");
		}
	}
	
	//车辆竞价
	function VehicleAuction(){
		var pid='<%=flg%>';
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
		for(var i=0;i<row.length;i++){
			var pid=row[i].demandReleaseId;
		}
		$.ajax({
	  			type: "POST",
	  			url:'paichedan.do?method=getSelectDemand_release',
	  			data:{pid:pid},
	  			success:function(data){
	  				$('#ff').form('load',data);
	  				$('#updateDialog').dialog("open");
	  			}
	  	});	
		}else{
			$.messager.alert("需求发布","请选择一条进行竞价!","info");

		}
	}
	
	function updateplaninfo(){
	
		$.messager.confirm('竞价', '确定要进行竞价吗?', function(p) {
			if (p) {
				$.ajax({
					type : "POST",
					url : 'paichedan.do?method=AddVehicleAuction',
					data : $('#ff').serialize(),
					success : function(msg) {
						if (msg.flag) {
							parent.$.messager.alert('计划修改', '计划修改成功', 'info',
								function(p) {
									$('#dg').datagrid('reload');
									$('#updateDialog').dialog("close");
								});
						};
					}
				});
			}
		});
	}
	//一维打印
	function printPCD(){
		var pid="";
		var row=$("#dg").datagrid('getSelections');
		if(row.length=1){
	 		var array = $('#dg').datagrid('getSelections');
  			for(var i=0;i<array.length;i++){
  				pid=row[i].demandReleaseId;
  			}
  			var url="paichedan.do?method=getPrintPCD&pid="+pid;
			ow(url);
		}else{
			$.messager.alert("派车单","请选择一行信息","info");
		}
	}
	function ow(owurl){ 
var tmp=window.open("about:blank","","fullscreen=1");
tmp.moveTo(0,0); 
tmp.resizeTo(screen.width+20,screen.height); 
tmp.focus(); 
tmp.location=owurl;
} 
  </script>
    <body class="easyui-layout">
    
	<div region="north" title="检索条件" class="st-north" border="false" data-options="collapsible:false" style="height:62px">
		<label>装货城市：<input type="text" id="e1" /></label>
		<label class="divlabel" >卸货城市：<input type="text" id="e2" /></label>
		<label class="divlabel">车长：<input type="text" class="search-text"  id="car_lengthId"></label>		
		<a class="easyui-linkbutton"  onclick="searchDemandRelease()" data-options="iconCls:'icon-search'">查询</a>
		<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button"  href="javascript:void(0)" state="close">更多条件</a>
		<div id="searchInfoId" style="display: none">
			<label>箱型：
		</label>
			<select class="easyui-combobox"  id='truckTypeId' name="truckTypeId" style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">厢车</option>
					<option id="" value="1">高栏</option>
					<option id="" value="2">平板</option>
				</select>
		<label class="divlabel">发布人：</label><input type="text" class="search-text"  id="publisherId" >
				<label>是否确定：
			<select class="easyui-combobox"  id='determine'  style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">未确定</option>
					<option id="" value="1">确定</option>
				</select>
		</label>
				</div>
		
	</div>
   	 <div region="center" title="发布信息" region="center" style="background: #eee; overflow-y:hidden">
	 	<table id="dg"></table>
	 	
	 </div>
	 
	<!-- ========================================================================================================= -->
	<div id="tb">
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbadd" onclick="showIcons()" data-options="iconCls:'icon-add',plain:true" >新增</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbmodify" onclick="EditshowIcons()" data-options="iconCls:'icon-edit',plain:true" >修改</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbdel" onclick="delDemand_release()" data-options="iconCls:'icon-remove',plain:true" >删除</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="printpcds" onclick="printPCD()" data-options="iconCls:'icon-edit',plain:true" >派车单打印</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbxinxi" onclick="xiangxixinxi()" data-options="iconCls:'icon-edit',plain:true" >详细信息</a>
   <!-- <a class="easyui-linkbutton" id="tbput" onclick="" data-options="iconCls:'icon-output',plain:true"style="display: none">导出</a> -->
   	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="" onclick="VehicleAuction()" data-options="plain:true">车辆竞价</a> -->
   	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
	</div>
	
	<input id="functionname"type="hidden" value=${function}>
    <div id="updateDialog" class="easyui-dialog" title="操作" style="width:690px;height:490px;"  data-options="iconCls:'icon-edit',resizable:true,modal:true,collapsible:true,closed:true,buttons:'#buttons'"> 
		<form id="ff" method="post">
		<input type="hidden" name="demandReleaseId">
		<table class="tableclass">
			<tr>
				<td>价格：</td>
				<td class="td2"><input type="text" class="search-text" name="price" id="" /></td>
			</tr>
		</table>
		<div id="buttons">
		<input type="button" onclick="updateplaninfo()" value="修改" class="btncss">
		</div>
		</form>
	</div>
	
  </body>
</html>
