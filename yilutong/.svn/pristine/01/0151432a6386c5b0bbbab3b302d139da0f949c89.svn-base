package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.PaiCheDanDao;
import com.jy.model.Car_length;
import com.jy.model.City_info;
import com.jy.model.Demand_release;
import com.jy.model.LinStandard;
import com.jy.model.ShippingOrder;
import com.jy.service.PaiCheDanService;

/**
 * 2015年5月13日 16:15:23
 * 
 * @author zkj
 * 需求发布serviceImpl
 * 
 */
@Component
public class PaiCheDanServiceImpl implements PaiCheDanService {
	@Resource
	public PaiCheDanDao paichedanDao;

	//查询分页
	public List<Demand_release> getDemand_releaseInfo(int page, int rows,String zhuang,String xie,String models,String truckTypeId,String publisher,String determine) {
		List<Demand_release> demand_releases = paichedanDao.getDemand_releaseInfo(page,rows,zhuang,xie,models,truckTypeId,publisher,determine);
		return demand_releases;
	}
	//全部
	public List<Demand_release> getDemand_releaseInfoAll(String userid, String rownum, String rows) {
 		return paichedanDao.getDemand_releaseInfoAll(userid,rownum,rows);
	}

	//获取总行数
	public int getCount(String zhuang,String xie,String models,String truckTypeId,String publisher,String determine) {
		int i = paichedanDao.getCount(zhuang,xie,models,truckTypeId,publisher,determine);
		return i;
	}

	//新增竞价
	public int addDemand_release(Demand_release demand_release) {
		int i = paichedanDao.addDemand_release(demand_release);
		return i;
	}

	// 获取装货城市下拉框列表
	public List<City_info> getCity_info(String cityinfo) {
		return paichedanDao.getCity_info(cityinfo);
	}
	//获取车长的下拉列表
	public List<Car_length> getCar_length() {
		paichedanDao.getCar_length();
		return paichedanDao.getCar_length();
	}

	//批量删除竞价
	public int deleteDemand_release(String[] del) {
		paichedanDao.deleteDemand_release(del);
		return paichedanDao.deleteDemand_release(del);
	}

	//获取修改信息
	public Demand_release getSelectDemand_release(String pid) {
		Demand_release demand_release = paichedanDao.getSelectDemand_release(pid);
		return demand_release;
	}

	// 更新竞价
	public int updateDemand_release(Demand_release demand_release) {
		int i = paichedanDao.updateDemand_release(demand_release);
		return i;
	}

	//进行竞价
	public int addDemand_release1(Demand_release demand_release1) {
		
		int i = paichedanDao.addDemand_release1(demand_release1);
		return i;
	}
	public int getDetermine(String id) {
		return paichedanDao.getDetermine(id);
	}
	public List<Demand_release> getDemand_releaseIndex() {
		
		return paichedanDao.getDemand_releaseIndex();
	}
	public List<LinStandard> getLines(String search) {
		// TODO Auto-generated method stub
		return paichedanDao.getLines(search);
	}
	public List<ShippingOrder> getDingdans(String name, String phone_number,
			String type, String start_date, String end_date) {
		// TODO Auto-generated method stub
		return paichedanDao.getDingdans(name, phone_number, type, start_date, end_date);
	}
	public int addDingdanid(String id, String shiping_id, String demand_id) {
		// TODO Auto-generated method stub
		return paichedanDao.addDingdanid(id, shiping_id, demand_id);
	}
	public List<String> getDemendDingdan(String dd) {
		// TODO Auto-generated method stub
		return paichedanDao.getDemendDingdan(dd);
	}
	public int delDingdan(String id) {
		int i  = paichedanDao.delDingdan(id);
		return i;
	}
	public LinStandard getLineCity(String id) {
		// TODO Auto-generated method stub
		return paichedanDao.getLineCity(id);
	}
	public List<Demand_release> getDemand_releaseInfoPage(int page, int rows,
			String zhuang, String xie, String models, String truckTypeId,
			String publisher, String determine) {
		// TODO Auto-generated method stub
		return paichedanDao.getDemand_releaseInfoPage(page, rows, zhuang, xie, models, truckTypeId, publisher, determine);
	}
	public ShippingOrder getPrintPCD(String checkarray) {
		// TODO Auto-generated method stub
		return paichedanDao.getPrintPCD(checkarray);
	}

	
	
	
	

}
