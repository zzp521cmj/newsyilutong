package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.AlarmDao;
import com.jy.model.JITMonitor;
import com.jy.model.LinStandard;
import com.jy.model.Maps;
import com.jy.model.MonitorRuning;
import com.jy.model.MonitorSet;
import com.jy.model.SiteLine;
import com.jy.model.SiteMilesTime;
import com.jy.model.SiteState;
import com.jy.model.User;
import com.jy.service.AlarmService;
@Component
public class AlarmServiceImpl implements AlarmService {
	@Resource
	private AlarmDao adao;
	public List<Maps> getMaps() {
		return adao.getMaps();
	}
	public String getCarnumber(String id) {
		// TODO Auto-generated method stub
		return adao.getCarnumber(id);
	}
	public String getLine(String car) {
		// TODO Auto-generated method stub
		return adao.getLine(car);
	}
	public List<LinStandard> getlinePosition(String id) {
		// TODO Auto-generated method stub
		return adao.getlinePosition(id);
	}
	public int addLineMonitor(MonitorRuning mr) {
		// TODO Auto-generated method stub
		return adao.addLineMonitor(mr);
	}
	public List<SiteLine> getSite(String id) {
		// TODO Auto-generated method stub
		return adao.getSite(id);
	}
	public int getSiteState(String car_id, String line_id) {
		// TODO Auto-generated method stub
		return adao.getSiteState(car_id, line_id);
	}
	public int addSiteState(SiteState ss) {
		// TODO Auto-generated method stub
		return adao.addSiteState(ss);
	}
	public SiteState getOneSiteState(String car_id, String line_id) {
		// TODO Auto-generated method stub
		return adao.getOneSiteState(car_id, line_id);
	}
	public int updateSiteState(SiteState ss) {
		// TODO Auto-generated method stub
		return adao.updateSiteState(ss);
	}
	public int getThisSiteState1(SiteState ss) {
		// TODO Auto-generated method stub
		return adao.getThisSiteState1(ss);
	}
	public int getMileTime(SiteMilesTime smt) {
		// TODO Auto-generated method stub
		return adao.getMileTime(smt);
	}
	public int addMileTime(SiteMilesTime smt) {
		// TODO Auto-generated method stub
		return adao.addMileTime(smt);
	}
	public SiteMilesTime getStartSite(SiteMilesTime smt) {
		// TODO Auto-generated method stub
		return adao.getStartSite(smt);
	}
	public String getshijiMiles(String ss) {
		// TODO Auto-generated method stub
		return adao.getshijiMiles(ss);
	}
	public int delSiteMilesTime(SiteMilesTime smt) {
		// TODO Auto-generated method stub
		return adao.delSiteMilesTime(smt);
	}
	public String getClass_line(String class_line_id) {
		// TODO Auto-generated method stub
		return adao.getClass_line(class_line_id);
	}
	public Integer getPlanTime(String Line_id) {
		// TODO Auto-generated method stub
		return adao.getPlanTime(Line_id);
	}
	public SiteLine getSiteStayTime(SiteLine l) {
		// TODO Auto-generated method stub
		return adao.getSiteStayTime(l);
	}
	public SiteMilesTime getMileTimeModel(SiteMilesTime st) {
		// TODO Auto-generated method stub
		return adao.getMileTimeModel(st);
	}
	public int addStayTimeMonitor(JITMonitor m) {
		// TODO Auto-generated method stub
		return adao.addStayTimeMonitor(m);
	}
	public String getUserId(String car_id) {
		// TODO Auto-generated method stub
		return adao.getUserId(car_id);
	}
	public User getPhoneId(String user_id) {
		// TODO Auto-generated method stub
		return adao.getPhoneId(user_id);
	}
	public MonitorSet getMonitorSet() {
		// TODO Auto-generated method stub
		return adao.getMonitorSet();
	}

}
