<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
  <head>
   <% User user=(User)request.getSession().getAttribute(SessionInfo.SessionName); %>
    <base href="<%=basePath%>">
    
    <title>车辆竞价页面</title>
    
 <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
 	<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
 
  <script type="text/javascript">
	var grid;
	var dialog;
 	$(function(){
 	 $("#ff").validationEngine('attach', { 
				 promptPosition:'topRight:-15,0'
				 });
 	var fs=$("#functionname").val().split(",");
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
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:62});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
  		grid=$("#dg").datagrid({
  			url : 'vehicleAuction.do?method=getVehicleAuction',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				//{field : 'demandReleaseId',title : '操作',width : 60,align:'center'},
  				{field : 'zhuangCity',title : '装货城市',width : 80,align:'center'},
  				{field : 'xieCity',title : '卸货城市',width : 80,align:'center'},
  				{field : 'loadingAddress',title : '装货地址',width : 120,align:'center'},
  				{field : 'unloadingAddress',title : '装货地址',width : 120,align:'center'},
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
  				{field : 'remarks',title : '备注',width : 100,align:'center'},
  				{field : 'createTime',title : '创建时间',width : 125,align:'center',
  				formatter:function(val,row,index){
  						if(val!=null){
  							return val.substring(0,19);
  						}
  					}},
  				//{field : 'publisher',title : '发布人',width : 60,align:'center'},
  				{field : 'price',title : '价格',width : 60,align:'center'},
  				{field : 'determine',title : '是否确认',width : 60,align:'center',
  				formatter:function(val,row,index){
  					if(val==1){
  						return "是";
  					}else{
  					return "否";
  					}
  				}
  				},
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  		});
  		
  		//获取城市检索列表   装货地址
	    $("#e1").select2({
		    placeholder: "输入拼音首字母检索",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,		
		    multiple: false,		//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
		    query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "temvehicle.do?method=getCity_info",
				   data: {cityinfo:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});
					});
			        query.callback(data);
				   }
				});
		    }
		});
		
		//获取城市检索列表   卸货地址
	    $("#e2").select2({
		    placeholder: "输入拼音首字母检索",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,		
		    multiple: false,		//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
		    query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "temvehicle.do?method=getCity_info",
				   data: {cityinfo:query.term},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};		
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});
					});
			        query.callback(data);
				   }
				});
		    }
		});
  	});
  	
  	
  	//查询
  	function searchDemandRelease(){
		$('#dg').datagrid('load',{
			zhuang : $.trim($("#e1").select2("val")),
			xie : $.trim($("#e2").select2("val")),
			models :  $.trim(document.getElementById("car_lengthId").value),
			truckTypeId : $("#truckTypeId").combobox("getValue"),
			determine : $("#determine").combobox("getValue")
		});
  	}
  	
	//重置按钮
	function equimentRuset(){
	$("#e1").select2("val", "");
		$("#e2").select2("val", "");
		document.getElementById("car_lengthId").value="";
		$("#truckTypeId").combobox("setValue","");
		$("#determine").combobox("setValue","");
	}
	
	//获取修改竞价信息
	function EditshowIcons() {
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
		if(row[0].determine==1){
		parent.$.messager.alert('警告', '该竞价已经被确定', 'info');
		}else{
		var vehicleAuctionId=row[0].vehicleAuctionId;
			$.ajax({
	  			type: "POST",
	  			url:'vehicleAuction.do?method=getVehicleAuctionRow',
	  			data:{vehicleAuctionId:vehicleAuctionId},
	  			success:function(data){
	  				$('#ff').form('load',data);
	  				
	  				$('#updateDialog').dialog("open");
	  			}
	  		});
		}
		}else{
			$.messager.alert("车辆竞价","请选择一行进行修改!","info");
		}
	};
	
	//批量删除
	function delDemand_release(){
		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
	 	for(var i=0;i<array.length;i++){
	 		checkarray.push(array[i].vehicleAuctionId);
		}
		if (array != "") {
			$.messager.confirm('确认','您确认想要删除选中的记录吗？',function(r){    
    			if (r){ 
    				$.ajax({
			    		url:"vehicleAuction.do?method=delVehicleAuction",
			    		type: "POST",
			    		data:{del:checkarray.join(",")},
		  				success:function(data){
		  					if (data.flag) {
								parent.$.messager.alert('需求删除', '删除成功', 'info',
								function(r) {
									$('#dg').datagrid('reload');
 								});
							} 
						}
    				});
    			}    
			});  
		} else{
			$.messager.alert("车辆竞价","请选中要删除的信息","info");
		}
	}
	
	function AddShowIcons(){
	var flag='<%=user.getFlag()%>';
	if(flag=="1"){
	dialog = parent.jy.modalDialog({
			title : '所有需求',
			url : 'vehicleAuction.do?method=getDemandRelease',
			width : 1200,
			height:520,
			onClose : function() {
				grid.datagrid('reload');
				$(this).dialog('destroy');
			},
			buttons : [{
				text : '',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	}else{
	parent.$.messager.alert('错误', '您不是车辆用户', 'info');
	//alert("您不是临时车辆用户");
	}
		
	}
	
	//修改竞价
	function updateplaninfo(){
		 if($("#ff").validationEngine('validate')){
  		 //可提交
		$.messager.confirm('竞价', '确定要进行竞价吗?', function(p) {
			if (p) {
				$.ajax({
					type : "POST",
					url : 'vehicleAuction.do?method=AddVehicleAuction',
					data : $('#ff').serialize(),
					success : function(msg) {
						if (msg.flag) {
							parent.$.messager.alert('竞价修改', '计划修改成功', 'info',
								function(p) {
									$('#dg').datagrid('reload');
									$('#updateDialog').dialog("close");
								});
						};
					}
				});
			}
		}); 
			}else{
			   parent.$.messager.alert('竞价修改', '必填信息不可为空', 'info');
			  }
	}
  </script>
    <body class="easyui-layout">
	<div region="north" title="检索条件" class="st-north" border="false" data-options="collapsible:false" style="height:62px">
		<label>装货城市：<input type="hidden" id="e1" /></label>
		<label class="divlabel">卸货城市：<input type="hidden" id="e2"/></label>
		<label class="divlabel">车长：<input type="text" class="search-text" id="car_lengthId"></label>
		<a class="easyui-linkbutton"  onclick="searchDemandRelease()" data-options="iconCls:'icon-search'">查询</a>
		<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" href="javascript:void(0)" state="close">更多条件</a>
		<div id="searchInfoId" style="display: none">
		<label>货车类型：
			<select class="easyui-combobox"  id='truckTypeId' name="truckTypeId" style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">厢车</option>
					<option id="" value="1">高栏</option>
					<option id="" value="2">平板</option>
				</select>
		</label>
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
	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbadd" onclick="AddShowIcons()" data-options="iconCls:'icon-add',plain:true" style="display: none">竞价</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbmodify" onclick="EditshowIcons()" data-options="iconCls:'icon-edit',plain:true" style="display: none">修改</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbdel" onclick="delDemand_release()" data-options="iconCls:'icon-remove',plain:true" style="display: none">删除</a>
   <!-- 	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbput" onclick="" data-options="plain:true" style="display: none">导出</a> -->
   	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
	</div>
	<input id="functionname"type="hidden" value=${function}>
	
	<div id="updateDialog" class="easyui-dialog" title="修改竞价" style="width:690px;height:290px;"  data-options="iconCls:'icon-edit',resizable:true,modal:true,collapsible:true,closed:true,buttons:'#buttons'"> 
		<form id="ff" method="post">
		<input type="hidden" name="vehicleAuctionId">
		<table class="tableclass">
				<tr>
				<th colspan="2">修改竞价</th>
				</tr>
			<tr>
				<td><font color="red" style="margin-right:10px">*</font>价格：</td>
				<td class="td2"><input type="text" class="validate[required,custom[number],max[9999999]]" name="price" id="" /></td>
			</tr>
		</table>

		<div id="buttons">
		<input type="button" onclick="updateplaninfo()" value="修改" class="btncss">
		</div>
		</form>
	</div>
  </body>
</html>