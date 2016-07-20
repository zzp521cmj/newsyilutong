package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.AgreementDao;
import com.jy.model.Agreement;
import com.jy.service.AgreementService;
@Component
public class AgreementServiceImpl implements AgreementService{
	@Resource
	private AgreementDao agreedao;
	/*
	 * 查询分页
	 * */
	public List<Agreement> getAgreementInfo(int rows,int page,String agreement_name,	String plate_number, String address,String start_date,String end_date) {
		List<Agreement> list=agreedao.getAgreementInfo(rows,page,agreement_name,plate_number,address,start_date,end_date);
		return list;
	}
	public int getAgreement(String agreement_name,	String plate_number, String address,String start_date,String end_date) {
		int count =agreedao.getAgreement(agreement_name,plate_number,address,start_date,end_date);
		return count;
	}
	
	//删除
	public int deleteAgreement(String[] del) {
			int flag=agreedao.deleteAgreement(del);
		return flag;
	}
	//保存
	public int saveAgreement(Agreement d) {
		int flag=agreedao.saveAgreement(d);
		return flag;
	}
	//修改查询
	public Agreement getUpdateAgreement(String id){
		Agreement d=agreedao.getUpdateAgreement(id);
		return d;
	}
	public int updateAgreement(Agreement d){
			 int flag=agreedao.updateAgreement(d);
			return flag;
	}
	/*
	 * 选择框的查询
	 * */
	public List<Agreement> getAgreementLength(String agreementName) {
		 	List<Agreement> list=agreedao.getAgreementLength(agreementName);
		return list;
	}
	public List<Agreement> getCar_idLength(String car_id){
		List<Agreement>list=agreedao.getCar_idLength(car_id);
		return list;
	}
	public List<Agreement> getAddressLength(String address){
		List<Agreement>list=agreedao.getCar_idLength(address);
		return list;
	}
	//过期车牌号的查询
	public List<Agreement> getAgreementOverdue(){
		List<Agreement>list=agreedao.getAgreementOverdue();
		return list;
	}
	//编辑新增、修改车牌查询
	public List<Agreement> searchAgreement(String number){
		List<Agreement>list=agreedao.searchAgreement(number);
		return list;
	}
	//导出
	public List<Agreement> getAgreementAll(String greement_name,String plate_number, String address,String start_date,String end_date){
		List<Agreement>list=agreedao.getAgreementAll(greement_name, plate_number, address, start_date, end_date);
		return list;
	}
	public int searchAgreementNum(String id) {
		int i=agreedao.searchAgreementNum(id);
		return i;
	}
	/**
	 * 线路编码
	 */
	public List	<Agreement> searchAgreementLinId(String linbm) {
		 List	<Agreement> list=agreedao.searchAgreementLinId(linbm);
		return list;
	}
}
