package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.CreatAgreeChangeDao;
import com.jy.model.CreateAgreement;
import com.jy.model.GuanlianCA;
import com.jy.service.CreatAgreeChangeService;

@Controller
public class CreatAgreeChangeServiceImpl  implements CreatAgreeChangeService{
	@Resource
	private CreatAgreeChangeDao ca;
	//查询分页

	public List<CreateAgreement> getCreateAgreementInfo(int rows, int page,
			String id, String start_date, String end_date,String departid) {
		List<CreateAgreement> list=ca.getCreateAgreementInfo(rows, page, id, start_date, end_date,departid);
		return list;
	}

	public int getCreateAgreement(String id, String start_date, String end_date,String departid) {
		int i=ca.getCreateAgreement(id, start_date, end_date,departid);
		return i;
	}

	public int saveCreateAgreement(CreateAgreement d) {
		int i=ca.saveCreateAgreement(d);
		return i;
	}

	public CreateAgreement getUpdateCreateAgreement(String id) {
		CreateAgreement c=ca.getUpdateCreateAgreement(id);
		return c;
	}

	public int updateCreateAgreement(CreateAgreement d) {
		int i=ca.updateCreateAgreement(d);
		return i;
	}

	public List<CreateAgreement> getPlateNumberLength(String number) {
		List<CreateAgreement> list=ca.getPlateNumberLength(number);
		return list;
	}

	public CreateAgreement getNumber(String number) {
		CreateAgreement c=ca.getNumber(number);
		return c;
	}

	public List<CreateAgreement> getCreateAgreementAll(String id, String start_date,
			String end_date) {
		 List<CreateAgreement> list=ca.getCreateAgreementAll(id, start_date, end_date);
		return list;
	}

	public int  saveAgreementToorder(List<GuanlianCA> list) {
		int i=ca.saveAgreementToorder(list);
		return i;
	}

	/**
	 * 制作协议修改订单好
	 */
	public int updateState(String[] pid) {
		int i=ca.updateState(pid);
		return i;
	}
	/**
	 * 详情信息订单号查询
	 * @param id
	 * @return
	 */
	public List<GuanlianCA> getXXCreateAgreement(String id) {
		List<GuanlianCA> list=ca.getXXCreateAgreement(id);
		return list;
	}

/**
 * 	获取订单id
 */
	public List<GuanlianCA> orderNumber(String[] del) {
		List<GuanlianCA> list=ca.orderNumber(del);
		return list;
	}
/**
 * 删除关联表表
 */
	public int deleToOder(String[] del) {
		int i=ca.deleToOder(del);
		return i;
	}
/**
 * 协议删除时候，修改订单状态
 */
	public int delState(List<GuanlianCA> list) {
		int i=ca.delState(list);
		return i;
	}
	/**
	 * 协议接收修改状态
	 */
	public int delCreateAgreement(String[] del) {
		int i=ca.delCreateAgreement(del);
		return i;
	}
}
