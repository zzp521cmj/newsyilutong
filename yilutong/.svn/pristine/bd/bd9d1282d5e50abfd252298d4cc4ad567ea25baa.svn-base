<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>收入信息管理</title>
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
	<script type="text/javascript" src="./js/function.js"></script><!--命名按钮方法  -->
	
  
  </head>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'jy.do?method=getMingxi',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  					columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'jy_direction',title : '方向',width : 100,align:'center'},
  				{field : 'jy_fufei',title : '付费方式',width : 100,align:'center'},
  				{field : 'jy_project',title : '项目',width : 100,align:'center'},
  				{field : 'jy_money',title : '金额',width : 100,align:'center'},
  				{field : 'jy_remarks',title : '备注',width : 100,align:'center'},
  			]],
  				/*  {field : 'income_total',title : '发货方式',width : 90,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "发货人门点";
  						}else if(val==1){
  						return "起运货运站";
  						}
  					}	
  				}, */
  			/* 	{field : 'shipping_order_state',title : '状态',width : 50,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "受理";
  						}else if(val==1){
  							return "在途";
  						}else if(val==2){
  						return "到达";
  						}else if(val==3){
  						return "配送";
  						}else if(val==4){
  						return "签收";
  						}
  					}	
  				}, */
  				/* {field : 'income_style',title : '是否修改',width : 70,align:'center',
	  				styler: function(val,row,index){
						if (val==1){
							return 'color:red;';
						}else{
							return 'color:blue;';
						}
	  				},
	  				formatter:function(val,row,index){
	  					if (val==1){
							return '是';
						}else{
							return '否';
						}
	  				},
			} */
  				
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
  		
  		//能更多条件
		var btnMoreSearch = $("#btnMoreSearch");
	btnMoreSearch.click(function() {
		 if (btnMoreSearch.attr("state") == "close") {
		 //主要代码 
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:92});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("收起条件");
			btnMoreSearch.attr("state", "open");
			$("#searchInfoId").css("display","block");
			$("#phone").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
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
		/*
  		select框
  	*/
  	
		$("#carid").select2({
		    placeholder: "请输入车牌号",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "income.do?method=IncemCarid",
				   data: {phones:query.term},   //传递你输入框中的值
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
  		document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};	
  	//查询
	function searchCar_owner() {
		$("#dg").datagrid('load', {
			jy_direction : $.trim($("#jy_direction").val()),
			jy_source : $.trim($("#jy_source").val()),
			jy_project:$.trim($("#jy_project").val()),
		});
	}
  	//删除
  	function deleteEver(){
  		var checkarray=[];
  		var che=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].jy_id);
  			che.push(array[i].jy_id);
  			}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "jy.do?method=deleteCompany",
						type: "POST",
						data:{	
								del:checkarray.join(","),
								che:che.join(",")
						},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("明细表删除","明细表删除成功",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert('明细表信息', '请选择要删除的信息', 'info');
  		}
  	}
  	
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].company_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '总汇表修改',
				url : 'company.do?method=getEditCompanyPage&pid=' + id,
				width : 680,
				buttons : [{
					text : '<input type="button" class="btncss" value="修改"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert('中转公司信息', '请选择一行信息', 'info');
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
  	
 	function add() {
		
		dialog = parent.jy.modalDialog({
			title : '明细信息新增',
			url : 'jy.do?method=save',

			width : 680,
			buttons : [{
				text : '<input type="button" class="btncss" value="保存"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
  	//打印
  	function dy(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var pid=row[i].shiping_order_id;
		  		}	
							var url="shipOrder.do?method=getShipOrderPrint&pid="+pid;
							ow(url);
  		}else{
  			$.messager.alert('中转公司信息', '请选择一行信息', 'info');
  		}	
  	
  	}
	function ow(owurl){ 
			var tmp=window.open("about:blank","","fullscreen=1");
			tmp.moveTo(0,0); 
			tmp.resizeTo(screen.width+20,screen.height); 
			tmp.focus(); 
			tmp.location=owurl; 
			} 
  	//导入
  	function putintfile() {
		dialog = parent.jy.modalDialog({
			title : '导入订单',
			url : 'shipOrder.do?method=imp',
			width : 600,
			height: 300,
			buttons : [{
				text : '<input type="button" value="导入" class="btncss">',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
				}
			}] 
		});
	};
	//重置
	function reset(){
		$("#jy_direction").val("");
		$("#jy_source").val("");
		$("#jy_project").val("");
		
		
	}
  </script>
  <body class="easyui-layout">
  	<form action="company.do" id="outputform" method="post">
    	
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	 <lable >方向:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="jy_direction" >
	    	 <lable >来源:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="jy_source" >
	    	
	    	<lable >项目:</lable>
	    	 <input type="text" class="search-text" id="jy_project"  style="width:150px"  >
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	
    	</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="add()">新增</a>
		      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"onclick="deleteEver()">删除</a>
		</div>	
		</form>	
  </body>
</html>