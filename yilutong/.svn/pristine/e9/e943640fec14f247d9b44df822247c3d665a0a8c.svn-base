<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.jy.common.SessionInfo"%>
<%@ page import="com.jy.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script language="javascript" src="js/LodopFuncs.js"></script>
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<title>承运协议打印</title>
<object id="LODOP_OB"
	classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0>
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0></embed>
</object>
<!--设置打印的css样式 -->
<style id="style1">
/* p标签的行高为20px 
			   设置段落开头缩进2em；
			*/
p {
	line-height: 23px;
	padding: 0px 0px;
	margin: 0px 0px;
	text-indent: 2em;
	font-size: 18px;
}
/*下划线 用input做下划线
			 */
.xiahuaxian {
	border: none;
	border-bottom: 1px solid #000;
	width: 40px;
}
/*设置表格样式*/
#tb01 {
	border-width: 1px;
	border-color: black;
	border-style: solid;
}
/*.rowstyle{
				border-width:1px;
				border-style: inherit;
			    border-color: blue;
			}*/
</style>
<script>
	
	function windowprinter(){
	 document.getElementById("buttonId").style.display='none';
	  window.print();
	  window.close();
	}
	
	/*
	这是插件打印控件
	*/
	var LODOP;//定义打印对象
	function printer() {
		initPrinter();
		//LODOP. PRINT_DESIGN ();//开启打印设计模式
		LODOP.PREVIEW();//开启打印模式
	}
	function initPrinter(){
	    LODOP = getLodop(); //获取lodop对象
		//var strVersion = LODOP.VERSION; //获取lodop的版本号
		var strBodyStyle = "<style>"
				+ document.getElementById("style1").innerHTML + "</style>";//获取style信息
		var strFormHtml = strBodyStyle + "<body>"
				+ document.getElementById("div_table").innerHTML + "</body>";//设置html对象为打印准备
		LODOP.PRINT_INIT("承运协议打印");//打印初始化
		LODOP.SET_PRINT_STYLEA(0,"Horient",2);//设置对象在纸张范围内水平居中,
		LODOP.ADD_PRINT_HTM(30, 30, "100%", "100%", strFormHtml);//设置打印显示比例和大小
		
		//LODOP.SET_PRINT_STYLEA(0,"Vorient",2);//设置对象在纸张范围内垂直居中,
		
		
	}
</script>

</head>
<div id="buttonId">
    <!-- <input type="button" onclick="windowprinter()" value="直接打印" />  -->
    <input type="button" onclick="printer()" value="打印预览" /> 
</div>

<body style=" font-family: '宋体';" id="printerBody"  >
    <!--调用打印插件按钮 -->
   
	<!-- 初始化表格合并列的数量 -->
	<c:choose>
		<c:when test="${createAgreement.number < 5}">
			<c:set var="num" scope="request" value="8"></c:set>
		</c:when>
		<c:otherwise>
			<c:set var="num" scope="request" value="${createAgreement.number+3} "></c:set>
		</c:otherwise>
	</c:choose>
	<!-- 定义承运协议的表格信息-->
	<div id="div_table" style="text-align: center;">
		<table border="1" id="tb01" cellpadding="0" cellspacing="0"
			width="700">
			<thead>
				<tr>
					<th colspan="9" height="55px"><span
						style="font-size:25px;color:black;">易路通（天津）物流有限公司货物运输协议书</span></th>
				</tr>
			</thead>

			<tbody>
				<tr height="60px">
					<td align="center">甲方<br />（托运单位)</td>
					<td align="center" colspan="4">易路通（天津）物流有限公司</td>
					<td align="center">乙方（承运单位/个人)</td>
					<td align="center" colspan="3">${createAgreement.car_name}</td>
					<!-- 司机姓名 -->
				</tr>
				<tr>
					<td align="center" width="95px">司机</td>
					<td align="center" width="80px">${createAgreement.car_name}</td>
					<!-- 司机姓名 -->
					<td align="center" width="40px">车牌</td>
					<td align="center" width="150px">${createAgreement.car_number1}</td>
					<!-- 车牌号码 -->
					<td align="center" width="60px">电话</td>
					<td align="center" width="85px">${createAgreement.phone_number}</td>
					<!-- 司机电话-->
					<td align="center" width="80px">驾驶证号</td>
					<td align="center" width="120px" colspan="2">${createAgreement.driver.drivingLicense}</td>
					<!-- 驾驶证号 -->
				</tr>
				<tr class="rowstyle">
					<td align="center">托运单号</td>
					<td align="center" colspan="2">地址</td>
					<td align="center">货物名称</td>
					<td align="center">件数</td>
					<td align="center">重量/体积</td>
					<td align="center">回单</td>
					<td align="center" width="110px">运费</td>

					<td align="center" rowspan="${num}"><span
						style="font-size:11px;color:blue;">第一联<br />（白）<br /> 调度
							<br />第二联<br />（红）<br />司机 <br />第三联<br />（黄)<br />客服</span></td>
				</tr>

				<c:choose>

					<c:when test="${createAgreement.number < 5}">
						<!-- 默认表格为5个 判断是否小于5 -->
						<c:forEach var="shiord" items="${createAgreement.shippingOrders}">
							<tr height="25px">
								<!-- 循环表格信息 -->
								<td align="center">${shiord.shiping_order_num}</td>
								<td align="center" colspan="2">${shiord.end_address}</td>
								<td align="center">${shiord.goods_name}</td>
								<td align="center">${shiord.goods_num}</td>
								<td align="center">${shiord.goods_weight}/${shiord.goods_vol}</td>
								<td align="center">${shiord.is_recept}</td>
								<td align="center">${shiord.destination_fee}</td>
							</tr>
						</c:forEach>
						<c:forEach begin="1" end="${5-createAgreement.number}">
							<!-- 添加空白表格信息 -->
							<tr height="25px">
								<td align="center"></td>
								<td align="center" colspan="2"></td>
								<td align="center"></td>
								<td align="center"></td>
								<td align="center"></td>
								<td align="center"></td>
								<td align="center"></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach var="shiord" items="${createAgreement.shippingOrders}">
							<!-- 订单数量大于5 直接打印即可 -->
							<tr height="25px">
								<td align="center">${shiord.shiping_order_num}</td>
								<!-- 货运编号 -->
								<td align="center" colspan="2">${shiord.end_address}</td>
								<!-- 到站 -->
								<td align="center">${shiord.goods_name}</td>
								<!-- 货物名称 -->
								<td align="center">${shiord.goods_num}</td>
								<!-- 货物数量 -->
								<td align="center">${shiord.goods_weight}/${shiord.goods_vol}</td>
								<!-- 重量体积 -->
								<td align="center">${shiord.is_recept}</td>
								<!-- 回单分数 -->
								<td align="center">${shiord.destination_fee}</td>
								<!-- 代收运费 -->
							</tr>
						</c:forEach>
					</c:otherwise>

				</c:choose>

				<!-- <tr height="25px">
						<td align="center"></td>
						<td align="center" colspan="2"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"> </td>
					</tr>
					<tr height="25px">
						<td align="center"></td>
						<td align="center" colspan="2"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"> </td>
					</tr>
					<tr height="25px">
						<td align="center"></td>
						<td align="center" colspan="2"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"> </td>
					</tr>
					<tr height="25px">
						<td align="center"></td>
						<td align="center" colspan="2"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"> </td>
					</tr>
					<tr height="25px">
						<td align="center"></td>
						<td align="center" colspan="2"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"></td>
						<td align="center"> </td>
					</tr> -->
				<tr height="25px">
					<td align="center">备注</td>
					<td align="center" colspan="7"></td>
				</tr>
				<tr height="25px">
					<td align="center">合计</td>
					<td align="center" colspan="7"><span
						style="font-size:15px;letter-spacing:15px;">&nbsp;拾 万 仟 百 拾
							元 角 分 ¥ </span>
					</td>
				</tr>
				<tr>
					<td colspan="9"><strong>甲乙双方经平等协商达成协议，必须严格按照下列条款执行：</strong>
					</td>
				</tr>
				<tr>
					<td colspan="9">
						<p>
							一、本车于<input type="text" class="xiahuaxian">年 <input
								type="text" class="xiahuaxian">月 <input type="text"
								class="xiahuaxian">日 <input type="text"
								class="xiahuaxian">时由天津发出，必须在<input type="text"
								class="xiahuaxian">年 <input type="text"
								class="xiahuaxian">月<input type="text"
								class="xiahuaxian">日<input type="text"
								class="xiahuaxian">时前准时到达甲方指定 的运输地点。 准时到达可获得人民币 <input
								type="text" class="xiahuaxian" style="width: 60px">元运费，晚点到达超过
							小时以上扣除运输费人民币 <input type="text" class="xiahuaxian"
								style="width: 70px">元。
						</p>
						<p>二、甲方托运的货物要如实填写，如因甲方隐瞒货物名称，数量及性质，给乙方在运输途中
							造成损失的责任由甲方承担，包括车辆损失。但因乙方违反法律有关规定或乙方原因在
							运输途中造成的损失（包括车辆损失）均由乙方自行负责承担责任。</p>
						<p>三、甲方将运输的货物交给乙方运输时，乙方要按照每车的货物清单清点运输的货物后， 若双方在清点时发现运输的货物出现丢失、
							损坏责任由甲方承担并负责赔偿。 自双方清点后由于乙方装卸、运输中造成货物丢失、损坏责任由乙方承担并负责赔偿。</p>
						<p>四、甲方将运输的货物交给乙方时，务必填写清楚卸货地址和收货人。</p>
						<p>
							五、乙方必须按照甲方的要求按时将货物完好整无损交给到甲方指定的接货 <br>人,并办理货物交接手续。
						</p>
						<p>
							六、乙方保证将甲方指定收货人签收的货物清单和货物交接手续及时带回交给甲方，
							若乙方未按约定将收货人签收的货物清单和货物交接手续及时交给甲方造成货款不能及时结清，
							给托运人造成的损失由乙方承担，并承担甲方违约金<input type="text" class="xiahuaxian"
								style="width: 100px">元。
						</p>
						<p>七、乙方在运输途中要精心保管货物，确保货物安全。 发生丢失或其它原因造成损失（不含不可抗力损耗）均由乙方负责按价赔偿。
						</p>
					</td>
				</tr>
				<tr height="60px">
					<td colspan="9">
						<p style="font-size: 16px;">此协议双方均认定无疑，按条款执行，一式三份，双方各执一份，另一份留底备用。经签字或盖章后生效。甲方收货人收到货物在回单或运单签字后，甲方按约支付运输费用。
						</p>
					</td>

				</tr>
			</tbody>
		</table>
		<!--
            	定义签字表格
            -->
		<table border="0" width="700px" id="tb02" cellpadding="0"
			cellspacing="0">
			<tr style="height: 40px;">
				<td align="left" width="180px">派车人：</td>
				<td align="left" width="180px">司机签字：</td>
				<td align="left" width="150px">库管签字：</td>
				<td align="left" width="230px">财务签字：</td>
			</tr>
			<tr style="height:35px;" style="border-top-style:none">
				<td colspan="3"></td>
				<td align="left"><span
					style="font-size:15px;letter-spacing:55px;">年月日</span></td>
			</tr>
		</table>
	</div>
	
</body>
</html>