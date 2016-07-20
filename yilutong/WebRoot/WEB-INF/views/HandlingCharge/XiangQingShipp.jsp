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
    <title>专线公司结算</title>
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
   <% 	String dd = (String) request.getAttribute("sl.getWrite_id()"); 
        String pid = (String) request.getAttribute("flg");
   %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
 		var id = '<%=pid%>';
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'Handling.do?method=getJyShenHeJiLu&pid='+id,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  		    rowStyler : function(index, row) {
  		    //未结算未审核
				if (row.destination_stata==0) {
				
					return 'color:blue;';
				};
			 	if (row.des_sh_stata==0&&row.destination_stata!=0) {
					return 'color:rgb(221, 14, 211);';
				}; 
				 if (row.des_sh_stata==1) {
					return 'color:red;';
				}; 
			}, 
  			columns : [[
  				{field : 'ck',checkbox : true},
 /*  				{field : 'shipping_orde',title : '记录详情',width : 80,align:'center',sortable:'true',
  				formatter:function(val,row,index){
  				return '<a href="javascript:void(0)" onclick="CheckManager(\'' + row.shiping_order_id+ '\')">查看详细信息</a>  ';
  				} 
  				},*/
  				{field : 'settlements_id',checkbox : true},
  				{field : 'settl_times',title : '操作时间',width : 140,align:'center',
  				formatter: function(value,row,index){
		  				if(value!=undefined){
		  				value=value.substr(0,19);
		  				}
		  					return value;
		  				} 				 
  				},
  				{field : 'shiping_order_num',title : '运单号',width : 80,align:'center'},  				
  				{field : 'allmoney',title : '应收金额',width : 80,align:'center'},
  				{field : 'settl_money',title : '实收金额',width : 80,align:'center'},
  				{field : 'over_money',title : '差额',width : 80,align:'center'},
  				{field : 'settl_type',title : '结算方式',width : 90,align:'center',
  					formatter: function(value,row,index){
		  				if(value==1){
		  				return '现金';
		  				}else if(value==2){
		  				return '刷卡';
		  				}else if(value==3){
		  				return '支票'; 
		  				}else if(value==4){
		  				return '其他'; 
		  				}	  				
		  			} 	
  				},
  				{field : 'settl_zpnum',title : '支票编号',width : 80,align:'center'},
  				{field : 'settl_khbank',title : '开户行',width : 80,align:'center'},
  				{field : 'settl_username',title : '开户人',width : 80,align:'center'},
  				{field : 'settl_kahao',title : '卡号',width : 80,align:'center'},  				
  				/* {field : 'settl_order',title : '结算类型',width : 90,align:'center',
  					formatter: function(value,row,index){
		  				if(value==0){
		  				return '应收';
		  				}else if(value==1){
		  				return '应付';
		  				}
		  			} 	
  				}, */
  				
  				{field : 'usernamecz',title : '操作人',width : 80,align:'center'},//方位（m³）
  				{field : 'settl_notes',title : '备注信息',width : 140,align:'center'},	
  			]],onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },  
		    onAfterEdit:function(index,row){//编辑关闭后
		    $('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'collect.do?method=updateShippiOrCo',
           				data :  row
           				,
            			success: function (data) {
            			//console.log(data);
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
    				if(editval!=rowIndex&&rowData.customs_recheck_state!=2){
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

  		    jiesuantimes:$.trim($("#jiesuantimes").val()),
	 	 	jiesuantime:$.trim($("#jiesuantime").val()),

	 	});	  
	 	
  	}
     //详细信息
    function CheckManager(pid){
        dialog = parent.jy.modalDialog({
			title : '费用结算',
			url : 'Destination.do?method=getShippingXiangQing&pid='+pid,
			width : 1200,
			heght: 700,				
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
  </script>
  <body class="easyui-layout">
  <form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false" collapsible="false">
    		 <label class="divlabel">结算日期:</label> 
	    	 <input id="jiesuantime"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	 <input  id="jiesuantimes"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
			
	    	 <!-- <lable class="divlabel">发车日期:</lable>
	    	 <input  id="send_time"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	 <input  id="send_times"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 <lable class="divlabel">运单编号:</lable>
	    	 <input type="text" id="shipindi" class="search-text" style="width:150px;height:22px;"/>
			<label class="divlabel">是否结算:</label>
			    <select id='write_off3'  name="write_off3"  style="width:50px;height:22px">
				    <option>全部</option>
				    <option  value="0">未结算</option>
				    <option  value="1">现金</option>
					<option  value="2">转账</option>
					
				    
				</select>
 -->	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	         <!-- <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
			 
	    	 <label class="divlabel">是否审核:</label>
					<select id='shenhe'  name="shenhe"  style="width:50px;height:22px">
							<option>全部</option>
							<option  value="0">未审核</option>
							<option  value="1">审核中 </option>
							<option  value="2">审核通过</option>
							<option  value="3">审核未通过</option>
			
					</select> -->

			<!--  <label class="divlabel">制单日期:</label> 
	    	 <input  id="order_time"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	 <input  id="order_times"  class="Wdate"   style="width:150px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" /> -->
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<!--<div id="tb">
    		<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="bianji()">编辑</a>
   	<a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">结算</a>
   	 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消结算</a>
   	
   	<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="settlementSh()">提审</a>
  	 		<div title='可结算' style='height: 16px;background:blue;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 1%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>可结算</span></div>
		<div title='未审核' style='height: 16px;background:rgb(221, 14, 211);-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>未审核</span></div>
		    <div title='审核中' style='height: 16px;background:red;-moz-border-radius: 8px;-webkit-border-radius: 8px; border-radius: 8px;  margin: 0 auto;    float: right;
		    	margin: 5 0%;color: white;
		    padding-left: 10px;
		    padding-right: 10px; '><span>审核中</span></div>
		</div>	 -->
		</form>	
  </body>
</html>