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
 * 保险界面
 * @author lx
 */  -->
    <title>保险</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<script type="text/javascript" src="./js/function.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
  	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	
  </head>
  <script type="text/javascript">
	var grid;
	var dialog;
	$(function(){
  			
  			/* 根据车牌号查询 */
  		  $("#number_search").select2({
    		 placeholder: "请选择车辆",	//默认文本框显示信息
   			 minimumInputLength: 1,	//最小输入字符长度
   			 allowClear:true,
   			 multiple: false,				//设置多项选择，false则只能单选
    		 maximumSelectionSize: 5,
    		 query: function (query) {
			    	$.ajax({
					   type: "POST",
					   url: "insurance.do?method=getCarNum",
					   data: {search:query.term},   //传递输入框中的值
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
  			url : 'insurance.do?method=getInsurance',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'plateNumber',title : '车牌号码',width : 80},
  				{field : 'insured',title : '被保险人',width : 80},
  				{field : 'insurer',title : '保险人',width : 80},
  				{field : 'insuredCard',title : '被保险人身份证号码',width : 120},
  				{field : 'premiumAmountCompulsory',title : '保费金额（交强险）',width : 110},
  				{field : 'carTax',title : '车船税（交强险）',width : 120},
  				{field : 'insuranceCategory',title : '承保险别（商业险）',width : 110},
  				{field : 'premiumAmountBusiness',title : '保费金额（商业险）',width : 110},
  				{field : 'premiumAmountCargo',title : '保费金额（货物险）',width :110},
  				{field : 'addDate',title : '新增时间',width : 130,
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
  	function add(){
  		dialog = parent.jy.modalDialog({
			title : '新增保险',
			url : 'insurance.do?method=getAddInsurance',
			width:670,
			buttons : [{
				text : '<input type="button" value="保存" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
  	};
  	
  	/* 跳转到修改界面*/
  	function modify(){
  		var row = $('#dg').datagrid('getSelections');
  		if(row.length==1){
  			for(var i=0;i<row.length;i++){
  				var insuranceId = row[i].insuranceId;
  			}
  			dialog = parent.jy.modalDialog({
				title : '修改保险',
				width:670,
				url : 'insurance.do?method=editInsurance&insuranceId=' + insuranceId,
				buttons : [{
					text : '<input type="button" value="保存" class="btncss">',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
		}else{
			alert("请选择一行");
  		}
  	}
  	/* 批量删除 */
  	function deleteEver(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].insuranceId);
  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({						
    					url: "insurance.do?method=deleteInsurance",
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
  	/* 查询 */
  	function searchTruck(){
  		$('#dg').datagrid('load',{
  			plateNumber : $.trim($("#number_search").select2("val")),
  		});
  	}
  </script>
  <body class="easyui-layout">
  <form action="insurance.do" id="outputform" method="post">
    	<div region="north" title="保险基础信息管理" class="st-north" border="false" collapsible="false">
			<lable>车牌号码:</lable><input type="hidden" style="width:140px"  name="plateNumber" id="number_search"/>
			&nbsp<a class="easyui-linkbutton" onclick="searchTruck()" data-options="iconCls:'icon-search'">查询</a>
    	</div>
    	
    	<div region="center" title="保险信息列表" region="center" style="background:#eee;overflow-y:hidden">
    		<table id="dg"></table>
    	</div>
    	<div id="tb">
		  <!--  <a href="javascript:void(0)" onclick="add()" class="easyui-linkbutton"  data-options="iconCls:'icon-add',plain:true">新增</a>
		   <a class="easyui-linkbutton" onclick="modify()" data-options="iconCls:'icon-edit',plain:true">修改</a>
		   <a class="easyui-linkbutton" onclick="deleteEver()" data-options="iconCls:'icon-remove',plain:true">删除</a>
		   <a class="easyui-linkbutton" id="" onclick="putoutfile" data-options="iconCls:'icon-input',plain:true">导入</a>
		   <a class="easyui-linkbutton" id="" onclick="putoutfile" data-options="iconCls:'icon-output',plain:true">导出</a> -->
		   
		</div>
		<input type="hidden" name="method" value="outputFile">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
  </body>
</html>
