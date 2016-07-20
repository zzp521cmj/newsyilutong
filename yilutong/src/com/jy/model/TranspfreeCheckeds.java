package com.jy.model;

public class TranspfreeCheckeds {
   private String checks_id;//运费审核历史表id
   private String orderid;//订单id
   private String shiping_order_num;// 订单号
   private String checks_type;// 审核操作:0 提审 1审核
   private String checks_user;// 审核操作人
   private String checks_times;// 审核时间
   private String checks_notes;// 审核备注
   private String checks_state;// 审核情况：0驳回 1 通过 2有效提审
   private String  usernamecz;//审核操作人
   
public String getUsernamecz() {
	return usernamecz;
}
public void setUsernamecz(String usernamecz) {
	this.usernamecz = usernamecz;
}
public String getChecks_id() {
	return checks_id;
}
public void setChecks_id(String checks_id) {
	this.checks_id = checks_id;
}
public String getOrderid() {
	return orderid;
}
public void setOrderid(String orderid) {
	this.orderid = orderid;
}
public String getChecks_type() {
	return checks_type;
}
public void setChecks_type(String checks_type) {
	this.checks_type = checks_type;
}
public String getChecks_user() {
	return checks_user;
}
public void setChecks_user(String checks_user) {
	this.checks_user = checks_user;
}
public String getChecks_times() {
	return checks_times;
}
public void setChecks_times(String checks_times) {
	this.checks_times = checks_times;
}
public String getChecks_notes() {
	return checks_notes;
}
public void setChecks_notes(String checks_notes) {
	this.checks_notes = checks_notes;
}
public String getChecks_state() {
	return checks_state;
}
public void setChecks_state(String checks_state) {
	this.checks_state = checks_state;
}
public String getShiping_order_num() {
	return shiping_order_num;
}
public void setShiping_order_num(String shiping_order_num) {
	this.shiping_order_num = shiping_order_num;
}
   
}
