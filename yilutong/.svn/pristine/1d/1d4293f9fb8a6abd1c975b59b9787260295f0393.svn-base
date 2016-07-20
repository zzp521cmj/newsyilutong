package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Company;
import com.jy.model.Income;
import com.jy.model.Material;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;

public  interface MaterialDAO {
	/**
	 * fjz
	 * 物料dao 
	 */ 
	// 全部查询
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
