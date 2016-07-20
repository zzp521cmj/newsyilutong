package com.jy.model;

public class Agreement {
	private String agreementId;// 合同的Id
	private String agreementName;// 合同名字
	private String owner;// 甲方
	private String side;// 乙方
	private String carId;// 车牌号码
	private String route;// 承运路线
	private String money;// 履约保证金
	private String agreementStartDate;// 合同开始日期
	private String agreementEndDate;// 合同结束日期
	private String address;// 签订地点
	private String travel_card_id;// 车行驶证编号
	private String plate_number;// 车牌号
	private String agreementNumber;// 合同号
	private int state;// 状态
	private String updateDate;
	private int guoqi;// 过期
	private int jijiang;// 即将过期
	private String next_maintenance_date;//下次维护时间
	private String maintenance_date;//维护时间
	private  String linid;//线路id
	private String linbh;//线路编号
	
	
	public String getLinid() {
		return linid;
	}

	public void setLinid(String linid) {
		this.linid = linid;
	}

	public String getLinbh() {
		return linbh;
	}

	public void setLinbh(String linbh) {
		this.linbh = linbh;
	}

	public String getNext_maintenance_date() {
		return next_maintenance_date;
	}

	public void setNext_maintenance_date(String next_maintenance_date) {
		this.next_maintenance_date = next_maintenance_date;
	}

	public String getMaintenance_date() {
		return maintenance_date;
	}

	public void setMaintenance_date(String maintenance_date) {
		this.maintenance_date = maintenance_date;
	}

	public int getGuoqi() {
		return guoqi;
	}

	public void setGuoqi(int guoqi) {
		this.guoqi = guoqi;
	}

	public int getJijiang() {
		return jijiang;
	}

	public void setJijiang(int jijiang) {
		this.jijiang = jijiang;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public String getAgreementNumber() {
		return agreementNumber;
	}

	public void setAgreementNumber(String agreementNumber) {
		this.agreementNumber = agreementNumber;
	}

	public String getAgreementId() {
		return agreementId;
	}

	public void setAgreementId(String agreementId) {
		this.agreementId = agreementId;
	}

	public String getAgreementName() {
		return agreementName;
	}

	public void setAgreementName(String agreementName) {
		this.agreementName = agreementName;
	}

	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getSide() {
		return side;
	}

	public void setSide(String side) {
		this.side = side;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getAgreementStartDate() {
		return agreementStartDate;
	}

	public void setAgreementStartDate(String agreementStartDate) {
		this.agreementStartDate = agreementStartDate;
	}

	public String getAgreementEndDate() {
		return agreementEndDate;
	}

	public void setAgreementEndDate(String agreementEndDate) {
		this.agreementEndDate = agreementEndDate;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTravel_card_id() {
		return travel_card_id;
	}

	public void setTravel_card_id(String travel_card_id) {
		this.travel_card_id = travel_card_id;
	}

	public String getPlate_number() {
		return plate_number;
	}

	public void setPlate_number(String plate_number) {
		this.plate_number = plate_number;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

}
