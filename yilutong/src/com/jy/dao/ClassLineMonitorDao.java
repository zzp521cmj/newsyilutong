package com.jy.dao;

import java.util.List;

import com.jy.model.DeparturePlan;
import com.jy.model.MonitorPoshytip;

public interface ClassLineMonitorDao  {
	List<DeparturePlan> getDeparturePlan(Integer rows, Integer page);
	int getCount();
	List<MonitorPoshytip> getPoshytip(String id);
}
