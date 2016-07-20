<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.text.*"%>
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
<title>拆分运单信息</title>
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
	margin-top: 10px;
}

.testStyle {
	vertical-align: middle;
	width: 150px;
	height: 22px
}
</style>

<script type="text/javascript" src="./js/json2.js"></script>
<script type="text/javascript" src="./js/jquery.easyui.patch.js"></script>
</head>
<%
String[] pid = (String[]) request.getAttribute("flg");
User user = (User) request.getSession().getAttribute(
SessionInfo.SessionName);
%>
<script type="text/javascript">
    var dialog;
    var grid,newgrid;
    var pid=[];
    var editval;
    var typeid=1;
    var index=[];
    var chanageType = [{ "value": "0", "text": "回付" }, { "value": "1", "text": "到付" }, { "value": "2", "text": "现付" }];
    <%for (int i = 0; i < pid.length; i++) {%>
        pid.push('<%=pid[i]%>');<%}%>
    pid = pid.join(",");
    $(function() {
        newgrid = $("#newdg").datagrid({
            //url : 'createA.do?method=getSplitShipOrderMessage&pid=' + pid,
            /* 	remoteSort:true, */
            singleSelect:true,
            toolbar : '#tb',
            //idField:'shiping_order_id',
            columns : [ [{field : 'send_time',title : '发车时间',width : 120,align:'center',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'weituo_time',title : '委托时间',width : 70,align:'center'},
   				{field : 'weitoudanhao',title : '委托单号',width : 70,align:'center'},
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'},
  				{field : 'fhdanweiname',title : '发货单位名称',width : 70,align:'center'},
  				{field : 'send_station',title : '发站',width : 100,align:'center'},
  				{field : 'custom_name',title : '发货客户名称',width : 80,align:'center'},
  				{field : 'send_phone',title : '发货人电话',width : 80,align:'center'},
   				{field : 'send_shouji',title : '发货人手机',width : 70,align:'center'},
   				{field : 'fahuo_address',title : '发货详细地址',width : 70,align:'center'},

  				{field : 'shdanweiname',title : '收货单位名称',width : 70,align:'center'},
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
  				{field : 'goods_packing',title : '包装',width : 60,align:'center'},
  				{field : 'goods_num',title : '件数',width : 60,align:'center',
  				   editor:{
                            type:'numberbox',
                            options:{
                                   precision:0,
                                validType:'goods_num'
                            }
                   }
  				},
  				{field : 'goods_weight',title : '重量',width : 60,align:'center',
  				   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'goods_weight'
                         }
                   }
  				
  				
  				},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center',
  				    editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'goods_vol'
                         }
                 }
  				},
  				{field : 'destination_fee',title : '到付款',width : 80,align:'center', 
  				     editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'destination_fee'
                         }
                     }
  				},
  				{field : 'picking_fee',title : '运费',width : 80,align:'center',
  				     editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'picking_fee'
                         }
                    }
  				},
  				{field : 'freight_fee',title : '提货费',width : 80,align:'center',
  				    editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'freight_fee'
                         }
                    }
  				},
  				{field : 'affirm_value',title : '投保价值',width : 70,align:'center',
  				    editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'affirm_value'
                         }
                    }
  				},
  				{field : 'rates',title : '投保费率',width : 70,align:'center',
  				    editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'rates'
                         }
                    }
  				},
  				{field : 'insurance_fee',title : '保价费',width : 80,align:'center'},
  				{field : 'adorn_fee',title : '其他费',width : 80,align:'center',
  				   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'adorn_fee'
                         }
                   }
  				},
  				{field : 'receivable_ground_fee', title : '装卸费', width : 80,align :'center',
  				   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'receivable_ground_fee'
                         }
                   }
  				},
  				{field : 'upstairs_fee',title : '上楼费', width : 80,align :'center',
  				   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'upstairs_fee'
                         }
                   }
  				},
  				{field : 'deliver_fee',title : '直送费', width : 80,align :'center', 
  				   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'deliver_fee'
                         }
                   }
  				},
  				{field : 'inspect_fee',title : '开箱验货费', width : 80,align :'center',
  				   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'deliver_fee'
                         }
                   }
  				
  				},
  				{field : 'seized_fee',title : '理货费', width : 80,align :'center',
  				  editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'seized_fee'
                         }
                   }
  				
  				},				
  				{field : 'transport_pay',title : '费用总额',width : 70,align:'center',},
   				{field : 'back_fee',title : '返款',width : 70,align:'center'}, 		
   				//{field : 'duty_rate',title : '税率',width : 70,align:'center'},
   				
  				{field : 'trade_agency',title : '代收货款',width : 70,align:'center',
  				   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'trade_agency'
                         }
                   }
  				},
                {field : 'shouxu_feelv',title : '费率',width : 70,align:'center',
                   editor:{
                         type:'numberbox',
                         options:{
                         	precision:2.00,
                            validType:'shouxu_feelv'
                         }
                   }
                },   				
   				{field : 'handling_charge',title : '手续费',width : 70,align:'center'},
   				{field : 'daohuo_time',title : '到货时间',width : 70,align:'center',},
   				{field : 'trade_agency_stata',title : '付款方式',width : 70,align:'center',
   				    formatter:function(val,row,index){
   				        if(val==0){
  							return "现付";
  						}else if(val==1){
  							return "到付";
  						}
   				    }
   				},
   				{field : 'konghuo',title : '控货 ',width : 70,align:'center',
   				    formatter:function(val,row,index){
   				        if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						}
   				    }
   				},		
  				{field : 'most_urgent',title : '急货',width : 70,align:'center',
  				    formatter:function(val,row,index){
  				           if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						} 
  				    }
  				},	
  				{field : 'printed',title : '运单打运',width : 70,align:'center',
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
  				},  
  				{field : 'is_recept',title : '回单份数',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "";
  						}else{
  						return val;
  						}
  					}
  				
  				},
  				{field : 'remarks',title : '备注',width : 90,align:'center'},
  				{field : 'stocks_predestination',title : '库存天数', width : 80,align :'center'},
  				{field : 'transport_mode',title : '运输方式', width : 80,align :'center',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "普快";
  						}else if(val==1){
  						
  						return "特快";
  						}
  					}
  				},
  				
  				{field : 'invoice_state',title : '是否开票', width : 80,align :'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "是";
  						}else if(val==1){
  						
  						return "否";
  						}
  					}
  				},
               {field : 'phone_state',title : '电话预约', width : 80,align :'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  						
  						return "是";
  						}
  					}
  				},  								
  				{field : 'is_order_arrive',title : '是否实际到达',width : 90,align:'center',
  					formatter: function(value,row,index){
  						if(value==0){
  							return "未到达";
  						}else if(value==1){
  							return "到达";
  						}
  					
  					}
  				
  				},
  				{field : 'creat_type',title : '创建方式', width : 80,align :'center',
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
  				{field : 'is_order_arrive',title : '到达状态', width : 80,align :'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未到达";
  						}else if(val==1){
  						
  						return "到达";
  						}
  					}
  				},
  				{field : 'remarks_fee',title : '应收备注',width : 90,align:'center'},
  				{field : 'appointment_remarks',title : '配送备注',width : 90,align:'center'},
   				{field : 'order_time',title : '录入时间',width : 80,align:'center'},
   				{field : 'time_appointment',title : '配送时间',width : 80,align:'center'},
   				{field : 'order_arrive_time',title : '实际到达时间',width : 80,align:'center'},
   				{field : 'shouliwangdian',title : '受理网店',width : 70,align:'center'},	
  				{field : 'baozhuang_name',title : '包装人',width : 70,align:'center'},	
  				{field : 'yewuyuan',title : '业务员',width : 70,align:'center'}, 				 				 	
  				{field : 'shipping_order_name',title : '制单人',width : 80,align:'center'},] ],
            onBeforeEdit:function(index,row){ //可编辑之前
                editval=index;
                row.editing = true;
            },
            onAfterEdit:function(index,row){//编辑关闭后
                var insurance_fee = Number(row.affirm_value)*Number(row.rates)/1000;//保价费
                var handling_charge=Number(row.trade_agency)*Number(row.shouxu_feelv)/1000;//手续费
               
                var transport_pay=Number(row.freight_fee)+Number(row.picking_fee)+Number(row.insurance_fee)
                +Number(row.adorn_fee)+Number(row.inspect_fee)+Number(row.seized_fee)+Number(row.deliver_fee)
                +Number(row.upstairs_fee)+Number(row.receivable_ground_fee);//总运费
                 var back_fee=Number(row.destination_fee)-transport_pay;//返款
                $('#newdg').datagrid("updateRow", {index:index,row:{
                insurance_fee:insurance_fee,handling_charge:handling_charge,back_fee:back_fee,transport_pay:transport_pay
                }});
                row.editing = false;
            },
            //单击事件
            onClickRow: function (rowIndex,rowData) {
                //单击开启编辑行
                if(editval!=rowIndex){
                    $("#newdg").datagrid("endEdit", editval);
                    $("#newdg").datagrid("beginEdit", rowIndex);
                    editval=rowIndex;
                } else{
                    editval=undefined;
                    $('#newdg').datagrid("endEdit", rowIndex);
                }
            },
            onLoadSuccess:function(){
            },
           
           /*  pagination : true,//分页
            pageSize : 10,
            pageList : [ 5, 10, 15, 20 ],*/
        });
        grid = $("#dg").datagrid({
            url : 'createA.do?method=getSplitShipOrderMessage&pid=' + pid,
            /* 	remoteSort:true, */
            columns : [ [
  				{field : 'send_time',title : '发车时间',width : 120,align:'center',
  				formatter: function(value,row,index){
  				if(value!=undefined){
  				value=value.substr(0,19);
  				}
  					return value;
  				} 				 
  				},
  				{field : 'weituo_time',title : '委托时间',width : 70,align:'center'},
   				{field : 'weitoudanhao',title : '委托单号',width : 70,align:'center'},
  				{field : 'shiping_order_num',title : '运单号',width : 60,align:'center'},
  				{field : 'fhdanweiname',title : '发货单位名称',width : 70,align:'center'},
  				{field : 'send_station',title : '发站',width : 100,align:'center'},
  				{field : 'custom_name',title : '发货客户名称',width : 80,align:'center'},
  				{field : 'send_phone',title : '发货人电话',width : 80,align:'center'},
   				{field : 'send_shouji',title : '发货人手机',width : 70,align:'center'},
   				{field : 'fahuo_address',title : '发货详细地址',width : 70,align:'center'},

  				{field : 'shdanweiname',title : '收货单位名称',width : 70,align:'center'},
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
  				{field : 'destination_fee',title : '到付款',width : 80,align:'center',
  				  formatter:function(val,row,index){
  						if(val!="" && val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'picking_fee',title : '运费',width : 80,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'freight_fee',title : '提货费',width : 80,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'affirm_value',title : '投保价值',width : 70,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'rates',title : '费率',width : 70,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "5";
  						}
  					}
  				},
  				{field : 'insurance_fee',title : '保价费',width : 80,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'adorn_fee',title : '其他费',width : 80,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'receivable_ground_fee', title : '装卸费', width : 80,align :'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'upstairs_fee',title : '上楼费', width : 80,align :'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'deliver_fee',title : '直送费', width : 80,align :'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'inspect_fee',title : '开箱验货费', width : 80,align :'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
  				{field : 'seized_fee',title : '理货费', width : 80,align :'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},				
  				{field : 'transport_pay',title : '费用总额',width : 70,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				
  				},
   				{field : 'back_fee',title : '返款',width : 70,align:'center',
   				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
   				}, 		
   				//{field : 'duty_rate',title : '税率',width : 70,align:'center'},
   				
  				{field : 'trade_agency',title : '代收货款',width : 70,align:'center',
  				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
  				},
                {field : 'shouxu_feelv',title : '费率',width : 70,align:'center',
                  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "5";
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
   				{field : 'daohuo_time',title : '到货时间',width : 70,align:'center',
   				  formatter:function(val,row,index){
  						if(val!=""&&val!=null){
  						   return val;
  						}else{
  						   return "0.00";
  						}
  					}
   				},
   				{field : 'trade_agency_stata',title : '付款方式',width : 70,align:'center',
   				    formatter:function(val,row,index){
   				        if(val==0){
  							return "现付";
  						}else if(val==1){
  							return "到付";
  						}
   				    }
   				},
   				{field : 'konghuo',title : '控货 ',align:'center',
   				    formatter:function(val,row,index){
   				        if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						}
   				    }
   				},		
  				{field : 'most_urgent',title : '急货',width : 70,align:'center',
  				    formatter:function(val,row,index){
  				           if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						} 
  				    }
  				},	
  				{field : 'printed',title : '运单打运',width : 70,align:'center',
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
  				},{field : 'is_recept_no',title : '要回单',width : 70,align:'center',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  							return "是";
  						}
  				    }
  				},   
  				{field : 'is_recept',title : '回单份数',width : 70,align:'center',
  					formatter:function(val,row,index){
  						if(val==0){
  							return "";
  						}else{
  						return val;
  						}
  					}
  				
  				},
  				{field : 'remarks',title : '备注',width : 90,align:'center'},
  				{field : 'stocks_predestination',title : '库存天数', width : 80,align :'center'},
  				{field : 'transport_mode',title : '运输方式', width : 80,align :'center',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "普快";
  						}else if(val==1){
  						
  						return "特快";
  						}
  					}
  				},
  				
  				{field : 'shiping_check',title : '运单核对状态', width : 80,align :'center',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "未核对";
  						}else if(val==1){
  						
  						return "已核对";
  						}
  					}
  				},
  				{field : 'invoice_state',title : '是否开票', width : 80,align :'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "是";
  						}else if(val==1){
  						
  						return "否";
  						}
  					}
  				},
               {field : 'phone_state',title : '电话预约', width : 80,align :'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "否";
  						}else if(val==1){
  						
  						return "是";
  						}
  					}
  				},  								
  				{field : 'is_order_arrive',title : '是否实际到达',width : 90,align:'center',
  					formatter: function(value,row,index){
  						if(value==0){
  							return "未到达";
  						}else if(value==1){
  							return "到达";
  						}
  					
  					}
  				
  				},
  				{field : 'creat_type',title : '创建方式', width : 80,align :'center',
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
  				{field : 'is_order_arrive',title : '到达状态', width : 80,align :'center',
  				formatter:function(val,row,index){
  						if(val==0){
  							return "未到达";
  						}else if(val==1){
  						
  						return "到达";
  						}
  					}
  				},
  				{field : 'remarks_fee',title : '应收备注',width : 90,align:'center'},
  				{field : 'appointment_remarks',title : '配送备注',width : 90,align:'center'},
   				{field : 'order_time',title : '录入时间',width : 80,align:'center'},
   				{field : 'time_appointment',title : '配送时间',width : 80,align:'center'},
   				{field : 'order_arrive_time',title : '实际到达时间',width : 80,align:'center'},
   				{field : 'shouliwangdian',title : '受理网店',width : 70,align:'center'},	
  				{field : 'baozhuang_name',title : '包装人',width : 70,align:'center'},	
  				{field : 'yewuyuan',title : '业务员',width : 70,align:'center'}, 				 				 	
  				{field : 'shipping_order_name',title : '制单人',width : 80,align:'center'},
  				] ],
            pagination : false,//分页
            onLoadSuccess : function(data) {
                /* var data = data.rows[0];
                 newgrid.datagrid('appendRow', {
                 shiping_order_num : data.shiping_order_num,
                 end_address : data.end_address,
                 receipt : data.receipt,
                 receipt_tel : data.receipt_tel,
                 pay_type : data.pay_type,
                 goods_name : data.goods_name,
                 send_type : data.send_type,
                 receipt_address : data.receipt_address
                 });
                 newgrid.datagrid('appendRow', {
                 shiping_order_num : data.shiping_order_num,
                 end_address : data.end_address,
                 receipt : data.receipt,
                 receipt_tel : data.receipt_tel,
                 pay_type : data.pay_type,
                 goods_name : data.goods_name,
                 send_type : data.send_type,
                 receipt_address : data.receipt_address
                 });
                 */
            }
        });

        /* //计算总金额
        function compute() {
            var rows = $('#dg').datagrid('getRows');//获取当前的数据行take_fee
            var total = 0;
            if (typeid == 0) {

            } else if (typeid == 1) {
                for ( var i = 0; i < rows.length; i++) {
                    total = Number(
                            Number(rows[i].send_fee)
                            + Number(rows[i].upstairs_fee)
                            + Number(total)).toFixed(2);
                }
            } else if (typeid == 2) {
                for ( var i = 0; i < rows.length; i++) {
                    total = Number(Number(rows[i].change_pay) + Number(total))
                            .toFixed(2);
                }
            }
            $("#alls").val(total);
        } */
        $('#cc3')
                .combotree(
                        {
                            url : "depn.do?method=getTree&&id=",
                            width : 150,
                            onBeforeLoad : function(node, param) {
                                if (node == null) {
                                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id=";//加载顶层节点
                                } else {
                                    $('#cc3').combotree('tree').tree('options').url = "depn.do?method=getTree&&id="
                                            + node.id;//加载下层节点
                                }
                            }
                        });
        //结束
    });
    //删除行
    function deleteShipOrder() {
        
        var row = newgrid.datagrid('getSelections');
       
        //var seRow=newgrid.datagrid('getSelected');
        if (row.length==1) {
            var rowIndex = newgrid.datagrid('getRowIndex', row[0]);
            newgrid.datagrid('deleteRow', rowIndex);
            newgrid.datagrid('reload');//删除后重新加载下

        }else{
            $.messager.alert('拆分运单', '请选择一条要删除的运单信息', 'info');
        }

    }
    //添加行
    function addShipOrder() {
        var data = grid.datagrid('getRows')[0];
        console.info(data);
        newgrid.datagrid('appendRow',{
        send_time:data.send_time,
        weituo_time:data.weituo_time,
        weitoudanhao:data.weitoudanhao,
        shiping_order_num:data.shiping_order_num,
        fhdanweiname:data.fhdanweiname,
        send_station:data.send_station,
        custom_name:data.custom_name,
        send_phone:data.send_phone,
        send_shouji:data.send_shouji,
        fahuo_address:data.fahuo_address,
        shdanweiname:data.shdanweiname,
        end_address:data.end_address,
        receipt:data.receipt,
        receipt_tel:data.receipt_tel,
        receipt_phone:data.receipt_phone,
        receipt_address:data.receipt_addres,
        send_type:data.send_type,
        goods_name:data.goods_name,
        goods_packing:data.goods_packing,
        goods_num:'0',
        goods_weight:'0.00',
        goods_vol:'0.00',
        destination_fee:data.destination_fee,
        picking_fee:data.picking_fee,
        freight_fee:data.freight_fee,
        affirm_value:data.affirm_value,
        rates:data.rates,
        insurance_fee:data.insurance_fee,
        adorn_fee:data.adorn_fee,
        receivable_ground_fee:data.receivable_ground_fee,
        upstairs_fee:data.upstairs_fee,
        deliver_fee:data.deliver_fee,
        inspect_fee:data.inspect_fee,
        seized_fee:data.seized_fee,
        transport_pay:data.transport_pay,back_fee:data.back_fee,
        trade_agency:data.trade_agency,
        shouxu_feelv:data.shouxu_feelv,
        handling_charge:data.handling_charge,
        daohuo_time:data.daohuo_time,
        trade_agency_stata:data.trade_agency_stata,
        konghuo:data.konghuo,
        most_urgent:data.most_urgent,
        printed:data.printed,
        pay_type:data.pay_type,
        shipping_order_state:data.shipping_order_state,
        is_recept:data.is_recept,
        remarks:data.remarks,
        stocks_predestination:data.stocks_predestination,
        transport_mode:data.transport_mode,
        invoice_state:data.invoice_state,
        phone_state:data.phone_state,
        is_order_arrive:data.is_order_arrive,
		creat_type:data.creat_type,
		remarks_fee:data.remarks_fee,
		appointment_remarks:data.appointment_remarks,
		order_time:data.order_time,
		time_appointment:data.time_appointment,
		order_arrive_time:data.order_arrive_time,
		shouliwangdian:data.shouliwangdian,
		baozhuang_name:data.baozhuang_name,
		yewuyuan:data.yewuyuan,
        shipping_order_name:data.shipping_order_name,
        is_recept_no:data.is_recept_no,
        is_split:'1'
        });

    }
    //修改行
    function updateShipOrder(){
        var data = newgrid.datagrid('getSelections');
        var json =JSON.stringify(data);
        if(data.length==1){
            dialog = parent.jy.modalDialog({
                title : '运单修改',
                url : 'createA.do?method=getSplitUpdateShipOrderMessage&rows'+json,
                width : 680,
                buttons : [{
                    text : '<input type="button" class="btncss" value="修改"/>',
                    handler : function() {
                        dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
                    }
                }]
            });
        }else{

        }
    }
    //关闭未关闭的可编辑行
    function endEdits() {
        var rows = $("#dg").datagrid('getRows');
        for ( var i = 0; i < rows.length; i++) {
            $("#dg").datagrid('endEdit', i);
        }
    }
    var submitForm = function($dialog, $grid, $pjq, $mainMenu) {
    endEdits();
        var oldData = grid.datagrid('getData').rows;
        var newData = newgrid.datagrid('getData').rows;
        var goodNum=0;
        var goodsWeight=0;
        var goodsVol=0;
        var oldGoodNum=oldData[0].goods_num;
        var oldGoodsWeight=oldData[0].goods_weight;
        var oldGoodsVol=oldData[0].goods_vol;
        
        var picking_fee=0;//运费
        var oldPicking_Fee=oldData[0].picking_fee;
        
        var freight_fee=0;//提货费
        var oldFreight_Fee=oldData[0].freight_fee;
        
        var insurance_fee=0;//保价费
        var oldInsurance_Fee=oldData[0].insurance_fee;
        
        var adorn_fee=0;//其他费
        var oldAdorn_Fee=oldData[0].adorn_fee;
        
        var receivable_ground_fee=0;//装卸费
        var oldReceivable_Ground_Fee=oldData[0].receivable_ground_fee;
        
        var upstairs_fee=0;//上楼费
        var oldUpstairs_Fee=oldData[0].upstairs_fee;
        
        var deliver_fee=0;//直送费
        var oldDeliver_Fee=oldData[0].deliver_fee;
        
        var inspect_fee=0;//开箱验货费
        var oldInspect_Fee=oldData[0].inspect_fee;
        
        var seized_fee=0;//理货费
        var oldSeized_Fee=oldData[0].seized_fee;
        
        var transport_pay=0;// 费用总额
        var oldTransport_Pay=oldData[0].transport_pay;
        
        var back_fee=0;//返款
        var oldBack_Fee=oldData[0].back_fee;
        
        var trade_agency=0;//代收货款
        var oldTrade_Agency=oldData[0].trade_agency;
        
        var handling_charge=0;//手续费
        var oldHandling_Charge=oldData[0].handling_charge;

        for(var i=0;i<newData.length;i++){
            goodNum= Number(Number(newData[i].goods_num)+Number(goodNum));
            goodsWeight=Number(Number(newData[i].goods_weight)+Number(goodsWeight));
            goodsVol=Number(Number(newData[i].goods_vol)+Number(goodsVol));
            picking_fee=Number(Number(newData[i].picking_fee)+Number(picking_fee));
            freight_fee=Number(Number(newData[i].freight_fee)+Number(freight_fee));
            insurance_fee=Number(Number(newData[i].insurance_fee)+Number(insurance_fee));
            adorn_fee=Number(Number(newData[i].adorn_fee)+Number(adorn_fee));
            receivable_ground_fee=Number(Number(newData[i].receivable_ground_fee)+Number(receivable_ground_fee));
            upstairs_fee=Number(Number(newData[i].upstairs_fee)+Number(upstairs_fee));
            deliver_fee=Number(Number(newData[i].deliver_fee)+Number(deliver_fee));
            inspect_fee=Number(Number(newData[i].inspect_fee)+Number(inspect_fee));
            seized_fee=Number(Number(newData[i].seized_fee)+Number(seized_fee));
            transport_pay=Number(Number(newData[i].transport_pay)+Number(transport_pay));
            back_fee=Number(Number(newData[i].back_fee)+Number(back_fee));
            trade_agency=Number(Number(newData[i].trade_agency)+Number(trade_agency));
            handling_charge=Number(Number(newData[i].handling_charge)+Number(handling_charge));
            
        }
        if(oldGoodNum!=goodNum){
            $pjq.messager.alert('拆分运单', '拆分运单数量的和与原运单数量不一致', 'info');
        }else if(oldGoodsWeight!=goodsWeight){
            $pjq.messager.alert('拆分运单', '拆分运单的重量和与原运单重量不一致', 'info');
        }else if(oldGoodsVol!=goodsVol){
            $pjq.messager.alert('拆分运单', '拆分运单体积和与原运单体积不一致', 'info');
       
        }else if(picking_fee!=oldPicking_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单运费和与原运单运费不一致', 'info');
        }else if(freight_fee!=oldFreight_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单提货费和与原运单提货费不一致', 'info');
        }else if(insurance_fee!=oldInsurance_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单保价费和与原运单保价费不一致', 'info');
        }else if(adorn_fee!=oldAdorn_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单其他费和与原运单其他费不一致', 'info');
        }else if(receivable_ground_fee!=oldReceivable_Ground_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单装卸费和与原运单装卸费不一致', 'info');
        }else if(upstairs_fee!=oldUpstairs_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单上楼费和与原运单上楼费不一致', 'info');
        }else if(deliver_fee!=oldDeliver_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单直送费和与原运单直送费不一致', 'info');
        }else if(inspect_fee!=oldInspect_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单开箱验货费和与原运单开箱验货费不一致', 'info');
        }else if(seized_fee!=oldSeized_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单理货费和与原运单理货费不一致', 'info');
        }else if(transport_pay!=oldTransport_Pay){
            $pjq.messager.alert('拆分运单', '拆分运单费用总额和与原运单费用总额不一致', 'info');
        }else if(back_fee!=oldBack_Fee){
            $pjq.messager.alert('拆分运单', '拆分运单返款和与原运单返款不一致', 'info');
        
        }else if(trade_agency!=oldTrade_Agency){
            $pjq.messager.alert('拆分运单', '拆分运单 代收货款和与原运单 代收货款不一致', 'info');
        }else if(handling_charge!=oldHandling_Charge){
            $pjq.messager.alert('拆分运单', '拆分运单 手续费和与原运单 手续费不一致', 'info');
        } else{
            var oldShippId=oldData[0].shiping_order_id;
            var newRows=JSON.stringify(newData);
            var win = $.messager.progress({
				title : '请稍等',
				msg : '正在拆分运单...',
				text : '正在拆分运单，请稍等...',
				interval : 500
			});
            $.ajax({
                type : "POST",
                url : 'createA.do?method=saveSplitShipOrderMessage',
                data :{oldShippId:oldShippId,
                       newRows:newRows
                },
                success : function(msg) {
                    if(msg){
                    $pjq.messager.alert('拆分运单', '拆单成功', 'info');
                        $dialog.dialog('close');
                        $grid.datagrid('reload');
                    }else{
                    $pjq.messager.alert('拆分运单', '拆单失败', 'info');
                        $dialog.dialog('close');
                        $grid.datagrid('reload');
                    }
                },
               error:function (XMLHttpRequest, textStatus, errorThrown) {
                        $.messager.progress('close');
                        $pjq.messager.alert('拆分运单', '拆单失败', 'info');
                       /*  $dialog.dialog('close');
                        $grid.datagrid('reload'); */
                } 
            });
        }

    };



</script>
<body class="easyui-layout">
	<form action="shipOrder.do" id="Regform" method="post">
		<div region="north" class="st-north" height="110px" border="false"
			collapsible="false">
			<table id="dg" title="原始运单信息"></table>
		</div>

		<div region="center" class="st-north" border="false"
			collapsible="false">

			<table id="newdg" title="新增运单信息" height="380px">
			</table>
		</div>
		<input type="hidden" id="dialog2" />
	</form>
	<div id="tb">
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-add',plain:true" onclick="addShipOrder()">添加</a>
		<!-- 		<a href="javascript:void(0)" class="easyui-linkbutton"
                id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"
                onclick="updateShipOrder()">修改</a> -->
		<a href="javascript:void(0)" class="easyui-linkbutton"
			data-options="iconCls:'icon-remove',plain:true"
			onclick="deleteShipOrder()">删除</a>
		<!--<a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>
   <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
   <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a>
     <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="daShipOrder()">打印</a>
    <tr style='margin: 20px;'>
        <td><font color="red" style="margin-right:10px">*</font>选择运单:</td>
        <td class="td2"><span id="selectuser" style="word-wrap:break-word;word-break:break-all;">请选择</span>&nbsp;&nbsp;<img alt="清除" src="./images/clear.png" style="cursor: pointer;width: 10px;height: 10px;" onclick="clearuser()">
            <span  id="selectuserid" style="display: none;"></span>
            <span  id="channelId" style="display: none;" ></span>
            <input type="hidden" id="message_touserid" name="message_touser">
            <input type="hidden" id="message_tousername" name="message_tousername">
            <input type="hidden" id="cnid" name="channelId"> -->
		</tr>
	</div>
	
</body>
</html>