package com.jy.service;

import java.util.List;

import com.jy.model.Car_length;
import com.jy.model.City_info;
import com.jy.model.Demand_release;
import com.jy.model.LinStandard;
import com.jy.model.ShippingOrder;

/**
 * 2015年5月13日 16:15:23
 * 
 * @author zkj
 * 需求发布service
 * 
 */
public interface Demand_releaseService {

	// 竞价查询
	List<Demand_release> getDemand_releaseInfo(int page, int rows,String start,String end,String models,String truckTypeId,String publisher,String determine);
	List<Demand_release> getDemand_releaseInfoPage(int page, int rows,String start,String end,String models,String truckTypeId,String publisher,String determine);
	List<Demand_release> getDemand_releaseInfoAll(String userid, String rownum, String rows);

	// 获取总行数
	int getCount(String start,String end,String models,String truckTypeId,String publisher,String determine);

	//新增竞价
	int addDemand_release(Demand_release demand_release);
	
	// 获取装货城市下拉框列表
	List<City_info> getCity_info(String cityinfo);

	//获取车长的下拉
	List<Car_length> getCar_length();
	
	int deleteDemand_release(String[] del);
	
	// 获取修改信息
	Demand_release getSelectDemand_release(String pid);
	List<String> getDemendDingdan(String dd);
	int delDingdan(String id);
	//更新竞价
	int updateDemand_release(Demand_release demand_release);
	int addDingdanid(String id,String shiping_id,String demand_id);
	//进行竞价
	int addDemand_release1(Demand_release demand_release1);
	int getDetermine(String id);
	List<Demand_release> getDemand_releaseIndex();
	List<LinStandard> getLines(String search);
	LinStandard getLineCity(String id);
	List<ShippingOrder> getDingdans(int page, int rows,String name,
			String phone_number, String type,String start_date,String end_date);
	int getDingdanNums(String name,
				String phone_number, String type,String start_date,String end_date);
}
