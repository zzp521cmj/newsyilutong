package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Confluence;
import com.jy.model.Detaileds;
import com.jy.model.Jy_mingxi;
import com.jy.model.Mingxi;

public interface Jy_mingxiService {
	
	List<Jy_mingxi>  getMingxi(int rows,int page,String jy_direction,String jy_source,String jy_project);
	int getMingxiInfo(String jy_direction,String jy_source,String jy_project);
	int add(Confluence d);
	int addMingxi(Mingxi y);
	 int  sava(Jy_mingxi j);
	 public int deleteMingxi(@Param("array") String[] del);//删除
}
