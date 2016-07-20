package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.DataSetDao;
import com.jy.model.Maps;
import com.jy.service.DataSetService;
@Component
public class DataSetServiceImpl implements DataSetService{
	@Resource
	private DataSetDao dataSetDao;

	public List<Maps> updatestatefromtime() {
		List<Maps>mlist=null;
		try {
			mlist=dataSetDao.updatestatefromtime();
		} catch (Exception e) {
		}
		return mlist;
	}

	public int updatestatebycarnos(List<String>carnos) {
		int i=0;
		try {
			i=dataSetDao.updatestatebycarnos(carnos);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return i;
	}

	public int checkweekdata() {
		return dataSetDao.checkweekdata();
	}
	
	public int checkmondata() {
		return dataSetDao.checkmondata();
	}
	
	public int checkolddata() {
		return dataSetDao.checkolddata();
	}
	
	public int insertmon() {
		return dataSetDao.insertmon();
	}
	
	public int insertold() {
		return dataSetDao.insertold();
	}

	public int deleteweek() {
		return dataSetDao.deleteweek();
	}

	public int deletemon() {
		return dataSetDao.deleteweek();
	}

	
}
