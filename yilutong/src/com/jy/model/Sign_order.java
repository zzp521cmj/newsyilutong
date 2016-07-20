package com.jy.model;//

public class Sign_order {
	/**
	 * @author H
	 * @return
	 */
	private String sign_id;// 签收id
	private String order_id;// 订单id
	private String order_number;// 订单号
	private String sign_user;// 签收人(默认订单收货联系人)
	private String sign_usernumber;// 证件号码
	private String sign_userphone;// 手机号
	private int sign_result;// 签收结果（0、异常签收；1、正常签收）
	private int actual_number;// 实际件数（默认订单总件数）
	private int defect_number;// 缺失数量(不可大于实际单数)
	private String copies_number;// 回单份数（不可大于实际单数）
	private String sign_remarks;// 签收备注
	private String sign_time;// 提货时间
	private String sign_username; // 提货经办
	private String sign_number;//提货代理人证件
	private String sign_name;//提货代理人
	private String sign_date;//签收日期
	
	public String getSign_date() {
		return sign_date;
	}

	public void setSign_date(String sign_date) {
		this.sign_date = sign_date;
	}

	public String getSign_name() {
		return sign_name;
	}

	public void setSign_name(String sign_name) {
		this.sign_name = sign_name;
	}

	public String getSign_number() {
		return sign_number;
	}

	public void setSign_number(String sign_number) {
		this.sign_number = sign_number;
	}

	public String getSign_username() {
		return sign_username;
	}

	public void setSign_username(String sign_username) {
		this.sign_username = sign_username;
	}

	public String getSign_id() {
		return sign_id;//
	}

	public void setSign_id(String sign_id) {
		this.sign_id = sign_id;//
	}

	public String getOrder_id() {
		return order_id;//
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;//
	}

	public String getOrder_number() {
		return order_number;//
	}

	public void setOrder_number(String order_number) {
		this.order_number = order_number;//
	}

	public String getSign_user() {
		return sign_user;//
	}

	public void setSign_user(String sign_user) {
		this.sign_user = sign_user;//
	}

	public String getSign_usernumber() {
		return sign_usernumber;//
	}

	public void setSign_usernumber(String sign_usernumber) {
		this.sign_usernumber = sign_usernumber;//
	}

	public String getSign_userphone() {
		return sign_userphone;//
	}

	public void setSign_userphone(String sign_userphone) {
		this.sign_userphone = sign_userphone;//
	}

	public int getSign_result() {
		return sign_result;//
	}

	public void setSign_result(int sign_result) {
		this.sign_result = sign_result;//
	}

	public int getActual_number() {
		return actual_number;//
	}

	public void setActual_number(int actual_number) {
		this.actual_number = actual_number;//
	}

	public int getDefect_number() {
		return defect_number;//
	}

	public void setDefect_number(int defect_number) {
		this.defect_number = defect_number;//
	}

	public String getCopies_number() {
		return copies_number;//
	}

	public void setCopies_number(String copies_number) {
		this.copies_number = copies_number;//
	}

	public String getSign_remarks() {
		return sign_remarks;//
	}

	public void setSign_remarks(String sign_remarks) {
		this.sign_remarks = sign_remarks;//
	}

	public String getSign_time() {
		return sign_time;//
	}

	public void setSign_time(String sign_time) {
		this.sign_time = sign_time;//
	}

}
