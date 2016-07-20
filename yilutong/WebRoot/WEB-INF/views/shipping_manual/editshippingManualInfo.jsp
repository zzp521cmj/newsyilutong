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
    <title>手录运单信息管理</title>
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
	<script type="text/javascript" src="./js/function.js"></script>
	
  
  </head>
     <%
  String function="";
   if(request.getAttribute("function")!=null){
   		function=request.getAttribute("function").toString();
   }
   %>
  <script type="text/javascript">
	  	var dialog;
 		var grid;
 		var functions='<%=function%>';	
  		$(function(){
  		//reset();
  			grid=$("#dg").datagrid({
  			//url : 'shipManual.do?method=getShipManual',
  			border : false,
  			rownumbers : true,
  			fit : true,
  			/* sortName:'transport_pay,check_time,shipping_order',
  			sortOrder:'desc', */
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			multiSort:true,
  			rowStyler:function(index,row){
		    	if (row.stocks_predestination>=2){
			        return 'color:blue;';
			    }
		    },
  		/* 	remoteSort:true, */
  			columns : [[
  				{field : 'ck',checkbox : true},
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
  			    {field : 'goods_name',title : '品名',width : 60,align:'center'},
  				{field : 'goods_packing',title : '包装',width : 60,align:'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "纸箱";
  						}else if(val==1){
  							return "编织袋";
  						}else if(val==2){
  						return "木箱";
  						}else if(val==3){
  						return "无";
  						}
  					}
  				},
  				{field : 'goods_num',title : '件数',width : 60,align:'center'},
  				{field : 'goods_weight',title : '重量',width : 60,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center'},
  				{field : 'destination_fee',title : '代收运费',width : 80,align:'center',sortable:'true'},
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
  				{field : 'transport_pay',title : '费用总额',width : 70,align:'center' ,sortable: true},
  				{field : 'gatheringhj',title : '收款合计',width : 70,align:'center' ,sortable: true},
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
  			pagination:true,//分页
		    pageSize:10,
		    pageList:[5,10,15,20],
  			toolbar : '#tb',
  			onDblClickRow:function(index,row){
  				dbmodify(row);
  			}

  		});
  		var fs=functions.split(",");
	for ( var i = 0; i < fs.length; i++) {
				if (fs[i] == "运费") {
					grid.datagrid('showColumn','freight_fee');
					grid.datagrid('showColumn','transport_pay');
				}else{
					grid.datagrid('hideColumn','freight_fee');
					grid.datagrid('hideColumn','transport_pay');
				
				}
		
	}
  		//回车查询
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
				   url: "shipManual.do?method=getPhoneLength",
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
  		var start_time=document.getElementById("start_time").value;
  		var end_time=document.getElementById("end_time").value;	
  		var flag=false;
 		$("input[yz=text]").each(function(){
			if($.trim($(this).val())!='') {
				flag=true;
			}
		});
		if($("#order_state").combobox("getText")!=''){
			flag=true;
		}else if($("#pay_type").combobox("getText")!=''){
			flag=true;
		}
		else if($("#send_type").combobox("getText")!=''){
			flag=true;
		}
		if(flag){
	  		$("#dg").datagrid({
	  			url : 'shipManual.do?method=editgetShipManual',
	  			queryParams:{ 
	  			start_time:start_time,
	  			end_time:end_time,
	  			num:$.trim($("#ddId").val()),//运单号
	  			send_station:$.trim($("#send_station").val()),//发站
	  			end_address:$.trim($("#end_address").val()),//到站
	  			custom_name:$.trim($("#custom_name").val()),//发货人
	  			receipt:$.trim($("#receipt").val()),//收货人
	  			pay_type:$.trim($("#pay_type").combobox("getValue")),//付款方式
	  			order_state:$.trim($("#order_state").combobox("getValue")),//运单状况
	  			send_type:$.trim($("#send_type").combobox("getValue")),//交接方式
	  			goods_name:$.trim($("#goods_name").val()),
	  			weitoudanhao:$.trim($("#weitoudanhao").val())}
		 	});	  
	 	}else{
	 		$.messager.alert("查询条件","请选择查询条件进行查询","info");
	 		
	 	}
  	}
  		//货物到达接收
  	function isArrive(orderId){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
	  		/*  if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  				$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
	  			} */
	  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要处理选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "shipManual.do?method=isArrive",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单信息","运单信息到达 ",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	}
  	
  	//货物到达取消
  	function isNotArrive(){
  		var checkarray=[];
	 	var array = $('#dg').datagrid('getSelections');
  		for(var i=0;i<array.length;i++){
  			checkarray.push(array[i].shiping_order_id);
	  		/*  if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  				$.messager.confirm('提示','您选中的运单号'+array[i].shiping_order_num+'不能执行删除！')
	  			} */
	  		}
  		if(array != ""){
  			$.messager.confirm('确认','您确定要取消到达选中的记录吗？',function(r){ 
    			if (r){ 
    				$.ajax({
						url: "shipOrder.do?method=isNotArrive",
						type: "POST",
						data:{del:checkarray.join(",")},
			  				success:function(data){
			  					if (data.flag) {
									parent.$.messager.alert("运单信息","运单信息取消到达",'info',
										function(r) {
											$('#dg').datagrid('reload');
 										});
  								} 
  						}
					});
				}  			
  			});
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	}  
  	
  	
  	//删除
  	function deleteEver(){
  		var checkarray=[];
  		var num=0;
	 	var array = $('#dg').datagrid('getSelections');
	 	if(array!=""){
	 		for(var i=0;i<array.length;i++){
  			//checkarray.push(array[i].shiping_order_id);
	  		 if(array[i].shipping_order_state==0){
	  			checkarray.push(array[i].shiping_order_id);
	  			}else{
	  					num++;
	  			}
	  		}
	  		 if(num>0){
	  				$.messager.alert('提示','您选中的运单有'+num+'个已经制作协议不能执行删除！','info',function(r){
											  	if(checkarray.length>0){
										  			$.messager.confirm('确认','您确定要删除选中未做协议的记录吗？',function(r){ 
										    			if (r){ 
										    				$.ajax({
																url: "shipManual.do?method=deleteShipManual",
																type: "POST",
																data:{del:checkarray.join(",")},
													  				success:function(data){
													  					if (data.flag) {
																			parent.$.messager.alert("运单信息删除","运单信息删除成功",'info',
																				function(r) {
																					$('#dg').datagrid('reload');
										 										});
										  								} 
										  						}
															});
														}  			
										  			});				  		
										  		}					  								
	  										});	  	
	  										num=0;
	  								}else{
	  										 	if(checkarray.length>0){
										  			$.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){ 
										    			if (r){ 
										    				$.ajax({
																url: "shipManual.do?method=deleteShipManual",
																type: "POST",
																data:{del:checkarray.join(",")},
													  				success:function(data){
													  					if (data.flag) {
																			parent.$.messager.alert("运单信息删除","运单信息删除成功",'info',
																				function(r) {
																					$('#dg').datagrid('reload');
										 										});
										  								} 
										  						}
															});
														}  			
										  			});	  		
										  		}					
	  										}		  				
	 	
	 	}else{
  			$.messager.alert("运单录入","请选择一行信息","info");
  		}	
  	}
  	
  	/*
  	修改查询 
  	*/
  	function modify(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){		
	  				var id=row[i].shiping_order_id;
					  		dialog = parent.jy.modalDialog({
								title : '运单修改',
								url : 'shipManual.do?method=getEditShipManualPage&pid=' + id,
								/* width : 680, */
								fit : true,
								id : "company",
								buttons : [{
									text : '<input type="button" class="btncss" value="修改"/>',
									handler : function() {
										dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
									}
								}] 
							});
		  		}		
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
  	}
  	function dbmodify(row){
	  				var id=row.shiping_order_id;
					  		dialog = parent.jy.modalDialog({
								title : '运单修改',
								url : 'shipManual.do?method=getEditShipManualPage&pid=' + id,
								/* width : 680, */
								fit : true,
								id : "company",
								buttons : [{
									text : '<input type="button" class="btncss" value="修改"/>',
									handler : function() {
										dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
									}
								}] 
							});
  	}
  	//详情查询
  	function xiangxixinxi(){
  		var row=$("#dg").datagrid('getSelections');
  			if(row.length==1){
	  			for(var i=0;i<row.length;i++){
		  			var id=row[i].shiping_order_id;
		  		}		
	  			dialog = parent.jy.modalDialog({
				title : '运单详情',
				url : 'shipManual.do?method=getShipManualPage&pid=' + id,
				/* width : 680, */
				fit : true,
				buttons : [{
					handler : function() {
						dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
					}
				}] 
			});
  		}else{
  			$.messager.alert("运单录入","请选择一行信息","info");	
  		}	
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
		for(i=1;i<allRows2.length;i++)
		{
			var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
			if(col.field!="check_type"&&col.field!="send_type"&&col.field!="shipping_order_state"){
				colName.push(col.title);//把title列名到数组里去 
				fieldName.push(col.field); //把field列属性名到数组里去 
			} 
		} 
		$("#fieldName").val(fieldName.join(","));
  		 $("#headtitle").val(colName.join(","));
  		var outputform=$("#outputform");
  		outputform.submit(); 
  	}
  	
 	function add() {
		 /* alert(document.getElementById("addbuttons"));
		 alert(document.getElementById("upbuttons")); */
		dialog = parent.jy.modalDialog({
			title : '运单新增',
			url : 'shipManual.do?method=addShipManual',
/* 				 buttons :'#addbuttons'
*/
			/* width : 680, */
			id : "company",
			fit : true,
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
  	  		var checkarray=[];
  		
  		var row=$("#dg").datagrid('getSelections');
  		if(row.length>=1){
	  			for(var i=0;i<row.length;i++){
		  			checkarray.push(row[i].shiping_order_id);
		  		}	
							var url="shipManual.do?method=getShipManualPrint&pid="+checkarray.join(",");
							ow(url);
  		}else{
  			$.messager.alert("运单打印","请选择一行信息","info");	
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
			title : '导入运单',
			url : 'shipManual.do?method=imp',
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
		$("#start_time").val("");
		$("#end_time").val(""); 
		$("#ddId").val("");		
		$("#send_station").val("");
		$("#end_address").val("");
		$("#custom_name").val("");
		$("#receipt").val("");
		$("#pay_type").combobox("setValue","");
		$("#order_state").combobox("setValue","");
		$("#send_type").combobox("setValue","");
		$("#goods_name").val("");
		
	}
	//一维打印
	function printYWM(){
		var row=$("#dg").datagrid('getSelections');
		if(row.length>=1){
			var checkarray=[];
	 		var array = $('#dg').datagrid('getSelections');
  			for(var i=0;i<array.length;i++){
  				checkarray.push(array[i].shiping_order_num);
  			}
  			$("#checkarray").val(checkarray.join(","));
  			$("#printywm").submit();
		}else{
			$.messager.alert("运单录入","请选择一行信息","info");	
		}		
	}
	//运单核对
	function check(){
	    var checkarray=[];  
        //var row=$("#dg").datagrid('getSelections');
            var array = $('#dg').datagrid('getSelections');
		    if(array.length==1){    	  
  			    for(var i=0;i<array.length;i++){
  				    checkarray.push(array[i].shiping_order_id);
  			    }
  			dialog = parent.jy.modalDialog({
				title : '运单核对',
			    url : 'shipManual.do?method=checkData&checkarray='+checkarray,
				width : 700,
				//height : 300,
				buttons : [ {
					text : '<input type="button" class="btncss" value="核对"/>',
					handler : function() {
						dialog.find('iframe').get(0).contentWindow
								.submitFormEdit(dialog, grid, parent.$);
					}
				} ]
			});    
		}else{
			$.messager.alert("运单核对","请选择一行信息","info");	
		}
	}
  </script>
  <body class="easyui-layout">
  	<form action="shipManual.do" id="outputform" method="post">
    	<div region="north" title="检索" class="st-north" border="false"  height="60px" collapsible="false"  >
	    	<lable>制单时间:</lable>
			<input  id="start_time" type="text" yz="text"  class="Wdate"  readonly="readonly" style="width:120px;height:22px; " onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			-
			<input id="end_time"  type="text" yz="text" class="Wdate"  readonly="readonly" style="width:120px;height:22px;" onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
	    	<lable >委托单号:</lable>
	    	 <input type="text" class="search-text" yz="text" id="weitoudanhao"  style="width:120px; margin-right:0px"  >
	    	<lable >运单编号:</lable>
	    	 <input type="text" class="search-text" yz="text" id="ddId"  style="width:120px; margin-right:0px"  >
	    	   		
		 <lable >发货人:</lable>
	    	<input type="text" yz="text"  class="search-text"style="width:120px"   id="custom_name" >

	    	 <a class="easyui-linkbutton" onclick="searchCar_owner()" data-options="iconCls:'icon-search'" >查询</a>	
	    	 <a id="btnMoreSearch" class="btn btn-sm btn-link" type="button" style="margin-top:16px;" href="javascript:void(0)" state="close">更多条件</a>
	    	 <div id="searchInfoId" style="display: none">
	    	<lable>运单状态:</lable>
				<select class="easyui-combobox" id="order_state" yz="select" name=shipping_order_state
					style="width:120px;"
					data-options="panelHeight : 'auto',editable:false">
 					<option id="" value="">全部</option>
 					<option id="" value="0">未出库</option>
					<option id="" value="1">配送中</option>
					<option id="" value="2">转运中</option>
					<option id="" value="4">签收</option>
				</select>
				 <lable >付款方式:</lable>
				<select class="easyui-combobox" id="pay_type" yz="select" name="agreement_type"
					style="width:120px;"
					data-options="panelHeight : 'auto',editable:false">
 					<option id="" value="">全部</option>
 					<option id="" value="0">回付</option>
					<option id="" value="1">提付</option>
					<option id="" value="2">现付</option>
					<option id="" value="3">货到前付</option>
					<option id="" value="4">发货方月结</option>
					<option id="" value="5">收货方月结</option>
					<option id="" value="6">货到付款</option>
				</select>
	    	<lable>交接方式:</lable>
				<select class="easyui-combobox" id="send_type" yz="select" name=send_type
					style="width:120px;"
					data-options="panelHeight : 'auto',editable:false">
					<option id="" value="">全部</option>
 					<option id="" value="0">自提</option>
					<option id="" value="1">送货</option>			
				</select>	 
	    	 <lable >收货人:</lable>
	    	<input type="text" yz="text" class="search-text"style="width:120px"   id="receipt" >
	    	
	    <lable>品名:</lable>
			<input type="text" yz="text" class="search-text" id="goods_name"style="width:120px"   >    
			</div>
    	</div>
    	<div region="center" >
    		<table id="dg" title="运单信息" ></table>
    	</div>
    	<div id="tb">
   		 <!--   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true"   onclick="add()">添加</a>  
   		      <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="xiangxixinxi()">详细</a>
		    <a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="modify()">修改</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteEver()">删除</a>
			 <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-print',plain:true"onclick="printYWM()">一维码打印</a>
		  <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="isArrive()" id="tbru" >到达</a>
		   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="isNotArrive()">取消到达</a>
		   		    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-reset',plain:true"onclick="reset()">重置</a>-->
		</div>	
		<input type="hidden" name="method" value="outShipOrder">
		<input type="hidden" id="fieldName" name="fieldName">
		<input type="hidden" id="headtitle" name="headtitle">
		</form>
		 <form action="shipManual.do" target="_blank" id="printywm" method="post">
		 	<input type="hidden" name="method" value="getShipManualPrintYwm">
		 	<input type="hidden" id="checkarray" name="checkarray">
		 </form>
  </body>
</html>