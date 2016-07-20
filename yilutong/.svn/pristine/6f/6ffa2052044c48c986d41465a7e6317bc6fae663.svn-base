package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Material;

public interface MaterialService {
	
	/**
	 * 物料service   fjz
	 * @param rows
	 * @param page
	 * @param material_id
	 * @param material_name
	 * @param material_type
	 * @return
	 */
	
	
	List<Material> getMaterial(int rows,int page,String material_id,String material_name,String material_type);	
	//分页查询总数
	int getMaterialInfo( String material_id,String material_name,String material_type);
	// 添加
	 int addMaterial(Material d);//添加
	//删除
	 int deleterMaterial(@Param("array") String[] del);//删除
	 // 
	 Material getUpdateMaterial(String id);//修改查询
	 int updateMaterial(Material d);//用户修改
}
