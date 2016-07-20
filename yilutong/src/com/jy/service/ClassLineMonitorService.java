package com.jy.service;

import java.util.List;

import com.jy.model.DeparturePlan;
import com.jy.model.MonitorPoshytip;

public interface ClassLineMonitorService {
	public List<DeparturePlan> getDeparturePlans(Integer rows, Integer page);
	public int getCount();
	public List<MonitorPoshytip> getPoshytip(String id);
}
