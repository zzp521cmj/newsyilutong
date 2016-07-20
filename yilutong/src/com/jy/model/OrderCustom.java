package com.jy.model;

public class OrderCustom {
	private String custom_id;//客户id
	private String custom_name;//客户名称
	private String car_time;//客户发车车次
	private String send_station;//发站
	private String car_number;//车牌号
	private String driver_name;//司机姓名
	private String driver_phone;//电话
	private String send_time;//发货日期
	private String receipt_time;//车到日期
	private String adorn_fee2;//应付装卸费
	private String car_remarks;//大车备注
	private String updatetime;//录入时间
	private String car_length;//车长
	private String car_type;//大车车型
	private String loading_remarks; //应付装卸费核销备注
	private String write_off4;  // 核销
	private String ys_unloading_fee; 
	private String transport_pay; // 应收总运费
	private String kuhu_date;//  应收客户核销日期
	private String zhuangxie_date; // 装卸费核销日期
	private String people_kehu; // 应收客户核销人
	private String people_zhuang;  // 装卸费和小人（车）
	private Integer is_arrived;//车辆是否实际到达：未到达0，到达1
	private String uid;//关联用户id
	private String receipt_address;// 收货地址
	private String end_address; // 到站
	private String user_id;//关联用户id
	private String customer_grade;//客户层级（0.散货1.大宗2.项目落仓）
	//客户结算模块新加bean ----------------------------------------------------
	private String cost_summary_id;
	private String change_fee;//中转费
    private String receivable_ground_fee;//配送费
    private String upstairs_fee;//上楼费
    private String deliver_fee;//直送费   
    private String inspect_fee;//开箱验货费
    private String seized_fee;//理货费
    private String trade_agency;//代收款
    private String close_recheck;//结算状态0未结算，1已结算
    private String close_recheck_state;//0未审核；1审核完毕，2审核不通过
    //private String cost_summary_id;
   // private String customer_id;
    private String close_recheck_time;//审核时间
    private String shiping_order_id;//订单id
    //private String shiping_order_num;
   // private String take_fee;
   // private String send_fee;
   // private String adorn_fee;
    //private String change_fee;
	//private String receivable_ground_fee;
	//private String upstairs_fee;
	//private String deliver_fee;
	//private String inspect_fee;
	//private String seized_fee;
	private String back_fee;//回扣
	//private String transport_pay;
	//private String trade_agency;
	private String cost_summary_time;//添加记录时间
	
	//--------------------------------------------------------------------------------- 
    //lcx-------------------------------------
	
    private String received_change_fee;//实收中转费
    private String received_take_fee;//实收送货费
    private String received_send_fee;//实收落地费
    private String received_adorn_fee;//实收其他费
    private String received_ground_fee;//实收装卸费
    private String received_upstairs_fee;//实收上楼费
    private String received_deliver_fee;//实收直送费
    private String received_seized_fee;//实收理货费
    private String received_inspect_fee;//实收开箱验货费
	//-------------------------------------

    
	public String getClose_recheck() {
		return close_recheck;
	}

	public String getCustomer_grade() {
		return customer_grade;
	}

	public void setCustomer_grade(String customer_grade) {
		this.customer_grade = customer_grade;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public String getClose_recheck_time() {
		return close_recheck_time;
	}
	public void setClose_recheck_time(String close_recheck_time) {
		this.close_recheck_time = close_recheck_time;
	}
	public String getShiping_order_id() {
		return shiping_order_id;
	}
	public void setShiping_order_id(String shiping_order_id) {
		this.shiping_order_id = shiping_order_id;
	}
	public String getBack_fee() {
		return back_fee;
	}
	public void setBack_fee(String back_fee) {
		this.back_fee = back_fee;
	}
	public String getCost_summary_time() {
		return cost_summary_time;
	}
	public void setCost_summary_time(String cost_summary_time) {
		this.cost_summary_time = cost_summary_time;
	}
	public String getCost_summary_id() {
		return cost_summary_id;
	}
	public void setCost_summary_id(String cost_summary_id) {
		this.cost_summary_id = cost_summary_id;
	}
	public String getClose_recheck_state() {
		return close_recheck_state;
	}
	public void setClose_recheck_state(String close_recheck_state) {
		this.close_recheck_state = close_recheck_state;
	}
	public void setClose_recheck(String close_recheck) {
		this.close_recheck = close_recheck;
	}
	public String getReceipt_address() {
		return receipt_address;
	}
	public void setReceipt_address(String receipt_address) {
		this.receipt_address = receipt_address;
	}
	public String getEnd_address() {
		return end_address;
	}
	public void setEnd_address(String end_address) {
		this.end_address = end_address;
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
	public Integer getGoods_num() {
		return goods_num;
	}
	public void setGoods_num(Integer goods_num) {
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
	public String getShiping_order_num() {
		return shiping_order_num;
	}
	public void setShiping_order_num(String shiping_order_num) {
		this.shiping_order_num = shiping_order_num;
	}
	public String getPeople_song() {
		return people_song;
	}
	public void setPeople_song(String people_song) {
		this.people_song = people_song;
	}
	public String getReceipt_phone() {
		return receipt_phone;
	}
	public void setReceipt_phone(String receipt_phone) {
		this.receipt_phone = receipt_phone;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getIs_receive() {
		return is_receive;
	}
	public void setIs_receive(String is_receive) {
		this.is_receive = is_receive;
	}
	public String getWrite_off1() {
		return write_off1;
	}
	public void setWrite_off1(String write_off1) {
		this.write_off1 = write_off1;
	}
	public String getOrder_arrive_time() {
		return order_arrive_time;
	}
	public void setOrder_arrive_time(String order_arrive_time) {
		this.order_arrive_time = order_arrive_time;
	}
	public String getSend_type() {
		return send_type;
	}
	public void setSend_type(String send_type) {
		this.send_type = send_type;
	}
	public String getReceipt() {
		return receipt;
	}
	public void setReceipt(String receipt) {
		this.receipt = receipt;
	}
	private String goods_name;// 货物
	private String goods_packing;// 包装
	private Integer goods_num;// 总件数
	private String goods_weight;// 总重量
	private String goods_vol;// 总体积
	private String shiping_order_num;// 订单号		
	private String people_song;//送货人
	private String  receipt_phone;//收货人电话
	private String pay_type;
	private String is_receive;//客户回单状态
	private String write_off1;//送货费核销方式：现金打卡
	private String order_arrive_time;//货物实际到达时间
    private String send_type;//交接方式
    private String receipt;//收货方
    
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Integer getIs_arrived() {
		return is_arrived;
	}
	public void setIs_arrived(Integer is_arrived) {
		this.is_arrived = is_arrived;
	}
	public String getPeople_kehu() {
		return people_kehu;
	}
	public void setPeople_kehu(String people_kehu) {
		this.people_kehu = people_kehu;
	}
	public String getPeople_zhuang() {
		return people_zhuang;
	}
	public void setPeople_zhuang(String people_zhuang) {
		this.people_zhuang = people_zhuang;
	}
	public String getKuhu_date() {
		return kuhu_date;
	}
	public void setKuhu_date(String kuhu_date) {
		this.kuhu_date = kuhu_date;
	}
	public String getZhuangxie_date() {
		return zhuangxie_date;
	}
	public void setZhuangxie_date(String zhuangxie_date) {
		this.zhuangxie_date = zhuangxie_date;
	}
	public String getTransport_pay() {
		return transport_pay;
	}
	public void setTransport_pay(String transport_pay) {
		this.transport_pay = transport_pay;
	}
	public String getYs_unloading_fee() {
		return ys_unloading_fee;
	}
	public void setYs_unloading_fee(String ys_unloading_fee) {
		this.ys_unloading_fee = ys_unloading_fee;
	}
	public String getBorn_fee1() {
		return born_fee1;
	}
	public void setBorn_fee1(String born_fee1) {
		this.born_fee1 = born_fee1;
	}
	private String total_cost; // 应收费用总和
	private String trunk_fee; // 应收中转费
	private String take_fee ;  // 应收送货费
	private String adorn_fee; //  应收其他费ring
	private String collection_fee; // 代收到付运费
	private String  paid_fee ; // 实收到付运费
	private String write_off; // 核销方式  现金 打卡
	private String remarks_fee1; //  应收客户账款备注
	private String write_off5; // 现金打卡 
	
    private String remarks_fee2; //  应付客户账款备注
	private String born_fee;//ｓ
	private String born_fee1;//实收落地费
	
	private String  paid;//提付实收
	private String  paid1;//回付实收
	private String  paid3;//到付实收

	
	public String getWrite_off() {
		return write_off;
	}
	public void setWrite_off(String write_off) {
		this.write_off = write_off;
	}
	public String getBorn_fee() {
		return born_fee;
	}
	public void setBorn_fee(String born_fee) {
		this.born_fee = born_fee;
	}
	public String getChange_fee() {
		return change_fee;
	}
	public void setChange_fee(String change_fee) {
		this.change_fee = change_fee;
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
	private String trade_sum;//代收合计
	private String reality_sum;//实收合计
	
	private String  change_pay;//应付中转费
	private String send_fee;//应付送货费
	private String payble_other;//应付其他费
	
	private String pay_sum;//应付款合计
	
	private String change_fee1;//实付中转费
	private String send_fee1;//实付送货费
	private String send_other;//实付其他费
	
	private String reality_pay_sum;//实付款合计
	
	private String trunk_fee_c;//应收中转费
	private String take_fee_c;//应收送货费
	private String adorn_fee_c;//应收其他费
	
	private String fee_sum_c;//应收款合计
	
	private String trunk_fee1_c;//实收中转费
	private String take_fee1_c;//实收送货费
	private String adorn_fee1_c;//实收其他费
	private String reality_fee_sum_c;//实收款合计
	private String sum;//合计
	
	
	public String getChange_fee1() {
		return change_fee1;
	}
	public String getPaid() {
		return paid;
	}
	public String getSum() {
		return sum;
	}
	public void setSum(String sum) {
		this.sum = sum;
	}
	public String getTrade_sum() {
		return trade_sum;
	}
	public void setTrade_sum(String trade_sum) {
		this.trade_sum = trade_sum;
	}
	public String getReality_sum() {
		return reality_sum;
	}
	public void setReality_sum(String reality_sum) {
		this.reality_sum = reality_sum;
	}
	public String getPay_sum() {
		return pay_sum;
	}
	public void setPay_sum(String pay_sum) {
		this.pay_sum = pay_sum;
	}
	public String getReality_pay_sum() {
		return reality_pay_sum;
	}
	public void setReality_pay_sum(String reality_pay_sum) {
		this.reality_pay_sum = reality_pay_sum;
	}
	public String getFee_sum_c() {
		return fee_sum_c;
	}
	public void setFee_sum_c(String fee_sum_c) {
		this.fee_sum_c = fee_sum_c;
	}
	public String getReality_fee_sum_c() {
		return reality_fee_sum_c;
	}
	public void setReality_fee_sum_c(String reality_fee_sum_c) {
		this.reality_fee_sum_c = reality_fee_sum_c;
	}
	public String Paid() {
		return paid;
	}
	public void setPaid(String paid) {
		this.paid = paid;
	}
	public String getPaid1() {
		return paid1;
	}
	public void setPaid1(String paid1) {
		this.paid1 = paid1;
	}
	public String getPaid3() {
		return paid3;
	}
	public void setPaid3(String paid3) {
		this.paid3 = paid3;
	}
	public String getTrade_agency() {
		return trade_agency;
	}
	public void setTrade_agency(String trade_agency) {
		this.trade_agency = trade_agency;
	}
	public String getChange_pay() {
		return change_pay;
	}
	public void setChange_pay(String change_pay) {
		this.change_pay = change_pay;
	}
	public String getSend_fee() {
		return send_fee;
	}
	public void setSend_fee(String send_fee) {
		this.send_fee = send_fee;
	}
	public String getPayble_other() {
		return payble_other;
	}
	public void setPayble_other(String payble_other) {
		this.payble_other = payble_other;
	}
	public String Change_fee1() {
		return change_fee1;
	}
	public void setChange_fee1(String change_fee1) {
		this.change_fee1 = change_fee1;
	}
	public String getSend_fee1() {
		return send_fee1;
	}
	public void setSend_fee1(String send_fee1) {
		this.send_fee1 = send_fee1;
	}
	public String getSend_other() {
		return send_other;
	}
	public void setSend_other(String send_other) {
		this.send_other = send_other;
	}
	public String getTrunk_fee_c() {
		return trunk_fee_c;
	}
	public void setTrunk_fee_c(String trunk_fee_c) {
		this.trunk_fee_c = trunk_fee_c;
	}
	public String getTake_fee_c() {
		return take_fee_c;
	}
	public void setTake_fee_c(String take_fee_c) {
		this.take_fee_c = take_fee_c;
	}
	public String getAdorn_fee_c() {
		return adorn_fee_c;
	}
	public void setAdorn_fee_c(String adorn_fee_c) {
		this.adorn_fee_c = adorn_fee_c;
	}
	public String getTrunk_fee1_c() {
		return trunk_fee1_c;
	}
	public void setTrunk_fee1_c(String trunk_fee1_c) {
		this.trunk_fee1_c = trunk_fee1_c;
	}
	public String getTake_fee1_c() {
		return take_fee1_c;
	}
	public void setTake_fee1_c(String take_fee1_c) {
		this.take_fee1_c = take_fee1_c;
	}
	public String getAdorn_fee1_c() {
		return adorn_fee1_c;
	}
	public void setAdorn_fee1_c(String adorn_fee1_c) {
		this.adorn_fee1_c = adorn_fee1_c;
	}
	public String getRemarks_fee2() {
		return remarks_fee2;
	}
	public void setRemarks_fee2(String remarks_fee2) {
		this.remarks_fee2 = remarks_fee2;
	}
	
	
	public String getWrite_off5() {
		return write_off5;
	}
	public void setWrite_off5(String write_off5) {
		this.write_off5 = write_off5;
	}
	public String getRemarks_fee1() {
		return remarks_fee1;
	}
	public void setRemarks_fee1(String remarks_fee1) {
		this.remarks_fee1 = remarks_fee1;
	}
	public String getCollection_fee() {
		return collection_fee;
	}
	public void setCollection_fee(String collection_fee) {
		this.collection_fee = collection_fee;
	}
	public String getPaid_fee() {
		return paid_fee;
	}
	public void setPaid_fee(String paid_fee) {
		this.paid_fee = paid_fee;
	}
	public String getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(String total_cost) {
		this.total_cost = total_cost;
	}
	public String getTrunk_fee() {
		return trunk_fee;
	}
	public void setTrunk_fee(String trunk_fee) {
		this.trunk_fee = trunk_fee;
	}
	public String getTake_fee() {
		return take_fee;
	}
	public void setTake_fee(String take_fee) {
		this.take_fee = take_fee;
	}
	public String getAdorn_fee2() {
		return adorn_fee2;
	}
	public void setAdorn_fee2(String adorn_fee2) {
		this.adorn_fee2 = adorn_fee2;
	}
	public String getWrite_off4() {
		return write_off4;
	}
	public void setWrite_off4(String write_off4) {
		this.write_off4 = write_off4;
	}
	public String getLoading_remarks() {
		return loading_remarks;
	}
	public void setLoading_remarks(String loading_remarks) {
		this.loading_remarks = loading_remarks;
	}
	public String getCar_type() {
		return car_type;
	}
	public void setCar_type(String car_type) {
		this.car_type = car_type;
	}
	private String customer_id;//客户id
	private String customer_name;//客户名称
	
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCar_length() {
		return car_length;
	}
	public void setCar_length(String car_length) {
		this.car_length = car_length;
	}
	public String getCustom_id() {
		return custom_id;
	}
	public void setCustom_id(String custom_id) {
		this.custom_id = custom_id;
	}
	public String getCustom_name() {
		return custom_name;
	}
	public void setCustom_name(String custom_name) {
		this.custom_name = custom_name;
	}
	public String getCar_time() {
		return car_time;
	}
	public void setCar_time(String car_time) {
		this.car_time = car_time;
	}
	public String getSend_station() {
		return send_station;
	}
	public void setSend_station(String send_station) {
		this.send_station = send_station;
	}
	public String getCar_number() {
		return car_number;
	}
	public void setCar_number(String car_number) {
		this.car_number = car_number;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public String getDriver_phone() {
		return driver_phone;
	}
	public void setDriver_phone(String driver_phone) {
		this.driver_phone = driver_phone;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public String getReceipt_time() {
		return receipt_time;
	}
	public void setReceipt_time(String receipt_time) {
		this.receipt_time = receipt_time;
	}
	public String getAdorn_fee() {
		return adorn_fee;
	}
	public void setAdorn_fee(String adorn_fee) {
		this.adorn_fee = adorn_fee;
	}
	public String getCar_remarks() {
		return car_remarks;
	}
	public void setCar_remarks(String car_remarks) {
		this.car_remarks = car_remarks;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}

	
}
