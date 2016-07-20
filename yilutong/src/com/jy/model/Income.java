package com.jy.model;

public class Income {
		private String tatal_id;//表的id
		private String checkp;//客户名称
		private String shiping_order_num;//运单号
		private String end_address;//到站
		private String receipt;//收货人
		private String goods_name;//品名
		private Integer goods_num;//总件数
		private String goods_weight;//总重量(千克)
		private String goods_vol;//总体积（立方米）
		private Integer pay_type;//付费方式： 0到付 1 恢复2月结3等通知4打卡
		private Integer send_type;	//交接方式:（收货方式）
		private String start_address ;//发货地址
		private String sended_time;//到货时间
		private String car_number;//车牌号
		private String trade_total;//代收运费(总运费)
		private String trade_real;//实收运费
		private String income_time;//实收日期
		private String sends_fee;//送货总费
		private String change_total;//中转总费
		private String land_total;//落地总费
		private String income_total;//收入总费
		private String send_pay;//送货费（支）
		private String changes_pay;//中转费（支）:中转公司费
		private String land_pay;//落地费（支）
		private String pay_total;//支出总费
		private String gain_total;//利润总费
		private String gain_send;//送货费（利）
		private String gain_change;//中转费（利）
		private String gain_land;//落地费（利）
		private String change_address;//中转地
		private String send_car;//送货费小车
		private String adorns_fee;//装卸费
		private String remarkes;//备注
		private String car_id;//车id
		private String updatetime;//修改时间
		private String plate_number;//车牌号
		private String travel_card_id;//行驶证ID
		private String shiping_order_id;//订单id
		private String isincome;//是否是总汇1是。0否
		private Integer income_style;//总汇镖的修改后颜色样式修改
		
		
		public Integer getIncome_style() {
			return income_style;
		}
		public void setIncome_style(Integer income_style) {
			this.income_style = income_style;
		}
		public String getIsincome() {
			return isincome;
		}
		public void setIsincome(String isincome) {
			this.isincome = isincome;
		}
		public String getShiping_order_id() {
			return shiping_order_id;
		}
		public void setShiping_order_id(String shiping_order_id) {
			this.shiping_order_id = shiping_order_id;
		}
		public String getPlate_number() {
			return plate_number;
		}
		public void setPlate_number(String plate_number) {
			this.plate_number = plate_number;
		}
		public String getTravel_card_id() {
			return travel_card_id;
		}
		public void setTravel_card_id(String travel_card_id) {
			this.travel_card_id = travel_card_id;
		}
		public String getUpdatetime() {
			return updatetime;
		}
		public void setUpdatetime(String updatetime) {
			this.updatetime = updatetime;
		}
		public String getCar_id() {
			return car_id;
		}
		public void setCar_id(String car_id) {
			this.car_id = car_id;
		}
		public String getTatal_id() {
			return tatal_id;
		}
		public void setTatal_id(String tatal_id) {
			this.tatal_id = tatal_id;
		}
		
		public String getCheckp() {
			return checkp;
		}
		public void setCheckp(String checkp) {
			this.checkp = checkp;
		}
		public String getShiping_order_num() {
			return shiping_order_num;
		}
		public void setShiping_order_num(String shiping_order_num) {
			this.shiping_order_num = shiping_order_num;
		}
		public String getEnd_address() {
			return end_address;
		}
		public void setEnd_address(String end_address) {
			this.end_address = end_address;
		}
		public String getReceipt() {
			return receipt;
		}
		public void setReceipt(String receipt) {
			this.receipt = receipt;
		}
		public String getGoods_name() {
			return goods_name;
		}
		public void setGoods_name(String goods_name) {
			this.goods_name = goods_name;
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
		public Integer getPay_type() {
			return pay_type;
		}
		public void setPay_type(Integer pay_type) {
			this.pay_type = pay_type;
		}
		public Integer getSend_type() {
			return send_type;
		}
		public void setSend_type(Integer send_type) {
			this.send_type = send_type;
		}
		public String getStart_address() {
			return start_address;
		}
		public void setStart_address(String start_address) {
			this.start_address = start_address;
		}
		public String getSended_time() {
			return sended_time;
		}
		public void setSended_time(String sended_time) {
			this.sended_time = sended_time;
		}
		public String getCar_number() {
			return car_number;
		}
		public void setCar_number(String car_number) {
			this.car_number = car_number;
		}
		public String getTrade_total() {
			return trade_total;
		}
		public void setTrade_total(String trade_total) {
			this.trade_total = trade_total;
		}
		public String getTrade_real() {
			return trade_real;
		}
		public void setTrade_real(String trade_real) {
			this.trade_real = trade_real;
		}
		public String getIncome_time() {
			return income_time;
		}
		public void setIncome_time(String income_time) {
			this.income_time = income_time;
		}
		
		public String getSends_fee() {
			return sends_fee;
		}
		public void setSends_fee(String sends_fee) {
			this.sends_fee = sends_fee;
		}
		public String getChange_total() {
			return change_total;
		}
		public void setChange_total(String change_total) {
			this.change_total = change_total;
		}
		public String getLand_total() {
			return land_total;
		}
		public void setLand_total(String land_total) {
			this.land_total = land_total;
		}
		public String getIncome_total() {
			return income_total;
		}
		public void setIncome_total(String income_total) {
			this.income_total = income_total;
		}
		public String getSend_pay() {
			return send_pay;
		}
		public void setSend_pay(String send_pay) {
			this.send_pay = send_pay;
		}
		public String getChanges_pay() {
			return changes_pay;
		}
		public void setChanges_pay(String changes_pay) {
			this.changes_pay = changes_pay;
		}
		public String getLand_pay() {
			return land_pay;
		}
		public void setLand_pay(String land_pay) {
			this.land_pay = land_pay;
		}
		public String getPay_total() {
			return pay_total;
		}
		public void setPay_total(String pay_total) {
			this.pay_total = pay_total;
		}
		public String getGain_total() {
			return gain_total;
		}
		public void setGain_total(String gain_total) {
			this.gain_total = gain_total;
		}
		public String getGain_send() {
			return gain_send;
		}
		public void setGain_send(String gain_send) {
			this.gain_send = gain_send;
		}
		public String getGain_change() {
			return gain_change;
		}
		public void setGain_change(String gain_change) {
			this.gain_change = gain_change;
		}
		public String getGain_land() {
			return gain_land;
		}
		public void setGain_land(String gain_land) {
			this.gain_land = gain_land;
		}
		public String getChange_address() {
			return change_address;
		}
		public void setChange_address(String change_address) {
			this.change_address = change_address;
		}
		public String getSend_car() {
			return send_car;
		}
		public void setSend_car(String send_car) {
			this.send_car = send_car;
		}
		
		public String getAdorns_fee() {
			return adorns_fee;
		}
		public void setAdorns_fee(String adorns_fee) {
			this.adorns_fee = adorns_fee;
		}
		public String getRemarkes() {
			return remarkes;
		}
		public void setRemarkes(String remarkes) {
			this.remarkes = remarkes;
		}
		
		
		
}
