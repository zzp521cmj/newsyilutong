package com.jy.model;

public class JITMonitor {
	private String jmonitor_id;//监控id
	private String car_id;
	private   String equipment_id;//设备号
	private String department_id;//所属机构
	private Integer jmonitor_type;//报警类型：1、发运时间监控 2、车辆运行时间监控 3、节点作业时间监控
	private String jmonitor_time;//报警时间
	private String jmonitor_address;//报警位置
	private int jmonitor_state;	//状态:1已经处理 0未处理
	private String answer_time;//解答时间
	private String remarks;//备注
	private String travel_card_id;// 车行驶证编号
	private String plate_number;// 车牌号
	private String readly;//是否被读取 1.已读 0 未读
	private String department_name; // 部门名称
	private String time_stay_real;//实际停留时间
	private String time_stay_plan;//计划停留时间
	private String time_real;//实际时间
	private String time_plan;//计划时间
	private String time_beyond;//超出的时间(晚的时间)
	
	private String jmonitor_type_name;//名字
	
	private String jmonitor_state_name;
	
	
	public String getJmonitor_state_name() {
		return jmonitor_state_name;
	}
	public void setJmonitor_state_name(String jmonitor_state_name) {
		this.jmonitor_state_name = jmonitor_state_name;
	}
	public String getJmonitor_type_name() {
		return jmonitor_type_name;
	}
	public void setJmonitor_type_name(String jmonitor_type_name) {
		this.jmonitor_type_name = jmonitor_type_name;
	}
	public String getTime_stay_real() {
		return time_stay_real;
	}
	public void setTime_stay_real(String time_stay_real) {
		this.time_stay_real = time_stay_real;
	}
	public String getTime_stay_plan() {
		return time_stay_plan;
	}
	public void setTime_stay_plan(String time_stay_plan) {
		this.time_stay_plan = time_stay_plan;
	}
	public String getTime_real() {
		return time_real;
	}
	public void setTime_real(String time_real) {
		this.time_real = time_real;
	}
	public String getTime_plan() {
		return time_plan;
	}
	public void setTime_plan(String time_plan) {
		this.time_plan = time_plan;
	}
	public String getTime_beyond() {
		return time_beyond;
	}
	public void setTime_beyond(String time_beyond) {
		this.time_beyond = time_beyond;
	}
	public String getJmonitor_id() {
		return jmonitor_id;
	}
	public void setJmonitor_id(String jmonitor_id) {
		this.jmonitor_id = jmonitor_id;
	}
	public String getCar_id() {
		return car_id;
	}
	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}
	public String getEquipment_id() {
		return equipment_id;
	}
	public void setEquipment_id(String equipment_id) {
		this.equipment_id = equipment_id;
	}
	public String getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(String department_id) {
		this.department_id = department_id;
	}
	public Integer getJmonitor_type() {
		return jmonitor_type;
	}
	public void setJmonitor_type(Integer jmonitor_type) {
		this.jmonitor_type = jmonitor_type;
	}
	public String getJmonitor_time() {
		return jmonitor_time;
	}
	public void setJmonitor_time(String jmonitor_time) {
		this.jmonitor_time = jmonitor_time;
	}
	public String getJmonitor_address() {
		return jmonitor_address;
	}
	public void setJmonitor_address(String jmonitor_address) {
		this.jmonitor_address = jmonitor_address;
	}
	public int getJmonitor_state() {
		return jmonitor_state;
	}
	public void setJmonitor_state(int jmonitor_state) {
		this.jmonitor_state = jmonitor_state;
	}
	public String getAnswer_time() {
		return answer_time;
	}
	public void setAnswer_time(String answer_time) {
		this.answer_time = answer_time;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getTravel_card_id() {
		return travel_card_id;
	}
	public void setTravel_card_id(String travel_card_id) {
		this.travel_card_id = travel_card_id;
	}
	public String getPlate_number() {
		return plate_number;
	}
	public void setPlate_number(String plate_number) {
		this.plate_number = plate_number;
	}
	public String getReadly() {
		return readly;
	}
	public void setReadly(String readly) {
		this.readly = readly;
	}
	public String getDepartment_name() {
		return department_name;
	}
	public void setDepartment_name(String department_name) {
		this.department_name = department_name;
	}
}
