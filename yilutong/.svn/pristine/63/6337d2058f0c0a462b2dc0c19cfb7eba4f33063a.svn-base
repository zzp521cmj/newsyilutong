package com.jy.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.dao.Json;
import com.jy.model.MonitorSet;
import com.jy.service.MonitorSetService;

@Controller
@RequestMapping(value="/smonitor.do")
public class MonitorSetController {
	@Resource
	private MonitorSetService mss;
	@RequestMapping(params = "method=getMonitorSetInfo")
	public String getMonitorSetInfo() {
		return "monitorSet/monitorSet";
	}
	@RequestMapping(params = "method=getMonitorSet")
	public @ResponseBody
	MonitorSet getMonitorSet() {
		MonitorSet der = mss.getMonitorSetInfo();
		return der;
	}
	@RequestMapping(params = "method=dealMonitorSet")
	public @ResponseBody
	Json dealMonitorSet(String xl,String jl, String tkd,String fysj,String clyx, String jdzy ) {
		MonitorSet m=mss.getMonitorSetInfo();
		System.out.println(xl+"====");
		//线路
		if(xl.equals("true")||xl=="true"){
			m.setSmonitor_line(1);
		}else{
			m.setSmonitor_line(0);
		}
		//距离
		if(jl.equals("true")){
			m.setSmonitor_distance(1);
		}else{
			m.setSmonitor_distance(0);
		}
		//停靠点
		if(tkd.equals("true")){
			m.setSmonitor_point(1);
		}else{
			m.setSmonitor_point(0);
		}
		//发运时间
		if(fysj.equals("true")){
			m.setSmonitor_trantime(1);
		}else{
			m.setSmonitor_trantime(0);
		}
		//车辆运作时间
		if(clyx.equals("true")){
			m.setSmonitor_cartime(1);
		}else{
			m.setSmonitor_cartime(0);
		}
		//节点时间作业
		if(jdzy.equals("true")){
			m.setSmonitor_pointtime(1);
		}else{
			m.setSmonitor_pointtime(0);
		}
		Json json=new Json();
		int i = mss.dealMonitorSet(m);
		if(i>0){
			json.setFlag(true);
			return json;
		}else{
			json.setFlag(false);
			return json;
		}
	}
}
