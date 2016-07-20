package com.jy.model;

import java.util.List;



public class CreateAgreement {
	// 协议制作基本表
	private String agreement_id;// 协议id
	private String agreement_number;// 协议编号（自动生成）
	private Integer agreement_type;// 协议类型（0、班线 1、配送 2、转运）
	private String ndp_id;// 托运机构id
	private String ldp_id;// 下一机构id
	private String car_number1;// 车牌号
	private String car_id;// 车辆id
	private String car_name;// 司机姓名
	private String all_money;// 竞价运费(所有订单运费合计)
	private Integer number;// 订单个数
	private String goods_weight;// 重量
	private String goods_vol;// 体积
	private String goods_num;// 件数
	private String end_address;//到站
	private String all_back_fee;//总返款费用(到付款-运费总额)
	private int all_back_type;//总返款方式(0,现付1,回付)
	private String all_destination_fee;//总到付款
	private String all_transportation_fee;//总运费订单费用
	private String all_trade_agency;//总的代收货款    
	private String all_handling_charge;//总的订单的手续费（代收货款*税率）
	private String all_change_handling;//总的中转手续费
	private String all_change_pay;//总的中转费
	private String pay_type;//(0，预付，1到付，2回付)
	
	
	private String phone_number;// 联系方式
	private String remarks_send;// 备注
	private String create_time;// 协议制作时间
	private String create_user;// 协议制作者
	private String send_type;
	
	private Integer order_state;// 订单状态
	private Integer isagain;// 是否被接受过
	private String company_id;// 中转公司的id
	private String company_name;
	private String end_people;
	private String end_phone;
	private String ship_order_id;// 订单id
	private String shiping_order_id;//
	private String company_number;// 转运单号
	private Integer chanage_pay_type;// 中转付款方式（0.回付，1.现付，2.到付）
	private String company_tel;// 中专公司联系方式
	private String send_date;// 配送时间
    private String is_vehbid;//是否竞价(0未竞价,1已竞价)

	private String vehiclebidding_id;// 竞价id
	private String vehiclebidding_message;// 竞价信息
	private String vehiclebidding_price;//竞价价格



	// 司机评价显示
	private String driverid;// 司机id
	private String shiping_order_num;// 订单号
	private String send_station;// 发站
	private String send_time;// 发车时间
	private String receipt;// 收货人
	private String goods_name;// 货物名称
	private String ratingid;// 司机评价id
	private String grade;// 评价分数
	private String content;// 评价内容
	private String bouns;// 评价时间
   
	
	//HCM毛利
	private String transport_pays;//总运费
	private String money_cha;//差异运费
    private String agreement_types;//协议类型
	
	 //配送费结算	
	private String yf;//预付
	private String df;//到付
	private String hf;//回付
	private String receivable_fee;//实付配送费
	private String payment_method;//配送结算方式(0.未结算  1.现金 2.油卡  3  转账)
	private String payment_tz;//配送费费调整：0未 1调整未结算 2已结算
	private String payment_sh;//配送费结算审核：0未审核 1审核中 2 审核通过 3 审核未通过
	private String payment_th_did;//配送费提审部门
	private String payment_fu;//配送费结算（实收，差额）
	private String trade_cha;//差异
	private String  paytypes;
	private String settlyf_remaks;
	private String settlyf_th_remaks;
   private String settlyf_time;//结算时间
	private String payment_bz;//付款备注
   private String settlyf_th_times;//提审日期

	private String allnuns;//总数
	private String notseetls;//没结算
	private String seetls;//已结算
	private String department_name;//部门
	private String lx;
	private String dn;
	
	private List<ShippingOrder> shippingOrders;//协议下面的
	private Driver driver;//司机信息
	
	
	public Driver getDriver() {
		return driver;
	}

	public void setDriver(Driver driver) {
		this.driver = driver;
	}

	public List<ShippingOrder> getShippingOrders() {
		return shippingOrders;
	}

	public void setShippingOrders(List<ShippingOrder> shippingOrders) {
		this.shippingOrders = shippingOrders;
	}

	public String getDn() {
		return dn;
	}

	public void setDn(String dn) {
		this.dn = dn;
	}

	public String getLx() {
		return lx;
	}

	public void setLx(String lx) {
		this.lx = lx;
	}

	public String getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}

	public String getPayment_bz() {
		return payment_bz;
	}

	public void setPayment_bz(String payment_bz) {
		this.payment_bz = payment_bz;
	}

	public String getSettlyf_th_times() {
		return settlyf_th_times;
	}

	public void setSettlyf_th_times(String settlyf_th_times) {
		this.settlyf_th_times = settlyf_th_times;
	}

	public String getSettlyf_time() {
		return settlyf_time;
	}

	public void setSettlyf_time(String settlyf_time) {
		this.settlyf_time = settlyf_time;
	}

	public String getAllnuns() {
		return allnuns;
	}

	public void setAllnuns(String allnuns) {
		this.allnuns = allnuns;
	}

	public String getNotseetls() {
		return notseetls;
	}

	public void setNotseetls(String notseetls) {
		this.notseetls = notseetls;
	}

	public String getSeetls() {
		return seetls;
	}

	public void setSeetls(String seetls) {
		this.seetls = seetls;
	}

	public String getSettlyf_remaks() {
		return settlyf_remaks;
	}

	public void setSettlyf_remaks(String settlyf_remaks) {
		this.settlyf_remaks = settlyf_remaks;
	}

	public String getSettlyf_th_remaks() {
		return settlyf_th_remaks;
	}

	public void setSettlyf_th_remaks(String settlyf_th_remaks) {
		this.settlyf_th_remaks = settlyf_th_remaks;
	}

	public String getPaytypes() {
		return paytypes;
	}

	public void setPaytypes(String paytypes) {
		this.paytypes = paytypes;
	}

	public String getYf() {
		return yf;
	}

	public void setYf(String yf) {
		this.yf = yf;
	}

	public String getDf() {
		return df;
	}

	public void setDf(String df) {
		this.df = df;
	}

	public String getHf() {
		return hf;
	}

	public void setHf(String hf) {
		this.hf = hf;
	}

	public String getReceivable_fee() {
		return receivable_fee;
	}

	public void setReceivable_fee(String receivable_fee) {
		this.receivable_fee = receivable_fee;
	}

	public String getPayment_method() {
		return payment_method;
	}

	public void setPayment_method(String payment_method) {
		this.payment_method = payment_method;
	}

	public String getPayment_tz() {
		return payment_tz;
	}

	public void setPayment_tz(String payment_tz) {
		this.payment_tz = payment_tz;
	}

	public String getPayment_sh() {
		return payment_sh;
	}

	public void setPayment_sh(String payment_sh) {
		this.payment_sh = payment_sh;
	}

	public String getPayment_th_did() {
		return payment_th_did;
	}

	public void setPayment_th_did(String payment_th_did) {
		this.payment_th_did = payment_th_did;
	}

	public String getPayment_fu() {
		return payment_fu;
	}

	public void setPayment_fu(String payment_fu) {
		this.payment_fu = payment_fu;
	}

	public String getTrade_cha() {
		return trade_cha;
	}

	public void setTrade_cha(String trade_cha) {
		this.trade_cha = trade_cha;
	}

	public String getAgreement_types() {
		return agreement_types;
	}

	public void setAgreement_types(String agreement_types) {
		this.agreement_types = agreement_types;
	}

	public String getTransport_pays() {
		return transport_pays;
	}

	public void setTransport_pays(String transport_pays) {
		this.transport_pays = transport_pays;
	}

	public String getMoney_cha() {
		return money_cha;
	}

	public void setMoney_cha(String money_cha) {
		this.money_cha = money_cha;
	}

	public String getAll_change_pay() {
		return all_change_pay;
	}

	public void setAll_change_pay(String all_change_pay) {
		this.all_change_pay = all_change_pay;
	}
	public String getPay_type() {
		return pay_type;
	}

	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
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

	public String getVehiclebidding_price() {
		return vehiclebidding_price;
	}

	public void setVehiclebidding_price(String vehiclebidding_price) {
		this.vehiclebidding_price = vehiclebidding_price;
	}

	public String getAll_change_handling() {
		return all_change_handling;
	}

	public void setAll_change_handling(String all_change_handling) {
		this.all_change_handling = all_change_handling;
	}

	public String getIs_vehbid() {
		return is_vehbid;
	}

	public void setIs_vehbid(String is_vehbid) {
		this.is_vehbid = is_vehbid;
	}

	public String getAll_back_fee() {
		return all_back_fee;
	}

	public void setAll_back_fee(String all_back_fee) {
		this.all_back_fee = all_back_fee;
	}

	public int getAll_back_type() {
		return all_back_type;
	}

	public void setAll_back_type(int all_back_type) {
		this.all_back_type = all_back_type;
	}

	public String getAll_destination_fee() {
		return all_destination_fee;
	}

	public void setAll_destination_fee(String all_destination_fee) {
		this.all_destination_fee = all_destination_fee;
	}

	public String getAll_transportation_fee() {
		return all_transportation_fee;
	}

	public void setAll_transportation_fee(String all_transportation_fee) {
		this.all_transportation_fee = all_transportation_fee;
	}

	public String getAll_trade_agency() {
		return all_trade_agency;
	}

	public void setAll_trade_agency(String all_trade_agency) {
		this.all_trade_agency = all_trade_agency;
	}

	public String getAll_handling_charge() {
		return all_handling_charge;
	}

	public void setAll_handling_charge(String all_handling_charge) {
		this.all_handling_charge = all_handling_charge;
	}

	public String getGoods_weight() {
		return goods_weight;
	}

	public void setGoods_weight(String goods_weight) {
		this.goods_weight = goods_weight;
	}

	public String getGoods_vol() {
		return goods_vol;
	}

	public void setGoods_vol(String goods_vol) {
		this.goods_vol = goods_vol;
	}

	public String getGoods_num() {
		return goods_num;
	}

	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
	}

	public String getDriverid() {
		return driverid;
	}

	public void setDriverid(String driverid) {
		this.driverid = driverid;
	}

	public String getSend_station() {
		return send_station;
	}

	public void setSend_station(String send_station) {
		this.send_station = send_station;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getReceipt() {
		return receipt;
	}

	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public String getShiping_order_num() {
		return shiping_order_num;
	}

	public void setShiping_order_num(String shiping_order_num) {
		this.shiping_order_num = shiping_order_num;
	}

	public String getRatingid() {
		return ratingid;
	}

	public void setRatingid(String ratingid) {
		this.ratingid = ratingid;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBouns() {
		return bouns;
	}

	public void setBouns(String bouns) {
		this.bouns = bouns;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getCompany_tel() {
		return company_tel;
	}

	public void setCompany_tel(String company_tel) {
		this.company_tel = company_tel;
	}

	public Integer getChanage_pay_type() {
		return chanage_pay_type;
	}

	public void setChanage_pay_type(Integer chanage_pay_type) {
		this.chanage_pay_type = chanage_pay_type;
	}

	public String getShiping_order_id() {
		return shiping_order_id;
	}

	public void setShiping_order_id(String shiping_order_id) {
		this.shiping_order_id = shiping_order_id;
	}

	public String getShip_order_id() {
		return ship_order_id;
	}

	public void setShip_order_id(String ship_order_id) {
		this.ship_order_id = ship_order_id;
	}

	public String getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}

	public String getEnd_people() {
		return end_people;
	}

	public void setEnd_people(String end_people) {
		this.end_people = end_people;
	}

	public String getEnd_phone() {
		return end_phone;
	}

	public void setEnd_phone(String end_phone) {
		this.end_phone = end_phone;
	}

	public String getCompany_id() {
		return company_id;
	}

	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}

	public Integer getIsagain() {
		return isagain;
	}

	public void setIsagain(Integer isagain) {
		this.isagain = isagain;
	}

	public Integer getOrder_state() {
		return order_state;
	}

	public void setOrder_state(Integer order_state) {
		this.order_state = order_state;
	}

	public Integer getNumber() {
		return number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public String getSend_type() {
		return send_type;
	}

	public void setSend_type(String send_type) {
		this.send_type = send_type;
	}

	public String getEnd_address() {
		return end_address;
	}

	public void setEnd_address(String end_address) {
		this.end_address = end_address;
	}

	public String getAgreement_id() {
		return agreement_id;
	}

	public void setAgreement_id(String agreement_id) {
		this.agreement_id = agreement_id;
	}

	public String getAgreement_number() {
		return agreement_number;
	}

	public void setAgreement_number(String agreement_number) {
		this.agreement_number = agreement_number;
	}




	public Integer getAgreement_type() {
		return agreement_type;
	}

	public void setAgreement_type(Integer agreement_type) {
		this.agreement_type = agreement_type;
	}

	public String getNdp_id() {
		return ndp_id;
	}

	public void setNdp_id(String ndp_id) {
		this.ndp_id = ndp_id;
	}

	public String getLdp_id() {
		return ldp_id;
	}

	public void setLdp_id(String ldp_id) {
		this.ldp_id = ldp_id;
	}

	public String getCar_number1() {
		return car_number1;
	}

	public void setCar_number1(String car_number1) {
		this.car_number1 = car_number1;
	}

	public String getCar_id() {
		return car_id;
	}

	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}

	public String getCar_name() {
		return car_name;
	}

	public void setCar_name(String car_name) {
		this.car_name = car_name;
	}

	public String getAll_money() {
		return all_money;
	}

	public void setAll_money(String all_money) {
		this.all_money = all_money;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getRemarks_send() {
		return remarks_send;
	}

	public void setRemarks_send(String remarks_send) {
		this.remarks_send = remarks_send;
	}

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public String getCompany_number() {
		return company_number;
	}

	public void setCompany_number(String company_number) {
		this.company_number = company_number;
	}

}
