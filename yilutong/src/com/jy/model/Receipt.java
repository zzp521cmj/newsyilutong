package com.jy.model;

public class Receipt {
	private String receipt_id;//发票ID
	private String order_id;//订单id
	private String whether;//是否已经发票操作
	private String receipt_dime;//发票时间
	private String receipt_remark;//发票金额
	private String receipt_number;//开票编号
	
	public String getReceipt_number() {
		return receipt_number;
	}
	public void setReceipt_number(String receipt_number) {
		this.receipt_number = receipt_number;
	}
	public String getReceipt_id() {
		return receipt_id;
	}
	public void setReceipt_id(String receipt_id) {
		this.receipt_id = receipt_id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getWhether() {
		return whether;
	}
	public void setWhether(String whether) {
		this.whether = whether;
	}
	public String getReceipt_dime() {
		return receipt_dime;
	}
	public void setReceipt_dime(String receipt_dime) {
		this.receipt_dime = receipt_dime;
	}
	public String getReceipt_remark() {
		return receipt_remark;
	}
	public void setReceipt_remark(String receipt_remark) {
		this.receipt_remark = receipt_remark;
	}
	
}
