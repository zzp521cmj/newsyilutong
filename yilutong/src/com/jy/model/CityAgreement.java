package com.jy.model;

public class CityAgreement {
	private String id;
	private String code;//编号
	private String state;//类型
	private String pcd_code;//派车单编号
	private String car_id;//车牌号
	private String flag;//是否删除状态
	private String createtime;//协议制作时间
	private String did;//制作机构
	private String lastdid;//下一机构
	private String arrive;//到达时间
	private String isArrive;//是否到达
	private String isCar;//车辆类型
	 private String department_name;//部门名字
	 private String lastname ;//下一个部门
	 
	 
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPcd_code() {
		return pcd_code;
	}
	public void setPcd_code(String pcd_code) {
		this.pcd_code = pcd_code;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getDid() {
		return did;
	}
	public void setDid(String did) {
		this.did = did;
	}
	public String getLastdid() {
		return lastdid;
	}
	public void setLastdid(String lastdid) {
		this.lastdid = lastdid;
	}
	public String getArrive() {
		return arrive;
	}
	public void setArrive(String arrive) {
		this.arrive = arrive;
	}
	public String getIsArrive() {
		return isArrive;
	}
	public void setIsArrive(String isArrive) {
		this.isArrive = isArrive;
	}
	public String getIsCar() {
		return isCar;
	}
	public void setIsCar(String isCar) {
		this.isCar = isCar;
	}

}
