package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Demand_releaseDao;
import com.jy.model.Car_length;
import com.jy.model.City_info;
import com.jy.model.Demand_release;
import com.jy.model.LinStandard;
import com.jy.model.ShippingOrder;
import com.jy.model.User;
import com.jy.service.Demand_releaseService;

/**
 * 2015年5月13日 16:15:23
 * 
 * @author zkj
 * 需求发布serviceImpl
 * 
 */
@Component
public class demand_releaseServiceImpl implements Demand_releaseService {
	@Resource
	public Demand_releaseDao demand_releaseDao;

	//查询分页
	public List<Demand_release> getDemand_releaseInfo(int page, int rows,String start,String end,String models,String truckTypeId,String publisher,String determine) {
		List<Demand_release> demand_releases = demand_releaseDao.getDemand_releaseInfo(page,rows,start,end,models,truckTypeId,publisher,determine);
		return demand_releases;
	}
	//全部
	public List<Demand_release> getDemand_releaseInfoAll(String userid, String rownum, String rows) {
 		return demand_releaseDao.getDemand_releaseInfoAll(userid,rownum,rows);
	}

	//获取总行数
	public int getCount(String start,String end,String models,String truckTypeId,String publisher,String determine) {
		int i = demand_releaseDao.getCount(start,end,models,truckTypeId,publisher,determine);
		return i;
	}

	//新增竞价
	public int addDemand_release(Demand_release demand_release) {
		int i = demand_releaseDao.addDemand_release(demand_release);
		return i;
	}

	// 获取装货城市下拉框列表
	public List<City_info> getCity_info(String cityinfo) {
		return demand_releaseDao.getCity_info(cityinfo);
	}
	//获取车长的下拉列表
	public List<Car_length> getCar_length() {
		demand_releaseDao.getCar_length();
		return demand_releaseDao.getCar_length();
	}

	//批量删除竞价
	public int deleteDemand_release(String[] del) {
		demand_releaseDao.deleteDemand_release(del);
		return demand_releaseDao.deleteDemand_release(del);
	}

	//获取修改信息
	public Demand_release getSelectDemand_release(String pid) {
		Demand_release demand_release = demand_releaseDao.getSelectDemand_release(pid);
		return demand_release;
	}

	// 更新竞价
	public int updateDemand_release(Demand_release demand_release) {
		int i = demand_releaseDao.updateDemand_release(demand_release);
		return i;
	}

	//进行竞价
	public int addDemand_release1(Demand_release demand_release1) {
		
		int i = demand_releaseDao.addDemand_release1(demand_release1);
		return i;
	}
	public int getDetermine(String id) {
		return demand_releaseDao.getDetermine(id);
	}
	public List<Demand_release> getDemand_releaseIndex() {
		
		return demand_releaseDao.getDemand_releaseIndex();
	}
	public List<LinStandard> getLines(String search) {
		// TODO Auto-generated method stub
		return demand_releaseDao.getLines(search);
	}
	public int addDingdanid(String id, String shiping_id, String demand_id) {
		// TODO Auto-generated method stub
		return demand_releaseDao.addDingdanid(id, shiping_id, demand_id);
	}
	public List<String> getDemendDingdan(String dd) {
		// TODO Auto-generated method stub
		return demand_releaseDao.getDemendDingdan(dd);
	}
	public int delDingdan(String id) {
		int i  = demand_releaseDao.delDingdan(id);
		return i;
	}
	public LinStandard getLineCity(String id) {
		// TODO Auto-generated method stub
		return demand_releaseDao.getLineCity(id);
	}
	public List<Demand_release> getDemand_releaseInfoPage(int page, int rows,
			String start, String end, String models, String truckTypeId,
			String publisher, String determine) {
		// TODO Auto-generated method stub
		return demand_releaseDao.getDemand_releaseInfoPage(page, rows, start, end, models, truckTypeId, publisher, determine);
	}
	public List<ShippingOrder> getDingdans(int page, int rows, String name,
			String phone_number, String type, String start_date, String end_date) {
		// TODO Auto-generated method stub
		return demand_releaseDao.getDingdans(page, rows, name, phone_number, type, start_date, end_date);
	}
	public int getDingdanNums( String name,
			String phone_number, String type, String start_date, String end_date) {
		// TODO Auto-generated method stub
		return demand_releaseDao.getDingdanNums( name, phone_number, type, start_date, end_date);
	}

	
	
	
	

}
