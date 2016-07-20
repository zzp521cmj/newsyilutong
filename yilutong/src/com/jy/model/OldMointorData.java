package com.jy.model;
/**
 * 
 * @author hqh
 * @createtime 2015-6-5
 * @注释：地图追踪获取三天表的信息
 */
public class OldMointorData {
	private String did;//id
	private String dlat;//lat
	private String dlng;//lng
	private String dcreatetime;//创建时间
	private String carno;//车号
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getDlat() {
		return dlat;
	}
	public void setDlat(String dlat) {
		this.dlat = dlat;
	}
	public String getDlng() {
		return dlng;
	}
	public void setDlng(String dlng) {
		this.dlng = dlng;
	}
	public String getDcreatetime() {
		return dcreatetime;
	}
	public void setDcreatetime(String dcreatetime) {
		this.dcreatetime = dcreatetime;
	}
	public String getCarno() {
		return carno;
	}
	public void setCarno(String carno) {
		this.carno = carno;
	}
}
