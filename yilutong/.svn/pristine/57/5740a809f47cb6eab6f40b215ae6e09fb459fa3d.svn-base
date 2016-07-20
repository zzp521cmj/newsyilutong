package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.JITMonitor;
import com.jy.model.MonitorRuning;

public interface JITMonitorDao{
	//查询总数
	int getJITMonitor(String start_date,String end_date,Integer monitorType,String carId);
	List<JITMonitor> getJITMonitorInfo(int rows,int page,String start_date,String end_date,Integer monitorType,String carId);	//查询
	public List<JITMonitor> getJITMonitorAll(String start_date,String end_date,Integer monitorType,String carId);
	/*
	 * 获取数据下拉表的查询
	 * */
	public List<JITMonitor> getCar_idLength(String car_id,int type);
	public  JITMonitor searchJITMonitor(String del);//处理查询
	public  int  dealJITMonitor(JITMonitor m);//处理
	//根据carid查询报警信息
	List<JITMonitor> getCarIdJITMonitor(String travelCardId);
}
