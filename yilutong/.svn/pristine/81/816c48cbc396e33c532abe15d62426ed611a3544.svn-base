package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.MonitorSetDao;
import com.jy.model.MonitorSet;
import com.jy.service.MonitorSetService;
@Component
public class MonitorSetServiceImpl implements MonitorSetService{
	@Resource
	private MonitorSetDao msd;

	public MonitorSet getMonitorSetInfo() {
		MonitorSet set=msd.getMonitorSetInfo();
		return set;
	}

	public int dealMonitorSet(MonitorSet m) {
		int i=msd.dealMonitorSet(m);
		return i;
	}
	

}
