package com.jy.service;

import java.util.List;

import com.jy.model.Agreement;

public interface AgreementService {
			//所有合同的查询
			public List<Agreement> getAgreementInfo(int rows,int page,String agreement_name,	String plate_number, String address,String start_date,String end_date);
			//public  List<Agreement> getDriver(String driver_name);
			public int getAgreement(String agreement_name ,String plate_number, String address,String start_date,String end_date);
			//删除
			public int deleteAgreement(String[] del);
			//保存
			public int saveAgreement(Agreement d);
			//修改查询
			public Agreement getUpdateAgreement(String id);
			//用户修改
			public int updateAgreement(Agreement d);
			/*
			 * select 查询
			 * */
			public List<Agreement> getAgreementLength(String agreementName) ;
			public List<Agreement> getCar_idLength(String car_id);
			public List<Agreement> getAddressLength(String address);
			public List<Agreement> getAgreementOverdue();//过期车牌号的查询
			public List<Agreement> searchAgreement(String number);//编辑新增、修改车牌查询
			public List<Agreement> getAgreementAll(String greement_name,String plate_number, String address,String start_date,String end_date);//合同导出
			//合同号重复查询
			public int searchAgreementNum(String id);
			/**
			 * 线路编号查询
			 * @param linbm
			 * @return
			 */
			public  List	<Agreement> searchAgreementLinId(String linbm);
}
