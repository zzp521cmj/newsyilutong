package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Function;
import com.jy.model.Menu;
/**
 * 
 * @author Zzp
 * Menu菜单管理Dao接口类
 */
public interface MenuDao {
	List<Menu> getMenu(int id,int roelid);
	List<Menu> getnoteId(int id);
	List<Menu> getMenus();
	List<Menu> getFMenuids(@Param("array") Integer[]ids);
	List<Menu> getRoleMenus(@Param("array") Integer[]ids);
	List<Menu> getcMenus(Integer id,@Param("array") Integer[]ids);
	//获取所有父节点
	List<Menu> getnoteAll();
	//获取所有子节点
	List<Menu> getMenuAll(int fuid);
	//获取菜单更新信息
	Menu getupdateMenuInfo(int id);
	//更新菜单
	int updateMenu(Menu menu);
	//删除菜单
	int deleteMenu(int mid);
	//添加菜单
	int addMenu(Menu menu);
	Integer[] getIdMenu(int id);
	List<Function> getMenuFunction(Integer id);
}

