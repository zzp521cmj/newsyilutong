package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.DataHandlingDao;
import com.jy.model.Monitor;
import com.jy.model.Truck;
import com.jy.service.DataHandlingService;
@Component
public class DataHandlingServiceImpl implements DataHandlingService{
	@Resource
	private DataHandlingDao dataHandlingDao;
	public List<Monitor> getData() {
		List<Monitor>mlist=null;
		try {
			mlist=dataHandlingDao.getData();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return mlist;
	}
	
	public List<Truck> getcarlist() {//获取所有车牌号的集合
		List<Truck>carlist=null;
		try {
			carlist=dataHandlingDao.getcarlist();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return carlist;
	}

	public String getcaridfromno(String carno) {
		dataHandlingDao.getcaridfromno(carno);
		return null;
	}

	public int savecarsinfo(List<Monitor> mlist) {
		int i=0;
		try {
			i=dataHandlingDao.savecarsinfo(mlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int deletelscarsinfo() {
		int i=0;
		try {
			i=dataHandlingDao.deletelscarsinfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int selectcarsinfocount() {
		int i=0;
		try {
			i=dataHandlingDao.selectcarsinfocount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int deletelmdcarsinfo(List<String> carnos) {
		int i=0;
		try {
			i=dataHandlingDao.deletelmdcarsinfo(carnos);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int savecarlminfo(List<Monitor> monitorList) {
		int i=0;
		try {
			i=dataHandlingDao.savecarlminfo(monitorList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
	}

}
