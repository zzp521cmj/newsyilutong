package com.jy.model;

public class SiteLine {
	private String siteId;//线路站点id
	private int siteFlag;//站点标示(1、首站点 2、途经点 0、终点)
	private String siteName;//站点名称
	private String siteLength;//行驶里程
	private String siteTime;//行驶时间
	private String siteStayTime;//停留时间
	private	String classline_Id;//班线id
	private int siteorder;//顺序
	private String remarkId;//站点id
	private String remark_state;//站点类型(polygon,mark)
	private String remark_point;//站点坐标
	private String remark_range_name;//mark范围
	private String remark_address;//站点地址
	
	public String getSiteName() {
		return siteName;
	}
	public void setSiteName(String siteName) {
		this.siteName = siteName;
	}
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
	public int getSiteorder() {
		return siteorder;
	}
	public void setSiteorder(int siteorder) {
		this.siteorder = siteorder;
	}
	public String getRemarkId() {
		return remarkId;
	}
	public void setRemarkId(String remarkId) {
		this.remarkId = remarkId;
	}
	public String getRemark_state() {
		return remark_state;
	}
	public void setRemark_state(String remark_state) {
		this.remark_state = remark_state;
	}
	public String getRemark_point() {
		return remark_point;
	}
	public void setRemark_point(String remark_point) {
		this.remark_point = remark_point;
	}
	public String getRemark_range_name() {
		return remark_range_name;
	}
	public void setRemark_range_name(String remark_range_name) {
		this.remark_range_name = remark_range_name;
	}
	public String getRemark_address() {
		return remark_address;
	}
	public void setRemark_address(String remark_address) {
		this.remark_address = remark_address;
	}

}
