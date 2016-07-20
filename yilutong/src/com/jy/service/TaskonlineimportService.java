package com.jy.service;
/**
 * 
 * @author hqh
 * @createtime 2015-6-8
 * @注释：任务计划导入
 */
import java.util.List;

import com.jy.model.Taskonlineimport;

public interface TaskonlineimportService {
	public List<Taskonlineimport> getallLin(int rows,int page,String linname,String stime,String edtime);//加载页面分页查询
	public int getallLinCount(String linname,String stime,String edtime);//总数量查询
	public int saveimp(List<Taskonlineimport>tlist);//保存
	public List<Taskonlineimport>getLinName(String linname);//获取select2 name
	public Taskonlineimport getlinplanplanbyid(String linnumber);//获取单条记录通过ID
	public int updatelinplan(Taskonlineimport tl);//更新方法
	public int deletebyid(String [] linnumber);//删除方法
	public String getcartype(String carno);//获取车辆类型
	public String getcarow(String carno);//获取车辆车主
	public List<Taskonlineimport>getallLinss(String linname);
}
