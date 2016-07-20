package com.jy.service;

import java.util.List;

import com.jy.model.Agreement;
import com.jy.model.MonitorRuning;

public interface MonitorRuningService {
			//所有的查询
			public int getMonitorRuning(String start_date,String end_date,Integer monitorType,String carId);
			public  List<MonitorRuning> getMonitorRuningInfo(int rows,int page,String start_date,String end_date,Integer monitorType,String carId);	//查询
			/*
			 * select 查询
			 * */
			public  MonitorRuning searchMonitor(String del);//处理查询
			public  int  dealMonitor(MonitorRuning m);//处理
			public List<MonitorRuning> getCar_idLength(String car_id,int type);
			public List<MonitorRuning> getMonitorRuningAll(String start_date,String end_date,Integer monitorType,String carId);//导出
			//根据carid查询报警信息
			public List<MonitorRuning> getCarIdRunMonitor(String travelCardId);
			
}
