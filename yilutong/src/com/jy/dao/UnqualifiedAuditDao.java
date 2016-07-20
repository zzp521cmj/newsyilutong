package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.RejectedRecord;
import com.jy.model.Unqualified;

/*
 * 异常审核
 */
public interface UnqualifiedAuditDao {
	// 不合格申请总条数
	int count(String shiping_order_num, String custom_name, String send_time,String send1_time,
			String audit_state,String report_date,String report1_date);

	// 不合格品审核查询
	List<Unqualified> inquire(int rows, int page, String shiping_order_num,
			String custom_name, String send_time,String send1_time, String audit_state,String report_date,String report1_date);

	// 查询审核对应的id
	Unqualified updateInfo(String id);

	// 审核
	int update(String reason, @Param("array") String[] abnormalid);

	// 查询客户名称的方法
	List<Unqualified> inquireName(String name);

	// 查询驳回对应的id
	Unqualified bohuiInfo(String id);

	// 驳回
	int bohui(String reason, @Param("array") String[] abnormalid);

	// 获取驳回记录对应的id
	List<Unqualified> recordInfo(@Param("array") String[] abnormalid);

	// 添加到驳回记录的方法
	int insertInfo(List<RejectedRecord> reject_id);

}
