package com.jy.service;

import net.sf.json.JSONArray;

import com.jy.model.Menu;
/**
 * 
 * @author Zzp
 * Menu菜单Service管理类
 */
public interface MenusService {
	
	public JSONArray getMenu(Integer[] rid);
	
	//菜单管理
	public String getMenus();
	//更新菜单查询
	public Menu getupdateMenuInfo(int id);
	//更新菜单
	public int updateMenu(Menu meun);
	//删除菜单
	public int deleteMenu(int mid);
	//获取combox菜单根节点
	public String getmenucombo();
	//添加菜单
	public int addMenu(Menu menu);
	
}
