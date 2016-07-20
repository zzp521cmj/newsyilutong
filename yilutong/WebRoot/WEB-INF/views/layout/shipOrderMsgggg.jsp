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
<script type="text/javascript" src="./easyui/jquery.min.js"></script>
 <script type="text/javascript" src="./js/jqprint/jquery-migrate-1.1.0.js"></script>
  <script type="text/javascript" src="./js/jqprint/jquery.jqprint-0.3.js"></script>
   <jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
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
 	$(function(){
 	$('#tt').tabs({  
    border:false,  
    onSelect:function(title){  
        if(title=="订单详细信息"){
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
  				{field : 'shiping_order_num',title : '订单号',width : 100,align:'center'},
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
});  
 	
 	
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
			var shishou='${sp.sum_pay}';
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
<div class="easyui-tabs" id="tt">
		<div title="订单详细信息" id="order" >
<table width="1060"  border="0" class="sixes">
  <tr>
    <td width="83" height="25">运单状态：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;">${sp.order_state}</b></td>
    <td width="83">收货网点：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;"> ${sp.end_address}</b></td>
    <td width="78">运单号：</td>
    <td width="270">&nbsp;<b style="color: red;font-size: 16px;">${sp.shiping_order_num}</b></td>
  </tr>
</table>
<table class="bgurang " width="1059" height="261" border="1" bordercolor="#000000"cellspacing="0" cellpadding="0"  >
  <tr>
    <td width="75" height="20">托运日期</td>
    <td height="20" colspan="4"  class="bgurangtbs">&nbsp;${fn:substring(sp.create_time,0,19)}</td>
    <td width="75" height="20">运行区间</td>
    <td height="20" colspan="5"  class="bgurangtbs">&nbsp;</td>
    <td width="60" height="20" >货号</td>
    <td height="20" colspan="4" class="bgurangtbs">&nbsp;</td>
  </tr>
 <tr>
    <td height="24">托运人</td>
    <td colspan="4" class="bgurangtbs">&nbsp;${sp.custom_name }</td>
    <td>联系方式</td>
    <td colspan="10" class="bgurangtbs">&nbsp;${sp.driver_phone }</td>
  </tr>
  <tr>
    <td height="24">收货人</td>
    <td colspan="4" class="bgurangtbs">&nbsp;${sp.receipt }</td>
    <td>联系方式</td>
    <td colspan="10" class="bgurangtbs">&nbsp;${sp.receipt_tel }</td>
  </tr>
  <tr>
    <td height="28">收货地址</td>
    <td colspan="10" class="bgurangtbs" >&nbsp;${sp.receipt_address }</td>
    <td>代理到货</td>
    <td colspan="4" class="bgurangtbs">&nbsp;</td>
  </tr>
  <tr>
    <td height="31">品名</td>
    <td width="43">件数</td>
    <td width="67">剩余件数</td>
    <td width="49">包装</td>
    <td width="51">重量</td>
    <td>体积</td>
    <td width="65">代收货款</td>
    <td width="58">保险费</td>
    <td width="74">基本运费</td>
    <td width="58">申明价值</td>
    <td width="71">送货费</td>
    <td>接货费</td>
    <td width="55">其他费<span class="STYLE3">（包装）</span></td>
    <td width="69">装卸费</td>
    <td width="63">叉车费</td>
    <td width="79">回扣</td>
  </tr>
  <tr>
    <td height="29" class="bgurangtb">${sp.goods_name }</td>
    <td class="bgurangtbs">${sp.goods_num }</td>
    <td class="bgurangtbs">${sp.overGoodsNum }</td>
    <td class="bgurangtbs">${sp.goods_packing }</td>
    <td class="bgurangtbs">${sp.goods_weight }</td>
    <td class="bgurangtbs">${sp.goods_vol }</td>
    <td class="bgurangtbs">${sp.trade_agency }</td>
    <td class="bgurangtbs">${sp.insurance }</td>
    <td class="bgurangtbs">&nbsp;${sp.transport_pay1 }</td>
    <td class="bgurangtbs">&nbsp;${sp.affirm_value }</td>
    <td class="bgurangtbs">&nbsp;${sp.send_fee1 }</td>
    <td class="bgurangtbs">&nbsp;${sp.send_fee }</td>
    <td class="bgurangtbs">&nbsp;${sp.adorn_fee }</td>
    <td class="bgurangtbs">&nbsp;${sp.ys_unloading_fee }</td>
    <td class="bgurangtbs">&nbsp;${sp.ys_unloading_fee }</td>
    <td class="bgurangtbs">&nbsp;${sp.back_fee }</td>
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
  </tr>
  <tr><!-- sp.paid 原来  提付 -->
    <td height="28" colspan="16">运费合计：<b style="color: red;font-size: 16px;">${sp.transport_pay}</b>&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;付款方式：${sp.paytype }&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;现付：<b style="color: red;font-size: 16px;">${sp.xf_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp; 回付：<b style="color: red;font-size: 16px;">${sp.hf_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp;提付：<b style="color: red;font-size: 16px;">${sp.transport_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp;货到前付：<b style="color: red;font-size: 16px;">${sp.hdqf_pay}</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;实收：<b style="color: red;font-size: 16px;">${sp.sum_pay}&nbsp; &nbsp;&nbsp;<label id="shishou">${sp.write_off_t}</label></b>&nbsp; &nbsp;&nbsp;${sp.write_remarks}</td>
  </tr>
  <tr>
    <td height="29" colspan="16">运输要求：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;交接方式：${sp.sendtype }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 回单要求：${sp.is_recept }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注：<label id="remarks">${sp.remarks }&nbsp;${sp.remarks_order }&nbsp;${fn:substring(sp.remarks_date,0,19)}</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button  id="modifybutton" onclick="addrrrr()">修改</button> </td>
  </tr>
  <tr>
    <td height="29" colspan="16"  >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 业务员：<%-- ${sp.shipping_order } --%>&nbsp;&nbsp;&nbsp;&nbsp;制单人：${sp.shipping_order }</td>
  </tr>
  <tr>
    <td rowspan="2"><p>配载</p>
    <p>信息</p></td>
    <td height="30" colspan="15">&nbsp;车号&nbsp;&nbsp;&nbsp;&nbsp;司机 &nbsp;&nbsp;&nbsp;&nbsp;司机电话&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;配载员 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发站 &nbsp;&nbsp;&nbsp;&nbsp;到站 &nbsp;&nbsp;&nbsp;&nbsp;合同编号 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发车日期&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;件数&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到达时间&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="30" colspan="15"  class="bgurangtbs">${sp.car_number }&nbsp;&nbsp;${sp.driver_name }&nbsp;&nbsp;&nbsp;${sp.driver_phone }&nbsp;&nbsp;&nbsp;&nbsp;${sp.create_user }&nbsp;&nbsp;&nbsp;&nbsp;${sp.send_station }&nbsp;&nbsp;${sp.end_address }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(sp.send_time,0,19)}&nbsp;&nbsp;${sp.practiacl_num }&nbsp;${fn:substring(sp.receipt_time,0,19)}</td>
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
    <td height="30" class="bgurangtb">${sp.change_pay }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off_c}</b></td>   
      <td height="30">中转其他费：</td>
       <td height="30" class="bgurangtb">${sp.change_other }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off_c}</b></td>
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
    <td height="30" class="bgurangtb">${sp.adorn_fee2 }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off_z}</b></td>
    <td height="30">应收落地费：</td>
    <td height="30"  class="bgurangtb">${sp.born_fee }&nbsp;<b style="color: red;font-size: 16px;">${sp.write_off3_l}</td>    
  </tr> 
    </table>
      </fieldset>	
	</td>
  </tr>
</table>

<table  class="bgurang "  width="1060" border="1" bordercolor="#000000"cellspacing="0" cellpadding="0">
  <tr>
    <td width="93" height="35" >送货日期</td>
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
    <td height="35"   class="bgurangtbs"><lable id="datetime">${fn:substring(sp.send_agreement_date,0,19)}</lable></td>
    <td  class="bgurangtbs"><lable id="agreement_number">${sp.agreement_number }</lable></td>
    <td  class="bgurangtbs"><lable id="car_number1">${sp.car_number1 }</lable></td>
    <td  class="bgurangtbs"><lable id="car_name">${sp.car_name }</lable></td>
    <td  class="bgurangtbs"><lable id="phone_number">${sp.phone_number }</lable></td>
    <td  class="bgurangtbs">&nbsp;</td>
    <td  class="bgurangtbs"><lable id="create_user">${sp.create_user}</lable></td>
    <td  class="bgurangtbs"><label id="send">${sp.send_fee1 }</label></td>
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
			<td><br></td>
		</tr>
	</table>
  	<div  id="buttons"  >
  			<input type="button" onclick="getRemakesOrder()" value="修改" class="btncss"/>   
  	</div>	
</div> 
</div>
	<div title="费用结算信息" id ="write">
		<div style="width: 1053px;height:300px">
    		<table id="dg"  ></table>
    	</div>
    	<div>
    <table width="1060"  border="0" class="sixes">
  <tr>
    <td width="83" height="25">寄出日期：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;">${sp.is_send_time}</b></td>
    <td width="83">回单日期：</td>
    <td width="150">&nbsp;<b style="color: red;font-size: 16px;"> ${sp.is_recept_time}</b></td>
  </tr>
</table>
    	
    	</div>
	</div>
	
	</div>
</body>
</html>
