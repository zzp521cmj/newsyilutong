package com.jy.model;

public class ChangeOrder {
	private String shiping_order_id;//订单id
	private String change_fee_id;//中转费表Id
	private String sends_fee;//配送费
	private String loading_fee;//装车费
	private String unloading_fee;//卸车费
	private String trans_price;//运费差价
	private String change_fee;//中转费
	private String unloadgoods_fee;//卸货费
	private Integer ischange_fee;//是否支付中转费 1支付 0未支付
	private String change_pay;//应付中转费
	private Integer is_update;//是否录入1录入 0未录入	
	private String update_time;//更新时间
	private Integer agreement_type;//订单协议，类型
	
	
	public Integer getAgreement_type() {
		return agreement_type;
	}
	public void setAgreement_type(Integer agreement_type) {
		this.agreement_type = agreement_type;
	}
	public String getShiping_order_id() {
		return shiping_order_id;
	}
	public void setShiping_order_id(String shiping_order_id) {
		this.shiping_order_id = shiping_order_id;
	}
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}
	public String getChange_fee_id() {
		return change_fee_id;
	}
	public void setChange_fee_id(String change_fee_id) {
		this.change_fee_id = change_fee_id;
	}
	public String getSends_fee() {
		return sends_fee;
	}
	public void setSends_fee(String sends_fee) {
		this.sends_fee = sends_fee;
	}
	public String getLoading_fee() {
		return loading_fee;
	}
	public void setLoading_fee(String loading_fee) {
		this.loading_fee = loading_fee;
	}
	public String getUnloading_fee() {
		return unloading_fee;
	}
	public void setUnloading_fee(String unloading_fee) {
		this.unloading_fee = unloading_fee;
	}
	public String getTrans_price() {
		return trans_price;
	}
	public void setTrans_price(String trans_price) {
		this.trans_price = trans_price;
	}
	public String getChange_fee() {
		return change_fee;
	}
	public void setChange_fee(String change_fee) {
		this.change_fee = change_fee;
	}
	public String getUnloadgoods_fee() {
		return unloadgoods_fee;
	}
	public void setUnloadgoods_fee(String unloadgoods_fee) {
		this.unloadgoods_fee = unloadgoods_fee;
	}
	public Integer getIschange_fee() {
		return ischange_fee;
	}
	public void setIschange_fee(Integer ischange_fee) {
		this.ischange_fee = ischange_fee;
	}
	public String getChange_pay() {
		return change_pay;
	}
	public void setChange_pay(String change_pay) {
		this.change_pay = change_pay;
	}
	public Integer getIs_update() {
		return is_update;
	}
	public void setIs_update(Integer is_update) {
		this.is_update = is_update;
	}
	
	
}
