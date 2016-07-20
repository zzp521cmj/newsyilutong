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
    <title>订单货发量查询</title>
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
 		var editval;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'coustomB.do?method=getCoustomBaob',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		/* 	remoteSort:true, */
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'order_time',title : '制单日期',width : 130,align:'center',
  					formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 			
  				
  				},
  				{field : 'send_time',title : '发车时间',width : 120,align:'center',sortable:'true',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'custom_name',title : '发货客户',width : 80,align:'center'},	
  				{field : 'car_number',title : '车牌号',width : 70,align:'center'},
  				{field : 'shiping_order_num',title : '运单号',width : 80,align:'center'},	
  				{field : 'send_station',title : '起运地',width : 70,align:'center'},
  				{field : 'end_address',title : '到达地',width : 70,align:'center'},
  				{field : 'receipt',title : '收货方',width : 70,align:'center'},
  				{field : 'receipt_address',title : '收货地址',width : 70,align:'center'},
  				{field : 'goods_name',title : '货物',width : 70,align:'center'},  			
  				{field : 'trade_agency',title : '代收款',width : 70,align:'center'},
  				{field : 'transport_pay',title : '运费总额',width : 70,align:'center'/* sortable: true */},
  				{field : 'pay_type',title : '付款方式',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "回付";
  						}else if(val==1){
  							return "提付";
  						}else if(val==2){
  						return "现付";
  						}else if(val==3){
  						return "货到前付";
  						}else if(val==4){
  						return "发货方月结";
  						}else if(val==5){
  						return "收货方月结";
  							}else if(val==6){
  						return "货到付款";
  						}
  					}	
  				}, 
  				{field : 'paytypes',title : '付款方式',width : 70,align:'center',hidden:'true'},	
  				/* {field : 'company_id',title : '中转公司',width : 70,align:'center',
  					formatter:function(val,row,index){
  						var de='';
	  						$.ajax({
					  			type: "POST",
					  			async : false,
					  			url:'company.do?method=getUpdateCompany',
					  			data:{id : val},
					  			success:function(data){
					  			de=data.company_name;
					  			//$("#ndpid").val(data.department_id);
					  			//$("#departments").append("<li>"+data+"</li>");
					  			}
					  		});
					  	return de;	 	
  					}		
  				}, */
  				{field : 'sign_time',title : '签收时间',width : 100,align:'center',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 		},
  				{field : 'sign_user',title : '提货人',width : 70,align:'center'}, 		
  				{field : 'sign_name',title : '提货代理人',width : 70,align:'center'},		
  				{field : 'sign_remarks',title : '提货备注',width : 90,align:'center'},			
  				{field : 'send_type',title : '交接方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "客户自提";
  						}else if(val==1){
  						    return "专车送货";
  						}else if(val==2){
  							return "送货进仓";
  						}else if(val==3){
  						    return "送货上楼";
  						}else if(val==4){
  						    return "送货上门";
  						}
  					}
  				},
  				{field : 'sendtype',title : '配送方式',width : 70,align:'center',hidden:'true'},
  				{field : 'agreement_types',title : '协议类型',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "班线";
  						}else if(val==1){
  						return "配送";
  						}else if(val==2){
  						return "转运";
  						}
  					}	 				
  				},			  					
  				{field : 'agreement_type',title : '协议类型',width : 90,align:'center',hidden:'true'},  	
  				{field : 'remarks',title : '备注',width : 90,align:'center',sortable:'true'},  		  			 					
  				{field : 'creat_type',title : '创建方式', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "手录";
  						}else if(val==1){ 						
  						return "PC端导入";
  						}else if (val==2) {
							return "无缝对接";
						}else if (val==3) {
							return "APP端导入";
						}else if (val==4) {
							return "PC端手录";
						}
  					}
  				}, 	
  				{field : 'creattype',title : '创建方式',width : 70,align:'center',hidden:'true'},	
  				{field : 'shipping_order_name',title : '制单人',width : 80,align:'center',sortable:'true'},				
  			]],	
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		//	回车查询
  		document.onkeydown = function(event) {
			e = event ? event : (window.event ? window.event : null);
			if (e.keyCode == 13) {
				//执行的方法 
				searchCar_owner();
			}
		};
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
				$("#send_address").val("");
				$("#end_address").val("");
				$("#perpole").val("");
				$("#pay_state").combobox("setValue","");
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
		    placeholder: "请输入车主电话",	//默认文本框显示信息
		    minimumInputLength: 1,	//最小输入字符长度
		    allowClear:true,
		    multiple: false,				//设置多项选择，false则只能单选
		    maximumSelectionSize: 5, //最大选择个数
			query: function (query) {
		    	$.ajax({
				   type: "POST",
				   url: "shipOrder.do?method=getPhoneLength",
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
		$("#pay_type").combobox("setValue",""); 
		$("#pay_type").combobox("setText","全部");	 
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		/* 	if(startDate!=null){
  			startDate.substr(0,10)+" 00:00:00"
  			}
  			if(endDate!=null){
  			endDate.substr(0,10)+" 59:59:59"
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		ddId:$.trim($("#ddId").val()),
	 	 		city1:$.trim($("#city1").val()),//发货区域
	 	 		fhname:$.trim($("#fhname").val()),//发货客户
	 	 		pay_type:$.trim($("#pay_type").combobox("getValue")),//付款方式
	 	 		//send_address:$.trim($("#send_address").val()),//发站
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				start_date1 :$.trim($("#startDate1").val()),
	 	 		end_date1 :$.trim($("#endDate1").val()),
	 	});	  
	 	
  	}
  		
 	//周图
  	function day(){
  		var row=$("#dg").datagrid('getSelections'); 				
	  			dialog = parent.jy.modalDialog({
				title : '发货量日图',
				url : 'coustomB.do?method=ddrcordInfo' ,
				width : 680,
				height:500,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}],
				onClose:function(){
					dialog.dialog('destroy');
					$('#dg').datagrid('reload');
				}  
			}); 		
  	}
  	
  	//周图
  	function zhou(){
  		var row=$("#dg").datagrid('getSelections'); 				
	  			dialog = parent.jy.modalDialog({
				title : '发货量周图',
				url : 'coustomB.do?method=dayrcordInfo' ,
				width : 680,
				height:500,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}],
				onClose:function(){
					dialog.dialog('destroy');
					$('#dg').datagrid('reload');
				}  
			}); 		
  	}
  	
  	//月
  	function yue(){
  		var row=$("#dg").datagrid('getSelections'); 				
	  			dialog = parent.jy.modalDialog({
				title : '月图',
				url : 'coustomB.do?method=yuercordInfo' ,
				width : 680,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}],
				onClose:function(){
					dialog.dialog('destroy');
					$('#dg').datagrid('reload');
				} 
			}); 		
  	}
  	
  	//年
  	function nian(){
  		var row=$("#dg").datagrid('getSelections'); 				
	  			dialog = parent.jy.modalDialog({
				title : '发货量年图',
				url : 'coustomB.do?method=nianrcordInfo' ,
				width : 680,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}],
				onClose:function(){
					dialog.dialog('destroy');
					$('#dg').datagrid('reload');
				} 
			}); 		
  	}
  	
  	//修改
  	function updateUser(){
	 var myform=document.forms[1];
  	 myform.action="car_owner.do?method=updateCar_owner";
  	 myform.submit();
	
	}
  	
  	//导出
  		function putoutfile(){
		var allRows2 = $("#dg").datagrid("getColumnFields");
		
		var colName=[];
		var fieldName=[];
		var checkarray=[];
		 var array = $('#dg').datagrid("getSelections");
		if(array != ""){
	  		for(var i=0;i<array.length;i++){
	  			checkarray.push(array[i].shiping_order_id);			
	  			}
  			}
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="pay_type"&&col.field!="send_type"&&col.field!="transport_mode"
			&&col.field!="creat_type"&&col.field!="agreement_types"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		 $("#checkarray").val(checkarray.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}

	//重置
	function reset(){
		$("#startDate").val("");
		$("#endDate").val("");
		$("#ddId").val("");
		$("#endDate1").val("");
		$("#fhname").val("");
		$("#city1").val("");
		$("#startDate1").val("");
		$("#pay_type").combobox("setValue","");
		//$("#pay_type").combobox("setValue","");		
	}

  </script>
  <body class="easyui-layout">
  	<form action="coustomB.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false"  height="60px" collapsible="false"  >
    	<lable >制单日期:</lable>
			<input  id="startDate1"  class="Wdate" name="start_date1" readonly="readonly" style="width:140px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate1"  class="Wdate"  name="end_date1"  readonly="readonly" style="width:140px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />		 	  		
	    <lable class="divlabel">发货客户:</lable>
	    	 <input type="text" class="search-text" id="fhname" name="fhname" style="width:140px"  >
	    	 	<lable>发货区域:</lable>
	    	 	 <input type="text" class="search-text" id="city1" name="city1"  style="width:140px"  >	    	
	    	 	 
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)"  state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">	  
	    	 <lable >运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  name="ddId"  style="width:140px"  > 	   	 
	    	 <lable >付款方式:</lable>
				<select class="easyui-combobox" id="pay_type" name="pay_type"
					style="width:150px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
					<option id="" value="4">发货方月结</option>
					<option id="" value="5">收货方月结</option>
				</select>
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
				<lable>签收日期:</lable>
			<input  id="startDate"  name="start_date"  class="Wdate"  readonly="readonly" style="width:140px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  name="end_date"  class="Wdate"  readonly="readonly" style="width:140px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />    	
				</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
   		 <!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"   onclick="putoutfile()">导出</a>  
   		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"   onclick="day()">日图</a>
   		      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"   onclick="zhou()">周图</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="yue()">月图</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true"   onclick="nian()">年图</a>
		   	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick="reset()">重置</a>
		 --></div>	
		<input type="hidden" name="method" value="outCoustomBaob">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		<input type="hidden" id="checkarray" name="checkarray">
		</form>
  </body>
</html>