package com.jy.model;

public class MonitorPoshytip {
	private String siteId;//班线设置信息ID
	private int siteFlag;//1、首站点 2、途经点 0、终点
	private String siteName;//站点名称
	private String siteLength;//行驶里程
	private String siteTime;//行驶时间
	private String siteStayTime;//停留时间
	private String classline_Id;//班线id
	private String siteorder;//顺序
	public String getSiteId() {
		return siteId;
	}
	public void setSiteId(String siteId) {
		this.siteId = siteId;
	}
	public int getSiteFlag() {
		return siteFlag;
	}
	public void setSiteFlag(int siteFlag) {
		this.siteFlag = siteFlag;
	}
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
	public String getSiteLength() {
		return siteLength;
	}
	public void setSiteLength(String siteLength) {
		this.siteLength = siteLength;
	}
	public String getSiteTime() {
		return siteTime;
	}
	public void setSiteTime(String siteTime) {
		this.siteTime = siteTime;
	}
	public String getSiteStayTime() {
		return siteStayTime;
	}
	public void setSiteStayTime(String siteStayTime) {
		this.siteStayTime = siteStayTime;
	}
	public String getClassline_Id() {
		return classline_Id;
	}
	public void setClassline_Id(String classline_Id) {
		this.classline_Id = classline_Id;
	}
	public String getSiteorder() {
		return siteorder;
	}
	public void setSiteorder(String siteorder) {
		this.siteorder = siteorder;
	}
	
	
}
