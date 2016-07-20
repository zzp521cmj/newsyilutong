package com.jy.model;
/**
 * 
 * @author Zzp
 * Menu菜单Bean类
 */
public class Menu {
	private int id;
	private String text;
	private int fid;
	private String state;
	private String iconCls;
	private String pageurl;
	private int sid;
	private String menuDescribe;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getFid() {
		return fid;
	}
	public void setFid(int fid) {
		this.fid = fid;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getPageurl() {
		return pageurl;
	}
	public void setPageurl(String pageurl) {
		this.pageurl = pageurl;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getMenuDescribe() {
		return menuDescribe;
	}
	public void setMenuDescribe(String menuDescribe) {
		this.menuDescribe = menuDescribe;
	}

}
