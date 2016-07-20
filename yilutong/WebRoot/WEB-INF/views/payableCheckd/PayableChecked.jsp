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
  			url : 'payable.do?method=getPayableCheckd',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
/*   		    rowStyler : function(index, row) {
								if (row.write_off != 3) {
									return 'color:blue;';
								}
							}, */
			columns : [ [
						   {field : 'ck',checkbox : true},
						   {field : 'shipping_orde',title : '详细信息',width : 80,align:'center',sortable:'true',
						  				formatter:function(val,row,index){
						  				return '<a href="javascript:void(0)" onclick="CheckManager(\'' + row.company_id+ '\')">查看详细信息</a>  ';
						  	},
						  	},
						  	 {field : 'company_name',title : '中转公司',width : 80,align : 'center'},
						  	 {field : 'create_time',title : '协议制作日期',width : 80,align : 'center'},
						    {field : 'company_time',title : '中转日期',width : 80,align : 'center'},			
						  
							{field : 'shiping_order_num', title : '订单编号',	width : 80,align : 'center'},
							{field : 'send_type',	title : '交接方式',width : 80,align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "自提";
											} else if (val == 1) {
												return "送货";
											}
										}
							 },
									
							{field : 'pay_type',title : '付款方式',width : 80,align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "回付";
											} else if (val == 1) {
												return "提付";
											} else if (val == 2) {
												return "现付";
											} else if (val == 3) {
												return "货到前付";
											}
										}
									}, 
							//{field : 'change_fee',title : '应收中转费',width : 80,align : 'center'},
	                     	{field : 'paid_chayi',title : '实收中转费',width : 80,align : 'center',				
							    formatter : function(val, row, index) {
									if (val == null || val == "") {
										return row.paid;
									} else {
												return row.paid_chayi;
									}
								}
							},
							{field : 'tifu_chayi',title : '差异',width : 80,align : 'center',
										formatter : function(val, row, index) {
											if (row.paid_chayi == null || row.paid_chayi == "") {
												 return"0";
											} else {
												return Number(Number(row.paid_chayi*1)- Number(row.change_fee*1));
											}
										}
									},
							{field : 'change_pay',title : '应付中转费',width : 80,	align : 'center'},		
							{field : 'change_fee1',title : '实付中转费',width : 80,align : 'center',
										formatter : function(val, row, index) {
											if (val == null) {
												return row.change_fee;
											} else {
												return row.change_fee1;
											}
										}
							},
							 {field : 'chayi_zhongzhuanfei',title : '付差异',width : 80,align : 'center',			
									formatter : function(val, row, index) {
											if (row.change_fee1 == null) {
												return val;
											} else {
												return Number(Number(row.change_fee1*1)- Number(row.change_pay*1));
											}
										}
							},
						    {field : 'change_remarks',title : '中转备注',width : 120,align : 'center'},

						   
						   {field : 'change_other',title : '应付中转费其他费',width : 80,	align : 'center'},			
						   {field : 'send_station',title : '发站',width : 80,align : 'center'},
						   {field : 'end_address',title : '到达地',width : 80,align : 'center'},
						   {field : 'receipt',title : '收货人',width : 80,align : 'center'},
						   {field : 'goods_name',title : '品名',width : 80,align : 'center'},
						   {field : 'goods_num',title : '件数',width : 80,align : 'center'},	
						   {field : 'goods_weight',title : '重量',width : 80,align : 'center'},
	                	   {field : 'goods_vol',title : '体积',width : 80,align : 'center'},
						  
						   	
					
									
						  {field : 'close_recheck_state',title : '审核状态',width : 80,align : 'center',
						  formatter : function(val, row, index){
						      if (val == 0) {
							      return "未审核";
							  } else if (val == 1) {
								  return "审核完毕";
							  } else if (val == 3) {
								  return "审核中";
							  } else if (val == 2) {
								return "审核不通过";
							}
						  },
						  }, 
						  {field : 'fee_remarks',title : '应付中转费核销备注',width : 80,align : 'center'}, 
						  {field : 'write_off',title : '核销方式',width : 80,align : 'center',
										formatter : function(val, row, index) {
											if (val == 0) {
												return "打卡";
											} else if (val == 1) {
												return "现金";
											} else if (val == 3) {
												return "未核销";
											}
										}
									}, 
						 {field : 'fee_date',title : '核销日期',width : 80,align : 'center'},
						 {field : 'people_zhong',title : '核销人',width : 80,align : 'center'},
							] ],onBeforeEdit:function(index,row){ //可编辑之前
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
  		function modify(){
		  var array=$("#dg").datagrid('getSelections');
  			var id = [];
  			var shpid = [];
  			var i;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].company_id); //注意修改你的id列 
			//shpid.push(array[i].shiping_order_id);
			var shp= shpid.join(",");
		/* 	if (array[i].company_id !=0) {
				a = true;
			} */
		}	
		if (id.length==1) {
			if (id != "") {
	  			dialog = parent.jy.modalDialog({
				title : '费用结算',
				url : 'payable.do?method=redirectPage&id=' + id.join(","),				
				width : 600,
				height:300,
				buttons : [{
					text : '<input type="button" class="btncss" value="结算"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				},   {
					text : '<input type="button" class="btncss" value="驳回" style="margin-left: 10px;"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormReject(dialog, grid, parent.$);
					}
				},
				],
				
			});
  		}
  		}else{
  			$.messager.alert("客户结算"," 请选择正确的信息","info");
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
 	function del() {
		var array = $("#dg").datagrid('getSelections');
		var id = [];
		var a = false;
		for ( var i = 0; i < array.length; i++) {
			id.push(array[i].custom_id); //注意修改你的id列 
		alert(array[i].custom_id);
			if (array[i].write_off3 != 3) {
				a = true;
			}
		}
			if (a== true) {
							$.messager.confirm('确认', '您确定要取消结算吗？', function(r) {
					if (r) {
						$.ajax({
							//url : 'collect.do?method=editKuhu&pid=' + id,
							type : "POST",
							data : {
								id:id.join(",")
							},
							success : function(data) {
								if (data.flag == false) {
									parent.$.messager.alert("", "取消结算成功！",
											'info', function(r) {
												$('#dg').datagrid('reload');
											});
								}
							}
						});
					}
				});
			} else {
				$.messager.alert('取消核销', ' 请选择正确的信息', 'info');
			}

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
				url : 'createA.do?method=getShippingCollect&pid='+pid,
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
	    	 <input  id="kuhu_date"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	  <input  id="kuhu_dates"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	  <lable class="divlabel">发车日期:</lable>
	    	 <input  id="send_time"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	  <input  id="send_times"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	  <lable class="divlabel">到车日期:</lable>
	    	 <input  id="receipt_time"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 -
	    	  <input  id="receipt_times"  class="Wdate"   style="width:50px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd '})" />
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	        <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
				<td>核销:</td>
					<td ><select id='write_off3'  name="write_off3"  style="width:50px;height:22px">
							<option> </option>
							<option  value="0">打卡</option>
							<option  value="1">现金</option>
							<option  value="3">未核销</option>
					</select></td> 
					<lable class="divlabel">车牌号:</lable>
	    	 <input type="text" class="search-text" id="car_number"  style="width:100px"  >
	    	 <lable class="divlabel">司机姓名:</lable>
	    	 <input type="text" class="search-text" id="driver_name"  style="width:100px"  >
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="汇总信息" ></table>
    	</div>
    	<div id="tb">
   	    <a href="javascript:void(0)" class="easyui-linkbutton"  data-options="iconCls:'icon-edit',plain:true"onclick="modify()">结算审核</a>
<!--       	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="del()">取消结算审核</a>
 --><!--      	<a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" onclick="del()">审核驳回</a>
 -->		</div>	
		</form>	
  </body>
</html>