package com.jy.model;

public class shipmentStatistics {
	private String shipment_statistics_id;//id
	private String customer_id;//客户id
	private String order_time;//制单时间
	private int totality;//总数
	public String getShipment_statistics_id() {
		return shipment_statistics_id;
	}
	public void setShipment_statistics_id(String shipment_statistics_id) {
		this.shipment_statistics_id = shipment_statistics_id;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public int getTotality() {
		return totality;
	}
	public void setTotality(int totality) {
		this.totality = totality;
	}
	
	
}
