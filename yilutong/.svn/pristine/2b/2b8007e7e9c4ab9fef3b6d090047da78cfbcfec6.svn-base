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
    <title>运单信息管理</title>
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
  <% 	String flg = (String) request.getAttribute("carno"); %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var editval;
 		var carno='<%=flg%>';
  		$(function(){
  	   
  			grid=$("#dg").datagrid({
  			url : 'map.do?method=getShipOrder&carno='+carno,
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
  			rowStyler:function(index,row){
		    	if (row.stocks_predestination>=2){
			        return 'color:blue;';
			    }
		    },
  			columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'send_time',title : '发车时间',width : 120,align:'center',sortable:'true',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'weituo_time',title : '委托时间',width : 70,align:'center',sortable:'true'},
   				{field : 'weitoudanhao',title : '委托单号',width : 70,align:'center',sortable:'true'},
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'},
  				{field : 'fhdanweiname',title : '发货单位名称',width : 70,align:'center',sortable:'true'},
  				{field : 'send_station',title : '发站',width : 100,align:'center'},
  				{field : 'custom_name',title : '发货客户名称',width : 80,align:'center'},
  				{field : 'send_phone',title : '发货人电话',width : 80,align:'center',sortable:'true'},
   				{field : 'send_shouji',title : '发货人手机',width : 70,align:'center',sortable:'true'},
   				{field : 'fahuo_address',title : '发货详细地址',width : 70,align:'center',sortable:'true'},

  				{field : 'shdanweiname',title : '收货单位名称',width : 70,align:'center',sortable:'true'},
  				{field : 'end_address',title : '到站',width : 55,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '收货人电话',width : 80,align:'center'},
  				{field : 'receipt_phone',title : '收货人手机',width : 80,align:'center'},
   				{field : 'receipt_address',title : '送货详细地址',width : 100,align:'center'},			
  				{field : 'send_type',title : '交接方式',width : 70,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "自提";
  						}else if(val==1){
  						return "送货";
  						}
  					}
  				},
  			    {field : 'goods_name',title : '品名',width : 60,align:'center'},
  				{field : 'goods_packing',title : '包装',width : 60,align:'center'},
  				{field : 'goods_num',title : '件数',width : 60,align:'center'},
  				{field : 'goods_weight',title : '重量',width : 60,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center'},
    			{field : 'freight_fee',title : '运费',width : 80,align:'center',sortable:'true'},
  				{field : 'picking_fee',title : '提货费',width : 80,align:'center',sortable:'true'},
  				
  				{field : 'affirm_value',title : '投保价值',width : 70,align:'center',sortable:'true'},
  				{field : 'rates',title : '费率',width : 70,align:'center',sortable:'true'},
  				{field : 'insurance_fee',title : '保价费',width : 80,align:'center',sortable:'true'},
  				{field : 'adorn_fee',title : '其他费',width : 80,align:'center',sortable:'true'},
  				{field : 'receivable_ground_fee', title : '装卸费', width : 80,align :'center',sortable:'true'},
  				{field : 'upstairs_fee',title : '上楼费', width : 80,align :'center',sortable:'true'},
  				{field : 'deliver_fee',title : '直送费', width : 80,align :'center',sortable:'true'},
  				{field : 'inspect_fee',title : '开箱验货费', width : 80,align :'center',sortable:'true'},
  				{field : 'seized_fee',title : '理货费', width : 80,align :'center',sortable:'true'},
  				{field : 'destination_fee',title : '代收运费',width : 80,align:'center',sortable:'true'},
  				{field : 'transport_pay',title : '费用总额',width : 70,align:'center' ,sortable: true},
   				{field : 'back_fee',title : '返款',width : 70,align:'center',sortable:'true'}, 		
   				//{field : 'duty_rate',title : '税率',width : 70,align:'center',sortable:'true'},
   				{field : 'fankuan_stata',title : '付款方式',width : 70,align:'center',sortable:'true',
   				    formatter:function(val,row,index){
   				        if(val==0){
  							return "现返";
  						}else if(val==1){
  							return "欠返";
  						}
   				    }
   				},
  				{field : 'trade_agency',title : '代收货款',width : 70,align:'center'},
                {field : 'shouxu_feelv',title : '费率',width : 70,align:'center',sortable:'true'},   				
   				{field : 'handling_charge',title : '手续费',width : 70,align:'center',sortable:'true'},
   				{field : 'daohuo_time',title : '到货时间',width : 70,align:'center',sortable:'true'},
   				{field : 'trade_agency_stata',title : '付款方式',width : 70,align:'center',sortable:'true',
   				    formatter:function(val,row,index){
   				        if(val==0){
  							return "现付";
  						}else if(val==1){
  							return "到付";
  						}
   				    }
   				},
   				{field : 'konghuo',title : '控货 ',align:'center',sortable:'true',
   				    formatter:function(val,row,index){
   				        if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						}
   				    }
   				},		
  				{field : 'most_urgent',title : '急货',width : 70,align:'center',sortable:'true',
  				    formatter:function(val,row,index){
  				           if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						} 
  				    }
  				},	
  				{field : 'printed',title : '运单打运',width : 70,align:'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "机打标签";
  						}else if(val==1){
  							return "机打运单";
  						}else if(val==2){
  						return "机打标签,机打运单";
  						}
  			    }
  				},	
  				
  	
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
  			{field : 'shipping_order_state',title : '运单状态',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "未出库";
  						}else if(val==1){
  							return "配送中";
  						}else if(val==2){
  						return "转运中";
  						}else if(val==3){
  						return "到达";
  						}else if(val==4){
  						return "签收";
  						}
  					}	
  				}, 
  				{field : 'is_recept_no',title : '要回单',width : 70,align:'center',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						}
  				    }
  				} ,
  				{field : 'is_recept',title : '回单份数',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "";
  						}else{
  						return val;
  						}
  					}
  				
  				},
  				{field : 'remarks',title : '备注',width : 90,align:'center',sortable:'true'},
  				{field : 'stocks_predestination',title : '库存天数', width : 80,align :'center',sortable:'true'},
  		/* 		{field : 'transport_mode',title : '运输方式', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "普快";
  						}else if(val==1){
  						
  						return "特快";
  						}
  					}
  				}, */
  				
  				/* {field : 'shiping_check',title : '运单核对状态', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "未核对";
  						}else if(val==1){
  						
  						return "已核对";
  						}
  					}
  				}, */
  				{field : 'invoice_state',title : '是否开票', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "是";
  						}else if(val==1){
  						
  						return "否";
  						}
  					}
  				},
               {field : 'phone_state',title : '电话预约', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  						
  						return "是";
  						}
  					}
  				},  								
  				{field : 'is_order_arrive',title : '是否实际到达',width : 90,align:'center',sortable:'true',
  					formatter: function(value,row,index){
  						if(value==0){
  							return "未到达";
  						}else if(value==1){
  							return "到达";
  						}
  					
  					}
  				
  				},
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
							return "pc手录";
						}
  					}
  				},
  				{field : 'is_order_arrive',title : '到达状态', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未到达";
  						}else if(val==1){
  						
  						return "到达";
  						}
  					}
  				},
  				{field : 'remarks_fee',title : '应收备注',width : 90,align:'center',sortable:'true'},
  				{field : 'appointment_remarks',title : '配送备注',width : 90,align:'center',sortable:'true'},
   				{field : 'order_time',title : '录入时间',width : 80,align:'center',sortable:'true'},
   				{field : 'time_appointment',title : '配送时间',width : 80,align:'center',sortable:'true'},
   				{field : 'order_arrive_time',title : '实际到达时间',width : 80,align:'center',sortable:'true'},
   				{field : 'shouliwangdian',title : '受理网店',width : 70,align:'center',sortable:'true'},	
  				{field : 'baozhuang_name',title : '包装人',width : 70,align:'center',sortable:'true'},	
  				{field : 'yewuyuan',title : '业务员',width : 70,align:'center',sortable:'true'}, 				 				 	
  				{field : 'shipping_order_name',title : '制单人',width : 80,align:'center',sortable:'true'},
  				
  			]],
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
		   

  			
  			pagination:true,//分页
		    pageSize:20,
		    pageList:[20,30,40,50]
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
			$('.easyui-layout').layout('panel', 'north').panel('resize',{height:150});
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
  	});
  		
  	//查询
  	function searchCar_owner(){
  		var startDate=document.getElementById("startDate").value;
  		var endDate=document.getElementById("endDate").value;
  		/* if($.trim($("#phone").select2("data"))!=""){
  		phone=$.trim($("#phone").select2("data").text);
  			} */
  		$("#dg").datagrid('load',{
  				start_date :startDate,
	 	 		end_date :endDate,
	 	 		name:$.trim($("#ddId").val()),
	 	 		phone_number:$.trim($("#perpole").val()),//发货人
	 	 		phone:$.trim($("#phone").val()),
	 	 		order_state:$.trim($("#order_state").combobox("getValue")),
	 	 		pay_type:$.trim($("#pay_type").combobox("getValue")),
	 	 		send_address:$.trim($("#send_address").val()),//发站
  				//institution:$.trim($("#cc3").combotree("getValue")),
  				type:$.trim($("#end_address").val()),//到站
  				weitoudanhao:$.trim($("#weitoudanhao").val())
	 	});	  
	 	
  	}
  	
 
  	function ow(owurl){ 
		var tmp=window.open("about:blank","","fullscreen=1");
		tmp.moveTo(0,0); 
		tmp.resizeTo(screen.width+20,screen.height); 
		tmp.focus(); 
		tmp.location=owurl;
    } 
  

	



  </script>
  <body class="easyui-layout">
  	<form action="shipOrder.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false"  height="60px" collapsible="false"  >
	    	<lable>发车日期:</lable>
			<input  id="startDate"  class="Wdate"  readonly="readonly" style="width:140px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="endDate"  class="Wdate"  readonly="readonly" style="width:140px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable class="divlabel">运单编号:</lable>
	    	 <input type="text" class="search-text" id="ddId"  style="width:120px"  >
	    	 <lable class="divlabel">委托单号:</lable>
	    	 <input type="text" class="search-text" id="weitoudanhao"  style="width:120px"  >
	    	 
	    	 	
	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	 <lable >运单状态:</lable>
				<select class="easyui-combobox" id="order_state" name="agreement_type"
					style="width:150px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">未出库</option>
					<option id="" value="1">配送中</option>
					<option id="" value="2">转运中</option>
					<option id="" value="4">签收</option>
				</select>
	    	 <lable >付款方式:</lable>
				<select class="easyui-combobox" id="pay_type" name="agreement_type"
					style="width:150px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
				</select>
	    	<lable class="divlabel">收货人:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="perpole" >
			<!--<lable>所属机构:</lable>
			<input id="cc3" name="did">-->
<!-- 			<lable class="divlabel">到站:</lable>
			<input type="text" class="search-text" id="end_address" >
			<lable class="divlabel">发站:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="send_adress" >
	    	<lable class="divlabel">电话:</lable>
	    	<input type="text"  class="search-text"style="width:150px"   id="phone" >
 -->			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
		 <form action="shipOrder.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipOrderPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form>
		 <div id="win" iconCls="icon-save" title="电话预约">  

    </div> 
  </body>
</html>