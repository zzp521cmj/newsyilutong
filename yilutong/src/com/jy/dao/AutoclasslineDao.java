package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Taskonlineimport;



public interface AutoclasslineDao {
	//查询总数
	int getAutoclassline(String linname,String lincarno,String start,String end);
	List<Taskonlineimport> getAutoclasslineInfo(int rows,int page,String linname,String lincarno,String start,String end);	//查询
	public int deleteAutoclassline(@Param("array") String[] del);//删除
	public int saveAutoclassline(Taskonlineimport d);//保存
	public Taskonlineimport getUpdateAutoclassline(String linnumber);//修改查询
	public Taskonlineimport getUpdateAutoclasslineNo(String linnumber);//修改查询
	public int updateAutoclassline(Taskonlineimport d);//用户修改
	public List<Taskonlineimport> getCar_idLength(String name);
	public List<Taskonlineimport> getClassLineLength(String name);
	public List<Taskonlineimport>getAutoclasslineAll(String linname,String lincarno,String start,String end);
}
