package com.jy.model;

/**
 * 车辆竞价
 * 
 * @author 90
 * 
 */
public class VehiclevBidding {
    private String agreement_id;//协议id
	private String vehiclebidding_id;// 竞价id
	private String vehiclebidding_message;// 竞价信息
	private String vehiclebidding_price;//竞价价格
	private String driver_id;//司机id
	private String plate_number;//车牌号
	private String card_number;//车牌号码
	private String driver_name;//司机姓名
	private String user_idcard;//身份证
	private String phone_number;//手机号
	private String length_name; //车长
	private String car_height;//车高
	private String car_width;//车宽
	private String car_length;//车长
	private String weight;// 重量（吨）
	private String boxType;// 厢型;
	private String tonnage;//吨位
	private String carType;//车辆类型
	private String car_id;//车辆id；
	private String is_vehbid;//是否竞价
	private String is_receipt_free;//是否接受回单结算（0是，1否）
	private String is_edit;//是否修改（1已修改，0未修改）
	private String vehicle_time;//竞价时间
	

	
	public String getVehicle_time() {
		return vehicle_time;
	}
	public void setVehicle_time(String vehicle_time) {
		this.vehicle_time = vehicle_time;
	}
	public String getVehiclebidding_price() {
		return vehiclebidding_price;
	}
	public void setVehiclebidding_price(String vehiclebidding_price) {
		this.vehiclebidding_price = vehiclebidding_price;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}

	
	
	public String getIs_edit() {
		return is_edit;
	}
	public void setIs_edit(String is_edit) {
		this.is_edit = is_edit;
	}
	public String getIs_receipt_free() {
		return is_receipt_free;
	}
	public void setIs_receipt_free(String is_receipt_free) {
		this.is_receipt_free = is_receipt_free;
	}

	public String getIs_vehbid() {
		return is_vehbid;
	}
	public void setIs_vehbid(String is_vehbid) {
		this.is_vehbid = is_vehbid;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public String getPlate_number() {
		return plate_number;
	}
	public void setPlate_number(String plate_number) {
		this.plate_number = plate_number;
	}
	public String getAgreement_id() {
		return agreement_id;
	}
	public void setAgreement_id(String agreement_id) {
		this.agreement_id = agreement_id;
	}
	public String getVehiclebidding_id() {
		return vehiclebidding_id;
	}
	public void setVehiclebidding_id(String vehiclebidding_id) {
		this.vehiclebidding_id = vehiclebidding_id;
	}
	public String getVehiclebidding_message() {
		return vehiclebidding_message;
	}
	public void setVehiclebidding_message(String vehiclebidding_message) {
		this.vehiclebidding_message = vehiclebidding_message;
	}

	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getCard_number() {
		return card_number;
	}
	public void setCard_number(String card_number) {
		this.card_number = card_number;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public String getUser_idcard() {
		return user_idcard;
	}
	public void setUser_idcard(String user_idcard) {
		this.user_idcard = user_idcard;
	}
	public String getPhone_number() {
		return phone_number;
	}
	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}
	public String getLength_name() {
		return length_name;
	}
	public void setLength_name(String length_name) {
		this.length_name = length_name;
	}
	public String getCar_height() {
		return car_height;
	}
	public void setCar_height(String car_height) {
		this.car_height = car_height;
	}
	public String getCar_width() {
		return car_width;
	}
	public void setCar_width(String car_width) {
		this.car_width = car_width;
	}
	public String getCar_length() {
		return car_length;
	}
	public void setCar_length(String car_length) {
		this.car_length = car_length;
	}




	public String getBoxType() {
		return boxType;
	}
	public void setBoxType(String boxType) {
		this.boxType = boxType;
	}
	public String getTonnage() {
		return tonnage;
	}
	public void setTonnage(String tonnage) {
		this.tonnage = tonnage;
	}
	public String getCarType() {
		return carType;
	}
	public void setCarType(String carType) {
		this.carType = carType;
	}
	
	
	
}