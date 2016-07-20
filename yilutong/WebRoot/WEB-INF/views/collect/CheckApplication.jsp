<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String change_fee1 = request.getParameter("change_fee1");
%>
<%
	String realPath1 = "http://" + request.getServerName() + ":" + request.getServerPort() +"/surmax/"; 
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>专线公司结算审核</title>
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
   <% 	String dd = (String) request.getAttribute("sl.getWrite_id()"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'collect.do?method=getCheckCollect',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  /* 			rowStyler : function(index, row) {
				if (row.write_off3!=3) {
				
					return 'color:blue;';
				}
			}, */
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'shipping_orde',title : '详细信息',width : 80,align:'center',sortable:'true',
  				formatter:function(val,row,index){
  				return '<a href="javascript:void(0)" onclick="CheckManager(\'' + row.customer_id+ '\')">查看详细信息</a>  ';
  				}
  				},
  				{field : 'custom_name',title : '客户名称',width :80,align:'center'},
  				//{field : 'car_time',title : '客户发车车次',width : 80,align:'center'},
  				{field : 'destination_fee',title : '应收到付款',width : 80,align:'center'},
  				//{field : 'paid_fee',title : '实收到付款',width : 80,align:'center'},
  			    
  			    {field : 'pay_destination_fee',title : '应付到付款',width : 80,align:'center'},
  			    {field : 'difference',title : '到付款差异',width : 80,align:'center',	formatter:function(val,row,index){
	           		   
	              	return Number(Number(row.destination_fee*1)-Number(row.pay_destination_fee*1));
	           		   
  					}},
  			{field : 'trade_agency',title : '应收代收款',width : 80,align:'center'},
  			{field : 'pay_trade_agency',title : '应付代收款',width : 80,align:'center'},
  			{field : 'difference',title : '代收款差异',width : 80,align:'center',	formatter:function(val,row,index){
	           		   
	              	return Number(Number(row.trade_agency*1)-Number(row.pay_trade_agency*1));
	           		   
  					}},
  			{field : 'close_recheck_state',title : '结算状态',width : 80,align:'center',
  			formatter:function(val,row,index){
  				if(val==0 ){
  						return "未审核";
  						}else if(val==1){
  						return "审核完毕";
  						}else if(val==2){
  						return "审核未通过";
  						}
  					}	 
  			},
  			/* {field : 'close_recheck_state',title : '结算状态',width : 80,align:'center',
  			formatter:function(val,row,index){
  				if(val==0 ){
  						return "未审核";
  						}else if(val==1){
  						return "审核完毕";
  						}else if(val==2){
  						return "审核未通过";
  						}
  					}	 
  			}, */
  			
  			{field : 'close_recheck_time',title : '审核日期',width : 80,align:'center'},
  			{field : 'close_recheck_name',title : '审核人',width : 80,align:'center'},
  			]],onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },  
		    onAfterEdit:function(index,row){//编辑关闭后
		    	$('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'collect.do?method=updateShippingOrder',
           				data :  row,
            			success: function (data) {
                		// Play with returned data in JSON format
            },
            error: function (msg) {
                            }
        });
  				/* $('#dg').datagrid("updateRow", {index:index,row:{gain_total:price}}); */
		        row.editing = false;  
		    },
		    //双击事件
            onDblClickRow: function (rowIndex,rowData) {
                //双击开启编辑行
    				if(editval!=rowIndex){
    					$('#dg').datagrid("endEdit", editval);
    					$('#dg').datagrid("beginEdit", rowIndex);
	                	editval=rowIndex;
    				}else{
    					editval=undefined;
    					$('#dg').datagrid("endEdit", rowIndex);
    				}
                	
            },
  			 onLoadSuccess:function(){
  			/*  $('#dg').datagrid('appendRow', {
                Saler: '<span class="subtotal">合计</span>',
                TotalOrderCount: '<span class="subtotal">' + compute("TotalOrderCount") + '</span>',
                TotalOrderMoney: '<span class="subtotal">' + compute("TotalOrderMoney") + '</span>',
                TotalOrderScore: '<span class="subtotal">' + compute("TotalOrderScore") + '</span>',
                TotalTrailCount: '<span class="subtotal">' + compute("TotalTrailCount") + '</span>',
                Rate: '<span class="subtotal">' + ((compute("TotalOrderScore") / compute("TotalTrailCount")) * 100).toFixed(2) + '</span>'
            });
            	 compute(); */
            },
  				
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb'
  		});
  		
  		
  		
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
			$("#address").val("");
		} else {
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
			$('.easyui-layout').layout('resize');
			btnMoreSearch.text("更多条件");
			btnMoreSearch.attr("state", "close");
			$("#searchInfoId").css("display","none");
		}
         });
  	
  	});
  	   //审核
  	
  		function modify(){
		  var array=$("#dg").datagrid('getSelections');
  			var id = [];
  			var shpid = [];
  			var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].customer_id); //注意修改你的id列 
			shpid.push(array[i].customer_id);
			var shp= shpid.join(",");
			if (array[i].close_recheck_state != 5) {
				a = true;
			}
		}	
		if (a == true) {
			if (id != "") {
	  			dialog = parent.jy.modalDialog({
				title : '费用结算',
				url : 'collect.do?method=redirectPage&id=' + id.join(","),
				data : {
				
				},
				width : 600,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="结算"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEditCheck(dialog, grid, parent.$);
					}
				},   {
					text : '<input type="button" class="btncss" value="驳回" style="margin-left: 10px;"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				},
				],
				
			});
  		}
  		}else{
  			$.messager.alert("费用结算"," 请选择正确的信息","info");
  		}	
  	}
  function compute(colName) {
            var rows = $('#dg').datagrid('getRows');
            var total = 0;
            for (var i = 0; i < rows.length; i++) {
                total += parseFloat(rows[i][colName]);
            }
            return total;
        }
  		//查询
  	function searchCar_owner(){
  		$("#dg").datagrid('load',{
  				
	 	 		custom_name:$.trim($("#custom_name").val()),
	 	 		car_time:$.trim($("#car_time").val()),
	 	 		kuhu_date:$.trim($("#kuhu_date").val()),
	 	 		write_off3:$.trim($("#write_off3").val()),
	 	 		send_time:$.trim($("#send_time").val()),
	 	 		receipt_time:$.trim($("#receipt_time").val()),
	 	 		car_number:$.trim($("#car_number").val()),
	 	 		driver_name:$.trim($("#driver_name").val()),
	 	 		kuhu_dates:$.trim($("#kuhu_dates").val()),
	 	 		send_times:$.trim($("#send_times").val()),
	 	 		receipt_times:$.trim($("#receipt_times").val()),
	 	 		
	 	});	  
	 	
  	}

  //重置
	function reset() {
		$("#custom_name").val("");
		$("#car_time").val("");
		$("#kuhu_date").val("");
		$("#write_off3").val("");
		$("#send_time").val("");
		$("#receipt_time").val("");
		$("#car_number").val("");
		$("#driver_name").val("");
		$("#kuhu_dates").val("");
		$("#send_times").val("");
		$("#receipt_times").val("");
	}
 
        document.onkeydown = function(event) {
  				e = event ? event : (window.event ? window.event : null);
  				if (e.keyCode == 13) {
  					//执行的方法 
  					searchCar_owner();
  				}
  			};	
  			//详细信息
  		function CheckManager(pid){
        	dialog = parent.jy.modalDialog({
				title : '费用结算',
				url : 'collect.do?method=getShippingCollect&pid='+pid,
				width : 1200,
				heght: 700,
				
		});
        }	
  

  </script>
  <body class="easyui-layout">
  <form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false"  >
	    	<lable class="divlabel">客户名称:</lable>
	    	 <input type="text" class="search-text" id="custom_name"  style="width:100px"  >
	    	 <lable class="divlabel">客户发车发次:</lable>
	    	 <input type="text" class="search-text" id="car_time"  style="width:100px"  >
	    	 <lable class="divlabel">结算日期:</lable>
	    	 <input  id="kuhu_date"  class="Wdate"   style="width:90px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	  <input  id="kuhu_dates"  class="Wdate"   style="width:90px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />

	    	  
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	        <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
			<lable class="divlabel">发车日期:</lable>
	    	 <input  id="send_time"  class="Wdate"   style="width:90px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
			<input  id="send_times"  class="Wdate"   style="width:90px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	  <lable class="divlabel">到车日期:</lable>
	    	 <input  id="receipt_time"  class="Wdate"   style="width:90px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	  <input  id="receipt_times"  class="Wdate"   style="width:90px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
				<td>结算:</td>
					<td ><select id='write_off3'  name="write_off3"  style="width:50px;height:22px">
							<option> </option>
							<option  value="0">打卡</option>
							<option  value="1">现金</option>
							<option  value="3">未结算</option>
					</select></td> 
					<!-- <lable class="divlabel">车牌号:</lable>
	    	 <input type="text" class="search-text" id="car_number"  style="width:100px"  >
	    	 <lable class="divlabel">司机姓名:</lable>
	    	 <input type="text" class="search-text" id="driver_name"  style="width:100px"  > -->
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
   	    <a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">审核</a>
<!--       	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消结算审核</a>
 --><!--      	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="del()">审核驳回</a>
 -->		</div>	
		</form>	
  </body>
</html>