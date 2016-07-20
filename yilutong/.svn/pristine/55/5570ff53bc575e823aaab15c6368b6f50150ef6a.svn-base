/*
 文件名:S-all-addpy.js
创建人:黄清华
类型:jsp//地图加载所有站点
创建日期:2015-6-9
最新修改日期:
*/

//加载地图获取站点数据
var arforp=[];//保存所有站点区域
var arforr=[];//保存站点旗子
var arforpf=[];//保存站点文字
var arfora=[];//保存站点范围
var arforclean=[];
function startload(){
	for (var int = 0; int < arforclean.length; int++) {
		arforclean[int].remove();
	}
	arforclean=[];
	$.getJSON("map.do?method=loadmarkforzd", function(json) {
		$(json).each(function(i) {
			if(json[i]!=""){
				caretezdremark(json[i]);
			}
		});
		if(null!=arforpf){
		for (var g = 0; g < arforpf.length; g++) {
			arforpf[g].getLabel().hide();
		}
		}
	});
}

var bzd = new BMap.Icon("images/newzd.png", new BMap.Size(23, 24), {
	anchor : new BMap.Size(0, 24)
});

function caretezdremark(obj){
	var apoint=obj.apoint;

	var zdlabel = new BMap.Label(obj.rname, {
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
	
	if(obj.rtype=="polygon"){//当站点为多边形
		var one=apoint.split("|");
		var x,y;
		var apt=[];
		q=one[0].split(",")[0];
		z=one[0].split(",")[1];
		for(var o=1;o<one.length;o++){
			x=one[o].split(",")[0];
			y=one[o].split(",")[1];
			apt[o-1]=new BMap.Point(x,y);
		}
		var polyline = new BMap.Polygon(apt,{
			strokeColor : "red",
			strokeWeight : 3,
			fillOpacity : 0,
			strokeOpacity : 0.5,
			strokeStyle : 'soild'
		}); 
		polyline.disableMassClear();
		map.addOverlay(polyline);
		p=new BMap.Point(q,z);
		var e = new BMap.Marker(p, {
			icon : bzd
		});
		e.addEventListener("click", showzdinfo);
		e.setLabel(zdlabel);
		e.disableMassClear();
		map.addOverlay(e);
		arforpf.push(e);
		arforp.push(polyline);
		arforr.push(e);
		arforclean.push(polyline,e);
	}else{//站点为点和范围
		var rran=obj.rran;
		x=apoint.split(",")[0];
		y=apoint.split(",")[1];
		var point = new BMap.Point(x, y);
		var d = new BMap.Marker(point, {
			icon : bzd
		});
		d.disableMassClear();
		d.addEventListener("click", showzdinfo);
		d.setLabel(zdlabel);
		
		var cir = new BMap.Circle(point,rran, {
			fillColor : "red",
			strokeWeight : 1,
			fillOpacity : 0.3,
			strokeOpacity : 0.3
		});
		cir.disableMassClear();
		map.addOverlay(d);
		map.addOverlay(cir);
		arforpf.push(d);
		arforr.push(d);
		arfora.push(cir);
		arforclean.push(d,cir);
	}
}

function hidezdremark(){//隐藏站点
	for (var int = 0; int < arforclean.length; int++) {
		arforclean[int].hide();
	}
}
function showzdremark(){//显示站点
	for (var int = 0; int < arforclean.length; int++) {
		arforclean[int].show();
	}
}
function showzdinfo(e){//显示站点信息
	var zdpoint=e.target.getPosition();
	var zddname=e.target.getLabel().content;
	$.getJSON("map.do?method=getallremarkbydname",{"dname":zddname}, function(json) {
			if(json[0]!=""){
				var opts = {
						title : "<span style='color:#D2693C;font-size: 14px;font-weight: bold'></span>", // 信息窗口标题
						enableAutoPan : true, // 自动平移
						offset : new BMap.Size(0, 0)
					// 偏离值
					};
				infoWindow = new BMap.InfoWindow("<table  style='  border-collapse: collapse; border-spacing: 0;line-height: 18px;white-space: nowrap;color:#333;font-size: 12px;ont-family: ''Microsoft YaHei',微软雅黑,Arial,Helvetica,Sans-Serif''> <tr> <td>站点名称：</td><td>"
						+ json[0].rname+ "</td> </tr><tr> <td>所属机构：</td><td>"+ json[0].dname
						+ "</td> </tr><tr> <td>当前地址：</td><td>"+ json[0].rad
						+ "</td> </tr></table>",opts);
				map.openInfoWindow(infoWindow, zdpoint); // 开启信息窗口
			}
	});
	
}
