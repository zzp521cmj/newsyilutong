package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Component;

import com.jy.dao.MenuDao;
import com.jy.dao.RoleDao;
import com.jy.model.Menu;
import com.jy.service.MenusService;
/**
 * 
 * @author Zzp
 * Menu菜单service实现类
 */
@Component
public class MenusServiceImpl implements MenusService {
	@Resource
	private MenuDao menudao;
	@Resource
	private RoleDao roledao;
	private List<Menu> list;
	public JSONArray getMenu(Integer[] rid) {
		list = menudao.getRoleMenus(rid);
		JSONArray array = new JSONArray();
		for(Menu menu : list){
		if(menu.getFid()==0){
			JSONObject jsonObject = JSONObject.fromObject(menu);
			jsonObject.put("children",build(menu.getId()));
			array.add(jsonObject);
			
		}
		}		
			return array;
		}
	private JSONArray build(Integer id){
		JSONArray buildarray = new JSONArray();
			for (Menu menu2 : list) {
				if(menu2.getFid()==id){
					JSONObject jsonObject = JSONObject.fromObject(menu2);
					jsonObject.put("children",build(menu2.getId()));
					buildarray.add(jsonObject);
				}
		}
		return buildarray;
		
	}

	//菜单管理
	public String getMenus() {
		List<Menu> notelist=menudao.getnoteAll();
		StringBuffer sb=new StringBuffer();
		sb.append("[");
		if(notelist.size()>0){
			for (Menu menu : notelist) {
				sb.append("{\"id\":\""+menu.getId()+"\",\"pageurl\":\"\",\"iconCls\":\""+menu.getIconCls()+"\",\"fid\":\""+menu.getFid()+"\",\"text\":\""+menu.getText()+"\",\"children\":[");
				List<Menu> menulist=menudao.getMenuAll(menu.getId());
				if(menulist.size()>0){
					for (Menu menu2 : menulist) {
						sb.append("{\"id\":\""+menu2.getId()+"\",\"pageurl\":\""+menu2.getPageurl()+"\",\"fid\":\""+menu2.getFid()+"\",\"iconCls\":\""+menu2.getIconCls()+"\",\"menuDescribe\":\""+menu2.getMenuDescribe()+"\",\"text\":\""+menu2.getText()+"\"");
						List<Menu> menulist2=menudao.getMenuAll(menu2.getId());
						if(menulist2.size()>0){
							sb.append(",\"children\":[");
							for (Menu menu3 : menulist2) {
								sb.append("{\"id\":\""+menu3.getId()+"\",\"pageurl\":\""+menu3.getPageurl()+"\",\"fid\":\""+menu3.getFid()+"\",\"iconCls\":\""+menu3.getIconCls()+"\",\"menuDescribe\":\""+menu3.getMenuDescribe()+"\",\"text\":\""+menu3.getText()+"\"},");	
							}
							sb.deleteCharAt(sb.length()-1);
							sb.append("]},");
							}else{
								sb.append("},");
							}
					}
				sb.deleteCharAt(sb.length()-1);
				sb.append("]},");
				}else{
					sb.append("],\"leaf\":\""+true+"\"},");
				}
				
			}
			
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
		}else{
			sb.append("{[]}");
		}
		return sb.toString();
	}
	//获取菜单数据进行表单填充
	public Menu getupdateMenuInfo(int id){
		Menu list=menudao.getupdateMenuInfo(id);
		return list;
	}
	//更新菜单
	public int updateMenu(Menu meun) {
		int flag=menudao.updateMenu(meun);
		return flag;
	}
	//删除菜单
	public int deleteMenu(int mid){
		int flag=menudao.deleteMenu(mid);
		return flag;
	}

	public String getmenucombo() {
		// TODO Auto-generated method stub
		List<Menu> notelist=menudao.getnoteAll();
		StringBuffer sb=new StringBuffer();
		sb.append("[");
		if(notelist.size()>0){
			for (Menu menu : notelist) {
				sb.append("{\"id\":\""+menu.getId()+"\",\"fid\":\""+menu.getFid()+"\",\"iconCls\":\""+menu.getIconCls()+"\",\"menuDescribe\":\""+menu.getMenuDescribe()+"\",\"text\":\""+menu.getText()+"\",\"children\":[");
				List<Menu> menulist=menudao.getMenuAll(menu.getId());
				if(menulist.size()>0){
					for (Menu menu2 : menulist) {
						sb.append("{\"id\":\""+menu2.getId()+"\",\"pageurl\":\""+menu2.getPageurl()+"\",\"fid\":\""+menu2.getFid()+"\",\"iconCls\":\""+menu2.getIconCls()+"\",\"menuDescribe\":\""+menu2.getMenuDescribe()+"\",\"text\":\""+menu2.getText()+"\"},");
					}
					sb.deleteCharAt(sb.length()-1);
					sb.append("]},");
				}else{
					sb.append("]},");
					
				}
			}
			sb.deleteCharAt(sb.length()-1);
			sb.append("]");
		}else{
			sb.append("[{}]");
		}
		return sb.toString();
	}

	public int addMenu(Menu menu) {
		int flag=menudao.addMenu(menu);
		return flag;
	}

}
