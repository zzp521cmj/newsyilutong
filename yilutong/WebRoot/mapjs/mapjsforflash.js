//窗口切换事件
	$(document).ready(function() {
		//
		$("#resultall").hide();//开始画框取车的div隐藏事件
		$("#min").hide();//地图级别小div隐藏事件
		$("#cxtj").hide();
		
		$("#sm").click(function() {
			$("#min").fadeIn(1000);
			$("#max").animate({
				right : '-=400px',
			});
		});
		$("#min").click(function() {
			$("#min").fadeOut(000);
			$("#max").animate({
				right : '+=400px',
			});
		});

		var hv=true;
		$("#gnf").click(function(){
			if(hv){
				$("#gnf").text("收缩");
				$("#gnf").css("color", "#333");
				$("#menushow").animate({
					right : '+=173px',
				});
				hv=false;
			}else{
				$("#gnf").text("功能");
				$("#gnf").css("color", "#fff");
				$("#menushow").animate({
					right : '-=173px',
				});
				hv=true;
			}
		});
		
		//选项卡悬浮变色wxdt
		$(".menusclick,#lkqh").hover(function() {
			$(this).css("background", "#EBEBEB");
		}, function() {
			$(this).css("background", "");
		});

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
		//卫星地图切换按钮end
		
		//路况切换按钮获取状态的判断
		var s = true;
		//路况切换按钮
		$("#lkqh").click(function() {
			map.setZoom(7);
			if (s) {
				ctrl.showTraffic();
				s = false;
			} else if (!s) {
				ctrl.hideTraffic();
				s = true;
			}
		});
		//路况切换按钮end
		
		//label.setTitle(name); 为label添加鼠标提示
		var bzd = new BMap.Icon("images/1.png", new BMap.Size(17, 25), {
			anchor: new BMap.Size(8,25)
		}
		);
		
		//查询框的隐藏显示
		$("#qdcx").hover(function(){$("#cxtj").show();$("#cxtj").focus();},function(){$("#cxtj").hide();});
		$("#cxtj").mouseover(function(){$("#cxtj").show();});
		//创建旗子的标注点
		//查询操作
		var adds="";
		var ad="";
		var add="";
		var bz=null;
		$("#qdcx").click(function(){
			if(null!=bz){
				map.removeOverlay(bz);
			}
			//map.clearOverlays();    
			add=$("#cxtj").val();
			// 创建地址解析器实例
			// 将地址解析结果显示在地图上,并调整地图视野
			myGeo.getPoint(add, function(point){
				if (point) {
						setbd(add);
						myGeo.getLocation(point, function(rs){
						var addComp = rs.addressComponents;
						adds=addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street;
						ad=addComp.province + ", " + addComp.city;
						getinf(adds,ad);
						map.centerAndZoom(point, 11);
						bz = new BMap.Marker(point, {icon: bzd}); 
						bz.addEventListener("click",attribute);
						map.addOverlay(bz);
						$("#cxtj").val("");
						});
				}else{
					$.messager.alert('查询', '您选择地址没有解析到结果!', 'info');
					$("#cxtj").val("");
				}
			});
		});
		function getinf(adds,ad){
			myGeo.getPoint(add, function(point){
			var opts = {
					  width : 200,     // 信息窗口宽度
					  height: 80,     // 信息窗口高度
					  title : "<span style='color:#D2693C;font-size: 14px;font-weight: bold'>地址："+ad+"</span>" , // 信息窗口标题
					  enableAutoPan : true,     //自动平移
					  enableSendToPhone: false, //是否显示发送到手机按钮 
					  offset: new BMap.Size(0, 0)//偏离值  
			};
			var infoWindow = new BMap.InfoWindow("<span style='font-size: 12px;'>地址:"+adds+"</span>", opts);
			map.openInfoWindow(infoWindow,point); //开启信息窗口
			});
		}
		var ply=null;
		function setbd(city){
			if(null!=ply){
				map.removeOverlay(ply);
			}
			var bdary = new BMap.Boundary();
			bdary.get(city, function(rs){       //获取行政区域
				//map.clearOverlays();        //清除地图覆盖物       
				var count = rs.boundaries.length; //行政区域的点有多少个
				for(var i = 0; i < count; i++){
						ply = new BMap.Polygon(rs.boundaries[i], {strokeColor : "red",
						fillColor:"",  
						strokeWeight : 3,
						fillOpacity: 0,
						strokeOpacity : 0.5,
						strokeStyle: 'dashed'}); //建立多边形覆盖物
					map.addOverlay(ply);  //添加覆盖物
				}                
			});   
		}
		
		function attribute(){
			getinf(adds,ad);
		}
		
		//开启拖拽(ps:用户选择测距，或画框的结束事件)
		$("#tz").click(function(){
			if(pullBox!=null){
				pullBox.close();
			}
			if(myDis.open()){
				myDis.close();
			}
			 new BMapLib.DrawingManager(map, {
			        isOpen: false
			 });
		});
		//开启拖拽end
		
		//点击地图级别变成5级
		$("#sfdt").click(function() {
			map.setZoom(5);
			if(null!=circle){
				map.removeOverlay(circle);
			}
			if(null!=local){
				local.clearResults();
			}
			if(null!=seachlabel){
				for(var s=0;s<seachlabels.length;s++){
					map.removeOverlay(seachlabels[s]);
				}
			}
		});
		//点击地图级别变成5级 end 设置全图
		
		
		//地图画框事件共有参数
		var resfalg=true;
		var pullBox=null;
		//地图画框事件
		$("#hkqc").click(function(){
			//设置画框取车关键字并开启控件使用
			var keyword = "" ;
		     pullBox = new BMapLib.SearchInRectangle(map,keyword,{
		     renderOptions:{
		         map: map,
		         followText: "画框取车",
		         strokeWeight: 2,
		         strokeColor: "#4024E0",
		         opacity: 0.7,                
		         autoClose: true,
		         autoViewport: false,
				 alwaysShowOverlay:false,
		         panel: "",
		         selectFirstResult: true
			     },
			     onSearchComplete:function showres(){
			    	 carnos="";
			    	 potispts(pullBox.getpoint());
			    	 var cars="";
			    	 cars='"'+carnos+'"';
			    	$.getJSON("map.do?method=getcarinfo",{"car":cars},
			    	function(msg) {
			 			if(resfalg){
				    		 $("#resultall").show(500);
							resfalg=false;
				       }
			 		   $("#restable").html($('#restable tr:eq(0)'));
			 		   var outString="";
	    			   $(msg).each(function(i){
	    					   $("#restable").append("<tr style=' background-color: white;cursor:pointer' onmouseover='over(this)'  onmouseout='out(this)'><td>"+msg[i].carno+"</td><td>"+msg[i].beidouid+"</td><td>"+msg[i].gpsstate+"</td><td>"+msg[i].deptname+"</td><td><a href='javascript:void(0)' onclick='getaddress(this)' style='text-decoration: none;color: blue;'>"+msg[i].lng+","+msg[i].lat+"</a></td><td>"+msg[i].nowdate+"</td><td>"+msg[i].drivename+"</td><td>"+msg[i].drivenumber+"</td></tr>");
	    					   outString=outString+"|"+msg[i].carno+","+msg[i].beidouid+","+msg[i].gpsstate+","+msg[i].deptname+","+msg[i].lng+"."+msg[i].lat+","+msg[i].nowdate+","+msg[i].drivename+","+msg[i].drivenumber;
	    			   });
			    	$("#outjson").val(outString);
			 		});
			     }
			 }); 
		     
			 pullBox.setFillColor("white"); 
		     pullBox.setLineStyle("dashed");
		     pullBox.open();
		});
		//地图画框事件end
		function showInfo(e){
			//alert(e.point.lng + ", " + e.point.lat);
		}
		map.addEventListener("click", showInfo);
		//比对点是否在电子围栏中
		var carnos=null;
		function potispts(ps){
			carnos=[];
			for (var z = 0; z < overlays.length; z++){
				var result = BMapLib.GeoUtils.isPointInRect(overlays[z].point, ps);
				if(result){
					carnos.push(overlays[z].getLabel().content);
				}
			}
			return carnos;
		}
		//结果集关闭按钮
		$("#resimg").click(function(){
			if(!resfalg){
				$("#restable").html($('#restable tr:eq(0)'));
				$("#resultall").hide(1000);
				resfalg=true;
			}
		});
		//结果集关闭按钮end
		
		//聚合按钮开关
		$("#slideThree").click(function(){
			if($("#slideThree").is(':checked')){
				markerClusterer.setMinClusterSize(2);
				_ISGT=true;//刷新是的判断条件
			}else{
				markerClusterer.setMinClusterSize(9999999);
				_ISGT=false;//刷新是的判断条件
			}
		});
		//聚合按钮开关end
		
		$("#slideThree2").click(function(){
			if(map.getZoom()<11){ //地图级别小于11自动关闭车号显示（ps:请勿删除）
				$("#slideThree2").attr('checked',false);
			}
			if($("#slideThree2").is(':checked')){
				showcarno();
				_SWCO=true;//刷新时车号隐藏的判断条件
			}else{
				hidecarno();
				_SWCO=false;//刷新时车号隐藏的判断条件
			}
		});
		
		$(".tj").click(function(){
			if(map.getZoom()<11){
				$(".tj").attr('checked',false);
			}
		});
		//负载状态显示的按钮判断 start
		$("#fzsta").click(function(){
			if($("#fzsta").is(':checked')){
				$("#qc").prop('checked','checked');
				$("#max").css('height','350px');
				$("#thr").css('height','65px');
				$("#qzd").css('display','block');
			}else{
				$("#qc").prop('checked',false);
				$("#max").css('height','320px');
				$("#thr").css('height','35px');
				$("#qzd").css('display','none');
			}
		});
		
		var qcmar=false;//接收聚合条件的返回值
		$("#qc").click(function(){
			if($("#qc").is(':checked')){
				for (var z = 0; z < overlays.length; z++){
					overlays[z].show();
				}
				if(qcmar){
					markerClusterer.addMarkers(overlays);
				}
				_ALCO=true;//刷新时图载车辆的判断条件
				$("#fzsta").prop('checked',false);
			}else{
				for (var z = 0; z < overlays.length; z++){
					overlays[z].hide();
				}
				qcmar=markerClusterer.removeMarkers(overlays);
				_ALCO=false;
				$("#fzsta").prop('checked',true);
			}
		});
		//负载状态显示的按钮判断 end 
		
		var xsmr=false;//行驶的接收mark聚合移除的返回值 例（markerClusterer.removeMarkers() 返回true 或  false）
		var jzmr=false;
		var lxmr=false;
		$("#xs").click(function(){
			if(!$("#xs").is(':checked')){
				for(var x=0;x<markers.length;x++){
					markers[x].hide();
				}
				xsmr=markerClusterer.removeMarkers(nullmarkers);
				$("#qcsl").text(parseInt($("#qcsl").text())-parseInt(nullmarkers.length));
				_XSCO=false;//刷新时行驶车辆的判断条件
			}else{
				for(var x=0;x<markers.length;x++){
					markers[x].show();
				}
				if(xsmr){
					markerClusterer.addMarkers(nullmarkers);
				}
				$("#qcsl").text(parseInt($("#qcsl").text())+parseInt(nullmarkers.length));
				_XSCO=true;
			}
		});
		
		$("#jz").click(function(){
			if(!$("#jz").is(':checked')){
				for(var x=0;x<nullmarkers.length;x++){
					nullmarkers[x].hide();
				}
				jzmr=markerClusterer.removeMarkers(markers);
				$("#qcsl").text(parseInt($("#qcsl").text())-parseInt(markers.length));
				_JZCO=false;//刷新时静止车辆的判断条件
			}else{
				for(var x=0;x<nullmarkers.length;x++){
					nullmarkers[x].show();
				}
				if(jzmr){
					markerClusterer.addMarkers(markers);
				}
				$("#qcsl").text(parseInt($("#qcsl").text())+parseInt(markers.length));
				_JZCO=true;
			}
		});
		
		$("#lx").click(function(){
			if(!$("#lx").is(':checked')){
				for(var x=0;x<nomarkers.length;x++){
					nomarkers[x].hide();
				}
				lxmr=markerClusterer.removeMarkers(nomarkers);
				$("#qcsl").text(parseInt($("#qcsl").text())-parseInt(nomarkers.length));
				_LXCO=false;//刷新时离线车辆的判断条件
			}else{
				for(var x=0;x<nomarkers.length;x++){
					nomarkers[x].show();
				}
				if(lxmr){
					markerClusterer.addMarkers(nomarkers);
				}
				$("#qcsl").text(parseInt($("#qcsl").text())+parseInt(nomarkers.length));
				_LXCO=true;
			}
		});
		var _HIDEZD=false;
		$("#onlyzd").click(function(){//仅显示站点
			if(!$("#onlyzd").is(':checked')){
				for (var z = 0; z < overlays.length; z++){
					overlays[z].show();
				}
				if(_HIDEZD){
					markerClusterer.addMarkers(overlays);
				}
				_OLZD=false;//刷新时仅显示站点的判断条件
			}else{
				for (var z = 0; z < overlays.length; z++){
					overlays[z].hide();
				}
				_HIDEZD=markerClusterer.removeMarkers(overlays);
				_OLZD=true;
			}
		});
		$("#loadsfz").click(function(){
			if(!$("#loadsfz").is(':checked')){
				sfz=false;
			}else{
				sfz=true;
			};
		});
		
		$("#gbxs").click(function(){
			$("#cxxx").css("display","block");
			$("#tname").focus();
		});
		
		$("#tjname").click(function(){
			if($("#tname").val()!=""){
				sname=	$("#tname").val();
				var xx=[];
				if(sname.indexOf("#")>0){
					xx=sname.split("#");
					$("#thisname").text(xx);
					for (var int = 0; int < xx.length; int++) {
						xx[int]='"'+xx[int]+'"';
					}
					xsname=xx;
				}else{
					xsname=sname;
					$("#thisname").text(sname);
				}
				$("#cxxx").css("display","none");
			}
		});
		
		$("#closexg").click(function(){
			$("#cxxx").css("display","none");
		});
		//显示所有站点名称
		$("#loadzdname").click(function(){
			if(zdnamecheck){
				if($("#loadzdname").is(':checked')){
					if(null!=arforpf&&arforpf.length>0){
						for (var g = 0; g < arforpf.length; g++) {
							arforpf[g].getLabel().show();
						}
					}
				}else{
					if(null!=arforpf&&arforpf.length>0){
						for (var g = 0; g < arforpf.length; g++) {
							arforpf[g].getLabel().hide();
						}
					}
				}
			}
		});
		//导出table
		$("#outstart").click(function(){
			$("#outjsonfrom").submit();
		});
	});	
	function cargz(obj){
		//parent.addTab('车辆跟踪','map.do?method=getmapzz&menu_id=45&gzhidvalue='+obj);
		dialog = parent.jy.modalDialog({
			title : '查看运单',
			url : 'map.do?method=getorderpage&carno=' + obj,
			width : 940,
			height : 580
		});
	}
	
	function carhf(obj){
		parent.addTab('轨迹回放','map.do?method=getmaphf&menu_id=40&hzhidvalue='+obj);	
		/*var hf=document.getElementById("gfhidvalue");
		hf.value=obj;//负值隐藏框的车牌号
		document.getElementById("carhfform").action="map.do?method=getmaphf";
		document.getElementById("carhfform").submit();*/
	}