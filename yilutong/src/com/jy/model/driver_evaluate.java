package com.jy.model;

public class driver_evaluate {
	private Integer rownum;//
	private String driver_id;// 司机ID
	private String car_id;// 汽车的Id
	private String driver_name;// 司机姓名
	private Integer gender;// 性别
	private String phone_number;// 手机号
	private String address;// 住址
	private String driving_type;// 准驾车型
	private String driving_license;// 驾驶证号
	private String plate_number;// 车牌号
	private	 String sign_timel;//签收日期
	private String grade;//评价的总分
	private String card_number;//身份证号码
	
	
	public String getSign_timel() {
		return sign_timel;
	}
	public void setSign_timel(String sign_timel) {
		this.sign_timel = sign_timel;
	}
	public Integer getRownum() {
		return rownum;
	}
	public void setRownum(Integer rownum) {
		this.rownum = rownum;
	}
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}

	
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public Integer getGender() {
		return gender;
	}
	public void setGender(Integer gender) {
		this.gender = gender;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getDriving_type() {
		return driving_type;
	}
	public void setDriving_type(String driving_type) {
		this.driving_type = driving_type;
	}
	public String getDriving_license() {
		return driving_license;
	}
	public void setDriving_license(String driving_license) {
		this.driving_license = driving_license;
	}


	public String getPlate_number() {
		return plate_number;
	}
	public void setPlate_number(String plate_number) {
		this.plate_number = plate_number;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}

	
	
	
}
