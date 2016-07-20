package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.ClassLineMonitorDao;
import com.jy.model.DeparturePlan;
import com.jy.model.MonitorPoshytip;
import com.jy.service.ClassLineMonitorService;
@Component
public class ClassLineMonitorServiceImpl implements ClassLineMonitorService {
	@Resource
	private ClassLineMonitorDao dao;
	public List<DeparturePlan> getDeparturePlans(Integer rows, Integer page) {
		
		return dao.getDeparturePlan(rows, page);
	}
	public int getCount() {
		
		return dao.getCount();
	}
	public List<MonitorPoshytip> getPoshytip(String id) {
		// TODO Auto-generated method stub
		return dao.getPoshytip(id);
	}

}
