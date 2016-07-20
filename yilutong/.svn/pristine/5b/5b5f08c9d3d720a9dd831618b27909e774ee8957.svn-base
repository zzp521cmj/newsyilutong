package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.JITMonitorDao;
import com.jy.model.JITMonitor;
import com.jy.model.MonitorRuning;
import com.jy.service.JITMonitorService;
@Component
public class JITMonitorServiceImpl implements JITMonitorService{
	@Resource
	private JITMonitorDao jmonitdao;
	/*
	 * 查询分页
	 * */
	public List<JITMonitor>  getJITMonitorInfo(int rows,int page,String start_date,String end_date,Integer monitorType,String carId) {
		List<JITMonitor> list=jmonitdao.getJITMonitorInfo(rows, page, start_date, end_date, monitorType, carId);
		return list;
	}
	public int getJITMonitor(String start_date,String end_date,Integer monitorType,String carId) {
		int count =jmonitdao.getJITMonitor(start_date, end_date, monitorType, carId);
		return count;
	}
	/*
	 * 选择框的查询
	 * */
	public List<JITMonitor> getCar_idLength(String car_id,int type){
		List<JITMonitor>list=jmonitdao.getCar_idLength(car_id,type);
		return list;
	}
	//导出
	public List<JITMonitor> getJITMonitorAll(String start_date,String end_date,Integer monitorType,String carId){
		List<JITMonitor>list=jmonitdao.getJITMonitorAll(start_date, end_date, monitorType, carId);
		return list;
	}
	//处理
	public JITMonitor searchJITMonitor(String del) {
		JITMonitor m=jmonitdao.searchJITMonitor(del);
		return m;
	}
	public int dealJITMonitor(JITMonitor m) {
		int i=jmonitdao.dealJITMonitor(m);
		return i;
	}
	public List<JITMonitor> getCarIdJITMonitor(String travelCardId) {
		// TODO Auto-generated method stub
		List<JITMonitor> jit=jmonitdao.getCarIdJITMonitor(travelCardId);
		return jit;
	}
}
