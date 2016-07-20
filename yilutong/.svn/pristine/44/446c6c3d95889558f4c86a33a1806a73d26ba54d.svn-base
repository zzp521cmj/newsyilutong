package com.jy.service;

import java.util.List;

import com.jy.model.JITMonitor;
import com.jy.model.LinStandard;
import com.jy.model.Maps;
import com.jy.model.MonitorRuning;
import com.jy.model.MonitorSet;
import com.jy.model.SiteLine;
import com.jy.model.SiteMilesTime;
import com.jy.model.SiteState;
import com.jy.model.User;

public interface AlarmService {
	public List<Maps> getMaps();
	public String getCarnumber(String id);
	public String getLine(String car);
	List<LinStandard> getlinePosition(String id);
	int addLineMonitor(MonitorRuning mr);
	List<SiteLine> getSite(String id);
	int getSiteState(String car_id,String line_id);
	int addSiteState(SiteState ss);
	SiteState getOneSiteState(String car_id,String line_id);
	int updateSiteState(SiteState ss);
	int getThisSiteState1(SiteState ss);
	int getMileTime(SiteMilesTime smt);
	int addMileTime(SiteMilesTime smt);
	SiteMilesTime getStartSite(SiteMilesTime smt);
	String getshijiMiles(String ss);
	int delSiteMilesTime(SiteMilesTime smt);
	String getClass_line(String class_line_id);
	Integer getPlanTime(String Line_id);
	SiteLine getSiteStayTime(SiteLine l);
	SiteMilesTime getMileTimeModel(SiteMilesTime st);
	int addStayTimeMonitor(JITMonitor m);
	String getUserId(String car_id);
	User getPhoneId(String user_id);
	MonitorSet getMonitorSet();
}
