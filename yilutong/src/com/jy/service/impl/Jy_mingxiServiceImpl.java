package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.Jy_mingxiDAO;
import com.jy.model.Confluence;
import com.jy.model.Detaileds;
import com.jy.model.Jy_mingxi;
import com.jy.model.Mingxi;
import com.jy.service.Jy_mingxiService;
@Component
public class Jy_mingxiServiceImpl implements Jy_mingxiService {
	@Resource
	private Jy_mingxiDAO  jy;
	public List<Jy_mingxi> getMingxi(int rows, int page,
			String jy_direction, String jy_source, String jy_project) {
		List<Jy_mingxi> list = jy.getMingxi(rows, page, jy_direction, jy_source, jy_project);
		return list;
	}

	public int getMingxiInfo(String jy_direction, String jy_source,
			String jy_project) {
		int i = jy.getMingxiInfo(jy_direction, jy_source, jy_project);
		return i;
	}

	public int add(Confluence d) {
	int i = jy.add(d);
		return i;
	}
 
	public int addMingxi(Mingxi y) {
	int i = jy.addMingxi(y);
		return i;
	}

	public int sava(Jy_mingxi j) {
		int i = jy.sava(j);
		return i;
	}

	public int deleteMingxi(String[] del) {
		int i = jy.deleteMingxi(del);
		return i;
	}



	

}
