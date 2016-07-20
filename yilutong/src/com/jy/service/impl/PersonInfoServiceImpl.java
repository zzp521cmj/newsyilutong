package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.AgreementDao;
import com.jy.dao.PersonInfoDao;
import com.jy.model.Agreement;
import com.jy.model.PersonInfo;
import com.jy.service.AgreementService;
import com.jy.service.PersonInfoService;
@Component
public class PersonInfoServiceImpl implements PersonInfoService{
	@Resource
	private PersonInfoDao personInfoDao;

	public int inserpersonhead(String id, String filesname) {
		// TODO Auto-generated method stub
		int flag=personInfoDao.inserpersonhead(id,filesname);
		return flag;
	}

	public PersonInfo getimages(String id) {
		// TODO Auto-generated method stub
		PersonInfo personInfo=personInfoDao.getimages(id);
		return personInfo;
	}

	public void deleteimages(String id) {
		personInfoDao.deleteimages(id);
		
	}
	
}
