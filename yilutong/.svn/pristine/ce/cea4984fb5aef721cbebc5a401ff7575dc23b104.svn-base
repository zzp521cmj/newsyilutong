package com.jy.dao;
/**
 * 
 * @author hqh
 * @createtime 2015-6-8
 * @注释：任务计划导入
 */
import java.sql.SQLException;
import java.util.List;

import com.jy.model.Taskonlineimport;

public interface TaskonlineimportDao {
	int getallLinCount(String linname,String stime,String edtime);
	List<Taskonlineimport> getallLin(int rows,int page,String linname,String stime,String edtime);
	int saveimp(List<Taskonlineimport> list) throws SQLException;
	List<Taskonlineimport>getLinName(String linname);
	Taskonlineimport getlinplanplanbyid(String linnumber);
	int updatelinplan(Taskonlineimport tl);
	int deletebyid(String [] linnumber);
	String getcartype(String carno);//获取车辆类型
	String getcarow(String carno);//获取车辆车主
	List<Taskonlineimport>getallLinss(String linname);
}
