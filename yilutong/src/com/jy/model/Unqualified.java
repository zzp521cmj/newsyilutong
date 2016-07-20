package com.jy.model;

public class Unqualified {
	private String abnormalid;					//异常编号
	private String shiping_order_num; 			//单订编号
	private String send_time; 					//发货时间
	private String send_station;				//起运站
	private String end_address;					//到达站
	private String insurance;					//保费
	private String custom_name;					//发货客户
	private String receipt;						//收货客户
	private String types_id;  					//异常类型
	private String goods_name;					//货品名称
	private String unqualified_number;			//不合格件数
	private String trade_agency;				//代收款
	private String responsible_institutions;	//负责机构
	private String reference_price;    			//参考价格
	private String responsible_people;			//负责人
	private String report_people;				//上报人姓名
	private String agreement;					//协议编号
	private String agreement_paid;				//协议实收数量
	private String agreement_Sign;				//协议签收人
	private String abnormal_situation;			//异常情况
	private String audit_state;					//异常状态（0.审核过通1.未审核2.审核未通过）
	private String report_date;					//上报时间
	private String documents_state;    			//单据类型（0.未提交1.已提交）
	private String submission_time;     		//提交时间
	private String reason; 						//驳回理由
	private String idea;						//驳回意见
	private String customer_id;                 //客户表id
	private String audit_id;
	private String audit_remark;
	private String ides;                        //是否理赔
	private String send_shouji;                 //发货人手机
	private String goods_num;                  //件数
	private String goods_weight;                //重量
	private String goods_vol;                  //体积
	private String receipt_phone;             //收货人手机
	
	
	public String getReceipt_phone() {
		return receipt_phone;
	}
	public void setReceipt_phone(String receipt_phone) {
		this.receipt_phone = receipt_phone;
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
	public String getSend_shouji() {
		return send_shouji;
	}
	public void setSend_shouji(String send_shouji) {
		this.send_shouji = send_shouji;
	}
	public String getIdes() {
		return ides;
	}
	public void setIdes(String ides) {
		this.ides = ides;
	}
	public String getAudit_id() {
		return audit_id;
	}
	public void setAudit_id(String audit_id) {
		this.audit_id = audit_id;
	}
	public String getAudit_remark() {
		return audit_remark;
	}
	public void setAudit_remark(String audit_remark) {
		this.audit_remark = audit_remark;
	}
	public String getIdea() {
		return idea;
	}
	public void setIdea(String idea) {
		this.idea = idea;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getSubmission_time() {
		return submission_time;
	}
	public void setSubmission_time(String submission_time) {
		this.submission_time = submission_time;
	}
	public String getReference_price() {
		return reference_price;
	}
	public void setReference_price(String reference_price) {
		this.reference_price = reference_price;
	}
	public String getAbnormalid() {
		return abnormalid;
	}
	public String getDocuments_state() {
		return documents_state;
	}
	public void setDocuments_state(String documents_state) {
		this.documents_state = documents_state;
	}
	public void setAbnormalid(String abnormalid) {
		this.abnormalid = abnormalid;
	}
	public String getShiping_order_num() {
		return shiping_order_num;
	}
	public void setShiping_order_num(String shiping_order_num) {
		this.shiping_order_num = shiping_order_num;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
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
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getCustom_name() {
		return custom_name;
	}
	public void setCustom_name(String custom_name) {
		this.custom_name = custom_name;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	public String getTypes_id() {
		return types_id;
	}
	public void setTypes_id(String types_id) {
		this.types_id = types_id;
	}
	public String getGoods_name() {
		return goods_name;
	}
	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}
	public String getUnqualified_number() {
		return unqualified_number;
	}
	public void setUnqualified_number(String unqualified_number) {
		this.unqualified_number = unqualified_number;
	}
	public String getTrade_agency() {
		return trade_agency;
	}
	public void setTrade_agency(String trade_agency) {
		this.trade_agency = trade_agency;
	}
	public String getResponsible_institutions() {
		return responsible_institutions;
	}
	public void setResponsible_institutions(String responsible_institutions) {
		this.responsible_institutions = responsible_institutions;
	}
	public String getResponsible_people() {
		return responsible_people;
	}
	public void setResponsible_people(String responsible_people) {
		this.responsible_people = responsible_people;
	}
	public String getReport_people() {
		return report_people;
	}
	public void setReport_people(String report_people) {
		this.report_people = report_people;
	}
	public String getAgreement() {
		return agreement;
	}
	public void setAgreement(String agreement) {
		this.agreement = agreement;
	}
	public String getAgreement_paid() {
		return agreement_paid;
	}
	public void setAgreement_paid(String agreement_paid) {
		this.agreement_paid = agreement_paid;
	}
	public String getAgreement_Sign() {
		return agreement_Sign;
	}
	public void setAgreement_Sign(String agreement_Sign) {
		this.agreement_Sign = agreement_Sign;
	}
	public String getAbnormal_situation() {
		return abnormal_situation;
	}
	public void setAbnormal_situation(String abnormal_situation) {
		this.abnormal_situation = abnormal_situation;
	}
	public String getAudit_state() {
		return audit_state;
	}
	public void setAudit_state(String audit_state) {
		this.audit_state = audit_state;
	}
	public String getReport_date() {
		return report_date;
	}
	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	
}
