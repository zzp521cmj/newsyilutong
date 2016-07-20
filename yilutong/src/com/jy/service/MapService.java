package com.jy.service;

/***
 * @author  黄清华
 * @param  全图监控模块
 * @since 1.6
 * @version 1.0
 * @throws null
 * @createtime 2015-6-3
 */
import java.util.List;

import com.jy.model.Maps;
import com.jy.model.OldMointorData;
import com.jy.model.Remark;
import com.jy.model.ShippingOrder;

//画框取车返回的结果集
public interface MapService {
	List<Maps> loadmapinfo(String carno, String string);

	List<Maps> returncarinfo(String[] car);

	List<Maps> loadallcarinfo(int rows, int page, String carno, String dept,
			String ydh, String string);// 加载页面分页查询

	int loadallcarinfocount(String carno, String dept, String ydh, String string);// 总数量查询

	List<Remark> getallremark();// 加载所有的reamk信息

	List<Remark> getallremarkbydname(String dname);// 通过连锁店名字获取信息
	// List<Maps>getcarnotoselect(String carno);//获取所有的车牌号放进select2

	// 回放-----------跟踪
	List<OldMointorData> gethfinfo(String carno);

	List<Maps> gethfmess(String carno, String starttime, String endtime);

	List<Maps> gethfmesspage(String carno, String starttime, String endtime,
			int rows, int page);// 加载页面分页查询

	int loadhfpage(String carno, String starttime, String endtime);// 总数量查询

	public int updateDepartment(String creatingUser, String institutionId);

	// 添加获取app非零坐标信息
	List<Maps> gethfmessnozero(String tablename, String carno,
			String starttime, String endtime, String dbname, String page);// 查询非0绘画路线

	Maps getqtmessgage(String carno, String dbname);// 查询线路名称所属机构电话号码

	/**
	 * 保存坐标
	 */

	public int saveMaps(Maps maps);

	public int saveMapsweek(Maps maps);

	public int deletecarbyid(String carid);

	int gethfpage(String tablename, String carno, String starttime,
			String endtime);

	int getShipOrder(String name, String phone_number, String type,
			String start_date, String end_date, String pid, String phone,
			String order_state, String pay_type, String send_address,
			String goods_name, String string);// 查询总数

	List<ShippingOrder> getShipOrderInfo(int rows, int page, String name,
			String phone_number, String type, String start_date,
			String end_date, String pid, String phone, String order_state,
			String pay_type, String send_address, String goods_name, String string); // 查询司机
	public int savecarsinfo(String dbName,Maps maps);

}
