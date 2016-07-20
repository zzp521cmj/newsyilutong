package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.MonitorRuning;

public interface MonitorRuningDao  {
	//查询总数
	int getMonitorRuning(String start_date,String end_date,Integer monitorType,String carId);
	List<MonitorRuning> getMonitorRuningInfo(int rows,int page,String start_date,String end_date,Integer monitorType,String carId);	//查询
	public List<MonitorRuning> getMonitorRuningAll(String start_date,String end_date,Integer monitorType,String carId);
	/*
	 * 获取数据下拉表的查询
	 * */
	public List<MonitorRuning> getCar_idLength(String car_id,int type);
	public  MonitorRuning searchMonitor(String del);//处理查询
	public  int  dealMonitor(MonitorRuning m);//处理
	//根据carid查询报警信息
	List<MonitorRuning> getCarIdRunMonitor(String travelCardId);
}
