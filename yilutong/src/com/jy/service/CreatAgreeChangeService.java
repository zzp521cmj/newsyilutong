package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CreateAgreement;
import com.jy.model.GuanlianCA;
import com.jy.model.ShippingOrder;

public interface CreatAgreeChangeService {
			//所有人员的查询
			public List<CreateAgreement> getCreateAgreementInfo(int rows,int page, String id,String start_date,String end_date,String departid);
			public int getCreateAgreement( String id,String start_date,String end_date,String departid);
			//保存
			public int saveCreateAgreement(CreateAgreement d);
			//修改查询
			public CreateAgreement getUpdateCreateAgreement(String id);
			//用户修改
			public int updateCreateAgreement(CreateAgreement d);
			/*
			 * select 查询
			 * */
			List<CreateAgreement> getPlateNumberLength(String number);
			CreateAgreement getNumber(String number);//重复号查询
			List<CreateAgreement> getCreateAgreementAll( String id,String start_date,String end_date) ;//导出查询
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
		public int updateState(String[] pid);
		/**
		 * 详情信息订单号查询
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
		 int delCreateAgreement( String[] del);//删除
		 /**
		  *关联表订单号查询
		  * @param del
		  * @return
		  */
		List<GuanlianCA>orderNumber( String[] del);
		/**
		 * 删除关联表的关联信息
		 * @param del
		 * @return
		 */
			int deleToOder( String[] del);
			/**
			 * 将订单修改到到达状态
			 * @param list
			 * @return
			 */
			int delState(List<GuanlianCA> list);
}
