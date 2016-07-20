package com.jy.model;
/**
 * 绑定线路（班线和标准线路关联）
 * @author zzp
 *
 */
public class ClassLineToLinstandard {
	private String classline_linstandard_id;
	private String classlineId;
	public String getClasslineId() {
		return classlineId;
	}
	public void setClasslineId(String classlineId) {
		this.classlineId = classlineId;
	}
	private String linid;
	private Integer isdefalut;
	private String linname;
	public String getLinname() {
		return linname;
	}
	public void setLinname(String linname) {
		this.linname = linname;
	}
	public String getClassline_linstandard_id() {
		return classline_linstandard_id;
	}
	public void setClassline_linstandard_id(String classline_linstandard_id) {
		this.classline_linstandard_id = classline_linstandard_id;
	}
	
	public String getLinid() {
		return linid;
	}
	public void setLinid(String linid) {
		this.linid = linid;
	}
	public Integer getIsdefalut() {
		return isdefalut;
	}
	public void setIsdefalut(Integer isdefalut) {
		this.isdefalut = isdefalut;
	}
}
