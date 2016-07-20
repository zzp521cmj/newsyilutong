package com.jy.model;

public class Vehicle_auction {
	private String vehicleAuctionId; // 车辆竞价编号

	private Double price; // 价格

	private Integer determine; // 确定操作1和0

	private String demandReleaseId; // 需求发布编号

	private Integer cityOfLoadingId; // 装货城市

	private Integer unloadingCityId;// 卸货城市

	private String loadingAddress;// 装货地址

	private String unloadingAddress;// 卸货地址

	private Double ranges;// 方位（方）

	private Double weight;// 重量（吨）

	private String models;// 车型（米）
	private String length_id;// 车型（米）编号
	private String length_name;// 车型（米）

	private String truckTypeId;// 货车类型（厢车、高栏、平板）

	private String publisher;// 发布人

	private String contactInformation;// 联系方式

	private String createTime;// 创建时间

	private int state;// 状态（删除）

	private String remarks;// 备注

	private String citycode;// 城市编号

	private String zhuang;// 装货城市
	private String xie;// 卸货城市
	private String zhuangCity;
	private String xieCity;
	private String userid;// 
	private String temporary_car_id;//车牌号
	private String certain_time;//确定时间
	private String username;//用户名
    private String plateNumber;//车牌号

	
	public String getZhuangCity() {
		return zhuangCity;
	}

	public void setZhuangCity(String zhuangCity) {
		this.zhuangCity = zhuangCity;
	}

	public String getXieCity() {
		return xieCity;
	}

	public void setXieCity(String xieCity) {
		this.xieCity = xieCity;
	}

	public String getPlateNumber() {
		return plateNumber;
	}

	public void setPlateNumber(String plateNumber) {
		this.plateNumber = plateNumber;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCertain_time() {
		return certain_time;
	}

	public void setCertain_time(String certain_time) {
		this.certain_time = certain_time;
	}

	public String getTemporary_car_id() {
		return temporary_car_id;
	}

	public void setTemporary_car_id(String temporary_car_id) {
		this.temporary_car_id = temporary_car_id;
	}

	public String getVehicleAuctionId() {
		return vehicleAuctionId;
	}

	public void setVehicleAuctionId(String vehicleAuctionId) {
		this.vehicleAuctionId = vehicleAuctionId == null ? null
				: vehicleAuctionId.trim();
	}

	public String getDemandReleaseId() {
		return demandReleaseId;
	}

	public void setDemandReleaseId(String demandReleaseId) {
		this.demandReleaseId = demandReleaseId == null ? null : demandReleaseId
				.trim();
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getDetermine() {
		return determine;
	}

	public void setDetermine(Integer determine) {
		this.determine = determine;
	}

	public Integer getCityOfLoadingId() {
		return cityOfLoadingId;
	}

	public void setCityOfLoadingId(Integer cityOfLoadingId) {
		this.cityOfLoadingId = cityOfLoadingId;
	}

	public Integer getUnloadingCityId() {
		return unloadingCityId;
	}

	public void setUnloadingCityId(Integer unloadingCityId) {
		this.unloadingCityId = unloadingCityId;
	}

	public String getLoadingAddress() {
		return loadingAddress;
	}

	public void setLoadingAddress(String loadingAddress) {
		this.loadingAddress = loadingAddress;
	}

	public String getUnloadingAddress() {
		return unloadingAddress;
	}

	public void setUnloadingAddress(String unloadingAddress) {
		this.unloadingAddress = unloadingAddress;
	}

	public Double getRanges() {
		return ranges;
	}

	public void setRanges(Double ranges) {
		this.ranges = ranges;
	}

	public Double getWeight() {
		return weight;
	}

	public void setWeight(Double weight) {
		this.weight = weight;
	}

	public String getModels() {
		return models;
	}

	public void setModels(String models) {
		this.models = models;
	}

	public String getLength_id() {
		return length_id;
	}

	public void setLength_id(String length_id) {
		this.length_id = length_id;
	}

	public String getLength_name() {
		return length_name;
	}

	public void setLength_name(String length_name) {
		this.length_name = length_name;
	}

	public String getTruckTypeId() {
		return truckTypeId;
	}

	public void setTruckTypeId(String truckTypeId) {
		this.truckTypeId = truckTypeId;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getContactInformation() {
		return contactInformation;
	}

	public void setContactInformation(String contactInformation) {
		this.contactInformation = contactInformation;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getCitycode() {
		return citycode;
	}

	public void setCitycode(String citycode) {
		this.citycode = citycode;
	}

	public String getZhuang() {
		return zhuang;
	}

	public void setZhuang(String zhuang) {
		this.zhuang = zhuang;
	}

	public String getXie() {
		return xie;
	}

	public void setXie(String xie) {
		this.xie = xie;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

}