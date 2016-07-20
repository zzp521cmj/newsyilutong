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
<title>协议信息管理选择运单</title>
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
<!-- 	<script type="text/javascript" src="./js/function.js"></script>命名按钮方法  -->


</head>
<script type="text/javascript">
    var dialog;
    var grid;
    $(function(){
        $("#type").combobox("setText","全部");//赋值
        grid=$("#dg").datagrid({
            url : 'createA.do?method=getShipOrderCA',
            border : false,
            rownumbers : true,
            fit : true,
            singleSelect : false,
            selectOnCheck : true,
            checkOnSelect :true,
            multiSort:true,
            /* 	remoteSort:true, */
            columns : [[
                //{field : 'ck',checkbox : true},
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
  				{field : 'goods_num',title : '件数',width : 60,align:'center'},
  				{field : 'goods_weight',title : '重量',width : 60,align:'center'},
  				{field : 'goods_vol',title : '体积',width : 60,align:'center'},
  				{field : 'destination_fee',title : '到付款',width : 80,align:'center',sortable:'true'},
  				{field : 'picking_fee',title : '运费',width : 80,align:'center',sortable:'true'},
  				{field : 'freight_fee',title : '提货费',width : 80,align:'center',sortable:'true'},
  				
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
   				{field : 'back_fee',title : '返款',width : 70,align:'center',sortable:'true'}, 		
   				//{field : 'duty_rate',title : '税率',width : 70,align:'center',sortable:'true'},
   				
  				{field : 'trade_agency',title : '代收货款',width : 70,align:'center'},
                {field : 'shouxu_feelv',title : '费率',width : 70,align:'center',sortable:'true'},   				
   				{field : 'handling_charge',title : '手续费',width : 70,align:'center',sortable:'true'},
   				{field : 'daohuo_time',title : '到货时间',width : 70,align:'center',sortable:'true'},
   				{field : 'trade_agency_stata',title : '手续费付款方式',width : 70,align:'center',sortable:'true',
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
  				{field : 'transport_mode',title : '运输方式', width : 80,align :'center',sortable:'true',
  				    formatter:function(val,row,index){
  						if(val==0){
  							return "普快";
  						}else if(val==1){
  						
  						return "特快";
  						}
  					}
  				},
  				/* 
  				{field : 'shiping_check',title : '运单核对状态', width : 80,align :'center',sortable:'true',
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
            onSelect:function(index,data){
                var selectuser=$("#selectuser").text();
                var selectuserid=$("#selectuserid").text();
                /* if(selectuser.indexOf(data.shiping_order_num)!=-1){
                 $.messager.alert("警告","不可以选择重复运单",'info');
                 return;
                 } */
                if(selectuser=="请选择"){
                    $("#selectuser").text("");
                    $("#selectuserid").text("");
                }
                if($("#selectuser").text()!=""){
                    $("#selectuser").append(",");
                    $("#selectuserid").append(",");
                }
                if(data.shiping_order_id!=null&&data.shiping_order_id!=""){
                    if($("#channelId").text()!=""){
                        $("#channelId").append(",");
                    }
                    $("#channelId").append(data.shiping_order_id);
                }
                $("#selectuser").append(data.shiping_order_num);
                $("#selectuserid").append(data.shiping_order_id);
                /* 	$("#cnid").val($("#channelId").text());
                 $("#message_touserid").val($("#selectuserid").text());
                 $("#message_tousername").val($("#selectuser").text()); */
                $('#dg').datagrid('deleteRow', index);
            },
            pagination:true,//分页
            pageSize:10,
            pageList:[5,10,15,20],
            toolbar : '#tb'
        });


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
                $("#pay_type").combobox("setValue","");
                $("#perpole").val("");
                $("#end_address").val("");
                $("#send_address").val("");
                $("#phone_number").val("");
            } else {
                $('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
                $('.easyui-layout').layout('resize');
                btnMoreSearch.text("更多条件");
                btnMoreSearch.attr("state", "close");
                $("#searchInfoId").css("display","none");
                $("#pay_type").combobox("setValue","");
                $("#perpole").val("");
                $("#end_address").val("");
                $("#send_address").val("");
                $("#phone_number").val("");
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
            ddId:$.trim($("#ddId").val()),
           // order_state:$.trim($("#order_state").combobox("getValue")),
            pay_type:$.trim($("#pay_type").combobox("getValue")),
            perpole:$.trim($("#perpole").val()),
            end_address:$.trim($("#end_address").val()),
            send_address:$.trim($("#send_address").val()),
            //institution:$.trim($("#cc3").combotree("getValue")),
            phone_number:$.trim($("#phone_number").val()),
            send_type:$.trim($("#send_type").combobox("getValue")),
        });

    }
    function clearuser(){
        if($("#selectuser").text()!="请选择"){
            $("#selectuser").text("请选择");
            $("#selectuserid").text("");
            $("#channelId").text("");
            $("#message_touserid").val("");
            $("#message_tousername").val("");
            $("#cnid").val("");
            $("#dg").datagrid('clearSelections');
            $("#dg").datagrid('reload');
        }
    }
    //删除
    function deleteEver(){
        var checkarray=[];
        var array = $('#dg').datagrid('getSelections');
        for(var i=0;i<array.length;i++){
            checkarray.push(array[i].shiping_order_id);
        }
        if(array != ""){
            $.messager.confirm('确认','您确定要删除选中的记录吗？',function(r){
                if (r){
                    $.ajax({
                        url: "order.do?method=deleteShipOrder",
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
        }else{
            $.messager.alert("请选择要删除的信息");
        }
    }

    //详情查询
    function xiangxixinxi(){
        var row=$("#dg").datagrid('getSelections');
        if(row.length==1){
            for(var i=0;i<row.length;i++){
                var id=row[i].shiping_order_id;
            }
            dialog = parent.jy.modalDialog({
                title : '协议详情',
                url : 'shipOrder.do?method=getShipOrderPage&pid=' + id,
                width : 680,
                buttons : [{
                    handler : function() {
                        dialog.find('iframe').get(0).contentWindow.submitFormEdit(dialog, grid, parent.$);
                    }
                }]
            });
        }else{
            $.messager.alert("请选择一行信息");
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
            if(col.field!="check_type"&&col.field!="send_type"){
                colName.push(col.title);//把title列名到数组里去
                fieldName.push(col.field); //把field列属性名到数组里去
            }
        }
        $("#fieldName").val(fieldName.join(","));
        $("#headtitle").val(colName.join(","));
        var outputform=$("#outputform");
        outputform.submit();
    }

    //制作协议
    function addShipOrder() {
        var checkarray=[];
        var array = $('#dg').datagrid('getSelections');

        if($("#selectuserid").text()!=""){
            checkarray=$("#selectuserid").text().split(",");
        }else if(array.length!=0){
            for(var i=0;i<array.length;i++){
                checkarray.push(array[i].shiping_order_id);
            }
        }

        if(!($("#selectuserid").text()==""&&array.length==0)){
            dialog = parent.jy.modalDialog({
                title : '协议制作',
                url : 'createA.do?method=getEditCreateAgreePage&pid='+checkarray,
                height : 600,
                width : 1100,
                id:"company",
                buttons : [{
                    text : '<input type="button" class="btncss" value="保存"/>',
                    handler : function() {
                        dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
                    }
                }],
               onDestroy:function(){
                    $("#selectuser").text("请选择");
                    $("#selectuserid").text("");
                    $("#channelId").text("");
                    $("#message_touserid").val("");
                    $("#message_tousername").val("");
                    $("#cnid").val("");
                    $("#dg").datagrid('clearSelections');
                    $("#dg").datagrid('reload');
                }
            });
        }else{
            $.messager.alert("协议制作","请选择一条信息");
        }

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
            $.messager.alert("请选择一行信息");
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
        $("#startDate").val("");
        $("#endDate").val("");
        $("#ddId").val("");
        $("#order_state").combobox("setValue","");
        $("#pay_type").combobox("setValue","");
        $("#order_state").combobox("setValue","");
        $("#perpole").val("");
        $("#end_address").val("");
        $("#send_address").val("");
        $("#phone_number").val("");
    }
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
            $("#startDate").val("");
            $("#endDate").val("");
        } else {
            $('.easyui-layout').layout('panel', 'north').panel('resize',{height:60});
            $('.easyui-layout').layout('resize');
            btnMoreSearch.text("更多条件");
            btnMoreSearch.attr("state", "close");
            $("#searchInfoId").css("display","none");
        }
    });
    //拆分运单
    function splitShipper(){
        var checkarray=[];
        var array = $('#dg').datagrid('getSelections');

        if($("#selectuserid").text()!=""){
            checkarray=$("#selectuserid").text().split(",");
        }else if(array.length!=0){
            for(var i=0;i<array.length;i++){
                checkarray.push(array[i].shiping_order_id);
            }
        }
        if($("#selectuserid").text()!=""&&checkarray.length==1){
            dialog = parent.jy.modalDialog({
                title : '协议制作',
                url : 'createA.do?method=getSplitShipperPage&pid='+checkarray,
                height : 600,
                width : 1100,
                buttons : [{
                    text : '<input type="button" class="btncss" value="保存"/>',
                    handler : function() {
                        dialog.find('iframe').get(0).contentWindow.submitForm(dialog, grid, parent.$);
                    }
                }],
                onDestroy:function(){
                    $("#selectuser").text("请选择");
                    $("#selectuserid").text("");
                    $("#channelId").text("");
                    $("#message_touserid").val("");
                    $("#message_tousername").val("");
                    $("#cnid").val("");
                    $("#dg").datagrid('clearSelections');
                    $("#dg").datagrid('reload');
                }
            });
        }else{
            $.messager.alert("协议制作","请选择一条信息");
        }
    }

</script>
<body class="easyui-layout">
	<form action="shipOrder.do" id="outputform" method="post">
		<div region="north" title="检索" class="st-north" border="false"
			height="60px" collapsible="false">
			<lable>发车日期:</lable>
			<input id="startDate" class="Wdate" readonly="readonly"
				style="width:150px;height:22px; "
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			- <input id="endDate" class="Wdate" readonly="readonly"
				style="width:150px;height:22px;"
				onfocus="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
			<lable class="divlabel">运单编号:</lable>
			<input type="text" class="search-text" id="ddId" style="width:150px">
			<lable class="divlabel">交接方式:</lable>
			<select class="easyui-combobox" id="send_type"
				name="send_type" style="width:150px;"
				data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">客户自提</option>
				<option id="" value="1">专车送货</option>
				<option id="" value="2">送货进仓</option>
				<option id="" value="3">送货上楼</option>
				<option id="" value="4">送货上门</option>
			</select> 
		<!-- 	<lable class="divlabel">运单状态:</lable>
			<select class="easyui-combobox" id="order_state"
				name="agreement_type" style="width:150px;"
				data-options="panelHeight : 'auto',editable:false">
				<option id="" value="">全部</option>
				<option id="" value="0">未出库</option>
				<option id="" value="1">配送中</option>
				<option id="" value="2">转运中</option>
				<option id="" value="3">签收</option>
				<option id="" value="4">已到达</option>
			</select>  --><a class="easyui-linkbutton" onclick="searchCar_owner()"
				data-options="iconCls:'icon-search'">查询</a> <a id="btnMoreSearch"
				class="btn btn-sm btn-link" type="button" style="margin-top:16px;"
				href="javascript:void(0)" state="close">更多条件</a>
			<div id="searchInfoId" style="display: none">
				<lable>付款方式:</lable>
				<select class="easyui-combobox" id="pay_type" name="agreement_type"
					style="width:150px;"
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
				<lable class="divlabel">收货人:</lable>
				<input type="text" class="search-text" style="width:150px"
					id="perpole">
				<!--<lable>所属机构:</lable>
            <input id="cc3" name="did">-->
				<lable>到站:</lable>
				<input type="text" class="search-text" id="send_address">
				<lable>发站:</lable>
				<input type="text" class="search-text" style="width:150px"
					id="end_address">
				<lable>电话:</lable>
				<input type="text" class="search-text" style="width:150px"
					id="phone_number">
			</div>
		</div>
		<div region="center">
			<table id="dg" title="运单信息"></table>
		</div>
		<div id="tb">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true"
				onclick="addShipOrder()">制作协议</a> <a href="javascript:void(0)"
				class="easyui-linkbutton"
				data-options="iconCls:'icon-add',plain:true"
				onclick="splitShipper()">拆分运单</a>
			<!--<a href="javascript:void(0)" class="easyui-linkbutton" id="getUpdateCar_owner" data-options="iconCls:'icon-edit',plain:true"onclick="getUpdateCar_owner()">修改</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="deleteShipOrder()">删除</a>
     <a href="javascript:void(0)"	class="easyui-linkbutton" data-options="iconCls:'icon-input',plain:true" onclick="showIcons()" id="tbru"style="display: none">导入</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" id="outputCar_owner" data-options="iconCls:'icon-output',plain:true" onclick="putoutfile()">导出</a>
       <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="getShipOrderPage()">详细</a>
         <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true"   onclick="daShipOrder()">打印</a> -->
			<tr style='margin: 20px;'>
				<td><font color="red" style="margin-right:10px">*</font>选择运单:</td>
				<td class="td2"><span id="selectuser"
					style="word-wrap:break-word;word-break:break-all;">请选择</span>&nbsp;&nbsp;<img
					alt="清除" src="./images/clear.png"
					style="cursor: pointer;width: 10px;height: 10px;"
					onclick="clearuser()"> <span id="selectuserid"
					style="display: none;"></span> <span id="channelId"
					style="display: none;"></span> <!-- <input type="hidden" id="message_touserid" name="message_touser">
                <input type="hidden" id="message_tousername" name="message_tousername">
                <input type="hidden" id="cnid" name="channelId"> -->
			</tr>
		</div>
		<input type="hidden" name="method" value="outShipOrder"> <input
			type="hidden" id="fieldName" name="fieldName"> <input
			type="hidden" id="headtitle" name="headtitle">
	</form>
</body>
</html>