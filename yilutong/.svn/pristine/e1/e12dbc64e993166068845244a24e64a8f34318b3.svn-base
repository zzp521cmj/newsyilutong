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
 * 临时车辆界面
 * @author lx
 */  -->
    <title>临时车辆</title>
    
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
	}else if(fs[i]=="导入"){
	$("#tbput").removeAttr("style");
	}else if(fs[i]=="导出"){
	$("#tboutput").removeAttr("style");
	}
	
	} 
	var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:115});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#source_search").val("");
			$("#box_search").val("");
			$("#length_search").val("");
			$("#carType").val("");
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

  	
  		/* 车长信息 */    
		$("#box_search").combobox({
			url : 'temcar.do?method=getLength',
			valueField : 'id',
			textField : 'text',
			editable:false,
			panelHeight : 'auto'
		});
			
		/* 车辆来源信息 */    
		$("#source_search").combobox({
			url : 'temcar.do?method=getSource',
			valueField : 'id',
			textField : 'text',
			editable:false,
			panelHeight : 'auto'
		});
		
  	
  			grid=$("#dg").datagrid({
  			url : 'temcar.do?method=getTemCar',
  			//border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true,align:'center'},
  				/* {field : 'onLine',title : '状态',width : 80,
  					formatter:function(val,row,index){
			        	if(val==1){
			        		return "在线";
			        	}else if(val==2){
			        		return "离线";
			        	}
			        }
		        }, */
  				{field : 'plateNumber',title : '车牌号码',width : 80,align:'center'},
  				{field : 'tel',title : '手机号',width : 80,align:'center'},
  				{field : 'userName',title : '姓名',width : 80,align:'center'},
  				
  				//{field : 'user_idcard',title : '身份证',width : 80},
  				{field : 'institutionId',title : '所属机构',width : 140,align:'center',
  				formatter:function(val,row,index){
		        	$.ajax({
  					type: "POST",
  					async : false,
  					url:'user.do?method=getDepartment',
  					data:{did:val},
  					success:function(data){
  						da=data;
  			}
  		});
  						val = da;
  						return val;
		        } },
  				{field : 'registrationType',title : '类型',width : 50,align:'center',
  					formatter:function(val,row,index){
  						if(val==1){
  							return "PC";
  						}else if(val==2){
  							return "APP";
  						}
  					}
  				},
  				{field : 'sourceName',title : '来源',width : 70,align:'center'},
  				{field : 'carLength',title : '车长',width : 80,align:'center'},
  				{field : 'length_name',title : '厢型',width : 80,align:'center'},
  				{field : 'volume',title : '体积',width : 80,align:'center'},
  				{field : 'load_s',title : '载重',width : 80,align:'center'},
  				{field : 'carType',title : '车辆类型',width : 80,align:'center',
  					formatter:function(val,row,index){
  						if(val=="A"){
  							return "市内车";
  						}else if(val=="B"){
  							return "干线车";
  						}
  					}
  				},
  				//{field : 'normalRoute',title : '常跑线路',width : 80},
  				//{field : 'notes',title : '备注',width : 80},
  				
  				{field : 'creatingUser',title : '创建用户',width : 80,align:'center',
			formatter:function(val,row,index){
		        	$.ajax({
  					type: "POST",
  					async : false,
  					url:'user.do?method=getUser1',
  					data:{id:val},
  					success:function(data){
  						da=data.username;
  			}
  			
  			});
  						val=da;
  						return val;
  			}
  				},
  				{field : 'creatingDate',title : '创建时间',width : 130,align:'center',
  					formatter:function(val,row,index){
  						if(val!=null){
  							return val.substring(0,19);
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
  	/*  跳转到新增界面*/
  	function addCar(){
  		dialog = parent.jy.modalDialog({
			title : '新增车辆',
			width:750,
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
				width:750,
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
				width:750,
				height:510,
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
  	var jj;
  	var gg;
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  		$.ajax({
  					type: "POST",
  					async : false,
  					url:'temcar.do?method=getjingjia',
  					data:{id:array[i].temporaryCarId},
  					success:function(data){
  						jj=data.flag;
  			}
  		});
  			checkarray.push(array[i].temporaryCarId);
  			if(jj==true){
  				gg=true;
  			}
  		}
  		if(array != ""){
	  		if(gg==true){
	  			parent.$.messager.alert("错误","该车辆已参与竞价不能被删除",'info');
	  		}else{
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
	  		}
  			
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
    	<div region="north" title="车辆基础信息管理" class="st-north" style="height:61px" border="false" data-options="collapsible:false">
			
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
    	<div region="center" title="车辆信息列表" region="center" style="background:#eee;overflow-y:hidden">
    		<table id="dg"></table>
    	</div>
    	<div id="tb">
		   <a href="javascript:void(0)" id="tbadd" onclick="addCar()" class="easyui-linkbutton"  data-options="iconCls:'icon-add',plain:true"style="display: none">新增</a>
		   <a class="easyui-linkbutton" id="tbmodify" onclick="editTruck()" data-options="iconCls:'icon-edit',plain:true"style="display: none">修改</a>
		   <a class="easyui-linkbutton" id="tbdel" onclick="deleteTruck()" data-options="iconCls:'icon-remove',plain:true"style="display: none">删除</a>
		   <a class="easyui-linkbutton" id="tbxinxi" onclick="xiangxixinxi()" data-options="iconCls:'icon-edit',plain:true">详细信息</a>
		  <!--  <a class="easyui-linkbutton" id="tbput" onclick="" data-options="iconCls:'icon-input',plain:true"style="display: none">导入</a> -->
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
