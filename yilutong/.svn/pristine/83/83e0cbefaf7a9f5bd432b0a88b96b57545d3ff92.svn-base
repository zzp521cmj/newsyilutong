/*
 文件名:S-gz_mapcarlxgz.js
创建人:黄清华
类型:js
创建日期:
最新修改日期:
 */
var pts =[];
// 获取通用Id的方法
function getfromid(obj) {
	return document.getElementById(obj);
}

// 创建和初始化地图函数：
var flag=false;
var ctrl;// 路况的全局变量
var map;
function initMap() {
	createMap();// 创建地图
	setMapEvent();// 设置地图事件
	addMapControl();// 向地图添加控件
	flag=true;
}
function createMap() {
	map = new BMap.Map("dituContent");
	map.centerAndZoom(new BMap.Point(116.403874, 39.914889), 6);
	getfromid("mins").innerHTML = "☞ 地图级别: " + map.getZoom();
}
function setMapEvent() {
	map.enableScrollWheelZoom();
	map.enableKeyboard();
	map.enableDragging();
	map.enableDoubleClickZoom();
}
// 向地图添加控件
function addMapControl() {
	var scaleControl = new BMap.ScaleControl({
		anchor : BMAP_ANCHOR_BOTTOM_LEFT
	});
	scaleControl.setUnit(BMAP_UNIT_METRIC);
	map.addControl(scaleControl);
	var navControl = new BMap.NavigationControl({
		anchor : BMAP_ANCHOR_TOP_LEFT,
		type : 0
	});
	map.addControl(navControl);
	var overviewControl = new BMap.OverviewMapControl({
		anchor : BMAP_ANCHOR_BOTTOM_RIGHT,
		isOpen : false
	});
	map.addControl(overviewControl);
	var opts = {
		showPanel : false
	};
	ctrl = new BMapLib.TrafficControl(opts);
	map.addControl(ctrl);
}
initMap();
map.addEventListener("zoomend", function() {
	getfromid("mins").innerHTML = "☞ 地图级别: " + map.getZoom();
	});

// 连接所有点
function lin(){
	var olepolyline=new BMap.Polyline(pts, {
		strokeColor : "#2DCD1F",
		strokeWeight : 4,
		strokeOpacity : 1
	});
	olepolyline.disableMassClear();
	map.addOverlay(olepolyline);
}
// 记录最后一个点
var endpoint ="";
function getmapgzinfor(point) {
	var newpoint = point;
	var polyline=new BMap.Polyline([endpoint,newpoint], {
		strokeColor : "#DB55E5",
		strokeWeight : 4,
		strokeOpacity : 1
	});
	polyline.disableMassClear();
	map.addOverlay(polyline);
	endpoint = newpoint;
}

function getinfo(obj){
	if(flag){
	if(obj!=null||obj!=""){
		$.ajax({
			   type: "POST",
			   url: "map.do?method=getgzinfo",
			   data: {carno:obj},
			   async:false,
			   success: function(msg){
				   $.each(JSON.parse(msg), function(i, itme) {
					   var point=new BMap.Point(itme.lng,itme.lat);
						pts.push(point);
					   });
				   if(pts.length>0){
				   lin();
				   }
			   }
		});
	}
	endpoint=pts[pts.length - 1];
	getcarinfo(obj);
	}
}

var myGeo = new BMap.Geocoder();
//创建mark自定义图片
var nullcarIcon = new BMap.Icon("images/kc.png", new BMap.Size(40, 30), {// 行驶图片
	imageOffset : new BMap.Size(0, 0)
// 图片的偏移量。为了是图片底部中心对准坐标点。
});
var carIcon = new BMap.Icon("images/zc.png", new BMap.Size(40, 30), { // 静止图片
	imageOffset : new BMap.Size(0, 0)
});
var nocarIcon = new BMap.Icon("images/lx.png", new BMap.Size(40, 30), {// 离线图片
	// anchor: new BMap.Size(0, -5), imageSize //相当于CSS精灵
	imageOffset : new BMap.Size(0, 0)
});

var _carno="";
//此方法需要每隔一顿时间调用一次
function getcarinfo(carno){
	_carno=carno;
	map.clearOverlays();//调用清除方法清楚所有mark，因为线路被设置disableMassClear()此设置在调用清除方法的时候不会被清除
	$.getJSON("map.do?method=loadmapinfo",{"carno":carno}, function(json) {
		$(json).each(function(i) {
			pto=json[i];
			var label = new BMap.Label(carno, {
				offset : new BMap.Size(-20, -20)
			});
			label.setStyle({
				color : "black",
				fontSize : "13px",
				fontWeight : "bolder",
				height : "16px",
				lineHeight : "16px",
				fontFamily : "微软雅黑",
				borderColor : "black",
				backgroundColor : "#FFF774"
			});
			var carMk=null;//carmark的全局变量
			var point=null;//point的全局变量
			if (pto.state == 1) {
				point = new BMap.Point(pto.lng, pto.lat);
				carMk = new BMap.Marker(point, {
					icon : carIcon
				});
			}
			if (pto.state == 2) {
				point = new BMap.Point(pto.lng, pto.lat);
				carMk = new BMap.Marker(point, {
					icon : nullcarIcon
				});
			}
			if (pto.state == 3) {
				point = new BMap.Point(pto.lng, pto.lat);
				carMk = new BMap.Marker(point, {
					icon : nocarIcon
				});
			}
			carMk.setLabel(label);
			carMk.setRotation(pto.angel);
			carMk.addEventListener("click", showcarinfor);//同时给创建的mark添加点击方法
			map.addOverlay(carMk);
			careteinfor(point, carno);//创建mark的同时开启info窗口
			getmapgzinfor(point);
			map.setZoom(10);
			map.panTo(point);
		});
	});
}

setInterval("getcarinfo(_carno)",7000);
function showcarinfor(e) {
	point = e.target.getPosition();// point
	labcon = e.target.getLabel().content;// 车牌号
	careteinfor(point, labcon);
}
// 创建windows信息展示窗口
var infoWindow;
function careteinfor(point, carno) {
	var opts = {
		title : "<span style='color:#D2693C;font-size: 14px;font-weight: bold'></span>", // 信息窗口标题
		enableAutoPan : true, // 自动平移
		enableCloseOnClick:false,
		offset : new BMap.Size(0, 0)
	// 偏离值
	};
	var carsno=carno;
	var addComp = "";
	var add = "";
	var cityname = "";
	var weather = "";
	myGeo.getLocation(point,function(rs) {
		addComp = rs.addressComponents;
		add = addComp.province + addComp.city+ addComp.district + addComp.street+ addComp.streetNumber;
		cityname = addComp.city;
		cityname = cityname.substring(0, cityname.length - 1);
		$.ajax({async : false,url : "http://php.weather.sina.com.cn/js.php?"+ $.param({
												city : cityname, // 城市
												day : 0,
												password : "DJOYnieT8234jlsK"
											}),
			dataType : "script",success : function(json) {
			weather = status1 + " " + temperature2+ '°~' + temperature1 + '°';
			$.getJSON("map.do?method=loadmapinfo",{"carno" : carsno},function(mapinfos) {
				infoWindow = new BMap.InfoWindow("<table  style='  border-collapse: collapse; border-spacing: 0;line-height: 18px;white-space: nowrap;color:#333;font-size: 12px;ont-family: ''Microsoft YaHei',微软雅黑,Arial,Helvetica,Sans-Serif''> <tr> <td>车牌号：</td><td>"
				+ carsno+ "</td> </tr><tr> <td>所属机构：</td><td>"+ mapinfos[0].deptname
				+ "</td> </tr><tr> <td>GPS设备号：</td><td>"+ mapinfos[0].beidouid
				+ "</td> </tr><tr> <td>GPS状态：</td><td>"+ mapinfos[0].gpsstate
				+ "</td> </tr><tr> <td>当前位置：</td><td>"+ add+ "</td> </tr><tr> <td>定位时间：</td><td>"
				+ mapinfos[0].nowdate+ "</td> </tr><tr> <td>天气状况：</td><td>"
				+ weather+ "</td> </tr><tr> <td>经纬度：</td><td>"+ point.lng+ ","+ point.lat
				+ "</td> </tr></table>",opts);
				map.openInfoWindow(infoWindow, point); // 开启信息窗口
				});
			}
		});
	});
}

$(document).ready(function() {
	// 卫星地图切换按钮
	$("#wxanddt").click(function() {
		obj = $("#wxanddt").text();
		if (obj == "卫星") {
			$("#wxanddt").text("地图");
			map.setMapType(BMAP_HYBRID_MAP);
		} else {
			$("#wxanddt").text("卫星");
			map.setMapType(BMAP_NORMAL_MAP);
		}
	});
	// 卫星地图切换按钮end

	// 路况切换按钮获取状态的判断
	var s = true;
	// 路况切换按钮
	$("#lq").click(function() {
		if (s) {
			$("#lq").css("background-color"," #3276B1");
			ctrl.showTraffic();
			s = false;
		} else if (!s) {
			$("#lq").css("background-color","");
			ctrl.hideTraffic();
			s = true;
		}
	});
	// 路况切换按钮end
});