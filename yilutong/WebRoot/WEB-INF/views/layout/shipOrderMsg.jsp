<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.model.Delivery"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.jy.common.SessionInfo" %>
<%@ page import="com.jy.model.User" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>订单信息</title>

 <link href="./images/print.ico" type=image/x-icon rel="shortcut icon" />
 <link rel="stylesheet" type="text/css" href="./css/main.css">
	<link rel="stylesheet" type="text/css" href="./css/tableCss.css">
<script type="text/javascript" src="./easyui/jquery.min.js"></script>
 <script type="text/javascript" src="./js/jqprint/jquery-migrate-1.1.0.js"></script>
  <script type="text/javascript" src="./js/jqprint/jquery.jqprint-0.3.js"></script>
  <link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
    <script type="text/javascript" src="./js/select2/select2.js"></script>
    <script type="text/javascript" src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
   <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   
   
<%--    <link rel="stylesheet" type="text/css" href="./css/main.css">
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
    <script type="text/javascript" src="./js/select2/select2.js"></script>
	<link rel="stylesheet" type="text/css" href="./css/tableCss.css"> --%>

     <script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<style type="text/css">
.STYLE3 {font-size: x-small}
	.bgurang{
 		  background: rgb(242, 242, 242);
  		font-size: 10px;
  		text-align: center;
  		  border-color: rgb(110, 110, 110);
	}
	.window{
  	background-color: #EFF3F7;
  	}
	.bgurangtable{
	 background: rgb(242, 242, 242);
  		font-size: 10px;
  		  text-align: right;
  		  border-color: rgb(110, 110, 110);
	}
	.bgurangtb{
	 background: rgb(242, 242, 242);
  		font-size: 10px;
  			color: blue;
  		  text-align: left;
  		border-color: rgb(110, 110, 110);
	}
	.bgurangtbs{
	 background: rgb(242, 242, 242);
  		color: blue;
  		font-size: 13px;
  		  text-align: center;
  		border-color: rgb(110, 110, 110);
	}
	.sixes{
		font-size: 14px;
	}
	.btncss{  background-color: #B7D9F5;
		  border: 1px solid #CFDFEC;
		  display: inline-block;
		  cursor: pointer;
		  color: #060606;
		  font-family: Arial;
		  font-size: 14px;
		  padding: 5px 28px;
		  text-decoration: none;
		  transition: all 0.5s;
		  -moz-transition: all 0.5s;
		  -webkit-transition: all 0.5s;
		  -o-transition: all 0.5s;}
</style>
</head>
<%
		Delivery sp=(Delivery)request.getAttribute("sp"); 
		User user=(User)request.getSession().getAttribute(SessionInfo.SessionName);
 %>
 <script type="text/javascript">
 	var remakesOrder="";
 	var shiping_order_num='${sp.shiping_order_num}';
 	var remarks_order='<%=user.getUsername()%>';
 	var pid = '${sp.shiping_order_id}';
 	$(function(){
  			$.ajax({
			//url : 'shipOrder.do?method=getUpdateShipOrder',
			data : {
				id : pid
			},
			success : function(data) {
			 if(data.plate_number==null){
					//$("#carid").select2("val",'');
				}else{
					//$("#carid").prev("div").find("span.select2-chosen").text(data.plate_number); 
				}	
				$('#Regform').form('load', data);
			}
		}); 
 	/* $('#tt').tabs({  
    border:false,  
    onSelect:function(title){  
        if(title=="运单详细信息"){
        }else{
       
      	
					var dialog;
 		var grid;
  		$(function(){
  			grid=$("#dg").datagrid({
  			url : 'collect.do?method=selectSettement&shiping_order_num=' + shiping_order_num,
  			border : false,
  			rownumbers : true,
  			fit : true,
  			singleSelect : false,
  			selectOnCheck : true,
  			checkOnSelect :true,
  			height:200,
  			multiSort:true,
  			
  					columns : [[
  				{field : 'ck',checkbox : true},
  				{field : 'write_project',title : '核销项目',width : 100,align:'center'},
  				{field : 'write_data',title : '核销日期',width : 100,align:'center'},
  				{field : 'write_money',title : '核销金额',width : 100,align:'center'},
  				{field : 'write_people',title : '核销人',width : 100,align:'center'},
  				{field : 'shiping_order_num',title : '运单号',width : 100,align:'center'},
  				{field : 'write_fangshi',title : '核销方式',width : 100,align:'center',
  					formatter:function(val,row,index){
  						if(val==0 ){
  							return "打卡";
  						}else if(val==1){
  						return "现金";
  						}else if(val==3){
  						return "未核销";
  						}
  					}},
  					{field : 'remarks',title : '备注',width : 100,align:'center'},
  			]],
  			
  		pagination : true,//分页
							pageSize : 10,
							pageList : [ 5, 10, 15, 20 ],
							toolbar : '#tb'
		   
  		});
  		
  	});
        }
    }  
});   */

 	
 	
 	$('#dlg1').dialog({
			title : '修改',
			width : 420,
			height : 190,
			closed : true,
			cache : false,
			modal : true,
			buttons : '#buttons'
		});

			$("#order_id").val('${sp.shiping_order_id}');
			var state ='${sp.shipping_order_state}';
				var type ='${sp.agreement_type}';
			if(state==0){
				$("#send").text("");
				$("#num").text("");
			}
		 	if(type!=1){
				$("#datetime").text("");
				$("#agreement_number").text("");
				$("#car_number1").text("");
				$("#car_name").text("");
				$("#phone_number").text("");
				$("#create_user").text("");
				$("#num").text("");
				$("#send").text("");
				$("#remarks_send").text("");
			} 
			var company='${sp.company_name }';
			var shishou='${sp.reality_sum}';
			if(company==null||company==''){
				$("#changedate").text("");
				$("#user1").text("");		
			}
				if(shishou==null||shishou==''){
				$("#shishou").text("");	
			}
			
 	});
 	function getRemakesOrder(){
 		var pid='${sp.shiping_order_id}';
 		var date = new Date();
		var remarks_date = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate()+' '+date.getHours()+':'+date.getMinutes()+':'+date.getSeconds();
 		var remakesOrder=$("#remakesOrder").val(); 
 			if(remakesOrder!=""||remakesOrder!=null){
 					$.messager.confirm('确认','您确定要修改备注吗？',function(r){ 
								  	if (r){					   	
										 $.ajax({
						 				type:"POST",
						 				url:'orderC.do?method=getRemakesOrder',
						 				data:{
						 				pid:pid,
						 				notes:remakesOrder,
						 				remarks_orde:remarks_order,
						 				remarks_date:remarks_date
						 				},
						 				success:function(data){
						 						if (data.flag) {
													parent.$.messager.alert("信息修改","备注信息修改成功",'info');
														$("#dlg1").dialog('close');
														
															$("#remarks").text(remakesOrder+"      "+remarks_order+"       "+remarks_date);
													}
						 					}
						 				});		   	
							  	 }
						});
 		}else{
  			$.messager.alert("备注修改","备注信息不能为空","info");
  		}	
		 	
 	
 	}
 	function addrrrr(){
				$("#remakesOrder").val("");				
				$("#dlg1").dialog('open');
			}	
	
  		
  	
 </script>
<body>
<form action="" method="post" id="Regform">
<!--  <div class="easyui-tabs" id="tt">
 <div title="运单详细信息" id="order" > -->	
		
	<%-- 	<table class="tableclasss" >
				<tr>
				<td colspan="14" align="left" ><b></b></td>
				</tr>
 				<tr>

					<td class="td5">委托时间:</td>
					  <td colspan="2" class="td5">
					   <input class="Wdate" onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="" name=""  value="${sp.weituo_time}"/>
					  </td>
				    <td>委托单号:</td>
				    <td colspan="2" class="td5">
				        <input type="text"  id="weitoudanhao" name="weitoudanhao" value="${sp.weitoudanhao}">
				    </td>
				    <td>交接方式：</td>
					<td class="td5"><select id='send' class="combobox" name="send_type"  data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">自提</option>
							<option id="" value="1">送货</option>
					</select> 
					</td>
				    <td >
				    运单号:</td>
					<td colspan="2"  class="td5"><input type="text" class="validate[required]" id="num"
						name="shiping_order_num" value="${sp.shiping_order_num}"></td>
	 
					<td colspan="4"></td>
				</tr>
			
		 		<tr>
				   <th colspan="14"><b>发货人</b></th>				    
				</tr>
				 <tr>
				 <td >单位名称:</td>
					<td colspan="2" class="td5"><input type="text"  id="" name="fhdanweiname" value="${sp.fhdanweiname}"></td>
				 	<td >发货联系人:</td>
					<td colspan="2" class="td5">
					    <input type="text"  id="custom_name" name="custom_name" value="${sp.custom_name}">
					</td>	 		
					 <td >发货人电话:</td>
					<td colspan="2" class="td5"><input type="text"  class="validate[required]" id=""
						name="send_phone" value="${sp.send_phone}"></td>  
				    <td >发货人手机:</td>
					<td colspan="2" class="td5"><input type="text"  id=""
						name="send_shouji" value="${sp.send_shouji}"></td> 
					<td>发站:</td>
					<td class="td5"><input type="text" id=""
						name="send_station" value="${sp.send_station}">			
				    </td>
				</tr>	
					 <tr>
					<td colspan="2" >发货详细地址：</td>	
					<td colspan="6" class="td5">
					<input type="text" name="fahuo_address" value="${sp.fahuo_address}"></input>
					</td>
					<td colspan="6"></td>
				</tr> 
			<tr>
				   <th colspan="14" ><b>收货人</b></th>				    
				</tr>
				<tr>
				 <td colspan="2">单位名称:</td>
					<td class="td5">
					    <input type="text"   id="" name="shdanweiname" value="${sp.shdanweiname}"></td>					
					<td >收货人名称：</td>
					<td colspan="2" class="td5">
					    <input type="text" id=""
						name="receipt" value="${sp.receipt}"></td>
				    <td >收货人电话：</td>
					<td  colspan="2" class="td5">
					    <input type="text" id=""
						name="receipt_tel" value="${sp.receipt_tel}"></td>
				    <td >收货人手机：</td>
					<td colspan="2" class="td5">
					    <input type="text"   id=""
						name="receipt_phone" value="${sp.receipt_phone}">
					</td>
 					<td class="td4" >到站:</td>
					<td class="td5"><input type="text" id="" name="end_address" value="${sp.end_address}">			
				    </td>
				</tr>
				<tr>
					<td colspan="2">收货详细地址：</td>	
					<td colspan="6" class="td5">
					<input  type="text" name="receipt_address" value="${sp.receipt_address}"></input>
					</td>
				</tr> 
 			    <tr> 
				<!-- <th colspan="4">运单基本信息</th> 
				</tr> -->
				<tr>
					<td>货品名称</td>															
					<td>包装</td>
					<td>总件数</td>
					<td>总重量(公斤)</td>
					<td>总体积(立方米)</td>
					<td>运费</td>
					<td>提货费</td>
					<td>装卸费</td>
					<td>上楼费</td>
					<td>直送费</td>
					<td>理货费</td>
				    <td>开箱验货费</td>
				    <td>其他费</td>
				    <td>付费方式：</td>				
				</tr>
				<tr>
					<td class="td5"><input   type="text"   name="goods_name" value="${sp.goods_name}"/></td>				
					<td class="td5"><input  type="text" name="goods_packing" value="${sp.goods_packing}"/></td>
					<td class="td5"><input  type="text"  type="text" name="goods_num" value="${sp.goods_num}"/></td>
					<td class="td5"><input type="text"  type="text" name="goods_weight" value="${sp.goods_weight}"/></td>	
				    <td class="td5"><input type="text"  type="text"  name="goods_vol" value="${sp.goods_vol}"/></td>
				    <td class="td5"><input id="freight_fee" type="text" name="freight_fee" value="${sp.freight_fee}"/></td>
				    <td class="td5"><input id="picking_fee" type="text" name="picking_fee" value="${sp.picking_fee}"/></td>
				   	<td class="td5"><input id="receivable_ground_fee" type="text" name="receivable_ground_fee" value="${sp.receivable_ground_fee}"/></td>
				   	<td class="td5"><input id="upstairs_fee" type="text" name="upstairs_fee" value="${sp.upstairs_fee}"/></td>			
					<td class="td5"><input id="deliver_fee" type="text" name="deliver_fee" value="${sp.deliver_fee}"/></td>
					<td class="td5"><input id="seized_fee" type="text"   name="seized_fee" value="${sp.seized_fee}"/></td>			
					<td class="td5"><input id="inspect_fee" type="text"   name="inspect_fee" value="${sp.inspect_fee}"/></td>
					<td class="td5"><input id="adorn_fee"  type="text"  name="adorn_fee" value="${sp.adorn_fee}"/></td>
					<td class="td5">
					     <select id='type' class="combobox" name="pay_type"  data-options="panelHeight : 'auto',editable:false">
								<option id="" value="0">回付</option>
								<option id="" value="1">提付</option>
								<option id="" value="2">现付</option>
								<option id="" value="3">货到前付</option>
								<option id="" value="6">货到付款</option>
								<option id="" value="4">发货方月结</option>
								<option id="" value="5">收货方月结</option>					
						 </select>
					</td>
			   </tr>
			    <tr>
					<td >投保价值</td>
					<td >费率</td>
					<td >保价费</td>
					<td >代收货款</td> 
					<td >费率</td>	
					<td >手续费</td> 			
                    <td>付款方式</td>				  
				    <td colspan="2" >到货时间</td> 
				    <td>代收运费</td>	
					<td >运费总额</td>					
					<td >返款</td>
				    <td>付款方式</td>	
				    <td >要发票</td>
				</tr>				
				<tr>
					<td class="td5">
					    <input id="affirm_value" type="text" name="affirm_value" value="${sp.affirm_value}"/></td>	
					<td class="td5">
					    <input id="rates"  type="text" style="width: 50px"  value="5"  name="rates" value="${sp.rates}"/><font  style="size: 15">‰</font></td>
			        <td class="td5">
					     <input id="insurance_fee" type="text"  name="insurance_fee" value="${sp.insurance_fee}"/></td>
						<td class="td5">
					    <input type="text" name="trade_agency" id="trade_agency" value="${sp.trade_agency}">
                    </td>
                    <td class="td5">
					    <input type="text" id="shouxu_feelv" style="width: 50px"   name="shouxu_feelv" value="${sp.shouxu_feelv}"/>‰
				   </td>
                    <td class="td5">
					    <input type="text"  id="handling_charge"  name="handling_charge" value="${sp.handling_charge}"/>
				   </td> 
                    <td class="td5">
                        <select id='type' class="combobox" name="trade_agency_stata"  data-options="panelHeight : 'auto',editable:false" >
							<option id="" value="0">现付</option>
							<option id="" value="1">到付</option>
					    </select>
                    </td>
				   <td colspan="2" class="td5">
				        <input class="Wdate" onfocus="WdatePicker({isShowWeek:true,dateFmt:'yyyy-MM-dd HH:mm:ss'})" id="" name="daohuo_time" value="${sp.daohuo_time}"/>
				   </td>
				   
                    <td class="td5"><input id="destination_fee" type="text" name="destination_fee" value="${sp.destination_fee}"/></td>						   			   
                    
				    <td  class="td5"><input   type="text" id="transport_pay"	name="transport_pay" value="${sp.transport_pay}"/> 				   
					<td class="td5"><input id="back_fee" type="text" name="back_fee" value="${sp.back_fee}"/></td>						   			
				    <td class="td5">
                        <select id='type' class="combobox" name="fankuan_stata"  data-options="panelHeight : 'auto',editable:false">
							<option id="" value="0">现反</option>
							<option id="" value="1">到反</option>
					    </select>
                    </td>
					<td  class="td5">
					     <select id='state'  class="combobox" name="invoice_state"  data-options="panelHeight : 'auto',editable:false">
					         <option id="" value="0">是</option>
							 <option id="" value="1">否</option>

					    </select>
					</td>
					
					
			   </tr> 
			   <tr>
					<td >应收备注：</td>
					<td colspan="6" class="td5">
					<input type="text" name="remarks_fee" value="${sp.remarks_fee}"></input>
					</td>
					<td colspan="7"></td>
				</tr>
			   <tr>
			   		<td id="">控货：</td>
					<td colspan="2">
	                    <input type="radio"  name="konghuo" value="1" style="width:15px" >&nbsp;是 &nbsp;
					    <input type="radio"  name="konghuo" value="0" style="width:15px" checked = "true">&nbsp;否
					</td>	
				    <td >要回单：</td>
					<td colspan="2">
					    <input type="radio"  name="is_recept_no" value="1" style="width:15px" onclick="rideroo(this)">&nbsp;是 &nbsp;
					    <input type="radio"  name="is_recept_no" value="0" style="width:15px" onclick="rideroo1(this)">&nbsp;否
					</td>
					 <td id="is_recept_id">回单份数：</td>
					<td class="td5"><input type="text"  id="is_recept"  name="is_recept"  value="${sp.is_recept}">
					</td>
				   <td id="">急货：</td>
					<td class="td" colspan="2">
	                    <input type="radio"  name="most_urgent" value="1" style="width:15px" >&nbsp;是 &nbsp;
					    <input type="radio"  name="most_urgent" value="0" style="width:15px" checked = "true">&nbsp;否
					</td>	
					<td >运单打印：</td> 
				    <td class="td" colspan="2">
				        <input type="checkbox"  name="printed" value="1" style="width:15px" >机打运单  &nbsp;&nbsp;
					    <input type="checkbox"  name="printed" value="0" style="width:15px" >机打标签
					</td>
				</tr>
				<tr>
					<td >备注:</td>
					<td colspan="6" class="td6">
					<textarea class="easyui-textarea" cols="45" rows="2" name="remarks" id="remakesOrder" value="${sp.remarks}"></textarea>
					</td>
					<td colspan="2"><input type="button" onclick="getRemakesOrder()" value="修改" class="btncss"/></td> 
					<td colspan="5"></td>
				</tr>
				<tr>
				    <td>受理网点:</td>
				    <td colspan="2" class="td5">
				        <input type="text" id="shouliwangdian" name="shouliwangdian" value="${sp.shouliwangdian}"/>
				    </td>
				     <td>制单人</td>
				    <td colspan="2" class="td5">
				        <input type="text" id="user" name="shipping_order_name" value="${sp.shipping_order_name}"/>
				    </td>
				    <td>包装人</td>
				    <td colspan="2" class="td5">
				        <input type="text" id="" name="baozhuang_name" value="${sp.baozhuang_name}"/>
				    </td>
				    <td>业务员</td>
				    <td colspan="2" class="td5">
				        <input type="text" id="" name="yewuyuan" value="${sp.yewuyuan}"/>
				    </td>
				    <td colspan="2"></td>
				</tr> 
				<tr>
				    <td rowspan="2"><p>配载<p/><p>信息</p></td>
				     <td>车牌号</td>
				     <td>司机姓名</td>
				     <td>司机电话</td>
				     <td>配载员</td>
				     <td>发站</td>
				     <td>到站</td>
				     <td>合同编号</td>
				     <td>发车日期</td>
				     <td>件数</td>
				     <td>到达日期</td>
				     <td colspan="3"></td>				    
				</tr>
				<tr>			    
				    <td class="td5"><input type="text" name="car_number" id="" value="${sp.car_number}"/></td>
				    <td class="td5"><input type="text" name="driver_name" id="" value="${sp.create_time}"/></td>
				    <td class="td5"><input type="text" name="driver_phone" id="" value="${sp.driver_phone}"/></td>
				    <td class="td5"><input type="text" name="create_user" id="" value="${sp.create_user}"/></td>				  
				    <td class="td5"><input type="text" name="send_station" id="" value="${sp.send_station}"/></td>
				    <td class="td5"><input type="text" name="end_address" id="" value="${sp.end_address}"/></td>
				    <td class="td5"><input type="text" name="" id="" value=""/></td>
				    <td class="td5"><input type="text" name="send_time" id="" value="${sp.send_time}"/></td>
				    <td class="td5"><input type="text" name="goods_num" id="" value="${sp.goods_num}"/></td>
				    <td class="td5"><input type="text" name="receipt_time" id="" value="${sp.receipt_time}"/></td>
				    <td colspan="3"></td>	
				</tr>
				<tr>
				    <td rowspan="2"><p>中转公司信息</p></td>
				     <td>中转时间</td>
				     <td>中转公司</td>
				     <td>联系电话</td>
				     <td>到站联系电话</td>
				     <td>中转货号</td>
				     <td>经办人</td>
				     <td>中转费</td>
				     <td>中转其他费</td>
				     <td>签收日期</td>
				     <td>签收人</td>
				     <td colspan="3">签收备注</td>
				    	    
				</tr>
				<tr>			    
				    <td class="td5"><input type="text" name="create_time" id="" value="${sp.create_time}"/></td>
				    <td class="td5"><input type="text" name="company_name" id="" value="${sp.company_name}"/></td>
				    <td class="td5"><input type="text" name="start_phone" id="" value="${sp.start_phone}"/></td>
				    <td class="td5"><input type="text" name="create_user" id="" value="${sp.create_user}"/></td>				  
				    <td class="td5"><input type="text" name="end_phone" id="" value="${sp.end_phone}"/></td>
				    <td class="td5"><input type="text" name="company_number" id="" value="${sp.company_number}"/></td>
				    <td class="td5"><input type="text" name="create_user" id="" value="${sp.create_user}"/></td>
				    <td class="td5"><input type="text" name="change_pay" id="" value="${sp.change_pay}"/></td>
				    <td class="td5"><input type="text" name="change_other" id="" value="${sp.change_other}"/></td>
				    <td class="td5"><input type="text" name="sign_time" id="" value="${sp.sign_time}"/></td>
				    <td colspan="3" class="td5"><input type="text" name="sign_remarks" id="" value="${sp.sign_remarks}"/></td>	
				</tr>
				<tr>
				    <td rowspan="2"><p>客户车辆信息</p></td>
				     <td>客户名称</td>
				     <td>发站</td>
				     <td>发货车次</td>
				     <td>车牌号码</td>
				     <td>司机姓名</td>
				     <td>联系电话</td>
				     <td>发货日期</td>
				     <td>车到日起</td>
				     <td>应付装卸费</td>
				     <td>应受落地费</td>
				     <td colspan="3">大车备注</td>
				    	    
				</tr>
				<tr>			    
				    <td class="td5"><input type="text" name="" id="" value="${sp.custom_name }"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${sp.send_station }"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${sp.car_time }"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${sp.car_number }"/></td>				  
				    <td class="td5"><input type="text" name="" id="" value="${sp.driver_name }"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${sp.driver_phone }"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${fn:substring(sp.send_time,0,19)}"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${fn:substring(sp.receipt_time,0,19)}"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${sp.adorn_fee2 }"/></td>
				    <td class="td5"><input type="text" name="" id="" value="${sp.born_fee }"/></td>
				    <td colspan="3" class="td5"><input type="text" name="" id="" value="${sp.car_remarks }"/></td>	
				</tr>	
				<tr>
				   <td>送货日期</td>
				   <td>送货批次</td>
				   <td>送货车号</td>
				   <td>送货司机</td>
				   <td>司机电话</td>
				   <td>转送到</td>
				   <td>经办人</td>
				   <td>送货费</td>
				   <td>件数</td>
				   <td colspan="5">备注</td>
				</tr>	
				<tr>
				   <td class="td5"><input type="text" id="datetime" value="${fn:substring(sp.send_date,0,19)}"></input></td>
				   <td class="td5"><input type="text" id="agreement_number" value="${sp.agreement_number }"></input></td>
				   <td class="td5"><input type="text" id="car_number1" value="${sp.car_number1 }"></input></td>
				   <td class="td5"><input type="text" id="car_name" value="${sp.car_name }"></input></td>
				   <td class="td5"><input type="text" id="phone_number" value="${sp.phone_number }"></input></td>
				    <td class="td5"><input type="text" id="" ></input></td>
				   <td class="td5"><input type="text" id="create_user" value="${sp.create_user}"></input></td>
				   <td class="td5"><input type="text" id="send" value="${sp.send_fee1 }"></input></td>
				   <td class="td5"><input type="text" id="num" value="${sp.practiacl_num }"></input></td>
				   <td class="td5" colspan="5"><input type="text" id="remarks_send" value="${sp.remarks_send }"></input></td>
			    </tr>
			    <tr>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td colspan="5">&nbsp;</td>
				</tr>	
				<tr>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td>&nbsp;</td>
				   <td colspan="5">&nbsp;</td>
				</tr>				 	
			</table> 
			</form>--%>
 <table width="800"  border="0" class="sixes">
  <tr>
    <td width="83" height="25">运单状态：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;">${sp.order_states}</b></td>
    <td width="83">收货网点：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;"> ${sp.end_address}</b></td>
    <td width="78">运单号：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;">${sp.shiping_order_num}</b></td>
    <td  width="70">委托单号:</td>
    <td>&nbsp;<b style="color: red;font-size: 16px;">${sp.weitoudanhao}</b></td>
  </tr>
</table>
<table class="bgurang " width="1059" height="261" border="1" bordercolor="#000000"cellspacing="0" cellpadding="0"  >
  <tr>
    <td width="75" height="20">托运日期</td>
    <td height="20" colspan="4"  class="bgurangtbs">&nbsp;${fn:substring(sp.create_time,0,19)}</td>
    <td width="75" height="20">运行区间</td>
    <td height="20" colspan="5"  class="bgurangtbs">&nbsp;</td>
    <td width="60" height="20" >货号</td>
    <td height="20" colspan="6" class="bgurangtbs">&nbsp;</td>
  </tr>
 <tr>
  <td height="24">单位名称:</td>
   <td colspan="4">&nbsp;${sp.fhdanweiname}</td>
    <td height="24">托运人</td>
    <td colspan="5" class="bgurangtbs">&nbsp;${sp.custom_name }</td>
    <td>联系方式</td>
    <td colspan="7" class="bgurangtbs">&nbsp;${sp.driver_phone }</td>
  </tr>
  <tr>
  <td height="24">单位名称:</td>
  <td colspan="4">&nbsp;${sp.shdanweiname}</td>
    <td height="24">收货人</td> 
    <td colspan="5" class="bgurangtbs">&nbsp;${sp.receipt }</td>
    <td>联系方式</td>
    <td colspan="7 " class="bgurangtbs">&nbsp;${sp.receipt_tel }</td>
  </tr>
  <tr>
    <td height="28">收货地址</td>
    <td colspan="10" class="bgurangtbs" >&nbsp;${sp.receipt_address }</td>
    <td>代理到货</td>
    <td colspan="7" class="bgurangtbs">&nbsp;</td>
  </tr>
  <tr>
    <td height="31">品名</td>
    <td width="43">件数</td>
    <td width="67">剩余件数</td>
    <td width="49">包装</td>
    <td width="51">重量</td>
    <td>体积</td>
    <td width="65">代收货款</td>
    <td width="65">投保价值</td>
    <td width="58">保价费</td>
    <td width="74">基本运费</td>
    <td width="58">直送费</td>
    <td width="71">提货费</td>
    
    <td  width="71">上楼费</td>
    <td width="55">其他费<span class="STYLE3">（包装）</span></td>
    <td width="89">装卸费&nbsp;理货费</td>
    <td width="63">开箱验货费</td>
    <td width="79">回扣</td>
    <td  width="79">运费</td>

  </tr>
  <tr>
    <td height="29" class="bgurangtbs">${sp.goods_name }</td>
    <td class="bgurangtbs">${sp.goods_num }</td>
    <td class="bgurangtbs">${sp.overGoodsNum }</td>
    <td class="bgurangtbs">${sp.goods_packing }</td>
    <td class="bgurangtbs">${sp.goods_weight }</td>
    <td class="bgurangtbs">${sp.goods_vol }</td>
    <td class="bgurangtbs">${sp.trade_agency }</td>
    <td class="bgurangtbs">${sp.affirm_value}</td>
    <td class="bgurangtbs">${sp.insurance_fee }</td>
    <td class="bgurangtbs">${sp.picking_fee }</td>
    <td class="bgurangtbs">${sp.affirm_value }</td>
    <td class="bgurangtbs">${sp.deliver_fee }</td>
    <td class="bgurangtbs">${sp.upstairs_fee }</td>
    <td class="bgurangtbs">${sp.adorn_fee }</td>
    <td class="bgurangtbs">${sp.receivable_ground_fee }&nbsp;&nbsp;${sp.seized_fee }</td>
    <td class="bgurangtbs">${sp.inspect_fee }</td>
    <td class="bgurangtbs">${sp.back_fee }</td>
    <td class="bgurangtbs">${sp.freight_fee}</td>
  </tr>
  <tr>
    <td height="31"></td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
      <td>&nbsp;</td>
  </tr>
  <tr><!-- sp.paid 原来  提付 -->
    <td height="28" colspan="18">运费合计：<b style="color: red;font-size: 16px;">${sp.transport_pay}</b>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;付款方式：${sp.paytype }&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;现付：<b style="color: red;font-size: 16px;">${sp.xf_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp; 回付：<b style="color: red;font-size: 16px;">${sp.hf_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp;提付：<b style="color: red;font-size: 16px;">${sp.tf_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp;货到前付：<b style="color: red;font-size: 16px;">${sp.hdqf_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实收：<b style="color: red;font-size: 16px;">${sp.reality_sum}&nbsp; &nbsp;&nbsp;<label id="shishou">${sp.settl_yf}</label></b>&nbsp; &nbsp;&nbsp;${sp.write_remarks}</td>
  </tr>
  <tr>
    <td height="29" colspan="18">运输要求：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;交接方式：${sp.sendtype }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 回单要求：${sp.is_recept }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注：<label id="remarks">${sp.remarks }&nbsp;${sp.remarks_order }&nbsp;${fn:substring(sp.remarks_date,0,19)}</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button  id="modifybutton" onclick="addrrrr()">修改</button> </td>
  </tr>
  <tr>
    <td height="29" colspan="18"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 业务员：${sp.shipping_order_name }&nbsp;&nbsp;&nbsp;&nbsp;制单人：${sp.shipping_order_name }</td>
  </tr>
  <tr>
    <td rowspan="2"><p>配载</p>
    <p>信息</p></td>
    <td height="30px" colspan="2">车号</td>
    <td height="30px" colspan="2">司机 </td>
    <td height="30px"  colspan="2">司机电话</td>
    <td height="30px" >配载员</td> 
     <td height="30px"  >发站 </td>
    <td height="30px"   colspan="2">到站</td>
   <td height="30px">合同编号</td>
   <td height="30px"  colspan="3">发车日期</td>
    <td height="30px">件数<a></a>
    <td height="30px"  colspan="2">到达时间</td>
  </tr>
  <tr>
    <td height="30"  class="bgurangtbs"  colspan="2">${sp.car_number }</td> 
    <td height="30"  class="bgurangtbs"  colspan="2">${sp.driver_name }</td>
    <td height="30px" class="bgurangtbs"  colspan="2">${sp.driver_phone }</td>
    <td height="30px" class="bgurangtbs"  > ${sp.create_user }</td>
    <td height="30px" class="bgurangtbs" > ${sp.send_station } </td>
    <td height="30px" class="bgurangtbs"  colspan="2"> ${sp.end_address } </td>
    <td height="30px" class="bgurangtbs"> </td>
    <td height="30px" class="bgurangtbs"  colspan="3"> ${fn:substring(sp.send_time,0,19)}</td>
    <td height="30px" class="bgurangtbs"> ${sp.goods_num }</td>
    <td height="30px" class="bgurangtbs"  colspan="2"> ${fn:substring(sp.receipt_time,0,19)}</td>
  </tr>
</table>
	<table   class="bgurang " width="1059" height="203"  border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td width="503" height="203">
	<fieldset style="margin: 5px"> <legend>中转公司信息</legend>
	<table   class="bgurangtable"  width="98%" height="152" border="0" cellpadding="0" cellspacing="0">			
      <tr>
   	 <td height="30">中转时间：</td>
     <td height="30" class="bgurangtb"><label id="changedate">${fn:substring(sp.create_time,0,19)}</label></td>
      <td height="30">中转公司：</td>
       <td height="30" class="bgurangtb">${sp.company_name }</td>
  </tr>
  <tr>
    <td height="30">联系电话：</td>
    <td height="30" class="bgurangtb">${sp.start_phone }</td>
    <td height="30">到站联系电话：</td>
    <td height="30" class="bgurangtb">${sp.end_phone }</td>
  </tr>
  <tr>
    <td height="30">中转货号：</td>
     <td height="30" class="bgurangtb">${sp.company_number }</td>
      <td height="30">经办人：</td>
       <td height="30" class="bgurangtb"><label id="user1">${sp.create_user }</label></td>
  </tr>
  <tr>
    <td height="30">中转费：</td>
    <td height="30" class="bgurangtb">${sp.change_pay }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off_zh}</b></td>   
      <td height="30">中转其他费：</td>
       <td height="30" class="bgurangtb">${sp.change_other }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off_zh}</b></td>
  </tr>
  <tr>
    <td height="30">签收日期：</td>
    <td height="30" class="bgurangtb">${fn:substring(sp.sign_time,0,19)}</td>
    <td height="30">签收人：</td>
    <td height="30"class="bgurangtb">${sp.sign_user }</td>    
  </tr>
  <tr>
    <td height="30"  colspan="1">签收备注：</td>
      <td height="30"  colspan="3"  class="bgurangtb">${sp.sign_remarks }</td>
  </tr>

    </table>
    </fieldset></td>
    <td width="550"height="203">
    <fieldset style="margin: 5px"> 
    <legend>客户车辆信息</legend>
	<table  class="bgurangtable "  width="99%" height="152" border="0" cellpadding="0" cellspacing="0"  >
				
      <tr>
   	 <td height="30">客户名称：</td>
     <td height="30"  class="bgurangtb">${sp.custom_name }</td>
      <td height="30">发站：</td>
       <td height="30"  class="bgurangtb">${sp.send_station }</td>
  </tr>
  <tr>
    <td height="30">发车车次：</td>
    <td height="30"  class="bgurangtb">${sp.car_time }</td>
    <td height="30">车牌号：</td>
    <td height="30"  class="bgurangtb">${sp.car_number }</td>
  </tr>
  <tr>
    <td height="30">司机：</td>
     <td height="30"  class="bgurangtb">${sp.driver_name }</td>
      <td height="30">电话：</td>
       <td height="30"  class="bgurangtb">${sp.driver_phone }</td>
  </tr>
  <tr>
    <td height="30">发车日期：</td>
    <td height="30"  class="bgurangtb">${fn:substring(sp.send_time,0,19)}</td>
    <td height="30">车到日期：</td>
    <td height="30"  class="bgurangtb">${fn:substring(sp.receipt_time,0,19)}</td>
    
  </tr>
  <tr>
    <td height="30"  colspan="1">大车备注：</td>
      <td height="30"  colspan="3" class="bgurangtb">${sp.car_remarks }</td>
  </tr>
  <tr>
    <td height="30">应付装卸费：</td>
    <td height="30" class="bgurangtb">${sp.adorn_fee2 }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off_kh}</b></td>
    <td height="30">应收落地费：</td>
    <td height="30"  class="bgurangtb">${sp.born_fee }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off_kh}</b></td>    
  </tr> 
    </table>
      </fieldset>	
	</td>
  </tr>
</table>

<table  class="bgurang "  width="1060" border="1" bordercolor="#000000"cellspacing="0" cellpadding="0">
  <tr>
    <td width="93"  height="35" >送货日期</td>
    <td width="75">送货批次</td>
    <td width="77">送货车号</td>
    <td width="110">送货司机</td>
    <td width="143">司机电话</td>
    <td width="104">转送到</td>
    <td width="71">经办人</td>
    <td width="74">送货费</td>
    <td width="60">件数</td>
    <td width="231">备注</td>
  </tr>
  <tr>
    <td height="35"   class="bgurangtbs"><lable id="datetime">${fn:substring(sp.send_date,0,19)}</lable></td>
    <td  class="bgurangtbs"><lable id="agreement_number">${sp.agreement_number }</lable></td>
    <td  class="bgurangtbs"><lable id="car_number1">${sp.car_number1 }</lable></td>
    <td  class="bgurangtbs"><lable id="car_name">${sp.car_name }</lable></td>
    <td  class="bgurangtbs"><lable id="phone_number">${sp.phone_number }</lable></td>
    <td  class="bgurangtbs">&nbsp;</td>
    <td  class="bgurangtbs"><lable id="create_user">${sp.create_user}</lable></td>
    <td  class="bgurangtbs"><label id="send">${sp.send_fee1 }<b style="color: red;font-size: 16px;">${sp.write_off_sj}</b></label></td>
    <td  class="bgurangtbs"><label id="num">${sp.practiacl_num }</label></td>
    <td  class="bgurangtbs"><lable id="remarks_send">${sp.remarks_send }</lable></td>
  </tr>
  <tr>
    <td height="35">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr> 

</table>
 <div id="dlg1"  >   
		<table class="tableclass">
			<tr>
						<th colspan="3">修改备注</th>
			</tr>
			<tr>			
			<td><font color="red" style="margin-right:10px">*</font><label>修改备注：</label></td>
				<td colspan="2"  class="td2">
					<textarea class="easyui-textarea" cols="35" rows="2" id="remakesOrder"></textarea>
					<input type="hidden"   class="search-text"id="order_id">
					</td>
		</tr>
	</table>
  	<div  id="buttons"  >
  			<input type="button" onclick="getRemakesOrder()" value="修改" class="btncss"/>   
  	</div>	 
</div> 

 <div title="费用结算信息" id ="write">
		<div style="width: 1053px;height:300px">
    		<table id="dg"  ></table>
    	</div>
  <%--      	<div>
 <table width="1060"  border="0" class="sixes">
 <tr>
    <td width="83" height="25">寄出日期：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;">${sp.is_send_time}</b></td>
    <td width="83">回单日期：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;"> ${sp.is_recept_time}</b></td>
   
  </tr> 
</table>  
    	</div>  --%> 	
	</div> 
</form>	
	
</body>
</html>
