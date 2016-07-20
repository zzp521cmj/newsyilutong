package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.AgreementDao;
import com.jy.dao.MonitorRuningDao;
import com.jy.model.Agreement;
import com.jy.model.MonitorRuning;
import com.jy.service.AgreementService;
import com.jy.service.MonitorRuningService;
@Component
public class MonitorRuningServiceImpl implements MonitorRuningService{
	@Resource
	private MonitorRuningDao monitdao;
	/*
	 * 查询分页
	 * */
	public List<MonitorRuning>  getMonitorRuningInfo(int rows,int page,String start_date,String end_date,Integer monitorType,String carId) {
		List<MonitorRuning> list=monitdao.getMonitorRuningInfo(rows, page, start_date, end_date, monitorType, carId);
		return list;
	}
	public int getMonitorRuning(String start_date,String end_date,Integer monitorType,String carId) {
		int count =monitdao.getMonitorRuning(start_date, end_date, monitorType, carId);
		return count;
	}
	
	/*
	 * 选择框的查询
	 * */
	public List<MonitorRuning> getCar_idLength(String car_id,int type){
		List<MonitorRuning>list=monitdao.getCar_idLength(car_id,type);
		return list;
	}
	//导出
	public List<MonitorRuning> getMonitorRuningAll(String start_date,String end_date,Integer monitorType,String carId){
		List<MonitorRuning>list=monitdao.getMonitorRuningAll(start_date, end_date, monitorType, carId);
		return list;
	}
	//处理
	public MonitorRuning searchMonitor(String del) {
		MonitorRuning m=monitdao.searchMonitor(del);
		return m;
	}
	public int dealMonitor(MonitorRuning m) {
		int i=monitdao.dealMonitor(m);
		return i;
	}
	//根据carid查询报警信息
	public List<MonitorRuning> getCarIdRunMonitor(String travelCardId) {
		// TODO Auto-generated method stub
		List<MonitorRuning> monitorrun=monitdao.getCarIdRunMonitor(travelCardId);
		return monitorrun;
	}
}
