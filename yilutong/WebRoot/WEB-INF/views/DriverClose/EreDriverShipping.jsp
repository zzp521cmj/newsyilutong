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
    <title>司机审核详细信息</title>
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
	<!-- <script type="text/javascript" src="./js/function.js"></script>命名按钮方法  -->
	
  
  </head>
  <% 	String flg = (String) request.getAttribute("did"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
 		var pid='<%=flg%>';
  		$(function(){
  	    $('#win').window({    
	     inline : false,
	       
	       });
	    $('#win').window('close'); 
  			grid=$("#dg").datagrid({
  			url : 'DriverClose.do?method=getDriverShipping&did='+pid,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  			columns : [ [
			    {field : 'ck',checkbox : true},
			    {field : 'driver_name', title : '司机姓名',	width : 80,align : 'center'},
				{field : 'shiping_order_num', title : '运单编号',	width : 80,align : 'center'},
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
		/* 		{field : 'chayi_zhongzhuanfei',title : '付差异',width : 80,align : 'center',			
					formatter : function(val, row, index) {
						if (row.change_fee1 == null) {
							 return val;
						} else {
							 return parseFloat(parseFloat(row.change_fee1*1)-parseFloat(row.change_pay*1));
						}
					 }
				}, */
				
					  
			    {field : 'send_fee',title : '应付直送费', width : 80,align :'center',sortable:'true'},	//送货费
			    {field : 'payble_coolie', title : '应付装卸费', width : 80,align :'center',sortable:'true'},		
			    {field : 'pay_upstairs_fee',title : '应付上楼费', width : 80,align :'center',sortable:'true'},
			    {field : 'payble_other',title : '应付其他费',width : 80,	align : 'center', sortable:'true'},		
			    {field : 'pay_total_fee',title : '应付总和',width : 80,	align : 'center',sortable:'true'},	
			    {field : 'paid_deliver_fee',title : '实付直送费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_deliver_fee'
					}
				},
				},	
			    {field : 'paid_ground_fee',title : '实付装卸费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_ground_fee'
					}
				},
			    },	
			    {field : 'paid_upstairs_fee',title : '实付上楼费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_upstairs_fee'
					}
				},
			    },
			    {field : 'paid_adorn_fee',title : '实付其他费', width : 80,align :'center',sortable:'true',
			    editor : {
				    type : 'numberbox',
					options : {
						precision : 2,
						validType : 'paid_adorn_fee'
					}
				},
			    },		
			    {field : 'paid_total_fee',title : '实付总和', width : 80,align :'center',sortable:'true',
				    formatter : function(val, row, index) {
					return Number(Number(row.paid_adorn_fee)+Number(row.paid_deliver_fee)+Number(row.paid_ground_fee)+Number(row.paid_upstairs_fee)) ;
					}   
			    },
		
			    
			  	
			    
			    
			    
				{field : 'send_station',title : '发站',width : 80,align : 'center'},
				{field : 'end_address',title : '到达地',width : 80,align : 'center'},
				{field : 'receipt',title : '收货人',width : 80,align : 'center'},
				{field : 'goods_name',title : '品名',width : 80,align : 'center'},
				{field : 'goods_num',title : '件数',width : 80,align : 'center'},	
				{field : 'goods_weight',title : '重量',width : 80,align : 'center'},
	            {field : 'goods_vol',title : '体积',width : 80,align : 'center'},
				{field : 'create_time',title : '协议制作日期',width : 80,align : 'center'},
				{field : 'driver_close_stata',title : '结算状态',width : 80,align : 'center',
					formatter : function(val, row, index) {
						if (val == 0) {
							return "未审核";
						} else if (val == 1) {
							return "审核中";
						} else if (val == 2) {
							return "审核通过";
						} else if (val == 3) {
							return "审核未通过";
						}
					}
				}, 
			    {field : 'settlement_modes',title : '结算方式',width : 80,align : 'center',
					formatter : function(val, row, index) {
						if (val == 0) {
							return "现金";
						} else if (val == 1) {
							return "油卡";
						} else if (val == 3) {
							return "转账";
						} else if (val == 2) {
							return "未结算";
						} 
					}
				}, 
				{field : 'driv_sige_name',title : '开户名称',width : 80,align : 'center'},
				{field : 'driv_card',title : '银行卡号',width: 80,align : 'center'},
				{field : 'driv_bank',title : '开户行',width : 80,align : 'center'},
				{field : 'oil_card',title : '油卡号',width : 80,align : 'center'},				
				{field : 'oil_card_name',title : '姓名',width : 80,align : 'center'},
				//{field : 'driver_close_naem',title : '结算人',width : 80,align : 'center'},				
			    {field : 'driver_close_remarks',title : '结算备注', width : 80,align :'center',sortable:'true'},	
				
				
				{field : 'driver_close_time',title : '结算日期',width : 80,align : 'center'},
				{field : 'driver_close_naem',title : '结算人',width : 80,align : 'center'},
			] ],
  			onBeforeEdit:function(index,row){ //可编辑之前
				editval=index;
		        row.editing = true;
		    },
		    onAfterEdit:function(index,row){//编辑关闭后
		    	$('#dg').datagrid("endEdit",editval);
					$.ajax({
           			 type: "post",
          				url : 'shipOrder.do?method=updateShipOrder',
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
  	
		 
  	});
  		
  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
 
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    </form>
  </body>
</html>