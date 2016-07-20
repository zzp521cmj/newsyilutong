package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Car_length;
import com.jy.model.City_info;
import com.jy.model.Demand_release;
import com.jy.model.LinStandard;
import com.jy.model.ShippingOrder;

public interface Demand_releaseDao {

	// 分页查询
	List<Demand_release> getDemand_releaseInfo(int page, int rows,String start,String end,String models,String truckTypeId,String publisher,String determine);
	List<Demand_release> getDemand_releaseInfoPage(int page, int rows,String start,String end,String models,String truckTypeId,String publisher,String determine);
	//全部
	public List<Demand_release> getDemand_releaseInfoAll(String userid, String rownum, String rows);
	
	// 总条数
	int getCount(String start,String end,String models,String truckTypeId,String publisher,String determine);

	// 新增竞价
	int addDemand_release(Demand_release demand_release);

	// 获取装货城市下拉框列表
	public List<City_info> getCity_info(String cityinfo);

	// 获取车长的下拉列表
	List<Car_length> getCar_length();
	
	//批量删除竞价
	int deleteDemand_release(@Param("array") String[] delPlan);
	
	//获取修改信息
	Demand_release getSelectDemand_release(String pid);
	List<String> getDemendDingdan(String dd);
	int delDingdan(String id);
	// 更新竞价
	int updateDemand_release(Demand_release demand_release);
	int addDingdanid(String id,String shiping_id,String demand_id);
	//进行竞价
	int addDemand_release1(Demand_release demand_release1);
	int getDetermine(String id);
	List<Demand_release> getDemand_releaseIndex();
	List<LinStandard> getLines(String search);
	LinStandard getLineCity(String id);//获取线路对象
	List<ShippingOrder> getDingdans(int page, int rows,String name,
			String phone_number, String type,String start_date,String end_date);
	int getDingdanNums(String name,
				String phone_number, String type,String start_date,String end_date);
}