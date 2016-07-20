package com.jy.model;

public class Settlement {
	
	private String write_project; // 核销项目
	private String write_data; // 核销日期
	private String write_money; //核销金额
	private String write_people;  //核销人
	private String shiping_order_num; // 订单号
	private String write_id; //id
	private String write_fangshi;
	private String id;
	private String remarks; // 备注
	private String company_id; //中转公司id
	
	
	public String getCompany_id() {
		return company_id;
	}
	public void setCompany_id(String company_id) {
		this.company_id = company_id;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getWrite_fangshi() {
		return write_fangshi;
	}
	public void setWrite_fangshi(String write_fangshi) {
		this.write_fangshi = write_fangshi;
	}
	public String getShiping_order_num() {
		return shiping_order_num;
	}
	public void setShiping_order_num(String shiping_order_num) {
		this.shiping_order_num = shiping_order_num;
	}
	public String getWrite_id() {
		return write_id;
	}
	public void setWrite_id(String write_id) {
		this.write_id = write_id;
	}
	public String getWrite_project() {
		return write_project;
	}
	public void setWrite_project(String write_project) {
		this.write_project = write_project;
	}
	public String getWrite_data() {
		return write_data;
	}
	public void setWrite_data(String write_data) {
		this.write_data = write_data;
	}
	public String getWrite_money() {
		return write_money;
	}
	public void setWrite_money(String write_money) {
		this.write_money = write_money;
	}
	public String getWrite_people() {
		return write_people;
	}
	public void setWrite_people(String write_people) {
		this.write_people = write_people;
	}
	
	
}
