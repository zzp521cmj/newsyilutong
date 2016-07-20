package com.jy.service.impl;

/**
 * 
 * @author hqh
 * @createtime 2015-6-8
 * @注释：任务计划导入
 */
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jy.dao.TaskonlineimportDao;
import com.jy.model.LinStandard;
import com.jy.model.Taskonlineimport;
import com.jy.service.TaskonlineimportService;

@Service("TaskonlineimportService")
public class TaskonlineimportServiceImpl implements TaskonlineimportService {

	@Resource
	private TaskonlineimportDao taskonlineimportDao;

	public List<Taskonlineimport> getallLin(int rows, int page, String linname,String stime,String edtime) {
		List<Taskonlineimport> list = taskonlineimportDao.getallLin(rows, page,
				linname,stime,edtime);
		return list;
	}

	public int getallLinCount(String linname,String stime,String edtime) {
		int count = taskonlineimportDao.getallLinCount(linname,stime,edtime);
		return count;
	}

	public int saveimp(List<Taskonlineimport> tlist) {
		try {
			taskonlineimportDao.saveimp(tlist);
			return 0;
		} catch (Exception e) {
			return 1;
		}
	}

	public List<Taskonlineimport> getLinName(String linname) {
		List<Taskonlineimport> plilist = new ArrayList<Taskonlineimport>();
		try {
			plilist = taskonlineimportDao.getLinName(linname);
		} catch (Exception e) {
			System.out.println(e);
		}
		return plilist;
	}

	public Taskonlineimport getlinplanplanbyid(String linnumber) {
		Taskonlineimport t = null;
		try {
			t = taskonlineimportDao.getlinplanplanbyid(linnumber);
		} catch (Exception e) {
			t = new Taskonlineimport();
		}
		return t;
	}

	public int updatelinplan(Taskonlineimport tl) {
		try {
			taskonlineimportDao.updatelinplan(tl);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	public int deletebyid(String[] linnumber) {
		try {
			taskonlineimportDao.deletebyid(linnumber);
			return 0;
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	public String getcartype(String carno) {
		String cartype=taskonlineimportDao.getcartype(carno);
		if (cartype==null){
			cartype="";
		}
		return cartype;
	}

	public String getcarow(String carno) {
		String carow=taskonlineimportDao.getcarow(carno);
		if (carow==null){
			carow="";
		}
		return carow;
	}

	public List<Taskonlineimport> getallLinss(String linname) {
		List<Taskonlineimport>s=null;
		try {
			s=taskonlineimportDao.getallLinss(linname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s;
	}
}
