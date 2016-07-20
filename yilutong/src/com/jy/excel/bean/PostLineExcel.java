package com.jy.excel.bean;

import com.jy.model.ClassLineToLinstandard;
import com.jy.model.LinStandard;
import com.jy.model.PostClassLineInfo;

public class PostLineExcel {
	private String classlineId; // 班线ID
	private String classlineName; // 班线名称
	private String classlineCode; // 班线编码
	private String organizationId; // 机构id
	private String organizationName; // 机构名称
	private String departure_time; // 发车时间
	private String plate_number; // 车牌号
	private String car_id; // 固定车辆ID
	private Integer regular_type; // 定期类型 1、按天 0、按周
	private Integer days; // 间隔天数 0、天天
	private String repetition_period; // 重复周期
	private Integer end_type; // 结束类型 1、永不结束 2、发生次数 3、到达某天
	private Integer end_num; // 结束次数
	private String end_date; // 结束日期
	private String effective_date; // 生效日期

	private String update_datetime; // 更新日期
	private String all_money; // 总运费
	private String autoId;// 随机id
	private String site_id; // 班线id
	private Integer siteflag;// 班线flag
	private String site_name;// 班线名称
	private String site_code;
	private String lnglat;// 班线坐标
	private String site_mlg;// 班线行驶公里
	private String site_run;// 班线行驶时间
	private String site_stop;// 班线停止时间
	private String remarkId;
	private String site_order;// 顺序
	private String shouzhandian;// 首点
	private String endzhandian;// 终点
	private String passdian;// 途经点
	private String linname;//班线名称
	public String getLinname() {
		return linname;
	}

	public void setLinname(String linname) {
		this.linname = linname;
	}

	public String getAutoId() {
		return autoId;
	}

	public void setAutoId(String autoId) {
		this.autoId = autoId;
	}

	public String getAll_money() {
		return all_money;
	}

	public void setAll_money(String all_money) {
		this.all_money = all_money;
	}

	// 班线详细信息
	private PostClassLineInfo postClassLineInfo;
	// 关联线路
	private ClassLineToLinstandard classLineToLinstandard;
	// 绑定的线路
	private LinStandard linStandard;

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public ClassLineToLinstandard getClassLineToLinstandard() {
		return classLineToLinstandard;
	}

	public void setClassLineToLinstandard(
			ClassLineToLinstandard classLineToLinstandard) {
		this.classLineToLinstandard = classLineToLinstandard;
	}

	public LinStandard getLinStandard() {
		return linStandard;
	}

	public void setLinStandard(LinStandard linStandard) {
		this.linStandard = linStandard;
	}

	public PostClassLineInfo getPostClassLineInfo() {
		return postClassLineInfo;
	}

	public void setPostClassLineInfo(PostClassLineInfo postClassLineInfo) {
		this.postClassLineInfo = postClassLineInfo;
	}

	public String getClasslineId() {
		return classlineId;
	}

	public void setClasslineId(String classlineId) {
		this.classlineId = classlineId == null ? null : classlineId.trim();
	}

	public String getClasslineName() {
		return classlineName;
	}

	public void setClasslineName(String classlineName) {
		this.classlineName = classlineName == null ? null : classlineName
				.trim();
	}

	public String getClasslineCode() {
		return classlineCode;
	}

	public void setClasslineCode(String classlineCode) {
		this.classlineCode = classlineCode == null ? null : classlineCode
				.trim();
	}

	public String getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(String organizationId) {
		this.organizationId = organizationId;
	}

	public String getDeparture_time() {
		return departure_time;
	}

	public void setDeparture_time(String departure_time) {
		this.departure_time = departure_time;
	}

	public String getPlate_number() {
		return plate_number;
	}

	public void setPlate_number(String plate_number) {
		this.plate_number = plate_number;
	}

	public String getCar_id() {
		return car_id;
	}

	public void setCar_id(String car_id) {
		this.car_id = car_id;
	}

	public Integer getRegular_type() {
		return regular_type;
	}

	public void setRegular_type(Integer regular_type) {
		this.regular_type = regular_type;
	}

	public Integer getDays() {
		return days;
	}

	public void setDays(Integer days) {
		this.days = days;
	}

	public String getRepetition_period() {
		return repetition_period;
	}

	public void setRepetition_period(String repetition_period) {
		this.repetition_period = repetition_period;
	}

	public Integer getEnd_type() {
		return end_type;
	}

	public void setEnd_type(Integer end_type) {
		this.end_type = end_type;
	}

	public Integer getEnd_num() {
		return end_num;
	}

	public void setEnd_num(Integer end_num) {
		this.end_num = end_num;
	}

	public String getEnd_date() {
		return end_date;
	}

	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}

	public String getEffective_date() {
		return effective_date;
	}

	public void setEffective_date(String effective_date) {
		this.effective_date = effective_date;
	}

	public String getUpdate_datetime() {
		return update_datetime;
	}

	public void setUpdate_datetime(String update_datetime) {
		this.update_datetime = update_datetime;
	}

	public String getSite_order() {
		return site_order;
	}

	public void setSite_order(String site_order) {
		this.site_order = site_order;
	}

	public String getShouzhandian() {
		return shouzhandian;
	}

	public void setShouzhandian(String shouzhandian) {
		this.shouzhandian = shouzhandian;
	}

	public String getEndzhandian() {
		return endzhandian;
	}

	public void setEndzhandian(String endzhandian) {
		this.endzhandian = endzhandian;
	}

	public String getPassdian() {
		return passdian;
	}

	public void setPassdian(String passdian) {
		this.passdian = passdian;
	}

	public String getRemarkId() {
		return remarkId;
	}

	public void setRemarkId(String remarkId) {
		this.remarkId = remarkId;
	}

	public String getSite_run() {
		return site_run;
	}

	public void setSite_run(String site_run) {
		this.site_run = site_run;
	}

	public String getSite_stop() {
		return site_stop;
	}

	public void setSite_stop(String site_stop) {
		this.site_stop = site_stop;
	}

	public String getSite_id() {
		return site_id;
	}

	public void setSite_id(String site_id) {
		this.site_id = site_id;
	}

	public Integer getSiteflag() {
		return siteflag;
	}

	public void setSiteflag(Integer siteflag) {
		this.siteflag = siteflag;
	}

	public String getSite_name() {
		return site_name;
	}

	public void setSite_name(String site_name) {
		this.site_name = site_name;
	}

	public String getSite_code() {
		return site_code;
	}

	public void setSite_code(String site_code) {
		this.site_code = site_code;
	}

	public String getLnglat() {
		return lnglat;
	}

	public void setLnglat(String lnglat) {
		this.lnglat = lnglat;
	}

	public String getSite_mlg() {
		return site_mlg;
	}

	public void setSite_mlg(String site_mlg) {
		this.site_mlg = site_mlg;
	}

}
