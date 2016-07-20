<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
 <!-- /**
 * 发车计划监控界面
 * @author lx
 */  -->
    <title>发车计划监控</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<script type="text/javascript" src="./poshytip-1.2/src/jquery.poshytip.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./css/smart.css" type="text/css"></link>
	<link rel="stylesheet" type="text/css" href="./poshytip-1.2/src/tip-violet/tip-violet.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  </head>
  <script type="text/javascript">
  
  	var grid;
  	var dialog;
  	$(function(){
	var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:115});
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
	
  			/* 根据车牌号查询 */
  		  $("#number_search").select2({
    		 placeholder: "请选择车辆",	//默认文本框显示信息
   			 minimumInputLength: 1,	//最小输入字符长度
   			 multiple: false,				//设置多项选择，false则只能单选
   			 allowClear:true,
    		 maximumSelectionSize: 5,
    		 query: function (query) {
			    	$.ajax({
					   type: "POST",
					   url: "temcar.do?method=getCarNum",
					   data: {search:query.term
					   		},   //传递输入框中的值
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
  			grid=$("#dg").datagrid({
  			url : 'clm.do?method=getMonitorPage',
  			//border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true,align:'center'},
  				{field : 'linname',title : '班线名称',width : 80,align:'center',
  				formatter : function(val, row, index) {
					var block="<a id='"+row.linnumber +"'class='lalala' onmouseout = 'yyy(\""+row.linnumber+"\")' onmouseover='xxx(\""+row.linnumber+"\")'>"+val+"</a>";
					return block;
				}
			}
  				
  			]],
  			pagination : true,
  			pageSize : 10,
  			pageList : [5, 10, 15, 20 ],
  			toolbar : '#tb'
  			
  		});
  		 
  	});
  	function yyy(data){
  	$("#"+data).poshytip('disable');
  	}
  	function xxx(data){
  	var ss;
  	$("#"+data).poshytip({
  			className: 'tip-violet',
  			alignTo:'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 25,
			offsetY: 8,
			fade: true,
			content: function(updateCallback) {
			$.ajax({
					   type: "POST",
					   async : false,
					   url: "clm.do?method=getPoshytip",
					   data: {id:data
					   		},   //传递输入框中的值
					   success: function(msg){
			 		   	ss=msg;
					   }
					   });
			var heightline=63;
			if(ss.length > 2){
			 heightline=83;
			}
			
		content='<div style="width:440px;"><div class="smart-timeline-content no-border padding-5 clearfix"><h6 class="col-xs-6 no-margin"> 计划 </h6><h6 class="col-xs-6 no-margin"> 实际 </h6></div><div class="classLine smart-timeline"><ul class="smart-timeline-list">';
         var content0="";
         var content1="";
         var content2="";
         $.each(ss,function(k,v){
         if(v.siteFlag==1){
         content1 += '<li class="special">'
							+'<div id="Poshytip'+v.siteId+'" class="smart-timeline-list-green" style="height:'+heightline+'px;display:none"></div>'
							+'<div class="smart-timeline-icon">';
							/* if(v.gout && v.gout!='--'){
								content +='<div class="timeline-icon-green"></div>';
										
							} */	
		content1 +='</div>'				
							+'<div class="smart-timeline-arrow"></div>'
							+'<div class="smart-timeline-time banxian_city padding-5">'
							+v.siteName
							+'</div>'
							+'<div class="smart-timeline-content clearfix">'
							+'<div class="col-xs-6 padding-5 border-right-timeline">'
							+'<i class="fa fa-arrow-circle-o-down fa-fw"></i>2015-07-10 15:30'
							+'</div>';
							/* if(v.gout && v.gout!='--' && v.pout >= v.gout ){
								content +='<div class="col-xs-6 padding-5 text-success">'
										+'<i class="fa fa-arrow-circle-o-down fa-fw"></i> '+v.gout
										+'</div>';
							}else if(v.gout && v.gout!='--' && v.pout < v.gout){
								content +='<div class="col-xs-6 padding-5 text-danger">'
										+'<i class="fa fa-arrow-circle-o-down fa-fw"></i> '+v.gout
										+'</div>';
							}else{
								content +='<div class="col-xs-6 padding-5">'
										+'<i class="fa fa-arrow-circle-o-down fa-fw"></i> '+v.gout
										+'</div>';
							} */
		content1 +='<div class="col-xs-6 padding-5">'
										+'<i class="fa fa-arrow-circle-o-down fa-fw"></i> 6666'
										+'</div>';
		content1 +='</div>'
							+'</li>';
         }else if(v.siteFlag==2){
         content2 += '<li>'
							+'<div id="Poshytip'+v.siteId+'" class="smart-timeline-list-green" style="display:none"></div>'
							+'<div class="smart-timeline-content clearfix no-border">'
							+'<div class="col-xs-6 padding-5">'
							+'<i class="fa fa-clock-o fa-fw"></i>'+v.siteTime
							+'</div>';
						/* 	if(v.gruntime && v.gruntime!='--' && v.pruntime >= v.gruntime ){
								content +='<div class="col-xs-6 padding-5 text-success">'
										+'<i class="fa fa-clock-o fa-fw"></i> '+sec2time(v.gruntime)
										+'</div>';
							}else if(v.gruntime && v.gruntime!='--' && v.pruntime < v.gruntime){
								content +='<div class="col-xs-6 padding-5 text-danger">'
										+'<i class="fa fa-clock-o fa-fw"></i> '+sec2time(v.gruntime)
										+'</div>';
							}else{
								content +='<div class="col-xs-6 padding-5">'
										+'<i class="fa fa-clock-o fa-fw"></i> '+v.gruntime
										+'</div>';
							} */
			content2 +='</div>'
							+'<div class="smart-timeline-icon">';
							/* if(v.gout && v.gout!='--'){
								content +='<div class="timeline-icon-green"></div>';
							} */
			content2 +='</div>'
				+'<div class="smart-timeline-arrow"></div>'
				+'<div class="smart-timeline-time banxian_city padding-5">'
				+v.siteName
				+'</div>'
				+'<div class="smart-timeline-content clearfix">'
				+'<div class="col-xs-6 padding-5 border-right-timeline">'
				+'<p><i class="fa fa-angle-double-down fa-fw"></i>2015-07-10 16:30</p>'
				+'<p><i class="fa fa-dot-circle-o fa-fw"></i>'+v.siteStayTime+'</p>'
				+'<p><i class="fa fa-angle-double-down fa-fw"></i> 2015-07-10 17:30</p>'
				+'</div>'
				+'<div class="col-xs-6 padding-5">';
			/* 	if(v.gin && v.gin!='--' && v.pin >= v.gin ){
								var siteorder = v.order - 1;
								$('#sitelist_'+siteorder).show();
								content +='<p class="text-success"><i class="fa fa-angle-double-down fa-fw"></i>'+v.gin+'</p>';
							}else if(v.gin && v.gin!='--' && v.pin < v.gin){
								var siteorder = v.order - 1;
								$('#sitelist_'+siteorder).show();
								content +='<p class="text-danger"><i class="fa fa-angle-double-down fa-fw"></i>'+v.gin+'</p>';
							}else{
								content +='<p><i class="fa fa-angle-double-down fa-fw"></i>'+v.gin+'</p>';
							} */
						/* 	if(v.gstoptime && v.gstoptime!='--分钟' && v.pstoptime >= v.gstoptime ){
								content +='<p class="text-success"><i class="fa fa-dot-circle-o fa-fw"></i>'+sec2time(v.gstoptime)+' </p>';
							}else if(v.gstoptime && v.gstoptime!='--分钟' && v.pstoptime < v.gstoptime){
								content +='<p class="text-danger"><i class="fa fa-dot-circle-o fa-fw"></i>'+sec2time(v.gstoptime)+' </p>';
							}else{
								content +='<p class=""><i class="fa fa-dot-circle-o fa-fw"></i>'+v.gstoptime+' </p>';
							}
							if(v.gout && v.gout!='--' && v.pout >= v.gout ){
								content +='<p class="text-success"><i class="fa fa-angle-double-down fa-fw"></i>'+v.gout+'</p>';
							}else if(v.gout && v.gout!='--' && v.pout < v.gout){
								content +='<p class="text-danger"><i class="fa fa-angle-double-down fa-fw"></i>'+v.gout+'</p>';
							}else{
								content +='<p><i class="fa fa-angle-double-down fa-fw"></i>'+v.gout+'</p>';
							} */
		content2 +='</div>'
							+'</div>'
							+'</li>';
         }else if(v.siteFlag==0){
          content0 += '<li class="special s2">'
							+'<div class="smart-timeline-content clearfix no-border">'
							+'<div class="col-xs-6 padding-5">'
							+'<i class="fa fa-clock-o fa-fw"></i>'+v.siteTime
							+'</div>';
							/* if(v.gruntime && v.gruntime!='--' && v.pruntime >= v.gruntime ){
								content +='<div class="col-xs-6 padding-5 text-success">'
										+'<i class="fa fa-clock-o fa-fw"></i> '+sec2time(v.gruntime)
										+'</div>';
							}else if(v.gruntime && v.gruntime!='--' && v.pruntime < v.gruntime){
								content +='<div class="col-xs-6 padding-5 text-danger">'
										+'<i class="fa fa-clock-o fa-fw"></i> '+sec2time(v.gruntime)
										+'</div>';
							}else{
								content +='<div class="col-xs-6 padding-5">'
										+'<i class="fa fa-clock-o fa-fw"></i> '+v.gruntime
										+'</div>';
							} */
			content0 += '</div>'
			+'<div class="smart-timeline-icon">';
			/* if(v.gin && v.gin!='--'){
				content +='<div class="timeline-icon-green"></div>';
			} */
			content0 +='</div>'
						+'<div class="smart-timeline-arrow"></div>'
						+'<div class="smart-timeline-time banxian_city padding-5">'+v.siteName+'</div>'
						+'<div class="smart-timeline-content clearfix">'
						+'<div class="col-xs-6 padding-5 border-right-timeline">'
						+'<i class="fa fa-arrow-circle-o-down fa-fw"></i>2015-07-10 20:30'
						+'</div>';
						/* if(v.gin && v.gin!='--' && v.pin >= v.gin ){
								var siteorder = v.order - 1;
								$('#sitelist_'+siteorder).show();
								content +='<div class="col-xs-6 padding-5 text-success">'
										+'<i class="fa fa-arrow-circle-o-down fa-fw"></i> '+v.gin
										+'</div>';
							}else if(v.gin && v.gin!='--' && v.pin < v.gin){
								var siteorder = v.order - 1;
								$('#sitelist_'+siteorder).show();
								content +='<div class="col-xs-6 padding-5 text-danger">'
										+'<i class="fa fa-arrow-circle-o-down fa-fw"></i> '+v.gin
										+'</div>';
							}else{
								content +='<div class="col-xs-6 padding-5">'
										+'<i class="fa fa-arrow-circle-o-down fa-fw"></i> '+v.gin
										+'</div>';
							} */
							content0 += '</div>'
							+'</li>';
         }
         });
         content += content1;content+= content2;content+=content0;
     content += '</ul></div></div>';
			window.setTimeout(function() {
			updateCallback(content);
		});
			return 'Loading...';
			}});
			
  	}
  	/*  跳转到新增界面*/
  	function addCar(){
  		dialog = parent.jy.modalDialog({
			title : '新增车辆',
			width:710,
			height:510,
			url : 'temcar.do?method=getAddCar',
			buttons : [{
				text : '<input type="button" class="btncss" value="保存">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
  	};
  	
  	/* 跳转到修改界面*/
  	function editTruck(){
  		var row = $('#dg').datagrid('getSelections');
  		if(row.length==1){
  			for(var i=0;i<row.length;i++){
  				var temporaryCarId = row[i].temporaryCarId;
  			}
  			dialog = parent.jy.modalDialog({
				title : '修改车辆',
				url : 'temcar.do?method=editTem&temporaryCarId=' + temporaryCarId,
				width:710,
				height:510,
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
  	}
  	/* 跳转到详细信息界面*/
  	function xiangxixinxi(){
  		var row = $('#dg').datagrid('getSelections');
  		if(row.length==1){
  			for(var i=0;i<row.length;i++){
  				var temporaryCarId = row[i].temporaryCarId;
  			}
  			dialog = parent.jy.modalDialog({
				title : '详细信息',
				url : 'temcar.do?method=xinxiTem&temporaryCarId=' + temporaryCarId,
				width:710,
				height:480,
				/* buttons : [{
					text : '<input type="button" class="btncss" value="保存">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}]  */
			});
		}else{
			alert("请选择一行");
  		}
  	}
  	/* 批量删除 */
  	function deleteTruck(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].temporaryCarId);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({						
    					url: "temcar.do?method=deleteTem",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("车辆信息删除","车辆信息删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
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
  	/* 查询 */
  	function searchTruck(){
  		$('#dg').datagrid('load',{
  			plateNumber : $.trim($("#number_search").select2("val")),
  			boxType: $.trim($("#box_search").combobox('getValue')),
  			volume : $.trim($("#volume_search").val()),
  			load_s : $.trim($("#load_search").val()),
  			source : $.trim($("#source_search").combobox('getValue')),
  			carLength : $.trim($("#length_search").val()),
  			carType :$.trim($("#carType").combobox('getValue'))
  		});
  	}
  	function reset(){
  	$("#number_search").select2("val", "");
  	$("#box_search").combobox('setValue',"");
  	$("#volume_search").val("");
  	$("#load_search").val("");
  	$("#length_search").val("");
  	$("#source_search").combobox('setValue',"");
  	$("#carType").combobox('setValue',"");
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
			fieldName.push(col.field); //把field列属性名到数组里去 
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  </script>
  <body class="easyui-layout">
  <form action="temcar.do" id="outputform" method="post">
    	<div region="north" title="发车计划监控管理" class="st-north" style="height:61px" border="false" data-options="collapsible:false">
				<lable>车牌号码:</lable><input type="hidden"  name="plateNumber" class="search-text"id="number_search"/>
				<lable class="divlabel">体积:</lable><input type="text" name="volume"class="search-text"id="volume_search">
				<lable>载重:</lable><input type="text"class="search-text" name="load_s" id="load_search" >
				<a class="easyui-linkbutton" onclick="searchTruck()" data-options="iconCls:'icon-search'">查询</a>
				<a id="btnMoreSearch" class="btn btn-sm btn-link" type="button"  href="javascript:void(0)" state="close">更多条件</a>
				<div id="searchInfoId" style="display: none">
				<lable>车辆来源:</lable><input class="easyui-combobox search-text" name="source" id="source_search" >
				<lable class="divlabel">车长:</lable><input type="text" name="carLength" class="search-text" id="length_search">
				<lable>厢型:</lable><input class="easyui-combobox search-text" name="boxType" id="box_search" >
				<br><div style="padding-top: 5px"><lable>车辆类型</lable>
				<select id="carType" class="easyui-combobox search-text"  name="carType" data-options="panelHeight : 'auto',editable:false">   
				    <option value="">请选择</option>
				    <option value="A">市内车</option>   
				   <option value="B">干线车</option>   
				</select></div>
				<!-- <lable>是否在线:</lable><input type="text" id="" style="width: 95px"> -->
				</div>
				
    	</div>
    	<div region="center" title="发车计划监控" region="center" style="background:#eee;overflow-y:hidden">
    		<table id="dg"></table>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" id="tbadd" onclick="addCar()" class="easyui-linkbutton"  data-options="iconCls:'icon-add',plain:true"style="display: none">新增</a>
		   <a class="easyui-linkbutton" id="tbmodify" onclick="editTruck()" data-options="iconCls:'icon-edit',plain:true"style="display: none">修改</a>
		   <a class="easyui-linkbutton" id="tbdel" onclick="deleteTruck()" data-options="iconCls:'icon-remove',plain:true"style="display: none">删除</a>
		   <a class="easyui-linkbutton" id="tbxinxi" onclick="xiangxixinxi()" data-options="iconCls:'icon-edit',plain:true">详细信息</a>
		   <a class="easyui-linkbutton" id="tboutput" data-options="iconCls:'icon-output',plain:true"style="display: none" onclick="putoutfile()">导出</a>
		   <a class="easyui-linkbutton" id="tbreset" onclick="reset()"data-options="iconCls:'icon-reset',plain:true">重置</a>
		</div>
		<input type="hidden" name="method" value="outputCar">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
		<input id="functionname"type="hidden" value=${function}>
  </body>
</html>
