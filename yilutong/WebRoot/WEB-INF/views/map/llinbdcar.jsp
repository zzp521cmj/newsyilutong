<!-- 
 文件名:mapbxgl.jsp
创建人:黄清华
类型:jsp
创建日期:
最新修改日期:
 -->
<%@page import="com.jy.model.Linstandard_truck"%>
<%@page import="com.jy.model.LinStandard"%>
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
<title>My JSP 'mapbxgl.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<jsp:include page="allMap.jsp"></jsp:include>
<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
<jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="css/mapforlx.css">
<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
<script type="text/javascript" src="./js/select2/select2.js"></script>
<script type="text/javascript"
	src="./js/select2/select2_locale_zh-CN.js"></script>
<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
<style type="text/css">
.select2-container .select2-choice {
	display: block;
	height: 31px;
	padding: 0 0 0 8px;
	overflow: hidden;
	position: relative;
	border: 1px solid #ccc;
	white-space: nowrap;
	line-height: 31px;
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
}
</style>
 <script type="text/javascript">
	$(function() {
		$("#car").select2({
			placeholder : "请选择车辆", //默认文本框显示信息
			minimumInputLength : 1, //最小输入字符长度
			multiple : true, //设置多项选择，false则只能单选
			allowClear : true,
			hight:50,
			//maximumSelectionSize: 5, //最大选择个数
			query : function(query) {
				$.ajax({
					type : "POST",
					url : "automaticPlan.do?method=getCarInfo",
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
								text : y.name
							});
						});
						query.callback(data);
					}
				});
			}
		});
		var linid=$("#linid").val();
		var morecar = [];
		//开始加载已经绑定的车辆
		$.ajax({
			type : "POST",
			url : "maplin.do?method=getbdcar",
			data : {
				linid :linid
			},
			success : function(data) {
				$.each(JSON.parse(data), function(i, itme) {
					morecar.push({id:itme.tid, text:itme.tname});
				});
				$('#car').select2('data', morecar);
			}
		});
	});
</script>
</head>
<body style="overflow: hidden;">
	<!-- <div id="head">
		<button class="bt" value="" onclick="cleanall()">
			<img alt="重新标记" src="images/sx.png" width="15px" height="15px"
				style="  vertical-align: sub;"> 重新标注
		</button>
	</div> -->
	<div id="dituContent"></div>
	<div id="a">
		<div id="b">
			<span id="f">绑定标准线路</span>
		</div>
		<!-- 表单提交的form -->
			<div id="c">
				<table id="t">
					<tr>
						<td style="color: #a90329!important">线路名称</td>
						<td><input type="text" class="ip validate[required]"
							id="xlname" name="linname"  disabled="disabled"></td>
						<td>线路编码</td>
						<td><input type="text" class="ip validate[required]"
							ID="linbh" name="linbh" disabled="disabled"></td>
					</tr>
					<tr>
						<td>起始城市</td>
						<td><input type="text" class="ip validate[required]"
							id="scity" name="scity"  disabled="disabled"> <input type="hidden" id="spt"
							name="spt"></td>
						<td>终到城市</td>
						<td><input type="text" class="ip validate[required]"
							ID="ecity" name="ecity"  disabled="disabled"> <input type="hidden" id="ept"
							name="ept"></td>
					</tr>
					<tr>
						<td colspan="4">
						<div style="width: 310px;height: 160px;overflow: scroll;overflow: hidden; overflow-y: auto;">
							 <input type="hidden" id="car" style="width:310px;height: 35px;" /> 
						</div>
						</td>
					</tr>
					<tr style="display: none;">
						<td>停留时间</td>
						<td><input type="text" class="ip validate[required]"
							id=stoptime name="stoptime" onblur="checkname(this)"></td>
						<td>运输时间</td>
						<td><input type="text" class="ip validate[required]"
							ID="longtime" name="longtime"></td>
					</tr>
					<tr style="display: none;">
						<td>方案</td>
						<td><select class="sl validate[required]" 
							id="linfatype" name="linfatype">
								<option value="0">默认方案</option>
								<option value="1">避开高速</option>
								<option value="2">最短时间</option>
								<option value="3">最短距离</option>
						</select></td>
						<td>里程</td>
						<td><input type="text"
							class="ip validate[required,custom[number],min[0]]" id="lcs"
							value="单位千里" name="lincd"></td>
					</tr>
					<tr style="display: none;">
						<td>备注</td>
						<td colspan="3"><input type="text" class="ip"
							style="width: 240px;" id="linbz" name="linbz"></td>
					</tr>
				</table>
				<input type="hidden" name="linzb" id="pst" value="" />
				<!-- 隐藏域保存所有坐标点的集合String类型 -->
				<!-- <input type="hidden" id="hdid" name="linwjid" value="" /> -->
				<!-- 保存班线Id -->
				<input type="hidden" id="linid" name="linid" value="">
				<!-- 保存线路Id -->
			</div>
		<div id="d">
			<div>
				<button class="bts" id="bclin" value="" onclick="bd()">
					<img alt="保存" src="images/bc.png" width="18px" height="18px"
						style="  vertical-align: sub;">绑定
				</button>
				<button class="bt" id="bcxjlin" value="" onclick="bdandadd()" style="padding: 0 18px;">清空绑定车辆</button>
				<button class="bt" value="" onclick="backto()">
					<img alt="返回" src="images/fh.png" width="18px" height="18px"
						style="  vertical-align: sub;">返回
				</button>
			</div>
		</div>
	</div>
	<div id="maxs">
		<div id="bigndivs">
			<span id="bigmapleaves">行车路线</span> <img id="sms" alt="关闭"
				src="images/close.png" width="10px" height="10px">
		</div>
		<div id="z">
			<div id="start">●起点</div>
			<div id="resplan"></div>
			<div id="end">●终点</div>
		</div>
	</div>
	<div align="center" id="mins">✎行车路线</div>
	<form action="" method="post" id="bc"></form>
</body>
<script type="text/javascript" src="mapjs/S-lxbdcar-maplxgh.js">
</script>
<script type="text/javascript">
	/* 单位千里的方法 start */
	jQuery.focusblur = function(focusid) {
		var focusblurid = $(focusid);
		var defval = focusblurid.val();
		focusblurid.focus(function() {
			var thisval = $(this).val();
			if (thisval == defval) {
				$(this).val("");
			}
		});
		focusblurid.blur(function() {
			var thisval = $(this).val();
			if (thisval == "") {
				$(this).val(defval);
			}
		});
	};
	/* 下面是调用方法 */
	$.focusblur("#lcs");
	/* 单位千里的方法 end */
	var morecar = [];
</script>

<%
	if(request.getAttribute("linlist")!=null){
	List<LinStandard> list=(List<LinStandard>)request.getAttribute("linlist");
	LinStandard lsd=list.get(0);
	String linid=lsd.getLinid();
	String name=lsd.getLinname();
	String bh=lsd.getLinbh();
	String scity=lsd.getScity();
	String ecity=lsd.getEcity();
	String spt=lsd.getSpt();
	String ept=lsd.getEpt();
	String stoptime=lsd.getStoptime();
	String longtime=lsd.getLongtime();
	int type=lsd.getLinfatype();
	double lc=lsd.getLincd();
	String bz=lsd.getLinbz();
	String zb="";
	for (LinStandard linStandard : list) {
		zb=zb+linStandard.getLinzb();
	}
%>
<script type="text/javascript">
	craetelinforupdate('<%=linid%>','<%=name%>','<%=bh%>','<%=scity%>','<%=ecity%>','<%=spt%>','<%=ept%>','<%=stoptime%>','<%=longtime%>','<%=type%>','<%=lc%>','<%=bz%>','<%=zb%>');
</script>
<%
	}
%>
</html>
