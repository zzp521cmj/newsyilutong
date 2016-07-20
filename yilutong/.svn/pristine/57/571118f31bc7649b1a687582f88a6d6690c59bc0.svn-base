package com.jy.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.CityAgreementDao;
import com.jy.dao.DepartmentDao;
import com.jy.model.CityAgreement;
import com.jy.service.CityAgreementService;
@Component
public class CityAgreementServiceImpl implements CityAgreementService {
	@Resource
	private CityAgreementDao AgreementDao;
	public boolean addAgreement(CityAgreement agreement) {
		int i = AgreementDao.addAgreement(agreement);
		if(i>0)
			return true;
			else
			return false;
	}

	public boolean delAgreement(String id) {
	int i = AgreementDao.delAgreement(id);
		if(i>0)
			return true;
			else
			return false;
	}

}
