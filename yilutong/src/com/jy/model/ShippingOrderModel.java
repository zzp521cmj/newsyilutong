package com.jy.model;

public class ShippingOrderModel {
    private String shiping_order_id;//订单id
    private String shiping_order_num;//订单号
    private String send_station;//发站
    private String end_address;//到站
    private String send_time;//发站时间
    private String receipt;//收货人名称
    private String receipt_tel;//收货方电话
    private String receipt_phone;//收货方手机
    private String receipt_address;//收货详细地址
    private String goods_name;//货物名称
    private String goods_packing;//包装
    private String goods_num;//件数
    private String goods_weight;//重量
    private String goods_vol;//体积
    private String spe;//规格
    private String take_fee;//应收送货费
    private String send_fee;//应付配送费（协议）
    private String adorn_fee;//应收其他费(运单导入)
    private String insurance;//应收保险费（预留）
    private String pay_type;//付款方式： 0回付 1 提付 2现付 3货到前付，4发货方月结；5收货方月结
    private String transport_pay;//运费总额(应收总运费)
    private String remarks;//订单备注（运单导入）
    private String send_type;//交接方式：1送货 0自提
    private String shipping_order_state;//订单状态：0未出库、1配送中、2转运中，4签收、3已到达
    private String trade_agency;//代收款
    private String creat_type;//创建方式：0手录  1pc导入,2无缝对接,3APP导入
    private String updatetime;//录入时间以及修改时间(运单导入，手动录入)
    private String shipping_order_name;//制单人
    private String change_fee;//中转费
    private String change_pay;//应付中转费(中转协议处 预留)
    private String is_receive;//客户回执：是否接收：0没有 1接收
    private String is_recept;//回单信息()
    private String custom_id;//客户车辆id
    private String car_number;//大车车牌号（）
    private String custom_name;//客户名称：发货人(运单导入)
    private String send_remarks;//送货备注(协议)
    private String change_remarks;//中转备注(协议)
    private String payble_other;//应付其他费()
    private String practiacl_num;//实际送货件数(协议)
    private String back_fee;//回扣
    private String remarks_fee;//应收备注(运单导入)
    private String total_cost;//应收费用总计（应收核销）
    private String is_recept_time;//回单时间(回单)
    private String is_send_time;//寄出日期(回单)
    private String is_send;//是否寄出；0未寄出；1寄出
    private String is_order_arrive;//货物是否实际到达(运单导入)
    private String order_arrive_time;//货物实际到达的时间(运单导入)
    private String ys_unloading_fee;//应收装卸费()
    private String payble_coolie;//应付装卸费()
    private String affirm_value;//申明价值(手动录入)
    private String delivery_fee;//应付实际接货费(提货费)手动录入
    private String delivery_charge_fee;//应付送货费（手动录入）
    private String people_song;//送货人
    private String order_time;//制单时间（手动录入以及导入)
    private String remarks_order;//订单备注修改人
    private String remarks_date;//订单修改时间
    private String chayi_daifukuan;//代付款 差异
    private String close_recheck;//结算状态0未结算，1已结算（）
    private String close_recheck_state;//0未审核；1审核完毕，2审核不通过
    private String invoice_state;//开票状态0是；1否
    private String phone_state;//电话预约状态0是；1否
    private String copies_number;//回单份数
    private String duty_rate;//税率
    private String receivable_ground_fee;//落地费
    private String upstairs_fee;//上楼费
    private String deliver_fee;//直送费   
    private String inspect_fee;//开箱验货费
    private String seized_fee;//理货费
    private String stocks_predestination;//库存天数
    private String transport_mode;//运输方式0普快，1特快
    private String change_address;//中转地
    private String time_appointment;//预约时间
    private String pay_total_fee;//应付总费用（预留）
    private String pay_ground_fee;//应付落地费（预留）
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
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
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
	public String getReceipt_phone() {
		return receipt_phone;
	}
	public void setReceipt_phone(String receipt_phone) {
		this.receipt_phone = receipt_phone;
	}
	public String getReceipt_address() {
		return receipt_address;
	}
	public void setReceipt_address(String receipt_address) {
		this.receipt_address = receipt_address;
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
	public String getSpe() {
		return spe;
	}
	public void setSpe(String spe) {
		this.spe = spe;
	}
	public String getTake_fee() {
		return take_fee;
	}
	public void setTake_fee(String take_fee) {
		this.take_fee = take_fee;
	}
	public String getSend_fee() {
		return send_fee;
	}
	public void setSend_fee(String send_fee) {
		this.send_fee = send_fee;
	}
	public String getAdorn_fee() {
		return adorn_fee;
	}
	public void setAdorn_fee(String adorn_fee) {
		this.adorn_fee = adorn_fee;
	}
	public String getInsurance() {
		return insurance;
	}
	public void setInsurance(String insurance) {
		this.insurance = insurance;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getTransport_pay() {
		return transport_pay;
	}
	public void setTransport_pay(String transport_pay) {
		this.transport_pay = transport_pay;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getSend_type() {
		return send_type;
	}
	public void setSend_type(String send_type) {
		this.send_type = send_type;
	}
	public String getShipping_order_state() {
		return shipping_order_state;
	}
	public void setShipping_order_state(String shipping_order_state) {
		this.shipping_order_state = shipping_order_state;
	}
	public String getTrade_agency() {
		return trade_agency;
	}
	public void setTrade_agency(String trade_agency) {
		this.trade_agency = trade_agency;
	}
	public String getCreat_type() {
		return creat_type;
	}
	public void setCreat_type(String creat_type) {
		this.creat_type = creat_type;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	public String getShipping_order_name() {
		return shipping_order_name;
	}
	public void setShipping_order_name(String shipping_order_name) {
		this.shipping_order_name = shipping_order_name;
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
	public String getIs_receive() {
		return is_receive;
	}
	public void setIs_receive(String is_receive) {
		this.is_receive = is_receive;
	}
	public String getIs_recept() {
		return is_recept;
	}
	public void setIs_recept(String is_recept) {
		this.is_recept = is_recept;
	}
	public String getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	public String getCar_number() {
		return car_number;
	}
	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}
	public String getCustom_name() {
		return custom_name;
	}
	public void setCustom_name(String custom_name) {
		this.custom_name = custom_name;
	}
	public String getSend_remarks() {
		return send_remarks;
	}
	public void setSend_remarks(String send_remarks) {
		this.send_remarks = send_remarks;
	}
	public String getChange_remarks() {
		return change_remarks;
	}
	public void setChange_remarks(String change_remarks) {
		this.change_remarks = change_remarks;
	}
	public String getPayble_other() {
		return payble_other;
	}
	public void setPayble_other(String payble_other) {
		this.payble_other = payble_other;
	}
	public String getPractiacl_num() {
		return practiacl_num;
	}
	public void setPractiacl_num(String practiacl_num) {
		this.practiacl_num = practiacl_num;
	}
	public String getBack_fee() {
		return back_fee;
	}
	public void setBack_fee(String back_fee) {
		this.back_fee = back_fee;
	}
	public String getRemarks_fee() {
		return remarks_fee;
	}
	public void setRemarks_fee(String remarks_fee) {
		this.remarks_fee = remarks_fee;
	}
	public String getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(String total_cost) {
		this.total_cost = total_cost;
	}
	public String getIs_recept_time() {
		return is_recept_time;
	}
	public void setIs_recept_time(String is_recept_time) {
		this.is_recept_time = is_recept_time;
	}
	public String getIs_send_time() {
		return is_send_time;
	}
	public void setIs_send_time(String is_send_time) {
		this.is_send_time = is_send_time;
	}
	public String getIs_send() {
		return is_send;
	}
	public void setIs_send(String is_send) {
		this.is_send = is_send;
	}
	public String getIs_order_arrive() {
		return is_order_arrive;
	}
	public void setIs_order_arrive(String is_order_arrive) {
		this.is_order_arrive = is_order_arrive;
	}
	public String getOrder_arrive_time() {
		return order_arrive_time;
	}
	public void setOrder_arrive_time(String order_arrive_time) {
		this.order_arrive_time = order_arrive_time;
	}
	public String getYs_unloading_fee() {
		return ys_unloading_fee;
	}
	public void setYs_unloading_fee(String ys_unloading_fee) {
		this.ys_unloading_fee = ys_unloading_fee;
	}
	public String getPayble_coolie() {
		return payble_coolie;
	}
	public void setPayble_coolie(String payble_coolie) {
		this.payble_coolie = payble_coolie;
	}
	public String getAffirm_value() {
		return affirm_value;
	}
	public void setAffirm_value(String affirm_value) {
		this.affirm_value = affirm_value;
	}
	public String getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(String delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public String getDelivery_charge_fee() {
		return delivery_charge_fee;
	}
	public void setDelivery_charge_fee(String delivery_charge_fee) {
		this.delivery_charge_fee = delivery_charge_fee;
	}
	public String getPeople_song() {
		return people_song;
	}
	public void setPeople_song(String people_song) {
		this.people_song = people_song;
	}
	public String getOrder_time() {
		return order_time;
	}
	public void setOrder_time(String order_time) {
		this.order_time = order_time;
	}
	public String getRemarks_order() {
		return remarks_order;
	}
	public void setRemarks_order(String remarks_order) {
		this.remarks_order = remarks_order;
	}
	public String getRemarks_date() {
		return remarks_date;
	}
	public void setRemarks_date(String remarks_date) {
		this.remarks_date = remarks_date;
	}
	public String getChayi_daifukuan() {
		return chayi_daifukuan;
	}
	public void setChayi_daifukuan(String chayi_daifukuan) {
		this.chayi_daifukuan = chayi_daifukuan;
	}
	public String getClose_recheck() {
		return close_recheck;
	}
	public void setClose_recheck(String close_recheck) {
		this.close_recheck = close_recheck;
	}
	public String getClose_recheck_state() {
		return close_recheck_state;
	}
	public void setClose_recheck_state(String close_recheck_state) {
		this.close_recheck_state = close_recheck_state;
	}
	public String getInvoice_state() {
		return invoice_state;
	}
	public void setInvoice_state(String invoice_state) {
		this.invoice_state = invoice_state;
	}
	public String getPhone_state() {
		return phone_state;
	}
	public void setPhone_state(String phone_state) {
		this.phone_state = phone_state;
	}
	public String getCopies_number() {
		return copies_number;
	}
	public void setCopies_number(String copies_number) {
		this.copies_number = copies_number;
	}
	public String getDuty_rate() {
		return duty_rate;
	}
	public void setDuty_rate(String duty_rate) {
		this.duty_rate = duty_rate;
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
	public String getStocks_predestination() {
		return stocks_predestination;
	}
	public void setStocks_predestination(String stocks_predestination) {
		this.stocks_predestination = stocks_predestination;
	}
	public String getTransport_mode() {
		return transport_mode;
	}
	public void setTransport_mode(String transport_mode) {
		this.transport_mode = transport_mode;
	}
	public String getChange_address() {
		return change_address;
	}
	public void setChange_address(String change_address) {
		this.change_address = change_address;
	}
	public String getTime_appointment() {
		return time_appointment;
	}
	public void setTime_appointment(String time_appointment) {
		this.time_appointment = time_appointment;
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

}
