<!-- 
 文件名:mapgjhf.jsp
创建人:黄清华
类型:jsp
创建日期:
最新修改日期:
 -->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>Track</title>

<jsp:include page="allMap.jsp"></jsp:include>

<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<script type="text/javascript" src="./bootstrap/js/bootstrap.js"></script>
<link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="./css/maphfcss.css">
<!-- <link href="./bootstrap/css/bootstrap-slider.css" rel="stylesheet">
<script type="text/javascript" src="./bootstrap/js/bootstrap-slider.js"></script> -->
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<link href="./js/noUiSlider/nouislider.min.css" rel="stylesheet">
<script src="./js/noUiSlider/nouislider.min.js"></script>
<style type="text/css">
label {
	max-width: none;
}
</style>
<%
	if (request.getAttribute("maphf") != null) {
		String carno = request.getAttribute("maphf").toString();
%>
<script type="text/javascript">
//获取id的通用方法
function getfromid(obj) {
	return document.getElementById(obj);
}
function CurentTime(befour, after,date) {
	var now = null;

	if(date!=""&&date!=null){
		now=new Date(date);
	}else{
		now=new Date();
	}
	if (befour != null) {
		now.setDate(now.getDate() - befour);
	}
	if (after != null) {
		now.setDate(now.getDate() + after);
	}
	var year = now.getFullYear(); // 年
	var month = now.getMonth() + 1; // 月
	var day = now.getDate(); // 日

	var hh = now.getHours(); // 时
	var mm = now.getMinutes(); // 分
	var ss = now.getSeconds();
	var clock = year + "-";
	if (month < 10)
		clock += "0";
	clock += month + "-";
	if (day < 10)
		clock += "0";
	clock += day + " ";
	if (hh < 10)
		clock += "0";
	clock += hh + ":";
	if (mm < 10)
		clock += '0';
	clock += mm + ":";
	if (ss < 10)
		clock += '0';
	clock += ss;
	return (clock);
}

var _carno="";//查询条件
/* function setcarno(obj){
	alert("3")
	_carno=obj;
} */
var dialog;
var grid;
var grid2;
	$(function() {
		//$("#datehidiv").hide(10);//时间保存DIV的隐藏
		// 进入页面给时间赋值
			$("#st").val(CurentTime(1, null));
			$("#ed").val(CurentTime(null,0));
			times = $("#sjip").val();
						
			
		$("#number_search").select2({
			placeholder : "请选择车辆",
			minimumInputLength : 1,
			multiple : false,
			allowClear : true,
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "automaticPlan.do?method=getCarInfohf",
					data : {
						name : query.term
					}, //传递你输入框中的值
					success : function(msg) {
						var caron='<%=carno%>';
						var msg = $.parseJSON(msg);
						var data = {
							results : []
						};
						$.each(msg, function(x, y) {
							data.results.push({
								id : y.id,
								text : y.name,
								beidouid:y.beidouid
							});
						});
						query.callback(data);
					}
				});
			},
		}).on("select2-selecting", function(f) {
				$("#beidouid").val(f.object.beidouid);
			});
		
		$("#number_search").select2('data',{id:"0",text:'<%=carno%>'});
	});
	
	function imgdragstart(){return false;}  
</script>

<style type="text/css">
/* .tooltip {
	background-color: none;
	border-color: #D4D4D4;
	color: #333;
	border: none;
}

.nav-tabs>li.active>a,.nav-tabs>li.active>a:hover,.nav-tabs>li.active>a:focus
	{
	cursor: default;
	background-color: #fafafa;
	border: 1px solid #ddd;
	border-bottom-color: transparent;
}

.tooltip.top {
	padding: 0 0 5 0;
}

.slider-handle {
	background: url('images/gd.png') no-repeat;
}

.select2-container .select2-choice {
	display: block;
	height: 25px;
	padding: 0 0 0 8px;
	overflow: hidden;
	position: relative;
	border: 1px solid #95B8E7;
	border-radius: 0;
	white-space: nowrap;
	line-height: 20px;
	color: #444;
	text-decoration: none;
	background-clip: padding-box;
	-webkit-touch-callout: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #fff;
	background-image: -webkit-gradient(linear, left bottom, left top, color-stop(0, #eee),
		color-stop(0.5, #fff));
	background-image: -webkit-linear-gradient(center bottom, #eee 0%, #fff 50%);
	background-image: -moz-linear-gradient(center bottom, #eee 0%, #fff 50%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr= '#ffffff',
		endColorstr= '#eeeeee', GradientType= 0);
	background-image: linear-gradient(to top, #fff 0%, #fff 50%);
} */
/* 
.window, .window .window-body {
    border-color: white;
}

.window {
    background-color: fff;
    background: -webkit- linear-gradient( top,#ffffff 0,#F2F2F2 20%);
    background: -moz- linear-gradient( top,#ffffff 0,#F2F2F2 20%);
    background: -o- linear-gradient( top,#ffffff 0,#F2F2F2 20%);
    background: linear-gradient( to bottom,#ffffff 0,#fff 20%);
    background-repeat: repeat-x;
    filter: progid:DXImageTransform.Microsoft.gradient( startColorstr=#ffffff, endColorstr=#F2F2F2, GradientType=0);
} */

.nav > li > a {
    position: relative;
    display: block;
    padding: 5px 15px;
}
</style>

</head>

<body>
	<div class="easyui-layout" data-options="fit: true">
		<div region="west" border="false" split="false" title="轨迹回放"
			class="cs-west" style="width:295px;overflow: hidden;" id="westId">
			
			<div style="height: 80px;">
				<table id="mytable">
					<tr>
						<td>车牌号：</td>
						<td><input type="hidden" id="number_search"
							style="width: 205px;height: 25px;" />
							<input id="beidouid" type="hidden">
							</td> 
					</tr>
					<tr>
						<td style="width:70px;">开始时间：</td>
						<td colspan="4"><input id="st" type="text"
							readonly="readonly" class="Wdate"
							onClick="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value=""/>
						</td>
					</tr>
					<tr>
						<td style="width:70px;">结束时间：</td>
						<td colspan="4"><input id="ed" type="text"
							readonly="readonly" class="Wdate"
							onClick="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
						</td>
						<td colspan="2" hidden="hidden">
							<div id="showdate">
								<img id="rlimg" alt="" src="images/rl.PNG" width="20"
									height="20"> <input id="sjip" type="text" onclick="showtimediv()"
									style="cursor: pointer;"/>
							</div>
						</td>
						<!-- 						class="Wdate" onClick="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" -->
					</tr>
					<tr>
						<td colspan="3" id="loadingMessage"></td>
					</tr>
					<tr>
						<td colspan="3" id="tiao"></td>
					</tr>
				</table>
			</div>
							<!-- <div id="datehidiv" style="display: none">
									<table id="thtb">
										<tr>
											<td>开始时间：</td>
											<td colspan="4"><input id="st" type="text"
												readonly="readonly" class="Wdate"
												onClick="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
											</td>
										</tr>
										<tr>
											<td>结束时间：</td>
											<td colspan="4"><input id="ed" type="text"
												readonly="readonly" class="Wdate"
												onClick="WdatePicker({skin:'twoer',dateFmt:'yyyy-MM-dd HH:mm:ss'})" /></td>
										</tr>
										<tr>
											<td></td>
											<td colspan="2"><button class="txbt" id="qds">确定</button></td>
											<td colspan="2"><button id="qxs" class="txbt">取消</button></td>
										</tr>
									</table>
								</div> -->
			<div id="jdt">
				<table id="td" style="padding-top:11%;">
					<tr style="  border-bottom: 1px solid #ccc;">
						<td>回放速度：</td>
						<td><select id="sd" onchange="szsd(this)">
								<option value="320">慢速</option>
								<option value="200" selected="selected">中速</option>
								<option value="120">快速</option>
								<option value="60">最快</option>
						</select></td>
						<td></td>
						<td><span>随视野移动</span></td>
						<td><input id="follow" type="checkbox" checked="checked"></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="2"><input type="button" value="加载" id="loadhf"
							style="width: 80px;height: 30px;  border: none; background-color: #296191; color: white; font-size: 14px; font-family: '微软雅黑';"></td>
						<td colspan="2">
							<button id="pause">
								<img id="bts" alt="" src="images/bf.png" width="15" height="10">
							</button>
						</td>
					</tr>
					<!-- <tr>
						<td colspan="5">
							<div align="center" id="gdt">
									<input id="ex6" type="text" data-slider-min="1"
										data-slider-max="20" data-slider-step="1"
										data-slider-value="1" /></div>
						</td>
					</tr> -->
				</table>
			</div>
			<div
				style="width: 296px; height: 10px;background-color: #FAFAFA;	border: 1px solid #ccc;"></div>
			<div id="tab">
				<ul id="myTab" class="nav nav-tabs"
					style="border-bottom: 1px solid #fafafa;">
					<li
						style="width: 100%;text-align: center;border-bottom: 1px solid #DDDDDD;"><a
						href="#ios" data-toggle="tab" style="color: black;">停留点</a></li>
				</ul>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade in active" id="ios" style="height: 88%">
						<div class="tabdiv" >
							<table style="width: 100%;height: 100%" id="tldg"  fit="true" 
								data-options=" loadMsg:'拼命加载中,请稍后……'"></table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div data-options="region: 'center', border: false">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'center',border:false">
					<div id="controller" align="center"></div>
					<div id="dituContent"></div>
					<div align="center" id="min"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="restartDialog" class="easyui-dialog" title="" style="overflow:hidden;width: 400px; height: 180px;" data-options="closed:true">
		<img alt="" src="./images/jzz.gif" style="width: 400px; height: 280px; margin-top: -60px;draggable:false">
	</div>
	<script language="javascript">  
		for(i in document.images)document.images[i].ondragstart=imgdragstart;  
	</script> 
</body>
<script type="text/javascript" src="mapjs/S-hf-maplxhf.js"></script>
<script type="text/javascript" src="mapjs/S-hf-addpy.js"></script>
<%
	if (request.getAttribute("times") != null) {
		String times = request.getAttribute("times").toString();
%>
<%
	if (request.getAttribute("beidouid") != null) {
		String beidouid = request.getAttribute("beidouid").toString();
		String endTimes="";
		if(request.getAttribute("endTimes")!=null){
			endTimes=request.getAttribute("endTimes").toString();
		}
%>
<script type="text/javascript">
function showtimediv(){
	document.getElementById("datehidiv").style.display="block";
}
$(document).ready(function() {
	/* $("#sjip").click(function() {
		$("#datehidiv").show(300);
	}); */
	

	$("#qxs").click(function() {
		$("#datehidiv").hide(100);
	});
	var times="<%=times%>";
	var carno="<%=carno%>";
	var beidouid="<%=beidouid%>";
	var endTimes="<%=endTimes%>";
	if(endTimes!=""&&endTimes!=null&&endTimes!="null"){
		getfromid("sjip").value=times + " 至 " +endTimes ;
		$("#st").val(times);
		$("#ed").val(endTimes);
	}else if(times!=null&&times!=""&&times!="null"){
		getfromid("sjip").value=CurentTime(1,null,times) + " 至 " + times;
		$("#st").val(CurentTime(1,null,times));
		$("#ed").val(times);
	}else{
		getfromid("sjip").value=CurentTime(1, null) + " 至 " + CurentTime(null, 0);
	}
	startload();//加载所有站点信息
	
	$("#beidouid").val(beidouid);
	setTimeout(function(){
		gethfinfo(carno,times,beidouid);
		$("#img").hide();
	},2000);
	
});

</script>
<%}}
	}
%>
</html>