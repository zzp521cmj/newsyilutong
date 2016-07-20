<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>JIT监控发运时间信息管理</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  	<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/truck_cloud/"; 
 	%>
  </head>
  <script type="text/javascript">
  
	  	var dialog;
 		var grid;
  		$(function(){
  		var fs=$("#functionname").val().split(",");
	for(var i = 0;i<fs.length;i++){
	if(fs[i]=="处理"){
		$("#tbchuli").removeAttr("style");
	}else if(fs[i]=="导出"){
	$("#tbput").removeAttr("style");
	}
	}
  			grid=$("#dg").datagrid({
  			url : 'jmonitor.do?method=getJITMonitor&monitorType=2',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'plate_number',title : '车牌号',width : 80,align:'center'},
  				{field : 'equipment_id',title : '设备号',width : 80,align:'center'},
  				{field : 'department_name',title : '所属机构',width : 100,align:'center'},
  				{field : 'jmonitor_type',title : '报警类型',width : 120,align:'center',
  					formatter:function(val,row,index){2
  						if(val==1){
  							return "发运时间报警";
  						}else if(val==2){
  						return "车辆运行时间报警";
  						}else if(val==3){
  						return "节点作业时间报警";
  						}
  					}
  				},
  				{field : 'jmonitor_type_name',title : '报警类型名',width : 120,align:'center',hidden:'true'},
  				{field : 'jmonitor_time',title : '报警时间',width : 140,align:'center'},
  				{field : 'time_stay_real',title : '实际运行时间',width : 95,align:'center'},
  				{field : 'time_stay_plan',title : '计划运行时间',width : 95,align:'center'},
  				{field : 'time_beyond',title : '晚的时间',width : 90,align:'center'},
  				{field : 'jmonitor_state',title : '状态',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "未解决";
  						}else if(val==1){
  						return "已解决";
  						}
  					}
  				},
  				{field : 'jmonitor_state_name',title : '处理状态',width : 70,align:'center',hidden:'true'},
  				//{field : 'employmentType',title : '从业类型',width : 80,align:'center'},
  				{field : 'answer_time',title : '解答时间',width : 140,align:'center'},
  				{field : 'remarks',title : '备注',width : 130,align:'center'},
  				//{field : 'updateDate',title : '更新日期',width : 80,align:'center'},
  				
  			]],
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
  		$('#cc3').combotree({    
    		url: "depn.do?method=getTree&&id=",    
    		width: 150,
    		onBeforeLoad: function(node, param) {
    		
                if (node == null) {
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                } else {
                
                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=" + node.id;//加载下层节点
                }
              
               }     
		});
		//更多条件
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
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:58});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
});
		/*
  		select框
  	*/
		
		 $("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    multiple: false,	//设置多项选择，false则只能单选
		    allowClear:true,		//允许清空	
		    maximumSelectionSize: 5, //最大选择个数
		    query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "jmonitor.do?method=getCar_idLength",
				   data: {car_id:query.term,
				   type:2},   //传递你输入框中的值
				   success: function(msg){
		 		   	var msg=$.parseJSON(msg);		
		 			var data = {results: []};					
					$.each(msg,function(x,y){
						data.results.push({id: y.id, text: y.name});;
					});
			        query.callback(data);
				   }
				});
		    }
		});
  	});
  		
  	//查询
  	function searchmonitorRuning(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		
  		if(startDate!=''&&endDate!=''){
		var str =startDate; 
		// 转换日期格式 
		str = str.replace(/-/g, '/'); // "2010/08/01"; 
		// 创建日期对象 
		var date = new Date(str); 
		// 加一天 
		date.setDate(date.getDate() - 1); 
		// 没有格式化的功能，只能一个一个取 
		startDate = date.getFullYear() + '-' 
		    // 因为js里month从0开始，所以要加1 
		    + (parseInt(date.getMonth()) + 1) + '-' 
		    + date.getDate(); 
		    
			 var str1 =endDate; 
		// 转换日期格式 
			str1 = str1.replace(/-/g, '/'); // "2010/08/01";
		// 创建日期对象 
			var date = new Date(str1); 
		// 加一天 
			date.setDate(date.getDate() +1); 
		// 没有格式化的功能，只能一个一个取 
			endDate = date.getFullYear() + '-' 
		    // 因为js里month从0开始，所以要加1 
		    + (parseInt(date.getMonth()) + 1) + '-' 
		    + date.getDate(); 
		    }else if(endDate!=''&&startDate==''){
				     var str1=endDate; 				
				// 转换日期格式 
					str1 = str1.replace(/-/g, '/'); // "2010/08/01";
				// 创建日期对象 
					var date = new Date(str1); 
				// 加一天 
					date.setDate(date.getDate() +1); 
				// 没有格式化的功能，只能一个一个取 
					endDate = date.getFullYear() + '-' 
				    // 因为js里month从0开始，所以要加1 
				    + (parseInt(date.getMonth()) + 1) + '-' 
				    + date.getDate(); 
		    }else if(startDate!=''&&endDate==''){
		   		 var str =startDate; 
				// 转换日期格式 
				str = str.replace(/-/g, '/'); // "2010/08/01"; 
				// 创建日期对象 
				var date = new Date(str); 
				// 加一天 
				date.setDate(date.getDate() - 1); 
				// 没有格式化的功能，只能一个一个取 
				startDate = date.getFullYear() + '-' 
				    // 因为js里month从0开始，所以要加1 
				    + (parseInt(date.getMonth()) + 1) + '-' 
				    + date.getDate(); 			    
		    }
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		monitorType:2,
	 	 		carId:$.trim($("#carid").select2("val")),
  			
	 	});	  
	 	
  	}
  	
  	function dealJITmonitor(){
  		var del='';
  		var state='';
	 	var array = $('#dg').datagrid('getSelections');	 	
  		if(array.length== 1){
  			for(var i=0;i<array.length;i++){
	  			del=array[i].jmonitor_id;
	  			state=array[i].jmonitor_state;
	  		}
	  		if(state==1){
	  				alert("该条信息不需要处理！");
	  		}else{
  			$.messager.confirm('确认','您确定要处理选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "jmonitor.do?method=dealJITMonitor",
						type: "POST",
						data:{del:del},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("车辆运行时间监控","车辆运行时间监控处理成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}
  			});
  			}
	 	}else{
  			alert("请选择一行信息");
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
			if(col.field!="jmonitor_type"&&col.field!="jmonitor_state"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			}
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  </script>
  <body class="easyui-layout">
  	<form action="jmonitor.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable>报警时间:</lable>
	    	<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px; " onfocus="WdatePicker({isShowWeek:true})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:150px;height:22px;" onfocus="WdatePicker({isShowWeek:true})" />
	    <!-- 	<lable class="divlabel">报警类型:</lable>
	    	<select  class="easyui-combobox" id="type"name="monitorType" style="width:150px;height:22px"
						 data-options="panelHeight : 'auto',editable:false">
						 <option id="" value="">全部类型</option>
							<option id="" value="1">发运时间报警</option>
							<option id="" value="2">车辆运行时间报警</option>
							<option id="" value="3">节点运作时间报警</option>
					</select> -->
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
			<lable class="divlabel">车牌号码:</lable>
			<input type="hidden"  style="width:150px"   id="carid" >
			<a class="easyui-linkbutton" onclick="searchmonitorRuning()"style="margin-left: 10px;" data-options="iconCls:'icon-search'">查询</a>	
    	</div>
    	<div region="center" >
    		<table id="dg" title="监控信息" ></table>
    	</div>
    	<div id="tb">
    		<a href="javascript:void(0)" class="easyui-linkbutton" style="display: none" id="tbchuli" data-options="iconCls:'icon-edit',plain:true" onclick="dealJITmonitor()">处理</a>
		  	<a href="javascript:void(0)" class="easyui-linkbutton" style="display: none" id="tbput" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
		</div>
		
	<input type="hidden" name="method" value="outJITMonitor1">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>	
		<input id="functionname"type="hidden" value=${function}>
	</div>
  </body>
</html>