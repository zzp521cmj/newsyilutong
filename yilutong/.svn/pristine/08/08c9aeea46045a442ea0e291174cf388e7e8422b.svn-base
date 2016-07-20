<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="com.jy.model.ShippingOrder"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html> 
 <head>
    <base href="<%=basePath%>">
    
    <title>天津易路通物流托运有限公司</title>
  <link href="./images/print.ico" type=image/x-icon rel="shortcut icon" />
<!-- <script type="text/javascript" src="./easyui/jquery.min.js"></script> -->

 <script type="text/javascript" src="./js/jquery-1.9.1.min.js"></script>

 <script type="text/javascript" src="./js/jQuery.print.js"></script>
 
<!--   <script type="text/javascript" src="./js/jqprint/jquery.jqprint-0.3.js"></script>
  <script type="text/javascript" src="./js/jqprint/jquery.jqprint-0.3.js"></script>
 -->  
 </head>
 <script type="text/javascript">
 function  a(){
	 
	 $("#printinfo").print({
		    globalStyles: false,
		    mediaPrint: false,
		 //  stylesheet:"./css/tablePrint.css" ,
		    noPrintSelector: ".noprint",
		    iframe: false,
		   // printContainer: true,
		   // append: null,
		  //  prepend: null,
		    //manuallyCopyFormValues: true,
		    //deferred: $.Deferred()
		 });
/* $("#printinfo").jqprint(); */
//$.print("#printinfo" /*, options*/);  
}

</script>
  
   <% ShippingOrder sp=(ShippingOrder)request.getAttribute("shipp"); %> 
<style type="text/css">
#div1{
position:absolute; 
    top: 105px;
    right: 705px;

}
p{
	display:inline;	
	font-size:2px;
	}
	.rqclass{
	margin-left:50px;
	}
	.btclass{margin-left:70px;}
	.titleclass{
	font-weight:2px;
	word-spacing:10px;
	letter-spacing:5px;
	padding-bottom:15px;
	}
	table tr td{
	border-color: black #000000 #000000 black; border-style: solid; border-top-width: 0px; border-right-width: 0px; border-bottom-width: 1px; border-left-width: 1px;
	font-size:2px;
	height:28px;
	}
/* .norightborder {
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
	border-collapse:inherit;} */
	.texts{
	text-align: center;
	}

</style>
<script type="text/javascript">
	$(function(){	
			function zhuanhua(input){
			  input=input+"";
			  var l=input.split(".")[0].length;
			  //var h=input.split(".")[1].length;
			  var a=new Array(l);
			  var b=new Array(l);
			  var result="";
			  for(var i=0;i<l;i++){
			     a[i]=input.substr(i,1);
			     b[i]=getchinese(a[i]);     
			     result+=b[i];
			  } 
				 if(result.length==1){
					$("#yuan").text(" "+result+" ");
				}else if(result.length==2){
					$("#yuan").text(" "+result.substring(0,1)+" ");
					$("#shi").text(" "+result.substring(1,2)+" ");
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
			 function zhuanhua1(input){
			  input=input+"";
			  var l=input.split(".")[0].length;
			  //var h=input.split(".")[1].length;
			  var a=new Array(l);
			  var b=new Array(l);
			  var result="";
			  for(var i=0;i<l;i++){
			     a[i]=input.substr(i,1);
			     b[i]=getchinese(a[i]);     
			     result+=b[i];
			  } 
				 if(result.length==1){
					$("#yuan1").text(" "+result+" ");
				}else if(result.length==2){
					$("#yuan1").text(" "+result.substring(0,1)+" ");
					$("#shi1").text(" "+result.substring(1,2)+" ");
				}else if(result.length==3){
					$("#bai1").text(" "+result.substring(0,1)+" ");
					$("#shi1").text(" "+result.substring(1,2)+" ");
					$("#yuan1").text(" "+result.substring(2,3)+" ");
				}
				else if(result.length==4){
					$("#qian1").text(" "+result.substring(0,1)+" ");
					$("#bai1").text(" "+result.substring(1,2)+" ");
					$("#shi1").text(" "+result.substring(2,3)+" ");
					$("#yuan1").text(" "+result.substring(3,4)+" ");
				}
				else if(result.length==5){
					$("#wan1").text(result.substring(0,1)+" ");
					$("#qian1").text(" "+result.substring(1,2)+" ");
					$("#bai1").text(" "+result.substring(2,3)+" ");
					$("#shi1").text(" "+result.substring(3,4)+" ");
					$("#yuan1").text(" "+result.substring(4,5)+" ");
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
		
		 var input1=${sp.transport_pay};	
		  var input = ${sp.trade_agency};
		 
			zhuanhua1(input1);
			zhuanhua(input);
			
			
});
</script>

</head>

<body style="background: url(./images/yilutong1.jpg)  no-repeat;" >
<input type="button" onclick="a()" value="打印" style="float: right"/>
<div id="printinfo" >
<div style="" id="div1">
    <span>${sp.send_station}</span>
</div>
<div style="position:absolute; top: 105px; right:640px;" id="div2" >
    <span>${sp.end_address}</span>
</div>
<div style="position:absolute; top: 105px; right:520px;" id="div3">
    <span>${sp.custom_name}</span>
</div>
</div>
 <%-- <table  width="80%" ;height="400px"  style="font-size: 1;border-width:1px;border-left: 1px; border-right: 1px;border-top: 1px; border-style: 1px; margin-left: 50px;" border="1"  cellspacing="0" cellpadding="0"  id="printinfo" >
    <tr>
	    <td colspan="2" rowspan="2" style="border-left: 0px; border-right-width: 0px;border-top: 0px;border-width:0px"  height="40" >
				<img src="./images/yltbig.png" class="noprint" width="150" height="30" class="noprint"/>
		</td >
		<td rowspan="2"  style="border-left-width: 0px; border-right: 0px;border-top: 0px;border-width:0px" height="40">
				<img src="./images/yltgzhs.png"  width="35" height="30" class="noprint"/>	
		</td>
		    <td colspan="3"  rowspan="2" align="center" style="font-size: 25;border:0px;"><b class="noprint">天津易路通物流托运单</b></td>		
		    <td align="center"  height="20px" width="120px"><label class="noprint">起运地</label></td>
			<td align="center"  height="20px" width="100px" colspan="2" ><label class="noprint">目的地</label></td>
		    <td align="center"  height="20px" width="120px"><label class="noprint">送货人</label></td>
	    </tr>
		<tr>
			<td height="20"  width="120px">${sp.send_station}</td>
			<td height="20" width="100px" colspan="2">${sp.end_address}</td>
			<td height="20" width="120px">${sp.custom_name}</td>
		</tr>
        <tr> 
			<td  colspan="3" height="20"  style="border-right-width: 0px;border-left-width: 0px;border-top: 0px; " height="20" align="left"><label class="noprint">发运时间:</label ><span style="margin-left: 40px">${fn:substring(sp.send_time,0,4)}</span><label  class="noprint">年</label><span style="margin-left: 45px">${fn:substring(sp.send_time,5,7)}</span><label  class="noprint">月</label><span style="margin-left: 50px">${fn:substring(sp.send_time,8,10)}</span><label  class="noprint">日</label></td>
			<td colspan="4" height="20"  style="border-left: 0px;border-top: 0px;"><label class="noprint">同城速运   仓配一体共   同配送</label></td> 
			<td  colspan="3" height="20" style="border-left: 0px;border-right: 0px;border-top: 0px;"><label class="noprint">运输单号：</label><span style="margin-left: 30px;">${sp.shiping_order_num}</span></td>
	   </tr> 	
       <tr>
           <td colspan="4" align="left" valign="top" height="20"   width="380px"> <label class="noprint">托运人信息</label></td>
           <td colspan="6"  align="left" height="20" width="420px"><label class="noprint">其他服务</label></td>
       </tr>
       <tr>
		   <td height="20"  width="120px"><label class="noprint">单位（姓名）</label></td>
		   <td colspan="3"  height="20"  width="250px">${sp.fhdanweiname}</td>
		   <td  height="20"   width="120px"><label class="noprint">是否签回单</label></td>
		   <td height="20"  width="120px"><label class="noprint">是</label><span style="margin-left: 10px">${sp.is_recept_no1} </span><label class="noprint">否</label><span style="margin-left: 35px">${sp.is_recept_no}</span></td>
		   <td height="20"  width="120px"><label class="noprint">回单份数</label></td>
		   <td height="20"  width="120px">${sp.is_recept}</td>
		   <td height="20" width="60px"><label class="noprint">签回单要求</label></td>
		   <td height="20"  width="120px">&nbsp;</td>
       </tr>
      <tr>
		   <td height="20"><label class="noprint">地址</label></td>
		   <td colspan="3">&nbsp;${sp.fahuo_address}</td>
		   <td colspan="6" align="left"><label class="noprint">费用信息</label></td>
      </tr>
      <tr>
		   <td height="20"><label class="noprint">电话</label></td>
		   <td>&nbsp;${sp.send_phone}</td>
		   <td><label class="noprint">VIP号</label></td>
		   <td >&nbsp;</td>
		   <td><label class="noprint">运费</label></td>
		   <td>&nbsp;${sp.freight_fee }</td>
		   <td rowspan="2"><label class="noprint">保价声明价值</label></td>
		   <td rowspan="2">&nbsp;${sp.affirm_value}</td>
		   <td ><label class="noprint">保价费</label></td>
		   <td>&nbsp;${sp.insurance_fee}</td>
      </tr>
      <tr>
		    <td colspan="4"  align="left" height="20"><label class="noprint">收货人信息</label></td>
		    <td><label class="noprint">装卸费</label></td>
		    <td>&nbsp;${sp.receivable_ground_fee}</td>
		    <td>&nbsp;</td>
		    <td colspan="2" ><label class="noprint">不投保</label>&nbsp;${sp.affirm_value1}<label class="noprint">投保</label>&nbsp;${sp.affirm_value2}</td>
	   </tr>
       <tr>
		    <td height="20"><label class="noprint">单位（姓名）</label></td>
		    <td colspan="3">&nbsp;${sp.shdanweiname}</td>
		    <td><label class="noprint">送货费 </label></td>
		    <td>&nbsp;${sp.deliver_fee}</td>
		    <td><label class="noprint">提货费</label></td>
		    <td>&nbsp;${sp.picking_fee}</td>
		    <td><label class="noprint">其他费</label></td>
		    <td>&nbsp;${sp.adorn_fee}</td>
        </tr>
        <tr>
		    <td height="20"><label class="noprint">地址</label></td>
		    <td colspan="3">&nbsp;${sp.receipt_address}</td>
		    <td><label class="noprint">付款方式</label></td>
		    <td colspan="5"><label class="noprint">现付</label>&nbsp;&nbsp;${sp.pay_type3} <label class="noprint">到付</label>&nbsp;&nbsp;${sp.pay_type2} <label class="noprint">月结</label>&nbsp;&nbsp;${sp.pay_type4}  <label class="noprint">回单付</label>&nbsp;&nbsp;${sp.pay_type1} </td>
		</tr>
		<tr>
		    <td height="20"><label class="noprint">电话</label></td>
		    <td>&nbsp;${sp.receipt_tel }</td>
		    <td><label class="noprint">VIP号</label></td>
		    <td>&nbsp;</td>
		    <td><label class="noprint">代收货款COD</label></td>
		    <td colspan="5"><label class="noprint">￥</label>${sp.trade_agency} &nbsp;<label class="noprint">元</label>&nbsp;&nbsp; <label class="noprint">大写：</label>
		 <label id="wan">&nbsp;</label><label class="noprint">万</label><label id="qian">&nbsp;</label><label class="noprint">仟</label><label id="bai">&nbsp;</label><label class="noprint">佰</label><label id="shi">&nbsp;</label><label class="noprint">拾</label><label id="yuan">&nbsp;</label><label class="noprint">元</label></td> 
	    </tr>
		<tr>
		    <td colspan="4" height="20"><label class="noprint">托运物信息</label></td>
		    <td ><label class="noprint">运输费用合计</label></td>
		    <td colspan="3"><label class="noprint">￥元 </label></td>
		    <td><label class="noprint">贷款金额</label></td>
		    <td><label class="noprint">￥ 元</label></td>
		</tr>
		<tr>
		    <td height="20"><label class="noprint">货物名称</label></td>
		    <td>&nbsp;${sp.goods_name}</td>
		    <td><label class="noprint">包装</label></td>
		    <td>&nbsp;${sp.goods_packing}</td>
		    <td><label class="noprint">应收费用总计</label></td>
		    <td colspan="5"><label class="noprint">￥</label>${sp.transport_pay}<label class="noprint">元</label>&nbsp; &nbsp;<label class="noprint">大写：</label><label id="wan1">&nbsp;</label><label class="noprint">万</label><label id="qian1">&nbsp;</label><label class="noprint">仟</label><label id="bai1">&nbsp;</label><label class="noprint">佰</label><label id="shi1">&nbsp;</label><label class="noprint">拾</label><label id="yuan1">&nbsp;</label><label class="noprint">元</label></td>		    
	   </tr>
	   <tr>
		    <td height="20"><label class="noprint">长*宽*高</label></td>
		    <td>&nbsp;${sp.goods_vol}</td>
		    <td><label class="noprint">件数</label></td>
		    <td>&nbsp;${sp.goods_num}</td>
		    <td colspan="3"  align="left"><label class="noprint">签收信息</label></td>
		    <td colspan="3" rowspan="2" align="left" valign="top"><label class="noprint">请仔细阅读背面运输条款，您的签名意味着您已理解并接受条款内容</label></td>
	   </tr>
	   <tr>
		    <td height="20"><label class="noprint">重量（公斤</label></td>
		    <td>&nbsp;${sp.goods_weight}</td>
		    <td><label class="noprint">体积（方）</label></td>
		    <td>&nbsp;${sp.goods_vol}</td>
		    <td colspan="3" rowspan="4" align="left" valign="top">
			<div align="left" class="noprint">
			签字确认以上货物件数、重量完全准确，包装完好、如无异议，请签字。
			</div>
			<div align="left" class="noprint">
			收货人签字：
			</div>
			<div align="left" style="margin-top:10px;" class="noprint">
			身份证号码：
			</div>
			<div align="right" style="margin-top:10px;" class="noprint">
			年   月   日
			</div>
			</td>
		</tr>
		<tr>
		    <td rowspan="2" height="20"><label class="noprint">交货方式</label></td>
		    <td style="" align="right"><label class="noprint">专车送货</label>${sp.send_type1}</td>
		    <td align="right"><label class="noprint">客户自提</label>${sp.send_type0}</td>
		    <td height="20" align="right"><label class="noprint">送货进仓</label>${sp.send_type2} </td>
		    <td colspan="3" rowspan="3" align="left" valign="top">
				<div align="left" class="noprint">
				托运人签字：
				</div>
				<div align="left" style="margin-top:10px;" class="noprint">
				身份证号码：
				</div>
				<div align="right" style="margin-top:10px;" class="noprint">
				年   月   日
				</div>
			</td>
		</tr>
		<tr>
		    <td height="20"  align="right"><label class="noprint">送货上楼</label>${sp.send_type3}</td>
		    <td colspan="2"  align="right"><label class="noprint">送货上门（不上楼）</label>${sp.send_type4}</td>
	   </tr>
	   <tr>
		    <td height="20"><label class="noprint">注意事项</label></td>
		    <td colspan="3">&nbsp;</td>
	   </tr>
  <tr>
  <td colspan="9" style="font-size:11px;margin-top:5px;" height="20">
	<label  class="noprint">地址：天津市北辰区双街开发区双原到2号易路通物流&nbsp;&nbsp;	TEL：022-26922999 / 13212225557&nbsp;&nbsp; 服务监督电话：13821216123 &nbsp;&nbsp;制单人：</label>
  </td>
  <td align="left">${sp.shipping_order_name}</td>
  </tr> --%>
</table>

</body>
</html>
<%-- <table width="749" id="printinfo">
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
	<td>起运地：${sp.start_address}</td>
    <td></td>
    <td>到达地：${sp.end_address}</td>
    <td><span>${fn:substring(sp.check_time,0,4)}年${fn:substring(sp.check_time,5,7)}月${fn:substring(sp.check_time,8,10)}日</span></td>
</tr>
<tr>
	<td colspan="4" style="height: 410px;">
            <table width="744" height="410" border="1" cellpadding="0" cellspacing="0">
              <tr>
                <td width="95" class="norightborder">托运方：</td>
                <td width="113" class="noleftandright">&nbsp;${sp.checkp}</td>
                <td width="98" class="noleftandright">电话：</td>
                <td colspan="3" class="noleftandright">&nbsp;${sp.check_tel}</td>
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
                <td width="63">&nbsp;${sp.take_fee}</td>
                <td width="54"><div align="center">送货费</div></td>
                <td width="62">&nbsp;${sp.send_fee}</td>
              </tr>
              <tr>
                <td class="norightborder">总件数：</td>
                <td class="noleft">&nbsp;${sp.goods_num}</td>
                <td><div align="center">汽运货运站</div></td>
                <td>&nbsp;${sp.checktype1}</td>
                <td><div align="center">自提</div></td>
                <td>&nbsp;${sp.sendtype}</td>
                <td><div align="center">装卸费</div></td>
                <td>&nbsp;${sp.adorn_fee}</td>
                <td><div align="center">干线费</div></td>
                <td>&nbsp;${sp.trunk_fee}</td>
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
  
 --%>