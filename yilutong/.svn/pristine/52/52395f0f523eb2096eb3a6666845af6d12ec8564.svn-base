package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.City_info;
import com.jy.model.Company;
import com.jy.model.Income;

public interface CompanyInfoService {
	
				// 全部查询
		List<Company> getCompany(int rows,int page,String company_name,String start_people,String end_phone, String phone,String end_people);
				//分页查询总数
		public int getCompanyInfo( String company_name,String start_people,String end_phone, String phone,String end_people);//查询总数
				// 添加 
		int addCompany(Company d) ;
		//----------------省市联动------------------------//
		public List<City_info> getNewFinalPositionCounty();
		public List<City_info> getNewFinalpositionCity(Integer citye_parent_id);
		public List<City_info> getNewFinalpositioncounty(Integer citye_parent_id);
		//删除
		 int deleteCompany(@Param("array") String[] del);//删除
		 Company getUpdateCompany(String id);//修改查询
		 int updateCompany(Company d);//用户修改
}
