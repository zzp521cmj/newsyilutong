package com.jy.service;

import java.util.List;

import com.jy.model.JITMonitor;

public interface JITMonitorService {
			//所有合同的查询
			public int getJITMonitor(String start_date,String end_date,Integer monitorType,String carId);
			public  List<JITMonitor> getJITMonitorInfo(int rows,int page,String start_date,String end_date,Integer monitorType,String carId);	//查询
			/*
			 * select 查询
			 * */
			
			public List<JITMonitor> getCar_idLength(String car_id,int type);
			public List<JITMonitor> getJITMonitorAll(String start_date,String end_date,Integer monitorType,String carId);//导出
			public  JITMonitor searchJITMonitor(String del);//处理查询
			public  int  dealJITMonitor(JITMonitor m);//处理
			//根据carid查询报警信息
			public List<JITMonitor> getCarIdJITMonitor(String travelCardId);
}
