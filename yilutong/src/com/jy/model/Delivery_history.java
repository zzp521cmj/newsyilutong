package com.jy.model;

public class Delivery_history {
	   private String historyid;//配送费调整历史表id
	   private String formerfree;//原金额
	   private String formerchange;//原调整金额
	   private String newfree;//现金额
	   private String order_id;//订单id
	   private String downfree;//冲减金额
	   private String newchange;//现调整金额
	   private String changeuser;//调整人
	   private String changetime;//调整时间
	   private String shiping_order_num;// 订单号
	   private String changeremark;//调整原因
	   private String usernametz;//调整人名
	private String payment_bz;
	
	
	public String getPayment_bz() {
		return payment_bz;
	}
	public void setPayment_bz(String payment_bz) {
		this.payment_bz = payment_bz;
	}
	public String getHistoryid() {
		return historyid;
	}
	public void setHistoryid(String historyid) {
		this.historyid = historyid;
	}
	public String getFormerfree() {
		return formerfree;
	}
	public void setFormerfree(String formerfree) {
		this.formerfree = formerfree;
	}
	public String getFormerchange() {
		return formerchange;
	}
	public void setFormerchange(String formerchange) {
		this.formerchange = formerchange;
	}
	public String getNewfree() {
		return newfree;
	}
	public void setNewfree(String newfree) {
		this.newfree = newfree;
	}


	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getDownfree() {
		return downfree;
	}
	public void setDownfree(String downfree) {
		this.downfree = downfree;
	}
	public String getNewchange() {
		return newchange;
	}
	public void setNewchange(String newchange) {
		this.newchange = newchange;
	}
	public String getChangeuser() {
		return changeuser;
	}
	public void setChangeuser(String changeuser) {
		this.changeuser = changeuser;
	}
	public String getChangetime() {
		return changetime;
	}
	public void setChangetime(String changetime) {
		this.changetime = changetime;
	}
	public String getShiping_order_num() {
		return shiping_order_num;
	}
	public void setShiping_order_num(String shiping_order_num) {
		this.shiping_order_num = shiping_order_num;
	}
	public String getChangeremark() {
		return changeremark;
	}
	public void setChangeremark(String changeremark) {
		this.changeremark = changeremark;
	}
	public String getUsernametz() {
		return usernametz;
	}
	public void setUsernametz(String usernametz) {
		this.usernametz = usernametz;
	}
	   
}
