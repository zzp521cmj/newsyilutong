package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Between;
import com.jy.model.Claim_settlement;
import com.jy.model.Claim_settlementmap;
import com.jy.model.Customer;
import com.jy.model.Settlement_Record;
import com.jy.model.Unqualified;

public interface ClaimSettlementService {
	public List<Unqualified> getjUnqualified(String[] id);

	/*
	 * 查询总条数
	 */
	int count(String numbersid, String claims_state, String claims_time,String claims_endtime,
			String project_name, String common_carrier,String ddid);

	/*
	 * 查询所有数据
	 */
	List<Claim_settlementmap> inquire(int rows, int page, String numbersid,
			String claims_state, String claims_time,String claims_endtime, String project_name,
			String common_carrier,String ddid);

	/*
	 * 删除的方法
	 */
	int deleteTravel(String[] del);

	/*
	 * 删除中间表
	 */
	int deleteween(@Param("array") String[] id);

	/*
	 * 获取修改是id
	 */
	Claim_settlement updateId(String id);

	/*
	 * 修改的方法
	 */
	int getupdate(Claim_settlement claimsid);

	// 根据修改的id 获取中间表
	List<Between> updateween(String id);

	/*
	 * 提交
	 */
	int updateunqualified(String[] claimsid, String did, String arraign_remarks);

	/*
	 * 导出
	 */
	List<Claim_settlementmap> exportunqualified(String numbersid,
			String claims_state, String claims_time,String claims_endtime, String custom_name,
			String receipt);

	/*
	 * 勾选导出
	 */
	public List<Claim_settlementmap> outShi(@Param("array") String[] checkarray);// 回单勾选导出

	/*
	 * /查询发货的方法
	 */
	List<Customer> inquireName(String custom_name);

	/*
	 * /查询收货的方法
	 */
	List<Unqualified> inquireName1(String receipt);

	/*
	 * 查询异常签收且审核通过总条数
	 */
	int abnormalcount(String submitfrontdate, String submintdqueendate,
			String custom_name, String shiping_order_num,
			String responsible_people, String types_id, String[] ids,String ides);

	/*
	 * 查询异常签收且审核通过的方法
	 */
	List<Unqualified> abnormal(int row, int page, String submitfrontdate,
			String submintdqueendate, String custom_name,
			String shiping_order_num, String responsible_people,
			String types_id, String[] ids,String ides);

	/*
	 * 查询异常类型
	 */
	List<Unqualified> nquiryDisplay(String types_id);

	/*
	 * 添加的方法
	 */
	int insertInfo(Claim_settlement claim_settlement);

	// 添加中间表的方法
	int insetinf(List<Between> between);

	/*
	 * 查询记录总条数
	 */
	int Record(String claimsid);

	/*
	 * 查询驳回记录
	 */
	List<Settlement_Record> RecordList(String claimsid);

	// 根据上报表id 修改是否理赔状态
	int updatestate(String[] id, String ides);

}
