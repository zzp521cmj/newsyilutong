<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<%
	String realPath1 = "http://" + request.getServerName() + ":"
			+ request.getServerPort() + "/surmax/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>承运协议详细信息</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<style type="text/css">
fieldset {
	border: 1px dotted #D1D7DC;
	/* margin: 10px; */
	padding: 8px;
	width: 994px;
}

.st-north {
	
}

.iner {
	margin-top: 8px;
}

.testStyle {
	vertical-align: middle;
	width: 150px;
	height: 22px
}
</style>

</head>
<%
	String pid = (String) request.getAttribute("pid");
	User user = (User) request.getSession().getAttribute(
			SessionInfo.SessionName);
%>
<script type="text/javascript">
    var dialog;
    var grid;
    var typeid=0;
    var pid=('<%=pid%>');
    var checkarray=[];
    var editval;
    var chanageType = [{ "value": "0", "text": "回付" }, { "value": "1", "text": "到付" }, { "value": "2", "text": "现付" }];
    var driverId="";
    $(function(){
        $.ajax({
            url : 'createA.do?method=getUpdateCreateAgreement',
            data : {
                id : pid
            },
            success : function(data) {
                if(data.agreement_type==1){
                    $("#send_date").css("display","");
                    
                    
                }
                
                  var payment_sh=data.payment_sh;
           		var all_money=data.all_money;
            	var receivable_fee=data.receivable_fee;
            	if(payment_sh==2&&all_money==receivable_fee){//审核通过差异为零
            	 $("#biancar").css("display","none");
            	  $("#bian").css("display","none");
            	  $("#dgremove").css("display","none");
            	  $("#type").combobox({ disabled:true});
            	  
            	  
            	 
            
            	}
                data.send_date=data.send_date!=null?data.send_date.substr(0,19):'';
                /* 	 if(data.ldp_id!=''){
                 var id=data.ldp_id;
                 $.ajax({
                 type: "POST",
                 async : false,
                 url:'depn.do?method=getDepn',
                 data:{department_id:id},
                 success:function(data){
                 $("#cc3").val(data.department_name);
                 //$("#departments").append("<li>"+data+"</li>");
                 }
                 });
                 } */
              /*   if(data.driverid!=''){
                    driverId=data.driverid;
                    $("#biancar").attr("style", "display:none");
                    $("#bian").attr("style", "display:none");
                    $("#dgremove").attr("style", "display:none");
                    $("#type").combo("disable");
                } */
                if(data.ndp_id!=''){
                    var id=data.ndp_id;
                    $.ajax({
                        type: "POST",
                        async : false,
                        url:'depn.do?method=getDepn',
                        data:{department_id:id},
                        success:function(data){
                            $("#ndp").val(data.department_name);
                            //$("#departments").append("<li>"+data+"</li>");
                        }
                    });
                }
                $("#carid").prev("div").find("span.select2-chosen").text(data.car_number1);
                $("#compid").prev("div").find("span.select2-chosen").text(data.company_name);
                $("#comp_ren").val(data.end_people);
                $("#comp_phone").val(data.end_phone);
                typeid=data.agreement_type;
                $('#Regform').form('load', data);
            }
        });

        $.ajax({
            url: "createA.do?method=getXXCreateAgreement",
            type: "POST",
            data:{id:pid},
            success:function(msg){
                $.each(msg,function(i,item){
                    checkarray.push(item.order_id);
                });
                checkarray=checkarray.join(",");
                grid=$("#dg").datagrid({
                    url : "shipOrder.do?method=getShipOrderCAM&pid="+checkarray,
                    border : false,
                    rownumbers : true,
                    fit : true,
                    singleSelect : false,
                    selectOnCheck : true,
                    checkOnSelect :true,
                    multiSort:true,
                    toolbar : '#tb',
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
   				{field : 'time_appointment',title : '配送时间',width : 80,align:'center',sortable:'true'},
  				{field : 'send_station',title : '发站',width : 100,align:'center'},
  				 {
				field : 'fhdanweiname',
				title : '发货单位名称',
				width : 70,
				align : 'center',
				sortable : 'true'
			    },
  				{field : 'custom_name',title : '发货人',width : 80,align:'center'},
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'},
  				{field : 'end_address',title : '到站',width : 55,align:'center'},
  				{field : 'receipt',title : '收货人',width : 60,align:'center'},
  				{field : 'receipt_tel',title : '电话',width : 80,align:'center'},
  				{field : 'receipt_phone',title : '手机',width : 80,align:'center'},
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
  				{field : 'goods_packing',title : '包装',width : 60,align:'center'},
  				{field : 'receipt_address',title : '送货详细地址',width : 100,align:'center'},
  				{field : 'goods_num',title : '件数',width : 60,align:'center',
  				    formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0";
  						}
  					}
  				
  				},
  				{field : 'goods_weight',title : '重量',width : 60,align:'center',
  				    formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center',
  				    formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  			/* 	{field : 'car_number',title : '车牌号',width : 70,align:'center'}, */
  				{field : 'trade_agency',title : '代收货款',width : 70,align:'center',
  				    formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'destination_fee',title : '代收运费',width : 70,align:'center',
  				    formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'transport_pay',title : '运费总额',width : 70,align:'center',
  				    formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				/* sortable: true */},
  				{field : 'back_fee',title : '客户返款',width : 70,align:'center',
  				   formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'handling_charge',title : '手续费',width : 70,align:'center',
  				   formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
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
  				{field : 'is_recept',title : '回单份数',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "0";
  						}else{
  						return val;
  						}
  					}
  				},
  			/* 	{field : 'send_remarks',title : '送货备注',width : 90,align:'center',sortable:'true'
                            ,editor:{
                            type:'textarea',
                            options:{
                                validType:'send_remarks'
                            }
                        }
                 } ,*/
                 {field : 'change_pay',title : '应付中转费',width : 80,align:'center',
                            editor:{
                            type:'numberbox',
                            options:{
                                precision:2.00,
                                validType:'change_pay'
                            }
                           },formatter:function(val,row,index){
                             if(val!="" &&val!=null){
  						       return val;
  						   }else{
  						       return "0.00";
                           }
                        }
                  },{field : 'chanage_pay_type',title : '中转付款方式',width : 90,align:'center',
                            editor: { type: 'combobox', options: { data: chanageType, valueField: "value", textField: "text" } }
                            ,formatter:function(val,row,index){
                            if(val==0){
                                return '回付';
                            }else if(val==1){
                                return '到付';
                            }else if(val==2){
                                return '现付';
                            }
                        }
                },{field : 'change_feilv',title : '中转代收货款手续费率（‰）',width :150,align:'center',
                            editor:{
                            type:'numberbox',
                            options:{
                                precision:2.00,
                                validType:'change_pay'
                            }
                           },formatter:function(val,row,index){
                           if(val!="" &&val!=null){
  						       return val;
  						   }else{
  						       return "5";
                           }
                        }
                },{field : 'change_handling',title : '中转手续费',width : 90,align:'center',
                        formatter:function(val,row,index){
                           if(val!="" &&val!=null){
  						       return val;
  						   }else{
  						       return "0.00";
                           }
                        }
                },
                 
                /* {field : 'change_back_fee',title : '中转返款',width : 80,align:'center',sortable:'true'
                            ,editor:{
                            type:'numberbox',
                            options:{
                                precision:2.00,
                                validType:'change_back_fee'
                            }
                           },formatter:function(val,row,index){
                            if(val==null||val==""){
                                return '0.00';
                            }else{
                                return val;
                            }
                        }
                  },{field : 'change_back_type',title : '中转返款方式',width : 90,align:'center',
                            editor: { type: 'combobox', options: { data: chanageBackType, valueField: "value", textField: "text" } }
                            ,formatter:function(val,row,index){
                            if(val==0){
                                return '现付';
                            }else if(val==1){
                                return '欠返';
                            }
                        }
                }, */{field : 'change_remarks',title : '中转备注',width : 90,align:'center',sortable:'true'
                            ,
                            editor:{
                            type:'textarea',
                            options:{
                               
                                validType:'change_remarks'
                            }
                        },
                },
                
                {field : 'change_other',title : '中转其他费用',width : 90,align:'center',formatter:function(val,row,index){
                        if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
                        },editor:{
                           type:'numberbox',
                           options:{
                                precision:2.00,
                                validType:'change_other'
                            }
                        },
                },
                {field : 'send_fee',title : '应付配送费',width : 80,align:'center'
  					,editor:{
	                	type:'numberbox',
	                	options:{
	                		precision:2.00,
	                    	validType:'send_fee'
	                	}
	           		},formatter:function(val,row,index){
  							if(val==null||val==""){
  								return '0.00';
  							}else{
  								return val;
  							}
  						}	
  				},{field : 'send_remarks',title : '配送备注',width : 90,align:'center'
					,editor:{
	                	type:'textarea',
	                	options:{
	                    	validType:'send_remarks'
	                	}
           			}	
				},
  				{field : 'picking_fee',title : '运费',width : 80,align:'center',sortable:'true'},
  				{field : 'freight_fee',title : '提货费',width : 80,align:'center',sortable:'true'},
  				{field : 'insurance_fee',title : '保价费',width : 80,align:'center',sortable:'true'},
  				{field : 'adorn_fee',title : '其他费',width : 80,align:'center',sortable:'true'},
  				{field : 'receivable_ground_fee', title : '装卸费', width : 80,align :'center',sortable:'true'},
  				{field : 'upstairs_fee',title : '上楼费', width : 80,align :'center',sortable:'true'},
  				{field : 'deliver_fee',title : '直送费', width : 80,align :'center',sortable:'true'},
  				{field : 'inspect_fee',title : '开箱验货费', width : 80,align :'center',sortable:'true'},
  				{field : 'seized_fee',title : '理货费', width : 80,align :'center',sortable:'true'},
  				{field : 'stocks_predestination',title : '库存天数', width : 80,align :'center',sortable:'true'},
  				{field : 'transport_mode',title : '运输方式', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "普快";
  						}else if(val==1){
  						
  						return "特快";
  						}
  					}
  				},
  				{field : 'invoice_state',title : '是否开票', width : 80,align :'center',sortable:'true',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  						
  						return "是";
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
  							//value = "<a href='javascript:void(0)'onclick= 'openwindow(\""+row.shiping_order_id+"\")'>到达</a>&nbsp";
  						}else if(value==1){
  							return "到达";
  							//value = "<a href='javascript:void(0)'onclick= 'openwindow(\""+row.shiping_order_id+"\")'>未到达</a>&nbsp";
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
   				{field : 'order_time',title : '录入时间',width : 80,align:'center',sortable:'true'},
   				{field : 'order_arrive_time',title : '实际到达时间',width : 80,align:'center',sortable:'true'},
  				{field : 'shipping_order_name',title : '制单人',width : 80,align:'center',sortable:'true'},
                {field : 'remarks_fee',title : '应收备注',width : 90,align:'center',sortable:'true'},
  				{field : 'appointment_remarks',title : '配送备注',width : 90,align:'center',sortable:'true'},
  				{field : 'remarks',title : '备注',width : 90,align:'center',sortable:'true'},
                    ]],
                    onBeforeEdit:function(index,row){ //可编辑之前
                      
                    	editval=index;
                    	row.editing = true;
                    	
                    },
                    onAfterEdit:function(index,row){//编辑关闭后
                         var bool=true;
                         var ch = Number(row.change_feilv)*Number(row.trade_agency)/1000;
                         $('#dg').datagrid("updateRow", {index:index,row:{change_handling:ch}});
                        /*  if(typeid!=0){
                         if(typeid==2){
                         if(row.trunk_fee==""){
                         $('#dg').datagrid("updateRow", {index:index,row:row});
                         bool=false;
                         }
                         }else if(typeid==1){
                         if(row.practiacl_num==""){
                         bool=false;
                         $('#dg').datagrid("updateRow", {index:index,row:row});
                         }
                         if(row.take_fee==""){
                         bool=false;
                         $('#dg').datagrid("updateRow", {index:index,row:row});
                         }
                         }
                         } */
                        //compute();
                        if(typeid==0){
                        }else if(typeid==1){
                           $.ajax({url:'createA.do?method=updataMoney',data:{
                                 id:row.shiping_order_id,
                                 change_pay:'0.00',
                                 change_remarks:'',
                                 chanage_pay_type:'0',
                                 change_other:'0.00',
                                 change_handling:'0.00',
                                 change_feilv:'5',
                                 paidtc_fu:'0.00',
                                 send_fee:row.send_fee,
                                 send_remarks:row.send_remarks
                           },success:function(){
                           }});
                        }else if(typeid==2){
                              $.ajax({url:'createA.do?method=updataMoney',data:{
                                id:row.shiping_order_id,
                    			change_pay:row.change_pay,
                    			change_remarks:row.change_remarks,
                    			chanage_pay_type:row.chanage_pay_type,
                    			change_other:row.change_other,
                    			change_feilv:row.change_feilv,
                    			change_handling:row.change_handling,
                    			paidtc_fu:row.change_pay,
                    			send_fee:'0.00',
                                send_remarks:''
                    			},success:function(){
                    			}});
                        }

                        row.editing = false;
                    },
                    //单击事件
                    onClickRow: function (rowIndex,rowData) {
                        if(driverId==""){
                          console.info(rowData.settltc_sh);
                        console.info(rowData.paidtc_fu==rowData.change_pay);
                    	
                    	if(rowData.settltc_sh==2&&rowData.paidtc_fu==rowData.change_pay){
                    	  editval=index;
                          row.editing = false;
                    	}else{
                    	 //单击开启编辑行
                            if(editval!=rowIndex){
                            
                                $("#dg").datagrid("endEdit", editval);
                                $("#dg").datagrid("beginEdit", rowIndex);
                                editval=rowIndex;
                            } else{
                                editval=undefined;
                                $('#dg').datagrid("endEdit", rowIndex);
                            }
                    	}
                           
                        }
                    },
                    onLoadSuccess:function(){
                        if(typeid==0){
                            /*  $("#dg").datagrid('hideColumn', 'practiacl_num');
                             $("#dg").datagrid('hideColumn', 'send_fee');
                             $("#dg").datagrid('hideColumn', 'change_pay');
                             $("#dg").datagrid('hideColumn', 'change_remarks');
                             $("#dg").datagrid('hideColumn', 'send_remarks');
                             $("#dg").datagrid('hideColumn', 'chanage_pay_type');
                             $("#dg").datagrid('hideColumn', 'change_other'); */

                        }else if(typeid==2){
                            $("#dg").datagrid('showColumn', 'change_pay');//中转费
                            $("#dg").datagrid('showColumn', 'chanage_pay_type');//中转付款方式
                            /*$("#dg").datagrid('showColumn', 'change_back_fee');
                            $("#dg").datagrid('showColumn', 'change_back_type'); */
                            $("#dg").datagrid('showColumn', 'change_remarks');
							$("#dg").datagrid('showColumn', 'change_other');
                   			$("#dg").datagrid('showColumn', 'change_feilv');//中转手续费率
                   			$("#dg").datagrid('showColumn', 'change_handling');//中转手续费
                   			$("#dg").datagrid('hideColumn', 'send_remarks');//配送备注
                            $("#dg").datagrid('hideColumn', 'send_fee');//配送费
                        }else{
                            $("#dg").datagrid('hideColumn', 'change_pay');//中转费
                    		$("#dg").datagrid('hideColumn', 'chanage_pay_type');//中转付款方式
                 			/*   $("#dg").datagrid('hideColumn', 'change_back_fee');
                   			$("#dg").datagrid('hideColumn', 'change_back_type'); */
                   			$("#dg").datagrid('hideColumn', 'change_remarks');//中转备注
                   			$("#dg").datagrid('hideColumn', 'change_other');//中转其他费用
                   			$("#dg").datagrid('hideColumn', 'change_feilv');//中转手续费率
                   			$("#dg").datagrid('hideColumn', 'change_handling');//中转手续费
                   			$("#dg").datagrid('showColumn', 'send_remarks');//送货备注
                            $("#dg").datagrid('showColumn', 'send_fee');//配送费
                   			//$("#dg").datagrid('showColumn', 'send_remarks');
                   			/* 
                  			 $("#dg").datagrid('hideColumn', 'chanage_pay_type');
                  			 $("#dg").datagrid('hideColumn', 'change_pay'); */
                        }
                    },
                    pagination:true,//分页
                    pageSize:10,
                    pageList:[5,10,15,20],
                });
            }
        });

        depart='<%=user.getDid()%>';
        $("#user").val('<%=user.getUsername()%>');
		/* $("#carid").select2({
		 placeholder : "请输入车牌号", //默认文本框显示信息
		 minimumInputLength : 1, //最小输入字符长度
		 allowClear : true,
		 multiple : false, //设置多项选择，false则只能单选
		 maximumSelectionSize : 5, //最大选择个数
		 query : function(query) {
		 $.ajax({
		 type : "POST",
		 url : "shipOrder.do?method=getPlateNumber",
		 data : {
		 phones : query.term
		 }, //传递你输入框中的值
		 success : function(msg) {
		 var msg = $.parseJSON(msg);
		 var data = {
		 results : []
		 };
		 $.each(msg, function(x, y) {
		 data.results.push({
		 id : y.id,
		 text : y.name
		 });
		 });
		 query.callback(data);
		 }
		 });
		 }
		 }).on("select2-selecting", function(f) {
		 $("#car").val(f.object.id);
		 $("#carnum").val(f.object.text);
		 var id = f.object.id;
		 var url = 'driver.do?method=getDriverLength&search=' + id;
		 //过滤职务
		 $('#driver').combobox('clear');
		 $('#driver').combobox('reload', url);
		 }); */

		$('#type').combobox({

			onChange : function(newValue, oldValue) {
				typeid = newValue;
				if (newValue == "0") {
					$("#jigou").removeAttr("style");
					$("#phone").attr("style", "display:none");
					$("#ren").attr("style", "display:none");
					$("#company").attr("style", "display:none");
					$("#company_number").attr("style", "display:none");
					$("#send_date").attr("style", "display:none");
					$("#change_type").attr("style", "display:none");
				} else if (newValue == "2") {
					if (driverId == "") {
						$("#bian").removeAttr("style");
					}
					$("#jigou").attr("style", "display:none");
					$("#send_date").attr("style", "display:none");
					$("#company").removeAttr("style");
					$("#phone").removeAttr("style");
					$("#ren").removeAttr("style");
					$("#company_number").removeAttr("style");
					$("#change_type").removeAttr("style");
					$("#dg").datagrid('reload');
					$("#fei").html("中转配送费总额:");
					// $("#take_data").attr("style", "display:none");
					//$("#beizhu").html("中转备注:");

				} else {
					$("#change_type").attr("style", "display:none");
					$("#jigou").attr("style", "display:none");
					//$("#phone").attr("style", "display:none");
					$("#ren").attr("style", "display:none");
					$("#company").attr("style", "display:none");
					$("#company_number").attr("style", "display:none");
					$("#send_date").removeAttr("style");
					$("#bian").attr("style", "display:none");
					$("#phone").attr("style", "display:none");
					$("#cid").val("");
					$("#compid").val("");
					$("#comp_ren").val("");
					$("#comp_phone").val("");
					$("#company_number").val("");
					$("#dg").datagrid('reload');
					$("#fei").html("司机配送费");
					//$("#take_data").removeAttr("style", "display:none");
					//$("#beizhu").html("配送备注:");

				}
			}
		});
		/* 部门查询
		 $("#compid").select2({
		 placeholder : "请输入中转公司名", //默认文本框显示信息
		 minimumInputLength : 1, //最小输入字符长度
		 allowClear : true,
		 multiple : false, //设置多项选择，false则只能单选
		 maximumSelectionSize : 5, //最大选择个数
		 query : function(query) {
		 $.ajax({
		 type : "POST",
		 url : "createA.do?method=getCompany",
		 data : {
		 name : query.term
		 }, //传递你输入框中的值
		 success : function(msg) {
		 var msg = $.parseJSON(msg);
		 var data = {
		 results : []
		 };
		 $.each(msg, function(x, y) {
		 data.results.push({
		 id : y.id,
		 text : y.name,
		 ren : y.ren,
		 phone : y.phones
		 });
		 });
		 query.callback(data);
		 }
		 });
		 }
		 }); */

	});
	//计算总金额
	function compute() {
		var rows = $("#dg").datagrid('getRows');//获取当前的数据行
		var total = 0;//总价格
		var goods_weight = 0;//总重量
		var goods_vol = 0;//总体积
		var goods_num = 0;//总数量
		var all_back_fee = 0;//总返款
		var all_destination_fee = 0;//总到付款
		var all_transportation_fee = 0;//总运费
		var all_trade_agency = 0;//总代收款trade_agency
		var all_handling_charge = 0;//总的手续费
		var all_change_handling = 0;//总的中转手续费
		var all_change_pay = 0;//总的中转费
		var num = rows.length;
		$("#num").val(num);
		for ( var i = 0; i < rows.length; i++) {
			//total = parseInt(rows[i]['transport_pay']) + total;
			goods_weight = Number(Number(rows[i]['goods_weight'])
					+ Number(goods_weight));
			goods_vol = Number(Number(rows[i]['goods_vol']) + Number(goods_vol));
			goods_num = Number(Number(rows[i]['goods_num']) + Number(goods_num));
			all_destination_fee = Number(Number(rows[i]['destination_fee'])
					+ Number(all_destination_fee));
			all_transportation_fee = Number(Number(rows[i]['transport_pay'])
					+ Number(all_transportation_fee));
			all_trade_agency = Number(Number(rows[i]['trade_agency'])
					+ Number(all_trade_agency));
			all_handling_charge = Number(Number(rows[i]['handling_charge'])
					+ Number(all_handling_charge));
			all_change_handling = Number(Number(rows[i]['change_handling'])
					+ Number(all_change_handling));
			all_change_pay = Number(Number(rows[i]['change_pay'])
					+ Number(all_change_pay));

		}

		// $("#alls").val(total + ".00");
		$("#goods_weight").val(goods_weight);
		$("#goods_vol").val(goods_vol);
		$("#goods_num").val(goods_num);

		$("#all_destination_fee").val(all_destination_fee);
		$("#all_transportation_fee").val(all_transportation_fee);
		$("#all_trade_agency").val(all_trade_agency);
		$("#all_handling_charge").val(all_handling_charge);
		$("#all_change_handling").val(all_change_handling);
		$("#all_change_pay").val(all_change_pay);

		//$("#all_back_fee").val(all_back_fee);
	}
	function deletefrom() {
		$.messager.confirm('确认', '您确定从协议中移除选中的记录吗？', function(r) {
			if (r) {
				var check = [];
				var array = $('#dg').datagrid('getSelections');
				if (editval != undefined) {
					$('#dg').datagrid('endEdit', editval);
				}
				for ( var i = 0; i < array.length; i++) {
					check.push(array[i].shiping_order_id);
					var checkedRow = array[i];
					var checkedRowIndex = $('#dg').datagrid('getRowIndex',
							checkedRow);
					$('#dg').datagrid('deleteRow', checkedRowIndex);
					var rows = $('#dg').datagrid("getRows");
					$('#dg').datagrid("loadData", rows);
				}
				if (array != "") {
					var rows = $('#dg').datagrid('getRows');
					if (rows.length > 1 || rows.length < array.length) {

						$.ajax({
							type : "POST",
							url : "createA.do?method=removeShip&cid=" + pid,
							data : {
								pid : check.join(",")
							}, //传递你输入框中的值
							success : function(data) {
								if (data.flag) {
									parent.$.messager.alert("协议信息", "已从协议中移除",
											'info', function(r) {
												compute();
											});
								}
							}
						});
					} else {
						$.messager.alert("协议详细", "无法移除,您可以尝试作废协议", "info");
					}
				} else {
					$.messager.alert("协议详细", "请选择要移除的运单", "info");
				}
			}
		});
	}
	//关闭未关闭的可编辑行
	function endEdits() {
		var rows = $("#dg").datagrid('getRows');
		for ( var i = 0; i < rows.length; i++) {
			$("#dg").datagrid('endEdit', i);
		}
	}
	var submitFormEdit = function($dialog, $grid, $pjq, $mainMenu) {
		endEdits();
		compute();
		var rows = $("#dg").datagrid('getData').rows;
		var pId = [];
		var alls = $("#alls").val();
		var text = document.getElementById("fei").innerHTML;
		for ( var i = 0; i < rows.length; i++) {

			pId.push(rows[i].shiping_order_id);
		}

		pId.join(",");

		if ($("#type").combotree("getValue") == 0
				&& $("#cc3").combotree("getValue") == "") {
			$pjq.messager.alert('修改协议', '班线必须填写下一机构', 'info');
		} else if ($("#type").combotree("getValue") == 2
				&& ($("#compid").val() == '' || $("#compid").val() == null)) {
			$pjq.messager.alert('修改协议', '中转必须填写中专公司', 'info');
		} else {
			if ($("#car").val() == "" || $("#car").val() == null) {
				if ($("#driver").val() == "" || $("#driver").val() == null) {

					$pjq.messager
							.confirm(
									'修改协议',
									'确定要修改吗?',
									function(r) {
										if (r) {
											var win = $.messager.progress({
												title : '请稍等',
												msg : '正在修改承运协议...',
												text : '正在修改承运协议，请稍等...',
												interval : 500
											});
											$
													.ajax({
														type : "POST",
														url : 'createA.do?method=updateCreateAgreement&pid='
																+ pId,

														data : $('#Regform')
																.serialize(),
														success : function(msg) {

															if (msg.flag) {
																$dialog
																		.dialog('close');
																$grid
																		.datagrid('reload');
																$pjq.messager
																		.alert(
																				'修改协议',
																				'协议修改成功',
																				'info');
															} else {
																$pjq.messager
																		.alert(
																				'修改协议',
																				'协议修改失败',
																				'info');
															}
															;
														},
														error : function(jqXHR,
																textStatus,
																errorMsg) {
															$.messager
																	.progress('close');
															$pjq.messager
																	.alert(
																			'修改协议',
																			'协议修改失败',
																			'info');
														}
													});
										}
									});
				} else {
					$pjq.messager.alert('修改协议', '车牌号不能为空', 'info');
				}
			} else {
				if ($("#driver").val() == "" || $("#driver").val() == null) {
					$pjq.messager.alert('修改协议', '司机不能为空', 'info');
				} else {
					if (alls != "" && alls != null) {
						$pjq.messager
								.confirm(
										'修改协议',
										'确定要修改吗?',
										function(r) {
											if (r) {
												var win = $.messager.progress({
													title : '请稍等',
													msg : '正在修改承运协议...',
													text : '正在修改承运协议，请稍等...',
													interval : 500
												});
												$
														.ajax({
															type : "POST",
															url : 'createA.do?method=updateCreateAgreement&pid='
																	+ pId,
															data : $('#Regform')
																	.serialize(),
															success : function(
																	msg) {

																if (msg.flag) {
																	$dialog
																			.dialog('close');
																	$grid
																			.datagrid('reload');
																	$pjq.messager
																			.alert(
																					'修改协议',
																					'协议修改成功',
																					'info');
																} else {
																	$pjq.messager
																			.alert(
																					'修改协议',
																					'协议修改失败',
																					'info');
																}
																;
															},
															error : function(
																	jqXHR,
																	textStatus,
																	errorMsg) {
																$.messager
																		.progress('close');
																$pjq.messager
																		.alert(
																				'修改协议',
																				'协议修改失败',
																				'info');
															}
														});
											}
										});
					} else {
						$pjq.messager.alert('新增协议', text + '不能为空', 'info');
					}
				}
			}
		}

	};

	function selectcar() {
		dialog = parent.jy.modalDialog({
			title : '选择司机',
			url : 'createA.do?method=modifyselectCar',
			width : 1000,
			height : 485,
			id : 'f',
			resizable : true,
			buttons : [ {
				text : '<input type="button"  class="btncss" value="确定"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	}
	function select() {
		dialog = parent.jy.modalDialog({
			title : '选择中专公司',
			url : 'createA.do?method=modifyselectCompany',
			width : 940,
			height : 485,
			resizable : true,
			buttons : [ {
				text : '<input type="button"  class="btncss" value="确定"/>',
				handler : function() {
					dialog.find('iframe').get(0).contentWindow.submitForm(
							dialog, grid, parent.$);
				}
			} ]
		});
	}
	//导出承运协议中运单
    function putoutfile(){
       /*  var allRows2 = $("#dg").datagrid("getColumnFields");
         var colName=[];
         var fieldName=[];
         for(i=1;i<allRows2.length;i++)
         {
         var col = $('#dg').datagrid( "getColumnOption" , allRows2[i] );
         if(col.field!="check_type"&&col.field!="send_type"){
         colName.push(col.title);//把title列名到数组里去 
         fieldName.push(col.field); //把field列属性名到数组里去 
         } 
         } 
         $("#fieldName").val(fieldName.join(","));
         $("#headtitle").val(colName.join(",")); */
        var checkarray=[];
        var array = $('#dg').datagrid('getSelections');
        for(var i=0;i<array.length;i++){
            checkarray.push(array[i].shiping_order_id);
        }
        $("#agId").val(checkarray.join(","));
        $("#agreementId").val(pid);
        
        var outputform=$("#Regform");
        outputform.submit();
    }
</script>
<body class="easyui-layout">
	<form action="createA.do" id="Regform" method="post">
		<div region="north" class="st-north" height="205px" border="false"
			collapsible="false">
			<fieldset>

				<legend>协议信息</legend>
				<div>
					<lable>类型:</lable>
					<select class="easyui-combobox" id="type" name="agreement_type"
						style="width:150px;"
						data-options="panelHeight : 'auto',editable:false">
						<option id="" value="1">配送</option>
						<option id="" value="2">转运</option>
					</select> <input name="agreement_id" type="hidden" /> <input
						name="agreement_number" type="hidden" />
					<lable>托运部门：</lable>
					<input id="ndp" class="search-text" readonly="true" type="text" />
					<input id="ndpid" class="search-text" type="hidden" name="ndp_id" />

					<lable id="take_data">时间: <input id="send_date"
						name="send_date" class="Wdate" value="" readonly="readonly"
						style="width:150px;height:22px; "
						onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
					</lable>
					<lable id="jigou" style="display: none"> <font color="red"
						style="margin-right:10px">*</font>下一机构: <input id="cc3"
						name="ldp_id" class="search-text"></lable>
					<lable id="company" class="divlabel" style="display: none"
						value="nicaiz"> <font color="red"
						style="margin-right:10px">*</font>中转公司: <input id="compName"
						name="company_name" class="search-text" readonly="true"> <input
						id="compid" name="company_id" type="hidden" class="search-text">
					</lable>
					<!--<input   id="cid"  type="hidden"  name="company_id"  class="search-text">
               <input   id="compid"  type="hidden" class="search-text">  -->

					<a class="easyui-linkbutton" id="bian" onclick="select()"
						data-options="iconCls:'icon-search'" style="display:none">选择</a>

				</div>
				<div class="iner">
					<lable id="phone" class="divlabel" style="display: none">电话:
					<input id="comp_phone" name="company_tel" class="search-text"></lable>
					<lable id="ren" style="display: none">到站联系人: <input
						id="comp_ren" name="" class="testStyle"></lable>
					<lable id="company_number" style="display: none" class="divlabel">转运单号:
					<input id="company_number" name="company_number" class="testStyle"></lable>
				</div>

				<fieldset>
					<legend>派车单信息</legend>

					<div>
						<lable>发站: <input id="send_action" class="search-text"
							name="send_station" type="text" /> </lable>
						<lable>到站: <input id="end_address" class="search-text"
							name="end_address" type="text" /> </lable>
						<lable class="divlabel" id="fei">司机总运费:</lable>
						<input id="alls" name="all_money" class="search-text" />
						<!-- <select class="easyui-combobox" id="pay_type" name="pay_type"
						style="width:150px;"
						data-options="panelHeight : 'auto',editable:false">
						<option id="" value="0">预付</option>
						<option id="" value="1">到付</option>
						<option id="" value="2">回付</option>
					</select>  -->
					</div>
					<div class="iner">
						<a class="easyui-linkbutton" id="biancar" onclick="selectcar()"
							data-options="iconCls:'icon-search'">选择司机</a>
						<lable> <!-- <font color="red" style="margin-right:10px">*</font> -->
						车牌号:<input id="canum" class="search-text" type="hidden"
							name="car_id" /> <!-- <font color="red" style="margin-right:10px">*</font> -->
						</lable>
						<input id="car" class="search-text" name="car_number1"
							readonly="true" /> 司机:<input id="driver" name="car_name"
							class="search-text" readonly="true" /> <input id="driverid"
							class="search-text" name="driverid" type="hidden" />
						<lable> <lable class="divlabel">联系方式:<input
							id="phones" name="phone_number" class=" search-text "></lable> <lable
							id="beizhu">协议备注:</lable> <input id="note" class="testStyle"
							name="remarks_send" /> <input id="user" type="hidden"
							class="testStyle" name="create_user" /> <input id="num"
							type="hidden" class="testStyle" name="number" />
					</div>
				</fieldset>
		</div>
		<!-- 导出条件 -->
		<input type="hidden" name="agreementId" id="agreementId"> 
		<input type="hidden" name="orderIds" id="agId"> <input
			type="hidden" name="method" value="outAgreementShipp">
		<div region="center">
			<div id="dg" title="运单信息">
				
			</div>
			<div id="tb">
			<a href="javascript:void(0)" id="dgremove" class="easyui-linkbutton"
					data-options="iconCls:'icon-remove',plain:true"
					onclick="deletefrom()">删除</a>
				<a href="javascript:void(0)" class="easyui-linkbutton"
				id="outputCar_owner" data-options="iconCls:'icon-output',plain:true"
				onclick="putoutfile()">导出</a>
			</div>
		</div>

		<input type="hidden" id="goods_weight" name="goods_weight"> <input
			type="hidden" id="goods_vol" name="goods_vol"> <input
			type="hidden" id="goods_num" name="goods_num"> <input
			type="hidden" id="all_destination_fee" name="all_destination_fee">
		<input type="hidden" id="all_transportation_fee"
			name="all_transportation_fee"> <input type="hidden"
			id="all_trade_agency" name="all_trade_agency"> <input
			type="hidden" id="all_handling_charge" name="all_handling_charge">
		<input type="hidden" id="all_back_fee" name="all_back_fee"> <input
			type="hidden" id="all_change_handling" name="all_change_handling">
		<input type="hidden" id="all_change_pay" name="all_change_pay">
	</form>
</body>
</html>