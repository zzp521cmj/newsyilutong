<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>确定车辆</title>
    <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   	<jsp:include page="/inc/incbootstrap.jsp"></jsp:include>
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
  </head>
  <%String flg = (String)request.getAttribute("flg"); %>
  <%String demandReleaseId = (String)request.getAttribute("flg1"); %>
  <script type="text/javascript">
	var grid;
	var dialog;
 	$(function(){
 	var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
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
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : true,
  			//selectOnCheck : false,
  			//checkOnSelect :false,
  			columns : [[
  				//{field : 'ck',checkbox : true},
  				//{field : 'demandReleaseId',title : 'UUID',width : 60,align:'center'},
  				{field : 'aaa',title : '操作',width : 60,align:'center',
  					formatter: function(index,row,value){
  						var ss="";
 						ss+="<a href='javascript:void(0)' onclick= 'Details(\""+row.demandReleaseId+"\")'>详细</a>&nbsp";
        				return ss;
  					}
  				},
  				{field : 'zhuangCity',title : '装货城市',width : 80,align:'center'},
  				{field : 'xieCity',title : '卸货城市',width : 80,align:'center'},
  				{field : 'loadingAddress',title : '装货地址',width : 130,align:'center'},
  				{field : 'unloadingAddress',title : '装货地址',width : 130,align:'center'},
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
						url : 'temvehicle.do?method=getDetermine',
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
  				},
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  		});
  		
  		$('#dg').datagrid({
  			url : 'temvehicle.do?method=getDemand_release',
  			queryParams:{determine : $("#determine").combobox("getValue")}	
  		});
  		//获取城市检索列表   装货地址
	    $("#e1").select2({
		    placeholder: "输入城市名检索",	//默认文本框显示信息
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
		    placeholder: "输入城市名检索",	//默认文本框显示信息
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
  	//alert( $.trim($("#e1").select2("val")))
		$('#dg').datagrid('load',{
			zhuang : $.trim($("#e1").select2("val")),
			xie : $.trim($("#e2").select2("val")),
			models :  $.trim(document.getElementById("car_lengthId").value),
			truckTypeId :$("#truckTypeId").combobox("getValue"),
			publisher : $.trim(document.getElementById("publisherId").value),
			determine : $("#determine").combobox("getValue")
		});
  	}
  	
	//重置按钮
	function equimentRuset(){
		$("#e1").select2("val", "");
		$("#e2").select2("val", "");
		document.getElementById("publisherId").value="";
		document.getElementById("car_lengthId").value="";
		$("#truckTypeId").combobox("setValue","");
		$("#determine").combobox("setValue","");
	}
	
	
	function showIcons() {
		dialog = parent.jy.modalDialog({
			title : '',
			url : 'temvehicle.do?method=getAddDemandRelease',
			width : 600,
			buttons : [{
				text : '<input type="button" class="btncss" value="保存">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	  
	//修改页面
	/* function EditshowIcons() {
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
			for(var i=0;i<row.length;i++){
			   		var pid=row[i].demandReleaseId;
			   	}
			dialog = parent.jy.modalDialog({
				title : 'xx',
				url : 'temvehicle.do?method=getEditDemandRelease&pid=' + pid,
				width : 600,
				buttons : [{
					text : '<input type="button" class="btncss" value="保存">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
		}else{
			alert("请选择一行");
		}
	}; */
	
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
			    		url:"temvehicle.do?method=delDemand_release",
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
			$.messager.alert("确认车辆","请选中要删除的信息","info");
		}
	}
	
	function updateplaninfo(){
	
		$.messager.confirm('竞价', '确定要进行竞价吗?', function(p) {
			if (p) {
				$.ajax({
					type : "POST",
					url : 'temvehicle.do?method=AddVehicleAuction',
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
	
	//详细
	function Details(demandReleaseId){
		var pid=demandReleaseId;
		$.ajax({
	  			type: "POST",
	  			url:'detemineveh.do?method=getdetermineVehicle',
	  			data:{pid:pid},
	  			success:function(data){
	  				dialog = parent.jy.modalDialog({
						title : '确定车辆',
						url : 'detemineveh.do?method=determineVehicle1&pid=' + pid,
						width : 720
						/* buttons : [{
							text : '<input type="button" class="btncss" value="保存">',
							handler : function() {
								dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
							}
						}]  */
					});
	  			}
	  	});	
	}
  </script>
    <body class="easyui-layout">
	<div region="north" title="检索条件" class="st-north" border="false" data-options="collapsible:false" style="height:62px">
		<label>装货城市：<input type="hidden" id="e1" class="search-text" style="width:150px"/></label>
		<label>卸货城市：<input type="hidden" id="e2" class="search-text" style="width:150px"/></label>
		<label>车长：<input type="text" class="search-text" style="width: 150px;" id="car_lengthId"></label>		
		<a class="easyui-linkbutton"  onclick="searchDemandRelease()" data-options="iconCls:'icon-search'">查询</a>
		<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="" href="javascript:void(0)" state="close">更多条件</a>
		<div id="searchInfoId" style="display: none">
			<label>货车类型：
		</label>
			<select class="easyui-combobox" class="search-text"  id='truckTypeId' name="truckTypeId" style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">厢车</option>
					<option id="" value="1">高栏</option>
					<option id="" value="2">平板</option>
				</select>
		<label style="margin-left: 10px;">发布人：</label><input type="text" class="search-text" style="width: 150px;" id="publisherId" >
				<label>是否确定：
			<select class="easyui-combobox"  id='determine'  style="width:150px;" data-options="panelHeight : 'auto',editable:false">   
				    <option id="" value="0">未确定</option>
				   	<option id="" value="">全部</option>
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
   	<a href="javascript:void(0)" class="easyui-linkbutton" onclick="equimentRuset()" data-options="iconCls:'icon-reset',plain:true" >重置</a>
	</div>
	<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
