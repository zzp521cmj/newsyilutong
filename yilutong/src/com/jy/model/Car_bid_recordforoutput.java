package com.jy.model;

public class Car_bid_recordforoutput {
	private String vehicleAuctionId; // 车辆竞价编号
	private String  userName;//司机
	private String plate_number;
	private String publisher;// 发布人
	private String contactInformation;// 联系方式
	private String createTime;// 创建时间
	private Long price; // 价格
	private String loadingAddress;// 装货地址
	private String unloadingAddress;// 卸货地址
	private Double ranges;// 方位（方）
	private Double weight;// 重量（吨）
	private String zhuang;// 装货城市
	private String xie;// 卸货城市
	private String remarks;// 备注
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPlate_number() {
		return plate_number;
	}

	public void setPlate_number(String plate_number) {
		this.plate_number = plate_number;
	}

	public String getVehicleAuctionId() {
		return vehicleAuctionId;
	}

	public void setVehicleAuctionId(String vehicleAuctionId) {
		this.vehicleAuctionId = vehicleAuctionId == null ? null
				: vehicleAuctionId.trim();
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
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

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

}