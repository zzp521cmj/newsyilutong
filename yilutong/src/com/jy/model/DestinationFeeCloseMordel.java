package com.jy.model;

public class DestinationFeeCloseMordel {
    private String customer_id;//客户id
    private String customer_num;//客户编号
    private String customer_name;//客户姓名
    private String customer_tel;//客户电话
    private String customer_address;//客户地址
    private String receipt_address;//送货客户详细地址
	private String shiping_order_id;//订单id
    private String shiping_order_num;//订单号
    private String receipt;//收货人名称
    private String receipt_tel;//收货方电话
    private String send_station;//发站
    private String end_address;//到站
    private String goods_name;//货物名称
    private String goods_packing;//包装
    private String goods_num;//件数
    private String goods_weight;//重量
    private String goods_vol;//体积
    private String transport_pay;//运费总额(应收总运费)
    private String paid_fee;//实收到付款（实收代收运费）
    private String destination_fee;//到付款(代收运费)
    private String chayi;//差异
    private String js_time;//结算日期
    private String send_time;//发车时间
    private String send_phone;//发货人电话
    private String receipt_phone;//收货人手机
    private String back_fee;//返款
    private String xian_back_fee;//现返
    private String qian_back_fee;//欠返
    private String zongpiaoshu;//未结算票数
    private String des_sh_stata;//应收代收运费审核状态：0未审核 1审核中 2 审核通过 3 审核未通过
    private String des_tz_stata;//应收代收运费调整状态： 0 未调整 1已调整未结算 2 已调整已结算
    private String destination_stata;//应收代收运费结算状态 ：0未结算 1现金 2转账
    private String des_sige_name;//应收代收运费开户名
    private String des_bank;//应收代收运费开户行
    private String des_card;//应收代收运费卡号
    private String des_time;//应收代收运费结算时间
    private String des_name;//应收代收运费结算人
    private String des_market;//应收代收运费结算备注
    private String des_ts_time;//应收代收运费提审时间
    private String des_ts_bm;//应收代收运费提审部门
    private String des_ts_market;//应收代收运提审算备注
    private String fankuan_stata;//返款付款方式，0现反，1欠反
    private String closes;//已结算票数
    private String close_fee;//
    private String send_type;//交接方式：1送货 0自提    
    private String derfee_id;//记录表id
    private String shenhe_id;//审核id
    private String shenhe_name;//审核人
    private String shenhe_stime;//审核时按
    private String  shenhe_market;//审核备注
    private String handling_charge;//应收手续费（代收货款的）
    private String handling_stata;//应收手续费结算方式：0未结算，1现金，2转账，3支票，4其他
    private String handling_shihou;//实收手续费
    private String handling_tiaozheng;//应收代收手续费审核状态： 0 未调整 1已调整未结算 2 已调整已结算
    private String handling_shenhe;//应收代收手续费审核状态：0未审核 1审核中 2 审核通过 3 审核未通过
    private String zhipiao_binahao;//支票编号
    private String handling_market;//手续费提审备注
    private String laiyuan;//来源
    private String handling_ts_name;//手续费提审人
    private String handling_ts_time;//提审时间
    private String settl_times;//结算时建
    private String settl_user;//结算人
    private String settl_notes;//结算备注
    private String trade_cha;//差异   
    private String settlyf_time;//结算时间	
    private String settlyf_remaks;//结算备注
    private String settleds_sh_times;//审核时间
    private String settlyf_th_remaks;//提审备注
    private String settleds_sh_remaks;//审核备注
    private String  username;//结算人
    private String usernameth;//提审人
	private String settlements_id;//结算id
	private String order_id;//记录订单 
	private String allmoney;//总金额
	private String settl_money;//结算金额
	private String over_money;//未结算金额
	private String settl_order;//结算收支类型：0 应收 1应付
	private String settl_type;//结算方式：1现金 2 刷卡 3 支票 4 其他  
	private String usernamecz;//操作人
	private String settl_zpnum;//支票编码
	private String settl_khbank;//结算开户行
	private String settl_username;//结算开户人
	private String settl_kahao;//结算卡号
	private String settl_state;//结算审核：0未审核 1审核中 2通过 3不通过
	private String settlyf_th_times;//提审时间
	private String all_nuns;//总数
	private String custom_name;//客户名称
	private String reality_sum;//已付结算金额
	private String department_name;//部门名称
	private String paid_derived_fee;//应收代收运费结算（本次实收，上次实收）
	private String handling_ysce;//应收手续费（实收，差额）
	
	
    public String getPaid_derived_fee() {
		return paid_derived_fee;
	}
	public void setPaid_derived_fee(String paid_derived_fee) {
		this.paid_derived_fee = paid_derived_fee;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
	public String getReality_sum() {
		return reality_sum;
	}
	public void setReality_sum(String reality_sum) {
		this.reality_sum = reality_sum;
	}
	public String getCustom_name() {
		return custom_name;
	}
	public void setCustom_name(String custom_name) {
		this.custom_name = custom_name;
	}
	public String getAll_nuns() {
		return all_nuns;
	}
	public void setAll_nuns(String all_nuns) {
		this.all_nuns = all_nuns;
	}
	public String getSettlyf_th_times() {
		return settlyf_th_times;
	}
	public void setSettlyf_th_times(String settlyf_th_times) {
		this.settlyf_th_times = settlyf_th_times;
	}
	public String getReceipt_address() {
		return receipt_address;
	}
	public void setReceipt_address(String receipt_address) {
		this.receipt_address = receipt_address;
	}
	public String getSettlements_id() {
		return settlements_id;
	}
	public void setSettlements_id(String settlements_id) {
		this.settlements_id = settlements_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getAllmoney() {
		return allmoney;
	}
	public void setAllmoney(String allmoney) {
		this.allmoney = allmoney;
	}
	public String getSettl_money() {
		return settl_money;
	}
	public void setSettl_money(String settl_money) {
		this.settl_money = settl_money;
	}
	public String getOver_money() {
		return over_money;
	}
	public void setOver_money(String over_money) {
		this.over_money = over_money;
	}
	public String getSettl_order() {
		return settl_order;
	}
	public void setSettl_order(String settl_order) {
		this.settl_order = settl_order;
	}
	public String getSettl_type() {
		return settl_type;
	}
	public void setSettl_type(String settl_type) {
		this.settl_type = settl_type;
	}
	public String getUsernamecz() {
		return usernamecz;
	}
	public void setUsernamecz(String usernamecz) {
		this.usernamecz = usernamecz;
	}
	public String getSettl_zpnum() {
		return settl_zpnum;
	}
	public void setSettl_zpnum(String settl_zpnum) {
		this.settl_zpnum = settl_zpnum;
	}
	public String getSettl_khbank() {
		return settl_khbank;
	}
	public void setSettl_khbank(String settl_khbank) {
		this.settl_khbank = settl_khbank;
	}
	public String getSettl_username() {
		return settl_username;
	}
	public void setSettl_username(String settl_username) {
		this.settl_username = settl_username;
	}
	public String getSettl_kahao() {
		return settl_kahao;
	}
	public void setSettl_kahao(String settl_kahao) {
		this.settl_kahao = settl_kahao;
	}
	public String getSettl_state() {
		return settl_state;
	}
	public void setSettl_state(String settl_state) {
		this.settl_state = settl_state;
	}
	public String getSettlyf_time() {
		return settlyf_time;
	}
	public void setSettlyf_time(String settlyf_time) {
		this.settlyf_time = settlyf_time;
	}
	public String getSettlyf_remaks() {
		return settlyf_remaks;
	}
	public void setSettlyf_remaks(String settlyf_remaks) {
		this.settlyf_remaks = settlyf_remaks;
	}
	public String getSettleds_sh_times() {
		return settleds_sh_times;
	}
	public void setSettleds_sh_times(String settleds_sh_times) {
		this.settleds_sh_times = settleds_sh_times;
	}
	public String getSettlyf_th_remaks() {
		return settlyf_th_remaks;
	}
	public void setSettlyf_th_remaks(String settlyf_th_remaks) {
		this.settlyf_th_remaks = settlyf_th_remaks;
	}
	public String getSettleds_sh_remaks() {
		return settleds_sh_remaks;
	}
	public void setSettleds_sh_remaks(String settleds_sh_remaks) {
		this.settleds_sh_remaks = settleds_sh_remaks;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsernameth() {
		return usernameth;
	}
	public void setUsernameth(String usernameth) {
		this.usernameth = usernameth;
	}
	
    
    
	public String getSettl_times() {
		return settl_times;
	}
	public void setSettl_times(String settl_times) {
		this.settl_times = settl_times;
	}
	public String getSettl_user() {
		return settl_user;
	}
	public void setSettl_user(String settl_user) {
		this.settl_user = settl_user;
	}
	public String getSettl_notes() {
		return settl_notes;
	}
	public void setSettl_notes(String settl_notes) {
		this.settl_notes = settl_notes;
	}
	public String getHandling_ysce() {
		return handling_ysce;
	}
	public void setHandling_ysce(String handling_ysce) {
		this.handling_ysce = handling_ysce;
	}
	
    
    public String getTrade_cha() {
		return trade_cha;
	}
	public void setTrade_cha(String trade_cha) {
		this.trade_cha = trade_cha;
	}
	public String getHandling_ts_time() {
		return handling_ts_time;
	}
	public void setHandling_ts_time(String handling_ts_time) {
		this.handling_ts_time = handling_ts_time;
	}
	public String getHandling_market() {
		return handling_market;
	}
	public void setHandling_market(String handling_market) {
		this.handling_market = handling_market;
	}
	public String getLaiyuan() {
		return laiyuan;
	}
	public void setLaiyuan(String laiyuan) {
		this.laiyuan = laiyuan;
	}
	public String getHandling_ts_name() {
		return handling_ts_name;
	}
	public void setHandling_ts_name(String handling_ts_name) {
		this.handling_ts_name = handling_ts_name;
	}
	public String getZhipiao_binahao() {
		return zhipiao_binahao;
	}
	public void setZhipiao_binahao(String zhipiao_binahao) {
		this.zhipiao_binahao = zhipiao_binahao;
	}
	public String getHandling_tiaozheng() {
		return handling_tiaozheng;
	}
	public void setHandling_tiaozheng(String handling_tiaozheng) {
		this.handling_tiaozheng = handling_tiaozheng;
	}
	public String getHandling_shenhe() {
		return handling_shenhe;
	}
	public void setHandling_shenhe(String handling_shenhe) {
		this.handling_shenhe = handling_shenhe;
	}
	public String getHandling_shihou() {
		return handling_shihou;
	}
	public void setHandling_shihou(String handling_shihou) {
		this.handling_shihou = handling_shihou;
	}
	public String getHandling_stata() {
		return handling_stata;
	}
	public void setHandling_stata(String handling_stata) {
		this.handling_stata = handling_stata;
	}
	public String getHandling_charge() {
		return handling_charge;
	}
	public void setHandling_charge(String handling_charge) {
		this.handling_charge = handling_charge;
	}
	public String getShenhe_id() {
		return shenhe_id;
	}
	public void setShenhe_id(String shenhe_id) {
		this.shenhe_id = shenhe_id;
	}
	public String getShenhe_name() {
		return shenhe_name;
	}
	public void setShenhe_name(String shenhe_name) {
		this.shenhe_name = shenhe_name;
	}
	public String getShenhe_stime() {
		return shenhe_stime;
	}
	public void setShenhe_stime(String shenhe_stime) {
		this.shenhe_stime = shenhe_stime;
	}
	public String getShenhe_market() {
		return shenhe_market;
	}
	public void setShenhe_market(String shenhe_market) {
		this.shenhe_market = shenhe_market;
	}
	public String getDerfee_id() {
		return derfee_id;
	}
	public void setDerfee_id(String derfee_id) {
		this.derfee_id = derfee_id;
	}
	public String getSend_type() {
		return send_type;
	}
	public void setSend_type(String send_type) {
		this.send_type = send_type;
	}
	public String getCloses() {
		return closes;
	}
	public void setCloses(String closes) {
		this.closes = closes;
	}
	public String getClose_fee() {
		return close_fee;
	}
	public void setClose_fee(String close_fee) {
		this.close_fee = close_fee;
	}
	public String getFankuan_stata() {
		return fankuan_stata;
	}
	public void setFankuan_stata(String fankuan_stata) {
		this.fankuan_stata = fankuan_stata;
	}
	public String getDes_ts_time() {
		return des_ts_time;
	}
	public void setDes_ts_time(String des_ts_time) {
		this.des_ts_time = des_ts_time;
	}
	public String getDes_ts_bm() {
		return des_ts_bm;
	}
	public void setDes_ts_bm(String des_ts_bm) {
		this.des_ts_bm = des_ts_bm;
	}
	public String getDes_ts_market() {
		return des_ts_market;
	}
	public void setDes_ts_market(String des_ts_market) {
		this.des_ts_market = des_ts_market;
	}
	public String getDes_time() {
		return des_time;
	}
	public void setDes_time(String des_time) {
		this.des_time = des_time;
	}
	public String getDes_name() {
		return des_name;
	}
	public void setDes_name(String des_name) {
		this.des_name = des_name;
	}
	public String getDes_market() {
		return des_market;
	}
	public void setDes_market(String des_market) {
		this.des_market = des_market;
	}
	public String getDes_sige_name() {
		return des_sige_name;
	}
	public void setDes_sige_name(String des_sige_name) {
		this.des_sige_name = des_sige_name;
	}
	public String getDes_bank() {
		return des_bank;
	}
	public void setDes_bank(String des_bank) {
		this.des_bank = des_bank;
	}
	public String getDes_card() {
		return des_card;
	}
	public void setDes_card(String des_card) {
		this.des_card = des_card;
	}
	public String getDes_sh_stata() {
		return des_sh_stata;
	}
	public void setDes_sh_stata(String des_sh_stata) {
		this.des_sh_stata = des_sh_stata;
	}
	public String getDes_tz_stata() {
		return des_tz_stata;
	}
	public void setDes_tz_stata(String des_tz_stata) {
		this.des_tz_stata = des_tz_stata;
	}
	public String getDestination_stata() {
		return destination_stata;
	}
	public void setDestination_stata(String destination_stata) {
		this.destination_stata = destination_stata;
	}
	public String getZongpiaoshu() {
		return zongpiaoshu;
	}
	public void setZongpiaoshu(String zongpiaoshu) {
		this.zongpiaoshu = zongpiaoshu;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public String getSend_phone() {
		return send_phone;
	}
	public void setSend_phone(String send_phone) {
		this.send_phone = send_phone;
	}
	public String getReceipt_phone() {
		return receipt_phone;
	}
	public void setReceipt_phone(String receipt_phone) {
		this.receipt_phone = receipt_phone;
	}
	public String getBack_fee() {
		return back_fee;
	}
	public void setBack_fee(String back_fee) {
		this.back_fee = back_fee;
	}
	public String getXian_back_fee() {
		return xian_back_fee;
	}
	public void setXian_back_fee(String xian_back_fee) {
		this.xian_back_fee = xian_back_fee;
	}
	public String getQian_back_fee() {
		return qian_back_fee;
	}
	public void setQian_back_fee(String qian_back_fee) {
		this.qian_back_fee = qian_back_fee;
	}
	public String getCustomer_tel() {
		return customer_tel;
	}
	public void setCustomer_tel(String customer_tel) {
		this.customer_tel = customer_tel;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getJs_time() {
		return js_time;
	}
	public void setJs_time(String js_time) {
		this.js_time = js_time;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_num() {
		return customer_num;
	}
	public void setCustomer_num(String customer_num) {
		this.customer_num = customer_num;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getShiping_order_id() {
		return shiping_order_id;
	}
	public void setShiping_order_id(String shiping_order_id) {
		this.shiping_order_id = shiping_order_id;
	}
	public String getShiping_order_num() {
		return shiping_order_num;
	}
	public void setShiping_order_num(String shiping_order_num) {
		this.shiping_order_num = shiping_order_num;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getReceipt_tel() {
		return receipt_tel;
	}
	public void setReceipt_tel(String receipt_tel) {
		this.receipt_tel = receipt_tel;
	}
	public String getSend_station() {
		return send_station;
	}
	public void setSend_station(String send_station) {
		this.send_station = send_station;
	}
	public String getEnd_address() {
		return end_address;
	}
	public void setEnd_address(String end_address) {
		this.end_address = end_address;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getGoods_packing() {
		return goods_packing;
	}
	public void setGoods_packing(String goods_packing) {
		this.goods_packing = goods_packing;
	}
	public String getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(String goods_num) {
		this.goods_num = goods_num;
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
	public String getTransport_pay() {
		return transport_pay;
	}
	public void setTransport_pay(String transport_pay) {
		this.transport_pay = transport_pay;
	}
	public String getPaid_fee() {
		return paid_fee;
	}
	public void setPaid_fee(String paid_fee) {
		this.paid_fee = paid_fee;
	}
	public String getDestination_fee() {
		return destination_fee;
	}
	public void setDestination_fee(String destination_fee) {
		this.destination_fee = destination_fee;
	}
	public String getChayi() {
		return chayi;
	}
	public void setChayi(String chayi) {
		this.chayi = chayi;
	}
    
    
}
