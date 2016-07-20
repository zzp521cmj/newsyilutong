<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
  	<jsp:include page="/inc/easyuiLocation.jsp"></jsp:include>
   <jsp:include page="../../../ValidationEngine/Validation.jsp"></jsp:include>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=3ktrkqQ4iISBiphzz8mkrZ68"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js"></script>
	<link rel="stylesheet" href="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.css" />
    <title>地图标记</title>
   	<style type="text/css">
   
	   html,body {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 99%;
	font-family: 'Microsoft YaHei','微软雅黑', Arial, Helvetica, sans-serif;
}
.bt {
	height: 31px;
	cursor: pointer;
	padding: 0 22px;
	font: 300 15px/29px 'Open Sans', Helvetica, Arial, sans-serif;
	color: #333;
	background-color: #fff;
	border-color: #ccc;
	border: 1px solid #ccc;
}
#wxdtdiv {
	position: absolute;
	z-index: 3;
	background-color: white;
	height: 50px;
	width: 48px;
	right: 10px;
	margin-top: 1%;
	margin-right:1%;
	background-image: url("images/wx.png");
	cursor: pointer;
}
.bts {
	height: 31px;
	cursor: pointer;
	padding: 0 22px;
	font: 300 15px/29px 'Open Sans', Helvetica, Arial, sans-serif;
	color: #333;
	background-color: #296191;
	color: white;
	border-color: #ccc;
	border: 1px solid #ccc;
	color: white;
	color: white;
	border-color: #ccc;
	border: 1px solid #ccc;
}

#allMap {
	position:absolute; 
	z-index:2;
	width: 97%;
    height: 89%;
}
#center{
	  width: 97%;
}
#dialog,#dialog2{
position:absolute;
	 z-index:3;
	 background-color: white;
	 height: 280px;
	 width: 300px;
	 margin-left: 68%;
	 margin-top: 12%;
}
#bigndiv,#bigndiv2{
	width: 300px;
	height: 35px;
	background-color: #296191;
}
#bigmapleave,#bigmapleave2{
	color: white;
	font-family: 'Microsoft YaHei', ΢���ź�, Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
	line-height: 35px;
	margin-left: 10px;
}
#sm,#sm2{
	cursor: pointer;
	margin-left: 180px;
	margin-top: 15px;
}
input{height: 30px;}
input,img{vertical-align:middle;}
input[type="checkbox"] {
  -webkit-appearance: none;
  height: 16px;
  vertical-align: middle;
  width: 16px;
  border: 1px solid #C1C1C1;
} 

input[type="checkbox"]:hover{
	 border: 1px solid #C1C1C1;
	 cursor: pointer;
}

input[type="checkbox"]:checked{
	background-image: url("images/ckd.png");
}

input[type="checkbox"]:checked:hover{
	
	 cursor: pointer;
}
.la{

	font-size: 16px;
 			font-family: Helvetica, 'Hiragino Sans GB', 'Microsoft Yahei', '微软雅黑', Arial, sans-serif;
 		}
}

.combo {
  border-color: #A9A9A9;
  background-color: #fff;
  border-radius: 0;
}
</style>
  </head>
  
  <body>
  <div id="dialog">
  	<div id="bigndiv">
  	<form id="form1" action="" method="post" style="font-family: 'Microsoft YaHei', 微软雅黑, Arial, Helvetica, sans-serif;font-size: 14px;">
  	<input type="hidden" id="update">
  	<input type="hidden" id="updateid" name="warehouse_id">
  		<input type="hidden" id="departmentid">
		<span id="bigmapleave">添加仓库</span> <img id="sm" onclick="closed(1)" alt="关闭"
		src="images/close.png" width="10px" height="10px" style="margin-top: 2px">
		<div align="center" style="margin-top: 15px">
		<label><font color="red">仓库编码</font></label><input id="warehouse_num" type="text" name="warehouse_num"  class="validate[required]" style="margin-left: 10px">
		</div>
		<div align="center" style="margin-top: 15px">
		<label><font color="red">仓库名称</font></label><input id="warehouse_name" type="text" name="warehouse_name"  class="validate[required]" style="margin-left: 10px">
		</div>
		<div style="margin-top: 15px;margin-left:33px;">
		<label style="margin-right:33px"><font>类型</font></label>
		<select class="easyui-combobox"  id='mark_tel1'  name="warehouse_type"  style="width:150px;height: 30px;" data-options="panelHeight : 'auto',editable:false">   
					<option id="" value="0">散支库（C库）</option>
					<option id="" value="1">整箱库（D库）</option>
	</select>
		</div>
		<div  style="margin-top: 15px">
		<!-- <label style="margin-right: 10px">类型</label><input id="type1" name="remark_type_id" class="easyui-combobox" > -->
		<!-- <label style="margin-left: 35px;margin-right: 33px">范围</label><input id="range1"  name="remark_range" class="easyui-combobox" style="height: 30px;width: 173px;"> -->
		</div>
		<div align="center" style="margin-top: 15px">
		<label style="margin-left: -12;margin-right: 10px">详细地址</label><textarea id="address1" name="warehouse_address"style="margin-left: 10px;resize: none;width: 173px;height: 30px;"></textarea>
		</div>
		<!-- <div align="center" style="margin-top: 15px">
		<label >设为站点</label><input id="zhandian1"  name="remark_site" type="checkbox">
		<label >设为私有</label><input id="siyou1" name="remark_attribute" type="checkbox" >
		</div> -->
		<div align="center" style="margin-top: 25px">
		<button type="button" class="bts" onclick="saveremark1('savemark')">
					<img alt="保存" src="images/bc.png" width="18px" height="18px"
						style="  vertical-align: sub;"> 保存
		</button>
		<button type="button" onclick="saveremark1('xinjianmark')" class="bt" style="width:80px">新建</button>
		<button type="button" onclick="closed(1)" class="bt">取消</button>
		</div>
		</form>
	</div>
  </div>
  <div id="dialog2">
  	<div id="bigndiv2">
  	<form id="form2" action="" method="post">
  		<input type="hidden" id="updateid2" name="remark_id">
		<span id="bigmapleave2">添加标注区域</span> <img id="sm2" onclick="closed(2)" alt="关闭"
		src="images/close.png" width="10px" height="10px"style="margin-top: 2px">
		<div align="center" style="margin-top: 23px">
		<label><font color="red">标注名称</font></label><input id="mark_name2"name="remark_name" class="validate[required]" type="text" style="margin-left: 10px">
		</div>
		<!-- <div align="center" style="margin-top: 10px">
		<label>标注编码</label><input name="remark_code" type="text"style="margin-left: 10px">
		</div> -->
		<div align="center" style="margin-top: 23px">
		<label style="margin-right: 10px"><font color="red">所属机构</font></label><input id="tree2" class="validate[required]" name="remark_department" style="width: 173px;height: 30px;">
		</div>
		<div align="center" style="margin-top: 23px">
		<label><font>联系方式</font></label><input id="mark_tel2" type="text" name="remark_tel" class="validate[custom[phone]]" style="margin-left: 10px">
		</div>
		<!-- <div align="center" style="margin-top: 10px">
		<label style="margin-right: 10px">类型</label><input id="type2" name="remark_type_id" class="easyui-combobox" >
		</div> -->
		<div align="center" style="margin-top: 23px">
		<label style="margin-right: 10px;  vertical-align: super;">详细地址</label><textarea id="address2" name="remark_address"style="resize: none;width: 173px;height: 30px;"></textarea>
		</div>
		<!-- <div align="center" style="margin-top: 15px">
		<label >设为站点</label><input id="zhandian2" name="remark_site" type="checkbox" >
		<label >设为私有</label><input id="siyou2" name="remark_attribute" type="checkbox" >
		</div> -->
		<input type="hidden" id="hidden_point" name="remark_point">
		<div align="center" style="margin-top: 28px">
		<button type="button" class="bts" onclick="saveremark1('savepolygon')">
					<img alt="保存" src="images/bc.png" width="18px" height="18px"
						style="  vertical-align: sub;"> 保存
		</button>
		<button type="button" onclick="saveremark1('xinjianpolygon')" class="bt" style="width:80px">新建</button>
		<button type="button" onclick="closed(2)" class="bt">取消</button>
		</div>
	</form>
	</div>
  </div>
  
	  <div id="center"  style="margin-top: 10px;margin-left:15px;border: 1px solid #CFCFCF;height: 40px;background-color: #FFFFFF">
 		<div style="float: left;height: 32px;margin-left:15px;margin-top:5px">		 
		 <input type="text" id="weizhi" style="height: 30px;  border: none; margin-left: 5px;  border: 1px solid #ccc;"><input type="button" onclick="search()"style="background-image:url('images/chaxun.png');width: 60px;height:30px;border: none;  margin-left: 5px;"> 
		 </div>
		 <div style="float: left;height: 32px; margin-left: 69%;margin-top:5px">
	  	<input type="button" title="添加客户" onclick="addremark()"style="background-image:url('images/biaozhu.png');  width: 29px;  height: 28px; border: 1px solid #3B9FF3;"><input type="button" value="返回"  onclick="fanhui()"style="background-color:#2995F2;color: white;width: 38px;  height: 28px;  border: 1px solid #3B9FF3;">
	  	</div>
	  </div>
	  <div id="allMap" style="margin-top: 0px;margin-left:15px;border: 1px solid #CFCFCF"></div>
	<div id="wxdtdiv">
		<input type="hidden" id="pdwd" value="卫星">
	</div>
  </body>
  <script type="text/javascript">
  var map = new BMap.Map("allMap");
  var zpoint="";
  var ppoint;
  var circle;
  var b = true;
  var a=true;
  var d = false;
  var infoWindow;
  var polygon;
  var myicon = new BMap.Icon("images/t3.png", new BMap.Size(50, 50), {
			anchor: new BMap.Size(45, 47)
		});
		
  $("#dialog").hide();
  $("#dialog2").hide();
  initMap();
  $(function(){
   $("#form1").validationEngine('attach', { 
			  promptPosition:'centerLeft:160,-10'/*'topRight:-50,0'*/,

			 }); 
	$("#form2").validationEngine('attach', { 
	 promptPosition:'centerLeft:160,-10'/*'topRight:-50,0'*/,

	});
			 
  getmodify("<%=request.getAttribute("id")%>");
  });
  
  /* $(function(){
	  $("#type1").combobox({
			url : 'remarkMap.do?method=getTypes',
			valueField : 'id',
			textField : 'text',
			panelHeight : 'auto',
			editable:false,
			width:85
		});
	  $("#type2").combobox({
			url : 'remarkMap.do?method=getTypes',
			valueField : 'id',
			textField : 'text',
			panelHeight : 'auto',
			editable:false,
			width:85
		}); 
	
   
			//关于选择私有和站点的操作
			$("#zhandian1").click(function(){
		if($("#zhandian1").is(':checked')){
			$("#siyou1").attr('checked',false);
		}
		});
		$("#siyou1").click(function(){
			if($("#siyou1").is(':checked')){
				$("#zhandian1").attr('checked',false);
			}
			});
		$("#zhandian2").click(function(){
		if($("#zhandian2").is(':checked')){
			$("#siyou2").attr('checked',false);
		}
		});
		$("#siyou2").click(function(){
			if($("#siyou2").is(':checked')){
				$("#zhandian2").attr('checked',false);
			}
			}); 
			
  }); */
  
  function initMap() {
		createMap();//创建地图
		setMapEvent();//设置地图事件
		addMapControl();//向地图添加控件
	}

	//创建地图函数：
	function createMap() {
	  
		var point = new BMap.Point(117.479345, 36.744883);//定义一个中心点坐标
		map.centerAndZoom(point, 7);//设定地图的中心点和坐标并将地图显示在地图容器中
		
		window.map = map;//将map变量存储在全局
	}

	//地图事件设置函数：
	function setMapEvent() {
		map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
		map.enableScrollWheelZoom();//启用地图滚轮放大缩小
		map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
		map.enableKeyboard();//启用键盘上下左右键移动地图
	}
	function fanhui(){
	window.history.go(-1);
	}
	function closed(only){
	if(only=="1"){
	$("#dialog").slideUp(500,function(){});
	if($("#update").val()=="update"){
	location.href="warehouse.do?method=getRemarkMap";
	}else{
	 
	  $('#form1').form('clear');
	 a=false;
	}
	
	 }else if(only=="2"){
	 $("#dialog2").slideUp(500,function(){});
	 if($("#update").val()=="update"){
	location.href="warehouse.do?method=getRemarkMap";
	}else{
	 $('#form2').form('clear');
	 d=false;
	}
	
	 }
	 map.clearOverlays();
	 b=true;
	}
	//地图控件添加函数：
	function addMapControl() {
		//向地图中添加缩放控件
		var opts = {
			type : BMAP_NAVIGATION_CONTROL_LARGE
		}; //放大缩小样式  
		map.addControl(new BMap.NavigationControl(opts));
		//向地图中添加缩略图控件
		var ctrl_ove = new BMap.OverviewMapControl({
			anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
			isOpen : 0
		});
		map.addControl(ctrl_ove);
		//向地图中添加比例尺控件
		var ctrl_sca = new BMap.ScaleControl({
			anchor : BMAP_ANCHOR_BOTTOM_LEFT
		});
		map.addControl(ctrl_sca);
	}
	
	
	var opts = {
	  		width : 200,     // 信息窗口宽度
	  		height: 40,     // 信息窗口高度
	  		enableMessage:false,//设置允许信息窗发送短息
			};
	
	function addremark(){
	if(b==true){
	b=false;
		a=true;
		$("#range1").combobox('setValue',1);
		$("#dialog").slideDown(500,function(){});
	map.setDefaultCursor("crosshair");
		
		map.addEventListener("click", function(e){
		if(a==true){
			a=false;
			var point = new BMap.Point(e.point.lng,e.point.lat);
			zpoint = point;
			var marker = new BMap.Marker(point,{icon:myicon});
			marker.enableDragging();                        //使其能够被拖拽
			circle = new BMap.Circle(point,100,{fillColor:"blue", strokeWeight: 1 ,fillOpacity: 0.3, strokeOpacity: 0.3});
    		map.addOverlay(circle);
			map.addOverlay(marker);
			var geoc = new BMap.Geocoder();
			geoc.getLocation(e.point, function(rs){
			var addComp = rs.addressComponents;
			 infoWindow = new BMap.InfoWindow("地址："+addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber, opts);  // 创建信息窗口对象 
				$("#address1").val(addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber);
				map.openInfoWindow(infoWindow,point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
		});       
			marker.addEventListener("dragend",function(e){
			   geoc.getLocation(e.point, function(rs){
			var addComp = rs.addressComponents;
			circle.setCenter(e.point);
			zpoint = e.point;
			 infoWindow.setContent("地址："+addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber);  // 创建信息窗口对象 
				$("#address1").val(addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber);
				map.openInfoWindow(infoWindow,e.point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,e.point); //开启信息窗口
			});
		});            
			});
			
		}else{
		
		}
		});
	}else{
	
	}
	}
	function addPolygon(){
	if(b==true){
	b=false;
	$("#dialog2").slideDown(500,function(){});
	map.setDefaultCursor("crosshair");
		//var a=true;
		var addComp;
		 var styleOptions = {
        strokeColor:"red",    //边线颜色。
        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    };
		var drawingManager = new BMapLib.DrawingManager(map, {
            isOpen: true, //是否开启绘制模式
            enableDrawingTool: false, //是否显示工具栏
            drawingToolOptions: {
                anchor: BMAP_ANCHOR_TOP_RIGHT, //位置
                offset: new BMap.Size(5, 5), //偏离值
                scale: 0.8 //工具栏缩放比例
            },
            polygonOptions: styleOptions//多边形的样式
        });
        drawingManager.setDrawingMode(BMAP_DRAWING_POLYGON);
        drawingManager.addEventListener('overlaycomplete',function(e){
        d=true;
        e.overlay.enableEditing();
        polygon = e.overlay.getPath();
      	e.overlay.addEventListener('lineupdate',function(type, target){
      	polygon = e.overlay.getPath();
    
      	});
        var haha = e.overlay.getBounds().getCenter();
        zpoint = haha;
         var marker = new BMap.Marker(haha,{icon:myicon});
         marker.enableDragging();
			map.addOverlay(marker);
			marker.addEventListener("dragend",function(f){
			zpoint = f.point; 
			var geoc = new BMap.Geocoder();       
			   geoc.getLocation(f.point, function(rs){
			 addComp = rs.addressComponents;
			
			 infoWindow.setContent("地址："+addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber);  // 创建信息窗口对象 
				$("#address2").val(addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber);
				map.openInfoWindow(infoWindow,f.point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,f.point);
				 
			});
			
		});             
			});  
			var geoc = new BMap.Geocoder();
			geoc.getLocation(haha, function(rs){
			 addComp = rs.addressComponents;
			
			 infoWindow = new BMap.InfoWindow("地址："+addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber, opts);  // 创建信息窗口对象 
				$("#address2").val(addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber);
				map.openInfoWindow(infoWindow,haha);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,haha); //开启信息窗口
			});
			
			
		});
		
		   
        });
         	
	}else{
	
	}
	}
	function search(){
	map.clearOverlays();
		var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	 	var weizhi1 = document.getElementById("weizhi").value;
	myGeo.getPoint(weizhi1, function(point){
		if (point) {
			setfanwei(weizhi1);
			map.centerAndZoom(point, 12);
			var maker = new BMap.Marker(point);
			map.addOverlay(maker);
			myGeo.getLocation(point, function(rs){
			var addComp = rs.addressComponents;
			var infoWindow = new BMap.InfoWindow("地址："+addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber, opts);  // 创建信息窗口对象 
				
				map.openInfoWindow(infoWindow,point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
		});       
		}else{
			alert("无效地址!");
		}
	});
	
	}
	function setfanwei(city){
			var bdary = new BMap.Boundary();
			bdary.get(city, function(rs){       //获取行政区域
				//map.clearOverlays();        //清除地图覆盖物       
				var count = rs.boundaries.length; //行政区域的点有多少个
				for(var i = 0; i < count; i++){
					var ply = new BMap.Polygon(rs.boundaries[i], {strokeColor : "red",
						fillColor:"",  
						strokeWeight : 3,
						fillOpacity: 0,
						strokeOpacity : 0.5,
						strokeStyle: 'dashed'}); //建立多边形覆盖物
					map.addOverlay(ply);  //添加覆盖物
				}                
			});   
	}
	function updatemark(data){
	var myform1 = document.getElementById("form1");
	//var name = document.getElementById("mark_name").value;
		//var code = document.getElementById("code1").value;
		//var type = document.getElementById("type1").value;
		//var range = document.getElementById("range1").value;
		//var did = $("#tree1").combotree('getValue');
		var c = "";
		
  		/* if(name==""){
		parent.$.messager.alert('警告!','请输入标注名称!','info');
		}else if(did==""){
		parent.$.messager.alert('警告!','请选择部门!','info');
		}else if(c==true){
		parent.$.messager.alert('警告!','用户名重复!','info');
		}else{  */
		var cpoint = zpoint.lng+","+zpoint.lat;
		document.forms[0].action="warehouse.do?method=updateRemark&&warehouse_point="+cpoint+"&&kkk="+data;
  		//myform1.action="remarkMap.do?method=updateRemark&&remark_point="+cpoint+"&&remark_state=mark&&kkk="+data;
  		//myform1.submit();
  		document.forms[0].submit();
  		/* }  */ 
	}
	function savemark(data){
	if($("#update").val()=="update"){
	updatemark(data);
	}else{
		var myform = document.getElementById("form1");
		//var name = document.getElementById("mark_name").value;
		//var code = document.getElementById("code1").value;
		//var type = document.getElementById("type1").value;
		//var range = document.getElementById("range1").value;
		//var did = $("#tree1").combotree('getValue');
		var c = "";
		$.ajax({
  			type: "POST",
  			async : false,
  			url:'warehouse.do?method=checkName',
  			data:{name:name},
  			success:function(data){
  				c=data;
  			}
  		});
  		 if($("#form1").validationEngine('validate')&&c!=true&&a!=true){
  	//可提交
  		var cpoint = zpoint.lng+","+zpoint.lat;
  		myform.action="warehouse.do?method=saveRemark&&warehouse_point="+cpoint+"&&kkk="+data;
  		myform.submit();
  		}else{
    	$.messager.alert('站点管理', '必填信息不可为空', 'info');
  		}
  		}
		
	 
	}
	function updatepolygon(data){
	
		ppoint=zpoint.lng+","+zpoint.lat+"|";
		
		for(var i=0;i<polygon.length;i++){
		ppoint += polygon[i].lng+","+polygon[i].lat+"|";
		}
		ppoint = ppoint.substring(0,ppoint.length-1);
		var myform = document.getElementById("form2");
		var name = document.getElementById("mark_name2").value;
		var did = $("#tree2").combotree('getValue');
		var c = "";
		if(name==""){
		parent.$.messager.alert('警告!','请输入标注名称!','info');
		}else if(did==""){
		parent.$.messager.alert('警告!','请选择部门!','info');
		}else if(c==true){
		parent.$.messager.alert('警告!','用户名重复!','info');
		}else{ 
		$("#hidden_point").val(ppoint);
  		myform.action="warehouse.do?method=updateRemark&&remark_state=polygon&&kkk="+data;
  		myform.submit();
  		}
	}
	function savepolygon(data){
	if($("#update").val()=="update"){
	updatepolygon(data);
	}else{
	ppoint=zpoint.lng+","+zpoint.lat+"|";
		for(var i=0;i<polygon.length;i++){
		ppoint += polygon[i].lng+","+polygon[i].lat+"|";
		}
		ppoint = ppoint.substring(0,ppoint.length-1);
		var myform = document.getElementById("form2");
		var name = document.getElementById("mark_name2").value;
		var did = $("#tree2").combotree('getValue');
		var c = "";
		
		$.ajax({
  			type: "POST",
  			async : false,
  			url:'warehouse.do?method=checkName',
  			data:{name:name},
  			success:function(data){
  				c=data;
  			}
  		});
		if(name==""){
		parent.$.messager.alert('警告!','请输入标注名称!','info');
		}else if(did==""){
		parent.$.messager.alert('警告!','请选择部门!','info');
		}else if(c==true){
		parent.$.messager.alert('警告!','用户名重复!','info');
		}else if(d==false){
		parent.$.messager.alert('警告!','请在地图上画出区域!','info');
		}else{ 
		$("#hidden_point").val(ppoint);
  		myform.action="warehouse.do?method=saveRemark&&remark_state=polygon&&kkk="+data;
  		myform.submit();
  		}
	}
		
	}
	//卫星地图切换按钮
		$("#wxdtdiv").click(function() {
			obj = $("#pdwd").val();
			if (obj == "卫星") {
				$(this).css("background-image", "url('images/dt.png')");
				$("#pdwd").val("地图");
				map.setMapType(BMAP_HYBRID_MAP);
			} else {
				$(this).css("background-image", "url('images/wx.png')");
				$("#pdwd").val("卫星");
				map.setMapType(BMAP_NORMAL_MAP);
			}
		});
	function saveremark1(data1){
	if(data1=="savemark"){
		savemark("save");
	}else if(data1=="xinjianmark"){
		savemark("xinjian");
		
	}else if(data1=="savepolygon"){
		savepolygon("save");
	}else if(data1=="xinjianpolygon"){
		savepolygon("xinjian");
	}
	}
	function getmodify(data){
  if(data!="null"){
  	var opts2 = {
	  		width : 200,     // 信息窗口宽度
	  		height: 130,     // 信息窗口高度
	  		enableMessage:false,//设置允许信息窗发送短息
			};
  $("#update").val("update");
  var department;
  	$.ajax({
  			type: "POST",
  			async : false,
  			url:'warehouse.do?method=getRemark',
  			data:{id:data},
  			success:function(data){
  					$.ajax({
  					type: "POST",
  					async : false,
  					url:'user.do?method=getDepartment',
  					data:{did:data.remark_department},
  					success:function(data){
  						department=data;
  			}
  		});
  			if(1==1){
  			$("#updateid").val(data.warehouse_id);
	  			var remark_point = data.warehouse_point.split(",");
	  			var point = new BMap.Point(remark_point[0],remark_point[1]);
	  			var marker = new BMap.Marker(point,{icon:myicon});
	  			var range;
	  			map.addOverlay(marker);
	  			zpoint = point;
	  			map.centerAndZoom(point, 11);
	  			marker.enableDragging();                        //使其能够被拖拽
				var geoc = new BMap.Geocoder();
			geoc.getLocation(point, function(rs){
			var addComp = rs.addressComponents;
			var type;
			if(data.warehouse_type=="0"){
			type="散支库（C库）";
			}else if(data.warehouse_type=="1"){
			type="整箱库（D库）";
			}
			 infoWindow = new BMap.InfoWindow("<label class='la'>客户编号:"+data.warehouse_num+"<br>客户名称:"+data.warehouse_name+"</br>地址:"+data.warehouse_address+
			 "</br>类型:"+type+"</label>",opts2);  // 创建信息窗口对象 
				$("#address1").val(data.warehouse_address);
				map.openInfoWindow(infoWindow,point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
		}); 
		marker.addEventListener("dragend",function(e){
			zpoint = e.point;        //添加拖拽的响应事件
			   geoc.getLocation(e.point, function(rs){
			   
			var addComp = rs.addressComponents;
			var address= addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber;
			//circle.setCenter(e.point);
			var type;
			if(data.warehouse_type=="0"){
			type="散支库（C库）";
			}else if(data.warehouse_type=="1"){
			type="整箱库（D库）";
			}
			 infoWindow.setContent("<label class='la'>客户编号:"+data.warehouse_num+"<br>客户名称:"+data.warehouse_name+"</br>地址:"+data.warehouse_address+
			 "</br>类型:"+type+"</label>");  // 创建信息窗口对象 
				$("#address1").val(address);
				map.openInfoWindow(infoWindow,e.point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,e.point); //开启信息窗口
			});
		});            
			});
			$("#warehouse_name").val(data.warehouse_name);
			$("#warehouse_num").val(data.warehouse_num);
			$("#mark_tel1").val(data.warehouse_type);
			$("#dialog").slideDown(500,function(){});
  			}else if(data.remark_state=="polygon"){
  			$("#updateid2").val(data.remark_id);
  				var remark_point = data.remark_point.split("|");
	  			var point = new BMap.Point(remark_point[0].split(",")[0],remark_point[0].split(",")[1]);
	  			var marker = new BMap.Marker(point,{icon:myicon});
	  			zpoint = point;
	  			map.addOverlay(marker);
	  			map.centerAndZoom(point, 11);
	  			 var styleOptions = {
        strokeColor:"red",    //边线颜色。
        fillColor:"red",      //填充颜色。当参数为空时，圆形将没有填充效果。
        strokeWeight: 3,       //边线的宽度，以像素为单位。
        strokeOpacity: 0.8,	   //边线透明度，取值范围0 - 1。
        fillOpacity: 0.6,      //填充的透明度，取值范围0 - 1。
        strokeStyle: 'solid' //边线的样式，solid或dashed。
    };
    	var points =[];
    		for(var i=1;i<remark_point.length;i++){
		var pointss = new BMap.Point(remark_point[i].split(",")[0],remark_point[i].split(",")[1]);
		points.push(pointss);
		}
		var polygons = new BMap.Polygon(points,styleOptions);
		map.addOverlay(polygons);
		polygons.enableEditing();
        polygon = polygons.getPath();
      	polygons.addEventListener('lineupdate',function(type, target){
      	polygon = polygons.getPath();
      	});
      	var geoc = new BMap.Geocoder();
			geoc.getLocation(point, function(rs){
			var addComp = rs.addressComponents;
			 infoWindow = new BMap.InfoWindow("<label class='la'>名称:"+data.remark_name+"</br>地址:"+data.remark_address+
			 "</br>所在部门:"+department+"</br>联系方式:"+data.remark_tel+"</label>",opts2);  // 创建信息窗口对象 
				$("#address2").val(data.remark_address);
				map.openInfoWindow(infoWindow,point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
		}); 
		marker.enableDragging();
		marker.addEventListener("dragend",function(e){
			zpoint = e.point;        //添加拖拽的响应事件
			   geoc.getLocation(e.point, function(rs){
			   
			var addComp = rs.addressComponents;
			var address= addComp.province +addComp.city + addComp.district + addComp.street + addComp.streetNumber;
			 infoWindow.setContent("<label class='la'>名称:"+data.remark_name+"</br>地址:"+address+
			 "</br>所在部门:"+department+"</br>联系方式:"+data.remark_tel+"</label>");  // 创建信息窗口对象 
				$("#address2").val(address);
				map.openInfoWindow(infoWindow,e.point);
				marker.addEventListener("click", function(){          
				map.openInfoWindow(infoWindow,e.point); //开启信息窗口
			});
		});            
			});
			$("#mark_name2").val(data.remark_name);
			$("#mark_tel2").val(data.remark_tel);
			$("#tree2").combotree("setValue",department);
			$("#departmentid").val(data.remark_department);
			$("#dialog2").slideDown(500,function(){});
  			}
  			}
  			});
  			}
  }
  </script>
</html>
