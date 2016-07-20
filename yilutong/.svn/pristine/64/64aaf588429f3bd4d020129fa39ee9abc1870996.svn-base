package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.Driver_bidDao;
import com.jy.model.driver_evaluate;
import com.jy.model.waybill_number;
import com.jy.service.Driver_bidService;
@Component
public class Driver_bidServiceImpl implements Driver_bidService{
	@Resource
	private Driver_bidDao bidDao;
	public List<waybill_number> getwaybillnumber(Integer rows, Integer page,
			String driver_name1, String plate_numbers1, String phone1,String qsstartdate1,String qsenddate1) {
		// TODO Auto-generated method stub
		return bidDao.getwaybillnumber(rows, page, driver_name1, plate_numbers1, phone1,qsstartdate1,qsenddate1);
	}
	public int getwaybillnumberlist(String driver_name1, String plate_numbers1,
			String phone1, String qsstartdate1, String qsenddate1) {
		// TODO Auto-generated method stub
		return bidDao.getwaybillnumberlist(driver_name1, plate_numbers1, phone1, qsstartdate1, qsenddate1);
	}

	public List<driver_evaluate> getdrivar_evaluate(Integer rows, Integer page,
			String driver_name, String plate_numbers, String phone,String qsstartdate,String qsenddate) {
		// TODO Auto-generated method stub
		return bidDao.getdrivar_evaluate(rows, page, driver_name, plate_numbers, phone,qsstartdate,qsenddate);
	}

	public int getdrivar_evaluatelist(String driver_name, String plate_numbers,
			String phone,String qsstartdate,String qsenddate) {
		// TODO Auto-generated method stub
		return bidDao.getdrivar_evaluatelist(driver_name, plate_numbers, phone,qsstartdate,qsenddate);
	}





}
