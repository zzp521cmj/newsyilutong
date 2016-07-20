package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Confluence;
import com.jy.model.Mingxi;
import com.jy.model.ShippingOrder;

public interface ConfluenceDAO {

	// 全部查询
	List<Confluence> getConfluence(int rows, int page, String direction,
			String fee_date, String bb);
	int getConfluenceInfo(String direction, String fee_date, String bb);
	List<Mingxi> getMingxi(int rows, int page, String id);
	int getMingxiInfo(String subject);
	public int deleteMingxi(@Param("array") String[] del);//删除
		
	
	List<Mingxi> selectConf(int rows, int page, String id);
	int selectConfInfo(String subject);
	
	
	
	List<Mingxi> selectSour(int rows, int page, String id);
	int selectSourInfo(String subject);
	

	List<Mingxi> moneyxianjin(int rows, int page, String id);
	int moneyxianjinInfo(String subject);
	

	List<Mingxi> shoudong(int rows, int page, String id);
	int shoudongInfo(String subject);
	
	List<Mingxi> moneydaka(int rows, int page, String id);
	int moneydakaInfo(String subject);
	
}
