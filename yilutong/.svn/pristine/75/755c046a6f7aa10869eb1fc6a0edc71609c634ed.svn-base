/*
 文件名:S-lx-maplxgh.js
创建人:黄清华
类型:js
创建日期:
最新修改日期:
 */
//创建和初始化地图函数：
function initMap() {
	createMap();// 创建地图
	setMapEvent();// 设置地图事件
	addMapControl();// 向地图添加控件
}
function createMap() {
	map = new BMap.Map("dituContent");
	map.centerAndZoom(new BMap.Point(116.403874, 39.914889), 6);
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
		anchor : BMAP_ANCHOR_BOTTOM_LEFT,
		offset : new BMap.Size(10, 60)
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
}
var map;
var tj;
var lxpts = [];// 坐标集合
var zlc;// 具体路线信息框
initMap();// 初始地图

//获取通用Id的方法
function getfromid(obj) {
	return document.getElementById(obj);
}

var options = {
	onSearchComplete : function(results) {
		if (driving.getStatus() == BMAP_STATUS_SUCCESS) {
			// 获取第一条方案
			var plan = results.getPlan(0);
			// 获取方案的驾车线路
			var route = plan.getRoute(0);
			zlc = plan.getDistance(true);
			// 获取每个关键步骤,并输出到页面
			var s = [];
			for (var i = 0; i < route.getNumSteps(); i++) {
				var step = route.getStep(i);
				s
						.push("<span style='margin-left: 20px;  text-align: start;  width: 260px;  display: block;'>"
								+ (i + 1)
								+ ") "
								+ step.getDescription()
								+ "</span>");
			}
			document.getElementById("resplan").innerHTML = s.join("<hr/>");
			//var pts = plan.getRoute(0).getPath();
			//var pt = new BMap.Point(114.31911,37.096642);
			//var ply = new BMap.Polyline(pts);
			//var result = BMapLib.GeoUtils.isPointOnPolyline(pt, ply);
			/*var dds = new BMap.Marker(pt, {
				icon : bzd
			});
			map.addOverlay(dds);*/
			/*if (result == true) {
				// alert("点在折线上");
			} else {
				// alert("点在折线外");
			}*/
			// 获取方案的驾车线路
			var points = plan.getDragPois();
			lxpts = "";
			for (var j = 0; j < points.length; j++) {
				lxpts = lxpts + points[j].point.lng + "," + points[j].point.lat
						+ "|";
			}
			lxpts = lxpts.substring(0, lxpts.length - 1);
			savepoints(start, lxpts, end);
		}
	},
	renderOptions : {
		map : map,
		panel : "",
		enableDragging : true
	// 起终点可进行拖拽
	}
};
var driving = new BMap.DrivingRoute(map, options);// policy:BMAP_DRIVING_POLICY_AVOID_HIGHWAYS

// 查询路线
function searchlx(strat, pt, end) {
	slng = start.split(",")[0];// 分割
	slat = start.split(",")[1];
	elng = end.split(",")[0];
	elat = end.split(",")[1];// end
	if (pt == null || pt == "") {// 没有经过点
		driving.search(new BMap.Point(slng, slat), new BMap.Point(elng, elat));
	} else {// 有经过点
		driving.search(new BMap.Point(slng, slat), new BMap.Point(elng, elat),
				{
					waypoints : pt
				});
	}
}
// 线路拖动后的回调方法，给具体路线的div放值
/*driving.setPolylinesSetCallback(function() {
	zlc = zlc.substring(0, zlc.length - 2);
	document.getElementById("lcs").value = zlc;
	document.getElementById("resplan").style.height = "200px";
});*/

// 把必须的值保存到隐藏（包括id，和坐标的集合）
function savepoints(start, pts, end) {
	var slng, slat;// 开始lng,lat
	var elng, elat;// 结束
	slng = start.split(",")[0];// 分割
	slat = start.split(",")[1];
	elng = end.split(",")[0];
	elat = end.split(",")[1];// end
	var ptsinput = document.getElementById("pst");
	var ptsstring = slng + "," + slat + "|" + pts + "|" + elng + "," + elat;
	ptsinput.value = ptsstring;
}
// linid,name,bh,type,lc ,bz ,cid,zb
// 修改方法，获取单条记录把值塞入
function craetelinforupdate(linid, name, bh,scity,ecity,spt,ept,stoptime,longtime,type, lc, bz, zb) {
	//$("#linbx").attr("disabled", true);
	document.getElementById("linid").value = linid;
	document.getElementById("xlname").value = name;
	document.getElementById("linbh").value = bh;
	document.getElementById("linfatype").value = type;
	document.getElementById("lcs").value = lc;
	document.getElementById("linbz").value = bz;
	document.getElementById("scity").value = scity;
	document.getElementById("ecity").value = ecity;
	document.getElementById("stoptime").value = stoptime;
	document.getElementById("longtime").value = longtime;
	document.getElementById("spt").value = spt;
	document.getElementById("ept").value = ept;
	var arr = new Array();
	arr = zb.split("|");// 按照，把坐标分割
	start = arr[0];// 获取第一个为起始坐标
	end = arr[arr.length - 1];
	// 起始 结尾坐标对象生成end
	var uplng, uplat;// 经过点的分割接收
	for (var x = 1; x < arr.length - 1; x++) {
		if(arr[1]==""){
			pts=null;
		}else{
		uplng = arr[x].split(",")[0];// 分割
		uplat = arr[x].split(",")[1];
		pts[x - 1] = new BMap.Point(uplng, uplat);// 生成经过点集合
		}
	}
	searchlx(start, pts, end);// 调用方法
}
// 创建线路s
var start = "", end = "";
var ptp = "";
var pts = [];
/*
 * var pstart="",pend="",cpt=""; var psran=0,peran=0, cpran=0;
 */
var addpot = "";
function savecjxl() {
	start=getfromid("spt").value;
	end=getfromid("ept").value;
	if(start==""||end==""){
		$.messager.alert('添加线路', '请选择起始城市和结束城市', 'info');
	}else
	if(start==end){
		$.messager.alert('添加线路', '开始城市与结束城市不能一样', 'info');
	}else{
		searchlx(start, null, end);
	}
}

// label.setTitle(name); 为label添加鼠标提示
var bzd = new BMap.Icon("images/t3.png", new BMap.Size(50, 50), {
	anchor : new BMap.Size(45, 47)
});

// 保存线路并新建s
function savelx() {
	var s = document.getElementById("xlname").value;
	var cd = document.getElementById("lcs").value;
	var pts = document.getElementById("pst").value;
	if($("#mylxform").validationEngine('validate')){
	  	//可提交
		if (s == "") {
			//$.messager.alert('添加线路', '线路名称不能为空', 'info');
		} else if (cd == "" || cd == "单位千里" || isNaN(cd)) {
			//$.messager.alert('添加线路', '里程填写不正确', 'info');
		} else if (pts == "") {
			//	$.messager.alert('添加线路', '未创建路线', 'info');
		} else {
			document.getElementById("mylxform").action = "maplin.do?method=savexlpts";
			document.getElementById("mylxform").submit();
		}
	  }else{
	    $.messager.alert('添加线路', '必填信息不可为空', 'info');
	  }
}// 保存线路并新建e

// 保存线路s
function savelxcx(obj) {
	var text=obj.innerText;
	var s = document.getElementById("xlname").value;
	var cd = document.getElementById("lcs").value;
	var pts = document.getElementById("pst").value;
	if($("#mylxform").validationEngine('validate')){
	  	//可提交
		if (s == "") {
			//$.messager.alert('添加线路', '线路名称不能为空', 'info');
		} else if (cd == "" || cd == "单位千里" || isNaN(cd)) {
			//$.messager.alert('添加线路', '里程填写不正确', 'info');
		} else if (pts == "") {
			///$.messager.alert('添加线路', '未创建路线', 'info');
		} else {
			document.getElementById("mylxform").action = "maplin.do?method=savexlptsgo&text="+text;
			document.getElementById("mylxform").submit();
		}
	}else{
	    $.messager.alert('添加线路', '必填信息不可为空', 'info');
	}
}
// 保存线路e

// 选择类型
function sw(obj) {
	if (obj.value == 0) {
		driving.setPolicy();
	} else if (obj.value == 1) {
		driving.setPolicy(BMAP_DRIVING_POLICY_AVOID_HIGHWAYS);
	} else if (obj.value == 2) {
		driving.setPolicy(BMAP_DRIVING_POLICY_LEAST_TIME);
	} else if (obj.value == 3) {
		driving.setPolicy(BMAP_DRIVING_POLICY_LEAST_DISTANCE);
	}
	searchlx(start, null, end);
}
// 检查名字是否存在
function checkname(obj) {
	var linname = obj.value;
	$.ajax({
		type : "POST",
		url : "maplin.do?method=checkname",
		data : {
			linname : linname
		},
		success : function(msg) {
			if (msg == "ok") {
				$("#bclin").attr("disabled", false);
				$("#bcxjlin").attr("disabled", false);
				$("#bclin").css("background", "");
				$("#bcxjlin").css("background", "");
			} else {
				$.messager.alert('添加线路', '线路名称重复', 'info');
				$("#bclin").attr("disabled", true);
				$("#bcxjlin").attr("disabled", true);
				$("#bclin").css("background", "#cccccc");
				$("#bcxjlin").css("background", "#cccccc");
 			}
		}
	});
}
// end
var bzd = new BMap.Icon("images/newzd.png", new BMap.Size(23, 24), {
	anchor : new BMap.Size(0, 24)
});
var geoc = new BMap.Geocoder(); 

function sstd(obj){//选择起点
	var i=0;
		map.setDefaultCursor("crosshair");    //设置地图默认的鼠标指针样式
		map.addEventListener("click", function(e){  
			i++;
			if(i>2){
				map.setDefaultCursor("url('bird.cur')");
			}else{
			var pt = e.point;
			var mk = new BMap.Marker(pt, {
				icon : bzd
			});
			mk.addEventListener("click", setaddress);
			map.addOverlay(mk);
			geoc.getLocation(pt, function(rs){
				var addComp = rs.addressComponents;
				var address=(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);	
				var label = new BMap.Label(address, {
					offset : new BMap.Size(-50, 25)
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
					mk.setLabel(label);
			});
			}
		});
}
function setcity(o,b){
	getfromid("spt").value=o+","+b;
	point = new BMap.Point(o,b);
	getfromid("scity").value="";	
	geoc.getLocation(point, function(rs){
		var addComp = rs.addressComponents;
		var address=(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);	
		getfromid("scity").value=address;	
	});
}

function setecity(o,b){
	getfromid("ept").value=o+","+b;
	point = new BMap.Point(o,b);
	getfromid("ecity").value="";
	geoc.getLocation(point, function(rs){
		var addComp = rs.addressComponents;
		var address=(addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);	
		getfromid("ecity").value=address;	
	});
}

function setaddresse(e){//设置mark的地址
	point = e.target.getPosition();// point
	var opts = {
			  width : 50,
			  enableAutoPan : true, // 自动平移
			  title : "<span style='color:#D2693C;font-size: 14px;font-weight: bold'>设置开始点</span>" , // 信息窗口标题
			  enableMessage:false,//设置允许信息窗发送短息
			  offset : new BMap.Size(0, -20)
			};
			var infoWindow = new BMap.InfoWindow("<input type='button' value='设为开始点' style='height: 30;border: 1px solid #ccc;background-color: white;cursor: pointer;width: 100px; margin-left: 55px;' onclick='setgreatlin("+ '"'+ point.lng+ '"'+","+'"'+ point.lat+'"'+ ")'  onmouseover='over(this)' onmouseout='out(this)'>", opts);  // 创建信息窗口对象 
	map.openInfoWindow(infoWindow,point); //开启信息窗口
}

var sums=[];//长度数组
var addresspoint=[];//point数组
var points=[];
function setgreatlin(lng,lat){
	points=[];
	sums=[];//长度数组
	map.clearOverlays(); 
	var point=new BMap.Point(lng,lat);//起点
	if(addresspoint.length>0){
		for (var int = 0; int < addresspoint.length; int++) {//小于总站点的数量
			var polyline = new BMap.Polyline([point,addresspoint[int]]);
			var dis = BMapLib.GeoUtils.getPolylineDistance(polyline);
			sums.push(dis);
			points.push(addresspoint[int]);
		}
	    //外层循环，共要进行arr.length次求最大值操作
	    for(var i=0;i<sums.length;i++){
	        //内层循环，找到第i大的元素，并将其和第i个元素交换
	        for(var j=i;j<sums.length;j++){
	            if(sums[i]>sums[j]){
	                //交换两个元素的位置
	                var temp=points[i];
	                points[i]=points[j];
	                points[j]=temp;
	                
	                var temps=sums[i];
	                sums[i]=sums[j];
	                sums[j]=temps;
	            }
	        }
	    }
	    
	    /*var newarr=[];
		for (var k = 0; k < points.length-1; k++) {
			newarr[k]=points[k+1];
		}*/
		driving.setPolicy(BMAP_DRIVING_POLICY_AVOID_HIGHWAYS);
	    driving.search(point, point,
				{
					waypoints : points
				});
	}
}
function ceatelin(){
	console.log(sums);
	console.log(ps);
	for(var i=0;i<sums.length;i++){
        //内层循环，找到第i大的元素，并将其和第i个元素交换
        for(var j=i;j<sums.length;j++){
            if(sums[i]>sums[j]){
                //交换两个元素的位置
            	var temp1=ps[i];
            	ps[i]=ps[j];
            	ps[j]=temp1;
            	
                var temp=sums[i];
                sums[i]=sums[j];
                sums[j]=temp;
            }
        }
    }
	console.log(sums);
	console.log(ps);
	var newarr=[];
	for (var k = 0; k < sums.length-2; k++) {
		newarr[k]=ps[k+1];
	}
	console.log(newarr);
	driving.search(pointss, ps[ps.length-1],
			{
				waypoints : newarr
			});
	sums=[];
	ps=[];
}

function pushpoints(pt){//把回调函数中的值赋值给全局标量
	addresspoint.push(pt);
}


function addsum(num,sum){
	sums.push(num);
	if(parseInt(sum)==parseInt(sums.length)){//说明回调完成
		ceatelin();
	}
	
}
var ps=[];
function addpoint(_point){
	ps.push(_point);
}
function cleanall(){
	map.setZoom(6);
	map.panTo(new BMap.Point(116.403874, 39.914889));
	map.clearOverlays(); 
	document.getElementById("xlname").value="";
	document.getElementById("linbh").value="";
	document.getElementById("linfatype").value="0";
	document.getElementById("lcs").value="0";
	document.getElementById("linbz").value="";
	document.getElementById("scity").value="";
	document.getElementById("spt").value="";
	document.getElementById("ecity").value="";
	document.getElementById("ept").value="";
	document.getElementById("stoptime").value="";
	document.getElementById("longtime").value="";
	location.reload();
}

// 返回
function backto() {
	document.getElementById("bc").action = "maplin.do?method=golin";
	document.getElementById("bc").submit();
}
function over(obj){
	obj.style.background='#5DA0FC';
	obj.style.color="white";
}

function out(obj){
	obj.style.background='white';
	obj.style.color="black";
}
var tl = new BMap.Icon("images/tld.png", new BMap.Size(18, 30), {
	anchor : new BMap.Size(10, 30)
});

// div特效jquery区
$(document).ready(function() {
	$.getJSON("maplin.do?method=loadmarkforzd", function(json) {
		$(json).each(function(i) {
			if(json[i]!=""){
				var zdlabel = new BMap.Label(json[i].names, {
					offset : new BMap.Size(-20, 25)
				});//设置站点隐藏的label
				zdlabel.setStyle({
					color : "white",
					fontSize : "12px",
					height : "16px",
					lineHeight : "16px",
					fontFamily : "微软雅黑",
					borderColor : "blue",
					backgroundColor : "#1764AF",
					borderRadius: "5px"
				});
				x=json[i].points.split(",")[0];
				y=json[i].points.split(",")[1];
				var point = new BMap.Point(x, y);
				var d = new BMap.Marker(point, {
					icon : tl
				});
				d.disableMassClear();
				d.addEventListener("click", setaddresse);
				d.setLabel(zdlabel);
				map.addOverlay(d);
			}
		});
	});
	 $("#mylxform").validationEngine('attach', { 
		 promptPosition:'centerLeft:45,-35'/*'topRight:-50,0'*/,
		 autoPositionUpdate:true,
		 scroll:false,
		 maxErrorsPerField:1,
		 autoHidePrompt:true,//	是否自动隐藏提示信息
		 autoHideDelay:1000
		 });
	
	
	$("#sms").click(function() {
		$("#mins").fadeIn(1000);
		$("#maxs").animate({
			left : '-=450px',
		});
	});
	$("#mins").click(function() {
		$("#mins").fadeOut(000);
		$("#maxs").animate({
			left : '+=450px',
		});
	});
});