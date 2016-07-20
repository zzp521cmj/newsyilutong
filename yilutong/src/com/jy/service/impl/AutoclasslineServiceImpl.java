package com.jy.service.impl;
/*
 * 自动任务计划表
 * */
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.dao.AutoclasslineDao;
import com.jy.dao.CityDao;
import com.jy.model.City_info;
import com.jy.model.Taskonlineimport;
import com.jy.service.AutoclasslineService;
import com.jy.service.CityService;
@Controller
public class AutoclasslineServiceImpl implements AutoclasslineService{
@Resource
private AutoclasslineDao ad;

public int getAutoclassline(String linname, String lincarno, String start,String end) {
	int i=ad.getAutoclassline(linname, lincarno, start,end);
	return i;
}

public List<Taskonlineimport> getAutoclasslineInfo(int rows, int page,
		String linname, String lincarno,String start,String end) {
	List<Taskonlineimport> list=ad.getAutoclasslineInfo(rows, page, linname, lincarno, start,end);
	return list;
}

public int deleteAutoclassline(String[] del) {
	int i=ad.deleteAutoclassline(del);
	return i;
}

public int saveAutoclassline(Taskonlineimport d) {
	int i=ad.saveAutoclassline(d);
	return i;
}

public Taskonlineimport getUpdateAutoclassline(String linnumber) {
	Taskonlineimport t=ad.getUpdateAutoclassline(linnumber);
	return t;
}

public int updateAutoclassline(Taskonlineimport d) {
	int i=ad.updateAutoclassline(d);
	return i;
}

public List<Taskonlineimport> getCar_idLength(String name) {
	// TODO Auto-generated method stub
	List<Taskonlineimport> list=ad.getCar_idLength(name);
	return list;
}

public List<Taskonlineimport> getClassLineLength(String name) {
	// TODO Auto-generated method stub
	List<Taskonlineimport> list=ad.getClassLineLength(name);
	return list;
}
public Taskonlineimport getUpdateAutoclasslineNo(String linnumber){
	Taskonlineimport t=ad.getUpdateAutoclasslineNo(linnumber);
	return t;
}

public List<Taskonlineimport> getAutoclasslineAll(String linname,
		String lincarno, String start,String end) {
	List<Taskonlineimport> list=ad.getAutoclasslineAll(linname, lincarno, start,end);
	return list;
}

}
