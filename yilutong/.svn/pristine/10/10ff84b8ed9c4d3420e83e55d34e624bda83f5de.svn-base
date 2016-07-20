<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.model.ShippingManual"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
 <head>
    <base href="<%=basePath%>">
    
    <title>易路通物流有限公司货物运单打印</title>
  <link href="./images/print.ico" type=image/x-icon rel="shortcut icon" />
  <script type="text/javascript" src="./easyui/jquery.min.js"></script>
  <script type="text/javascript" src="./js/jqprint/jquery-migrate-1.1.0.js"></script>
  <script type="text/javascript" src="./js/jqprint/jquery.jqprint-0.3.js"></script>
 </head>
 <script type="text/javascript">
 function  a(){
$("#printinfo").jqprint();
}</script>
  
   <% ShippingManual sp=(ShippingManual)request.getAttribute("sp"); %> 
<style type="text/css">
.norightborder {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: solid;
}
.noleftandright {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: none;
	border-bottom-style: solid;
	border-left-style: none;
}
.noleft {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: none;
}
.havebor {
	border-top-width: 1px;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
}
td{
	border-collapse:inherit;}

</style>
<script type="text/javascript">
	$(function(){	
			function zhuanhua(input){
			  input=input+"";
			  var l=input.length;
			  var a=new Array(l);
			  var b=new Array(l);
			  var result="";
			        for(var i=0;i<l;i++)
			  {
			     a[i]=input.substr(i,1);
			     b[i]=getchinese(a[i]);     
			     result+=b[i];
			  } 
				 if(result.length==1){
					$("#yuan").text(" "+result+" ");
				}else if(result.length==2){
					$("#yuan").text(" "+result.substring(1,2)+" ");
					$("#shi").text(" "+result.substring(0,1)+" ");
				}else if(result.length==3){
					$("#bai").text(" "+result.substring(0,1)+" ");
					$("#shi").text(" "+result.substring(1,2)+" ");
					$("#yuan").text(" "+result.substring(2,3)+" ");
				}
				else if(result.length==4){
					$("#qian").text(" "+result.substring(0,1)+" ");
					$("#bai").text(" "+result.substring(1,2)+" ");
					$("#shi").text(" "+result.substring(2,3)+" ");
					$("#yuan").text(" "+result.substring(3,4)+" ");
				}
				else if(result.length==5){
					$("#wan").text(result.substring(0,1)+" ");
					$("#qian").text(" "+result.substring(1,2)+" ");
					$("#bai").text(" "+result.substring(2,3)+" ");
					$("#shi").text(" "+result.substring(3,4)+" ");
					$("#yuan").text(" "+result.substring(4,5)+" ");
				} 
			}
			 
			function getchinese(p)
			{
			    var input=p;
			 if(input=="0")
			     return "零";
			    else if(input=="1")
			     return "壹";
			 else if(input=="2")
			     return "贰";
			 else if(input=="3")
			     return "叁";
			 else if(input=="4")
			     return "肆";
			 else if(input=="5")
			     return "伍";
			 else if(input=="6")
			  return "陆";
			 else if(input=="7")
			     return "柒";
			 else if(input=="8")
			     return "捌";
			 else if(input=="9")
			     return "玖";
			}
		 var input=${sp.transport_pay};	
			zhuanhua(input);
			
});
</script>
</head>

<body>
<input type="button" onclick="a()" value="打印" style="float: right"/>
<table width="749" id="printinfo">
<tr>
	<td width="104" style="font-weight:bold">NO.A0003021</td>
    <td width="112"><img src="./images/bsupmaxlogo.png" width="110"></td>
    <td width="315"><div style="text-align: center; font-size: 20px;letter-spacing: 10px;font-weight: bold;">
    山东速迈物流有限公司<br />公路货物运单</div></td>
    <td width="202" align="right"><div style=" border: 1px solid;  letter-spacing: 20px;  width: 200px;  font-weight: bold;">
    服务标准化<br />标准产业化</div></td>
    <td rowspan="5"><div style=" font-size:9px;width: 15px;     float: right;    transform: scale(0.6);">第一联 存根︵<br />白<br />︶ 第二联 发货客户︵<br />红<br />︶ 第三联 记账︵<br />黄<br />︶ 第四联 回执︵<br />蓝<br />︶ 第五联 收货客户︵<br />绿<br />︶</div></td>
</tr>
<tr>
	<td>起运地：${sp.send_station}</td>
    <td></td>
    <td>到达地：${sp.end_address}</td>
    <td><span>${fn:substring(sp.order_time,0,4)}年${fn:substring(sp.order_time,5,7)}月${fn:substring(sp.order_time,8,10)}日</span></td>
</tr>
<tr>
	<td colspan="4" style="height: 410px;">
            <table width="744" height="410" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="95" class="norightborder">托运方：</td>
                <td width="113" class="noleftandright">&nbsp;${sp.custom_name}</td>
                <td width="98" class="noleftandright">电话：</td>
                <td colspan="3" class="noleftandright">&nbsp;${sp.seller_phone}</td>
                <td width="114" class="noleftandright">手机：</td>
                <td colspan="3" class="noleft">&nbsp;${sp.check_phone}</td>
              </tr>
              <tr>
                <td class="norightborder">收货方：</td>
                <td class="noleftandright">&nbsp;${sp.receipt}</td>
                <td class="noleftandright">电话：</td>
                <td colspan="3" class="noleftandright">&nbsp;${sp.receipt_tel}</td>
                <td class="noleftandright">手机：</td>
                <td colspan="3" class="noleft">&nbsp;${sp.receipt_phone}</td>
              </tr>
              <tr>
                <td colspan="2" class="norightborder">收货单位地址：</td>
                <td colspan="8" class="noleft">${sp.receipt_address}</td>
              </tr>
              <tr>
                <td class="norightborder">货物名称：</td>
                <td class="noleft">&nbsp;${sp.goods_name}</td>
                <td colspan="2"><div align="center">自</div></td>
                <td colspan="2"><div align="center">至</div></td>
                <td class="norightborder"><div align="center">计费标准</div></td>
                <td colspan="3" class="noleft">&nbsp;</td>
              </tr>
              <tr>
                <td class="norightborder">包装：</td>
                <td class="noleft">&nbsp;${sp.goods_packing}</td>
                <td><div align="center">发货人网点</div></td>
                <td width="33">&nbsp;${sp.checktype}</td>
                <td width="51"><div align="center">送货</div></td>
                <td width="36">&nbsp;${sp.sendtype1}</td>
                <td><div align="center">提货费</div></td>
                <td width="63">&nbsp;<%-- ${sp.take_fee} --%></td>
                <td width="54"><div align="center">送货费</div></td>
                <td width="62">&nbsp;<%-- ${sp.send_fee} --%></td>
              </tr>
              <tr>
                <td class="norightborder">总件数：</td>
                <td class="noleft">&nbsp;${sp.goods_num}</td>
                <td><div align="center">汽运货运站</div></td>
                <td>&nbsp;${sp.checktype1}</td>
                <td><div align="center">自提</div></td>
                <td>&nbsp;${sp.sendtype}</td>
                <td><div align="center">装卸费</div></td>
                <td>&nbsp;<%-- ${sp.adorn_fee} --%></td>
                <td><div align="center">干线费</div></td>
                <td>&nbsp;<%-- ${sp.trunk_fee} --%></td>
              </tr>
              <tr>
                <td class="norightborder">总重量：</td>
                <td class="noleft">&nbsp;${sp.goods_weight}</td>
                <td class="norightborder">接货车</td>
                <td colspan="3" class="noleft">&nbsp;${sp.plate_number}</td>
                <td class="norightborder">保险费</td>
                <td colspan="3" class="noleft">&nbsp;&nbsp;${sp.insurance}</td>
              </tr>
              <tr>
                <td class="norightborder">总体积：</td>
                <td class="noleft">&nbsp;${sp.goods_vol}</td>
                <td class="norightborder">规格(米)</td>
                <td colspan="3" class="noleft">&nbsp;${sp.spe}</td>
                <td class="norightborder">付费方式：</td>
                <td colspan="3" class="noleft">&nbsp;${sp.paytype}</td>
              </tr>
              <tr>
                <td rowspan="2" align="center"><img src="login.do?method=getQrcode&content=http://182.92.4.57:8080/surmax/apk/surmax.apk"/></td>
                <td rowspan="2" class="norightborder"><div align="center">备注：</div></td>
                <td colspan="4" rowspan="2" class="noleft">&nbsp;${sp.remarks}</td>
                <td class="norightborder">运费总额：</td>
                <td colspan="3" class="noleft">&nbsp;${sp.transport_pay}</td>
              </tr>
              <tr>
                <td height="54" colspan="4">大写：<label id="wan">&nbsp;</label>万<label id="qian">&nbsp;</label>仟<label id="bai">&nbsp;</label>佰<label id="shi">&nbsp;</label>拾<label id="yuan">&nbsp;</label>元</td>
              </tr>
              <tr>
                <td class="norightborder">收货人签收：</td>
                <td class="noleftandright">&nbsp;</td>
                <td class="noleftandright">身份证号码：</td>
                <td colspan="4" class="noleftandright">&nbsp;</td>
                <td class="noleftandright">公章：</td>
                <td colspan="2" class="noleft">&nbsp;</td>
              </tr>
              <tr>
                <td rowspan="2">托运须知：</td>
                <td height="25" colspan="9">1凭托运人提供的收货单位、收货人的印鉴和身份证交货，其他交接或单据要求须声明。</td>
              </tr>
              <tr>
                <td height="29" colspan="9">
                2托运人须阅读并确认运单背面的《货物运输协议书》，欢迎针对服务质量向我司反馈。</td>
              </tr>
        </table>		
    </td>
</tr>
<tr>
	<td colspan="4">地址：青岛市城阳区双元路6号港贸物流园 环湾大道双元路上海口辅道<span style="    font-weight: bold;  margin-left: 100px;">碎物品保丢不保损</span><br />电话：4006-33-5656</td>
</tr>
<tr>
	<td>制单人：${sp.shipping_order}</td>
    <td></td>
    <td>入库：</td>
    <td>托运人签字：</td>
   </tr>

</table>
</body>
</html>
  
