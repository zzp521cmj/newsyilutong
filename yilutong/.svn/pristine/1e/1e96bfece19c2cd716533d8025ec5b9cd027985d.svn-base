<!-- 
 文件名:mapzz.jsp
创建人:黄清华
类型:jsp
创建日期:
最新修改日期:
 -->
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>车辆追踪</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<jsp:include page="allMap.jsp"></jsp:include>
	
	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
	<link rel="stylesheet" href="./css/mapcssforgz.css" type="text/css"></link>
	
	
	<link rel="stylesheet" href="./js/select2/select2.css" type="text/css"></link>
	<script type="text/javascript" src="./js/select2/select2.js"></script>
	<script type="text/javascript"	src="./js/select2/select2_locale_zh-CN.js"></script>
	<script type="text/javascript" src="./js/select2/select2_expand.js"></script>
	
	<script type="text/javascript">
	$(function() {
		$("#number_search").select2({
			placeholder : "请选择车辆",
			minimumInputLength : 1,
			multiple : false,
			allowClear : true,
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
			},
		});
	});
	
	function zz(){
		var obj=$.trim($("#number_search").select2("data").text);
		if(obj!=null&obj!=""){
			parent.addTab('车辆跟踪','map.do?method=getmapzz&menu_id=45&gzhidvalue='+obj);	
		}
	}
</script>
  </head>
  
  <body>
  	<div id="bigdiv">
  		<div id="titlediv">
  			<input type="hidden" id="number_search"style="width: 185px;height: 25px;" />
  			<button class="btz" value="" onclick="zz()">
			 <img alt="" src="images/zz.png" width="18px" height="18px"  style="  vertical-align: bottom;margin-left: -5px;  margin-right: 10;">跟踪
		</button>
		<button class="btz1" id="lq" value="" style="margin-left: 60%;">路况</button>
		<button class="btz1" id="wxanddt" value="">卫星</button>
  		</div>
  		 <div id="dituContent"></div>
  		 <div align="center" id="mins"></div>
  	</div>
    
  </body>
	<script type="text/javascript" src="mapjs/S-gz-mapcarlxgz.js"></script>
	
<% if(request.getAttribute("mapzz")!=null){	String carno=request.getAttribute("mapzz").toString();%>
<script type="text/javascript">
	getinfo('<%=carno %>');
</script>
<%}%>
</html>
