package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Maps;
import com.jy.model.OldMointorData;
import com.jy.model.Remark;
import com.jy.model.ShippingOrder;

/***
 * @author 黄清华
 * @param 全图监控模块
 * @since 1.6
 * @version 1.0
 * @throws null
 * @createtime 2015-6-3
 */
public interface MapDao {
	List<Maps> returncarinfo(String[] car);

	List<Maps> loadmapinfo(String carno, String cumoer);

	int loadallcarinfocount(String carno, String dept, String ydh, String cumorter);

	List<Maps> loadallcarinfo(int rows, int page, String carno, String dept,
			String ydh, String cumorter);

	List<Remark> getallremark();// 加载所有的reamk信息

	List<Remark> getallremarkbydname(String dname);// 通过dname获取rmark信息

	List<OldMointorData> gethfinfo(String carno);

	List<Maps> gethfmess(String carno, String starttime, String endtime);

	// public List<Maps>getcarnotoselect(String carno);//获取所有的车牌号放进select2

	List<Maps> gethfmesspage(String carno, String starttime, String endtime,
			int rows, int page);// 加载页面分页查询

	int loadhfpage(String carno, String starttime, String endtime);// 总数量查询

	void l();

	void ul();

	int saveMaps(Maps maps);

	int saveMapsweek(Maps maps);

	int deletecarbyid(String carid);

	List<Maps> gethfmessnozero(String tablename, String carno,
			String starttime, String endtime, String dbname, String page);// 查询非0绘画路线

	Maps getqtmessgage(String carno, String dbname);

	int gethfpage(String tablename, String carno, String starttime,
			String endtime);

	int getShipOrder(String name, String phone_number, String type,
			String start_date, String end_date, String pid, String phone,
			String order_state, String pay_type, String send_address,
			String goods_name, String cumoer);// 查询总数

	List<ShippingOrder> getShipOrderInfo(int rows, int page, String name,
			String phone_number, String type, String start_date,
			String end_date, String pid, String phone, String order_state,
			String pay_type, String send_address, String goods_name, String cumoer); // 查询司机

	public int savecarsinfo(@Param("dbName")String dbName, @Param("maps")Maps maps);
}
