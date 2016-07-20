<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	 <title>手动添加竞价页面</title>
    
 <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
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
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:90});
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
  			url : 'Manual.do?method=getManuals',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'car_owner',title : '司机姓名',width : 80,align:'center'},
  				{field : 'd.plateNumber',title : '车牌号',width : 90,align:'center',
  					formatter:function(value,rec,index){ 
						 var plateNumber='';
					if(typeof(rec.d)!="undefined"){
						plateNumber=rec.d.plateNumber;
					}
						return plateNumber;
					}
  				},
  				/* {field : 'd.carLeng',title : '临时车车长',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var carLength='';
					if(typeof(rec.d)!="undefined"){
						carLength=rec.d.carLength;
					}
						return carLength;
					}
  				},
  				{field : 'd.length_name',title : '临时车箱型',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						var length_name='';
						if(typeof(rec.d)!="undefined"){
							length_name=rec.d.length_name;
						}
						return length_name;
					}
  				},
  				{field : 'd.volume',title : '临时车体积',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var volume='';
					if(typeof(rec.d)!="undefined"){
						volume=rec.d.volume;
					}
						return volume;
					}
  				},
  				{field : 'd.load_s',title : '临时车载重',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var load_s='';
					if(typeof(rec.d)!="undefined"){
						load_s=rec.d.load_s;
					}
						return load_s;
					}
  				}, */
  				/* {field : 'd.normalRoute',title : '临时车常跑路线',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var normalRoute='';
					if(typeof(rec.d)!="undefined"){
						normalRoute=rec.d.normalRoute;
					}
						return normalRoute;
					}
  				}, */
  				/* {field : 'd.source',title : '临时车来源',width : 80,align:'center',
  					formatter:function(value,rec,index){ 
						 var source='';
					if(typeof(rec.d)!="undefined"){
						source=rec.d.source;
					}
						return source;
					}
  				}, */
  				{field : 'publisher',title : '需求发布人',width : 100,align:'center'},
  				/* {field : 'd.tel',title : '车主联系方式',width : 100,align:'center',
  				formatter:function(value,rec,index){ 
						 var tel='';
					if(typeof(rec.d)!="undefined"){
						tel=rec.d.tel;
					}
						return tel;
					}}, */
  				
  				{field : 'price',title : '价格',width : 70,align:'center'},
  				{field : 'loadingAddress',title : '装货地址',width : 60,align:'center'},
  				{field : 'unloadingAddress',title : '卸货地址',width : 60,align:'center'},
  				//{field : 'ranges',title : '方位（m³）',width : 80,align:'center'},
  				//{field : 'weight',title : '重量（T）',width : 80,align:'center'},
  				//{field : 'models',title : '车长（m）',width : 100,align:'center'},
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
  				{field : 'zhuangCity',title : '装货城市',width : 140,align:'center'},
  				{field : 'xieCity',title : '卸货城市',width : 140,align:'center'},
  				{field : 'remarks',title : '备注',width : 100,align:'center'},
  				{field : 'createTime',title : '创建时间',width : 125,align:'center',
  				formatter:function(val,row,index){
  						if(val!=null){
  							return val.substring(0,19);
  						}
  					}},
  					{field : 'istrue',title : '是否确定',width : 60,align:'center',
  					formatter:function(val,row,index){
  					if(val==1){
  						return "是";
  					}else{
  					return "否";
  					}
  				}},
  				
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
			title : '新增手动竞价',
			url : 'Manual.do?method=getAddManual',
			width : 720,
			height:560,
			id:'addRelease',
			buttons : [{
				text : '<input type="button" class="btncss" value="保存">',
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
		if(row[0].istrue==1){
		parent.$.messager.alert('警告', '该条手动竞价已被确定', 'info');
		}else{
		for(var i=0;i<row.length;i++){
			   		var pid=row[i].demandReleaseId;
			   		var vid=row[i].vehicleAuctionId;
			   		var cid=row[i].temporary_car_id;
			   	}
			dialog = parent.jy.modalDialog({
				title : '修改竞价',
				url : 'Manual.do?method=getEditManual&pid=' + pid+'&vid='+vid+'&cid='+cid,
				width : 720,
				height:560,
				id:"modifyRelease",
				buttons : [{
					text : '<input type="button" class="btncss" value="保存">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
		}
			
		}else{
			$.messager.alert("手动添加竞价","请选择一行","info");
		}
	};
	//详细信息页面
	function xiangxixinxi() {
		var row = $('#dg').datagrid('getSelections');
		if(row.length==1){
			for(var i=0;i<row.length;i++){
			   		var pid=row[i].demandReleaseId;
			   		var vid=row[i].vehicleAuctionId;
			   		var cid=row[i].temporary_car_id;
			   	}
			dialog = parent.jy.modalDialog({
				title : '详细信息',
				url : 'Manual.do?method=getxinxiManual&pid=' + pid+'&vid='+vid+'&cid='+cid,
				width : 700,
				height:530,
				/* buttons : [{
					text : '<input type="button" class="btncss" value="保存">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}]  */
			});
		}else{
			$.messager.alert("手动添加竞价","请选择一行","info");
		}
	};
	
	//批量删除
	function delDemand_release(){
		var checkarray=[];
		var vvv=[];
	 	var array = $('#dg').datagrid('getSelections');
	 	for(var i=0;i<array.length;i++){
	 		checkarray.push(array[i].demandReleaseId);
	 		vvv.push(array[i].vehicleAuctionId);
		}
		if (array != "") {
			$.messager.confirm('确认','您确认想要删除选中的记录吗？',function(r){    
    			if (r){ 
    				$.ajax({
			    		url:"Manual.do?method=delManual",
			    		type: "POST",
			    		data:{del:checkarray.join(","),
			    			  vvv:vvv.join(",")},
		  				success:function(data){
		  					if (data.flag) {
								parent.$.messager.alert('竞价删除', '竞价删除成功', 'info',
								function(r) {
									$('#dg').datagrid('reload');
 								});
							} 
						}
    				});
    			}    
			});  
		} else{
			$.messager.alert("手动添加竞价","请选中要删除的信息","info");
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
  </script>
    <body class="easyui-layout">
<div region="north" title="检索条件" class="st-north" border="false" data-options="collapsible:false" style="height:62px">
		<label>装货城市：<input type="hidden" id="e1" class="search-text" style="width:150px"/></label>
		<label>卸货城市：<input type="hidden" id="e2" class="search-text" style="width:150px"/></label>
		<label>车长：<input type="text" class="search-text" style="width: 150px;" id="car_lengthId"></label>		
		<a class="easyui-linkbutton"  onclick="searchDemandRelease()" data-options="iconCls:'icon-search'">查询</a>
		<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="" href="javascript:void(0)" state="close">更多条件</a>
		<div id="searchInfoId" style="display: none">
			<label>货车类型：</label>
			<select class="easyui-combobox" class="search-text"  id='truckTypeId' name="truckTypeId" style="width:150px;margin-left: 10px;" data-options="panelHeight : 'auto',editable:false">   
				   <option id="" value="">全部</option>
					<option id="" value="0">厢车</option>
					<option id="" value="1">高栏</option>
					<option id="" value="2">平板</option>
				</select>
		<label style="margin-left: 10px;">发布人：</label>
			<input type="text" class="search-text" style="width: 150px;" id="publisherId" >
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
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbadd" onclick="showIcons()" data-options="iconCls:'icon-add',plain:true" style="display: none">新增</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbmodify" onclick="EditshowIcons()" data-options="iconCls:'icon-edit',plain:true" style="display: none">修改</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbdel" onclick="delDemand_release()" data-options="iconCls:'icon-remove',plain:true" style="display: none">删除</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="tbxinxi" onclick="xiangxixinxi()" data-options="iconCls:'icon-edit',plain:true" >详细信息</a>
   	<!-- <a href="javascript:void(0)" class="easyui-linkbutton" id="tbput" onclick="" data-options="iconCls:'icon-output',plain:true" style="display: none">导出</a> -->
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
