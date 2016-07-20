package com.jy.dao;
/***
 * @author  黄清华
 * @param  标准路线的实体类（LinStandard）
 * @since 1.6
 * @version 1.0
 * @throws null
 * @createtime 2015-5-20
 */
import java.util.List;

import com.jy.model.LinStandard;
import com.jy.model.Linstandard_truck;
import com.jy.model.PostClassLineInfo;
import com.jy.model.PostClassline;
import com.jy.model.Remark;
import com.jy.model.ShippingOrder;
import com.jy.model.Warehouse;

public interface LinStandardDao {
	Boolean savelinstandard(LinStandard lst);
	List<LinStandard>getlinlist(int id);
	List<PostClassline> getlinlist(String name);
	List<PostClassLineInfo> getlinbyid(String id);
	List<PostClassline>getlinnameandno(String lxid);
	int getLin(String linname);
	List<LinStandard> getLinInfo(int rows,int page,String linname);
	List<LinStandard> getLinbyid(String linid);
	List<LinStandard>getLinName(String linname);
	int deleteLinById(String[] del);
	int checkname(String linname);
	List<Remark> getRemark(String id);
	int getLincount(String[] del);
	List<LinStandard>getallLinInfo(String linname);
	int bdcar(List<Linstandard_truck>ltlist);
	List<Linstandard_truck>getlincar(String getLinbyidforbd);
	int deletecarbyno(String linid);
	/**
	 * 查询重复的线路绑定
	 * @param linid
	 * @param tId
	 * @return
	 */
	int checkAgain(String linid,String tid);
	/**
	 * 保存车辆和线路的绑定
	 * @param lt
	 * @return
	 */
	int saveLinstand(Linstandard_truck lt);
	
	
	List<ShippingOrder>getorderbyaid(String aid);
	
	List<Warehouse> getallremark();// 加载所有的reamk信息

	List<Warehouse> getallremarkbydname(String dname);// 通过dname获取rmark信息
}
