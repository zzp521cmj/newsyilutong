package com.jy.service;

import java.util.List;

import com.jy.model.driver_evaluate;
import com.jy.model.waybill_number;

public interface Driver_bidService {
	List<waybill_number> getwaybillnumber(Integer rows,Integer page,String driver_name1,String plate_numbers1,String phone1 ,String qsstartdate1,String qsenddate1);
	int getwaybillnumberlist(String driver_name1,String plate_numbers1,String phone1 ,String qsstartdate1,String qsenddate1);
	List<driver_evaluate> getdrivar_evaluate(Integer rows,Integer page ,String driver_name,String plate_numbers,String phone,String qsstartdate,String qsenddate);
	int getdrivar_evaluatelist(String driver_name,String plate_numbers,String phone,String qsstartdate,String qsenddate);
}
