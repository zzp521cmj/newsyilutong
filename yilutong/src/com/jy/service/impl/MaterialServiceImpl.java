package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.jy.dao.CompanyDao;
import com.jy.dao.MaterialDAO;
import com.jy.model.Material;
import com.jy.service.MaterialService;
@Component
public class MaterialServiceImpl implements MaterialService {
	@Resource
	private MaterialDAO materialDAO;
	
	
	public List<Material> getMaterial(int rows, int page, String material_id,
			String material_name, String material_type) {
		List<Material> list =materialDAO.getMaterial(rows, page, material_id, material_name, material_type);
		return list;
	}

	public int getMaterialInfo(String material_id, String material_name,
			String material_type) {
		int i = materialDAO.getMaterialInfo(material_id, material_name, material_type);
		return i;
	}

	public int addMaterial(Material d) {
	int i =materialDAO.addMaterial(d);
		return i;
	}

	public int deleterMaterial(String[] del) {
		int i = materialDAO.deleterMaterial(del);
		return i;
	}

	public Material getUpdateMaterial(String id) {
		Material mt = materialDAO.getUpdateMaterial(id);
		return mt;
	}

	public int updateMaterial(Material d) {
		int i = materialDAO.updateMaterial(d);
		return i;
	}

}
