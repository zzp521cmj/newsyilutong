package com.jy.model;

public class LinStandard {
	private String linid;//id
	private String linname;//路线名称
	private String linbh;//编号
	private int linfatype;//类型
	private double lincd;//里程
	private String linbz;//备注
	private String linzb;//坐标
	private String linctime;//创建时间
	private String scity;//开始城市
	private String ecity;//结束城市
	private String stoptime;//停止时间
	private String longtime;//运行时间
	private String spt;//开始城市的point
	private String ept;//结束城市的point
	private int ct;
	public int getCt() {
		return ct;
	}

	public void setCt(int ct) {
		this.ct = ct;
	}

	public String getSpt() {
		return spt;
	}

	public void setSpt(String spt) {
		this.spt = spt;
	}

	public String getEpt() {
		return ept;
	}

	public void setEpt(String ept) {
		this.ept = ept;
	}

	public String getScity() {
		return scity;
	}

	public void setScity(String scity) {
		this.scity = scity;
	}

	public String getEcity() {
		return ecity;
	}

	public void setEcity(String ecity) {
		this.ecity = ecity;
	}

	public String getStoptime() {
		return stoptime;
	}

	public void setStoptime(String stoptime) {
		this.stoptime = stoptime;
	}

	public String getLongtime() {
		return longtime;
	}

	public void setLongtime(String longtime) {
		this.longtime = longtime;
	}
	//zzp添加
	private String isdefalut;//是否默认
	public String getIsdefalut() {
		return isdefalut;
	}

	public void setIsdefalut(String isdefalut) {
		this.isdefalut = isdefalut;
	}

	public String getLinctime() {
		return linctime;
	}

	public void setLinctime(String linctime) {
		this.linctime = linctime;
	}

	public LinStandard() {
		super();
	}
	
	public String getLinid() {
		return linid;
	}
	public void setLinid(String linid) {
		this.linid = linid;
	}
	public String getLinname() {
		return linname;
	}
	public void setLinname(String linname) {
		this.linname = linname;
	}
	public String getLinbh() {
		return linbh;
	}
	public void setLinbh(String linbh) {
		this.linbh = linbh;
	}
	public int getLinfatype() {
		return linfatype;
	}
	public void setLinfatype(int linfatype) {
		this.linfatype = linfatype;
	}
	public double getLincd() {
		return lincd;
	}
	public void setLincd(double lincd) {
		this.lincd = lincd;
	}
	public String getLinbz() {
		return linbz;
	}
	public void setLinbz(String linbz) {
		this.linbz = linbz;
	}
	public String getLinzb() {
		return linzb;
	}
	public void setLinzb(String linzb) {
		this.linzb = linzb;
	}
	

}
