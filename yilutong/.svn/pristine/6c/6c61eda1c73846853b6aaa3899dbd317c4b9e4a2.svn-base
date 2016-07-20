package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.GuanlianCA;


public  interface CreatAgreeChangeDao {
	int getCreateAgreement(String id,String start_date,String end_date,String departid);//查询总数
	List<CreateAgreement> getCreateAgreementInfo(int rows,int page,String id,String start_date,String end_date,String departid);	//查询
	 int saveCreateAgreement(CreateAgreement d);//保存
	 CreateAgreement getUpdateCreateAgreement(String id);//修改查询
	 int updateCreateAgreement(CreateAgreement d);//用户修改
	/*
	 * 获取数据下拉表的查询22222222222
	 * */
	List<CreateAgreement> getPlateNumberLength(String number);
	CreateAgreement getNumber(String number);//重复订单号查询
	List<CreateAgreement> getCreateAgreementAll(String id, String start_date,String end_date) ;
	/**
	 * 关联表的保存
	 * @param list
	 * @return
	 */
	int saveAgreementToorder( List<GuanlianCA>  list);
	/**
	 * 制作协议修改订单状态
	 * @param pid
	 * @return
	 */
	int updateState(@Param("array") String[] pid);
	/**
	 * 详情信息订单号关联查询
	 * @param id
	 * @return
	 */
	List<GuanlianCA> getXXCreateAgreement(String id);
	//作废时 的步骤
	/**
	 * 协议接收修改状态
	 * @param del
	 * @return
	 */
	 int delCreateAgreement(@Param("array") String[] del);//删除
	 /**
	  *关联表订单号查询
	  * @param del
	  * @return
	  */
	List<GuanlianCA>orderNumber(@Param("array") String[] del);
	/**
	 * 删除关联表的关联信息
	 * @param del
	 * @return
	 */
		int deleToOder(@Param("array") String[] del);
		/**
		 * 将订单修改到到达状态
		 * @param list
		 * @return
		 */
		int delState(List<GuanlianCA> list);
}
