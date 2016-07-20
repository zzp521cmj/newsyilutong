package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Agreement;

public interface AgreementDao  {
	//查询总数
	int getAgreement(String agreement_name,	String plate_number, String address,String start_date,String end_date);
	List<Agreement> getAgreementInfo(int rows,int page,String agreement_name,	String plate_number, String address,String start_date,String end_date);	//查询
	public List<Agreement> getAgreementAll(String greement_name,String plate_number, String address,String start_date,String end_date);
	public int deleteAgreement(@Param("array") String[] del);//删除
	public int saveAgreement(Agreement d);//保存
	public Agreement getUpdateAgreement(String id);//修改查询
	public int updateAgreement(Agreement d);//用户修改
	/*
	 * 获取数据下拉表的查询
	 * */
	public List<Agreement> getAgreementLength(String agreementName) ; 
	public List<Agreement> getCar_idLength(String car_id);
	public List<Agreement> getAddressLength(String address);
	public List<Agreement> getAgreementOverdue();//过期车牌号的查询
	public List<Agreement> searchAgreement(String number);//编辑新增、修改车牌查询
	//合同号重复查询
	public int searchAgreementNum(String id);
	/**
	 * 线路编号查询
	 * @param linbm
	 * @return
	 */
	public  List	<Agreement> searchAgreementLinId(String linbm);
}
