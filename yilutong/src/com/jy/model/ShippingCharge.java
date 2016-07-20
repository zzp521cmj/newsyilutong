package com.jy.model;

public class ShippingCharge {
	private String paid_fee;//实收到付款（客户结算） 
    private String picking_fee;//提货费
	private String freight_fee;// 运费
	private String insurance_fee;// 保价费
	private String destination_fee;//到付款
	private String receivable_ground_fee;//装卸费
	private String upstairs_fee;//上楼费
	private String deliver_fee;//直送费   
	private String inspect_fee;//开箱验货费
	private String seized_fee;//理货费
	private String adorn_fee;//应收其他费(运单导入)
	private String back_fee;//回扣   
	private String transport_pay;//运费总额(应收总运费)
	
	
    private String change_fee;//中转费
    private String change_pay;//应付中转费(中转协议处 预留)
    private String received_change_fee;//实收中转费
    private String received_take_fee;//实收送货费
    private String received_send_fee;//实收落地费 （预留）
    private String received_adorn_fee;//实收其他费
    private String received_ground_fee;//实收装卸费
    private String received_upstairs_fee;//实收上楼费
    private String received_deliver_fee;//实收直送费
    private String received_seized_fee;//实收理货费
    private String received_inspect_fee;//实收开箱验货费
    
    
    private String send_fee;//应付配送费（）
    private String pay_upstairs_fee;//應付上樓費（司機結算）
    private String payble_other;//应付其他费()
    private String payble_coolie;//应付装卸费()
    private String pay_total_fee;//应付总费用（预留）
    private String pay_ground_fee;//应付落地费（预留）
	private String pay_inspect_fee;//应付开箱验货费
	private String pay_seized_fee;//应付理货费
	private String pay_deliver_fee;//应付直送费   
    private String pay_picking_fee;//应付提货费

    private String driver_close_naem;//結算人（司機結算）
    private String driver_close_time;//結算時間（司機結算）   
    private String paid_upstairs_fee;//實付上樓費（司機結算）
    private String paid_deliver_fee;//實付直送费（司機結算）
    private String paid_ground_fee;//實付装卸费（司機結算）
    private String paid_adorn_fee;//實付其他费（司機結算）
	private String paid_seized_fee;//實付理货费（司機結算）
    private String paid_picking_fee;//實付提货费（司機結算）
    private String paid_inspect_fee;//實付开箱验货费（司機結算）
    
    
    
	public String getPaid_seized_fee() {
		return paid_seized_fee;
	}
	public void setPaid_seized_fee(String paid_seized_fee) {
		this.paid_seized_fee = paid_seized_fee;
	}
	public String getPaid_picking_fee() {
		return paid_picking_fee;
	}
	public void setPaid_picking_fee(String paid_picking_fee) {
		this.paid_picking_fee = paid_picking_fee;
	}
	public String getPaid_inspect_fee() {
		return paid_inspect_fee;
	}
	public void setPaid_inspect_fee(String paid_inspect_fee) {
		this.paid_inspect_fee = paid_inspect_fee;
	}
	public String getPay_inspect_fee() {
		return pay_inspect_fee;
	}
	public void setPay_inspect_fee(String pay_inspect_fee) {
		this.pay_inspect_fee = pay_inspect_fee;
	}
	public String getPay_seized_fee() {
		return pay_seized_fee;
	}
	public void setPay_seized_fee(String pay_seized_fee) {
		this.pay_seized_fee = pay_seized_fee;
	}
	public String getPay_deliver_fee() {
		return pay_deliver_fee;
	}
	public void setPay_deliver_fee(String pay_deliver_fee) {
		this.pay_deliver_fee = pay_deliver_fee;
	}
	public String getPay_picking_fee() {
		return pay_picking_fee;
	}
	public void setPay_picking_fee(String pay_picking_fee) {
		this.pay_picking_fee = pay_picking_fee;
	}
	public String getPaid_fee() {
		return paid_fee;
	}
	public void setPaid_fee(String paid_fee) {
		this.paid_fee = paid_fee;
	}
	public String getPicking_fee() {
		return picking_fee;
	}
	public void setPicking_fee(String picking_fee) {
		this.picking_fee = picking_fee;
	}
	public String getFreight_fee() {
		return freight_fee;
	}
	public void setFreight_fee(String freight_fee) {
		this.freight_fee = freight_fee;
	}
	public String getInsurance_fee() {
		return insurance_fee;
	}
	public void setInsurance_fee(String insurance_fee) {
		this.insurance_fee = insurance_fee;
	}
	public String getDestination_fee() {
		return destination_fee;
	}
	public void setDestination_fee(String destination_fee) {
		this.destination_fee = destination_fee;
	}
	public String getReceivable_ground_fee() {
		return receivable_ground_fee;
	}
	public void setReceivable_ground_fee(String receivable_ground_fee) {
		this.receivable_ground_fee = receivable_ground_fee;
	}
	public String getUpstairs_fee() {
		return upstairs_fee;
	}
	public void setUpstairs_fee(String upstairs_fee) {
		this.upstairs_fee = upstairs_fee;
	}
	public String getDeliver_fee() {
		return deliver_fee;
	}
	public void setDeliver_fee(String deliver_fee) {
		this.deliver_fee = deliver_fee;
	}
	public String getInspect_fee() {
		return inspect_fee;
	}
	public void setInspect_fee(String inspect_fee) {
		this.inspect_fee = inspect_fee;
	}
	public String getSeized_fee() {
		return seized_fee;
	}
	public void setSeized_fee(String seized_fee) {
		this.seized_fee = seized_fee;
	}
	public String getAdorn_fee() {
		return adorn_fee;
	}
	public void setAdorn_fee(String adorn_fee) {
		this.adorn_fee = adorn_fee;
	}
	public String getBack_fee() {
		return back_fee;
	}
	public void setBack_fee(String back_fee) {
		this.back_fee = back_fee;
	}
	public String getTransport_pay() {
		return transport_pay;
	}
	public void setTransport_pay(String transport_pay) {
		this.transport_pay = transport_pay;
	}
	public String getChange_fee() {
		return change_fee;
	}
	public void setChange_fee(String change_fee) {
		this.change_fee = change_fee;
	}
	public String getChange_pay() {
		return change_pay;
	}
	public void setChange_pay(String change_pay) {
		this.change_pay = change_pay;
	}
	public String getReceived_change_fee() {
		return received_change_fee;
	}
	public void setReceived_change_fee(String received_change_fee) {
		this.received_change_fee = received_change_fee;
	}
	public String getReceived_take_fee() {
		return received_take_fee;
	}
	public void setReceived_take_fee(String received_take_fee) {
		this.received_take_fee = received_take_fee;
	}
	public String getReceived_send_fee() {
		return received_send_fee;
	}
	public void setReceived_send_fee(String received_send_fee) {
		this.received_send_fee = received_send_fee;
	}
	public String getReceived_adorn_fee() {
		return received_adorn_fee;
	}
	public void setReceived_adorn_fee(String received_adorn_fee) {
		this.received_adorn_fee = received_adorn_fee;
	}
	public String getReceived_ground_fee() {
		return received_ground_fee;
	}
	public void setReceived_ground_fee(String received_ground_fee) {
		this.received_ground_fee = received_ground_fee;
	}
	public String getReceived_upstairs_fee() {
		return received_upstairs_fee;
	}
	public void setReceived_upstairs_fee(String received_upstairs_fee) {
		this.received_upstairs_fee = received_upstairs_fee;
	}
	public String getReceived_deliver_fee() {
		return received_deliver_fee;
	}
	public void setReceived_deliver_fee(String received_deliver_fee) {
		this.received_deliver_fee = received_deliver_fee;
	}
	public String getReceived_seized_fee() {
		return received_seized_fee;
	}
	public void setReceived_seized_fee(String received_seized_fee) {
		this.received_seized_fee = received_seized_fee;
	}
	public String getReceived_inspect_fee() {
		return received_inspect_fee;
	}
	public void setReceived_inspect_fee(String received_inspect_fee) {
		this.received_inspect_fee = received_inspect_fee;
	}
	public String getSend_fee() {
		return send_fee;
	}
	public void setSend_fee(String send_fee) {
		this.send_fee = send_fee;
	}
	public String getPay_upstairs_fee() {
		return pay_upstairs_fee;
	}
	public void setPay_upstairs_fee(String pay_upstairs_fee) {
		this.pay_upstairs_fee = pay_upstairs_fee;
	}
	public String getPayble_other() {
		return payble_other;
	}
	public void setPayble_other(String payble_other) {
		this.payble_other = payble_other;
	}
	public String getPayble_coolie() {
		return payble_coolie;
	}
	public void setPayble_coolie(String payble_coolie) {
		this.payble_coolie = payble_coolie;
	}
	public String getPay_total_fee() {
		return pay_total_fee;
	}
	public void setPay_total_fee(String pay_total_fee) {
		this.pay_total_fee = pay_total_fee;
	}
	public String getPay_ground_fee() {
		return pay_ground_fee;
	}
	public void setPay_ground_fee(String pay_ground_fee) {
		this.pay_ground_fee = pay_ground_fee;
	}
	public String getDriver_close_naem() {
		return driver_close_naem;
	}
	public void setDriver_close_naem(String driver_close_naem) {
		this.driver_close_naem = driver_close_naem;
	}
	public String getDriver_close_time() {
		return driver_close_time;
	}
	public void setDriver_close_time(String driver_close_time) {
		this.driver_close_time = driver_close_time;
	}
	public String getPaid_upstairs_fee() {
		return paid_upstairs_fee;
	}
	public void setPaid_upstairs_fee(String paid_upstairs_fee) {
		this.paid_upstairs_fee = paid_upstairs_fee;
	}
	public String getPaid_deliver_fee() {
		return paid_deliver_fee;
	}
	public void setPaid_deliver_fee(String paid_deliver_fee) {
		this.paid_deliver_fee = paid_deliver_fee;
	}
	public String getPaid_ground_fee() {
		return paid_ground_fee;
	}
	public void setPaid_ground_fee(String paid_ground_fee) {
		this.paid_ground_fee = paid_ground_fee;
	}
	public String getPaid_adorn_fee() {
		return paid_adorn_fee;
	}
	public void setPaid_adorn_fee(String paid_adorn_fee) {
		this.paid_adorn_fee = paid_adorn_fee;
	}
    
    
    
    
}
