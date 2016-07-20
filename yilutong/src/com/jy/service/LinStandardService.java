package com.jy.service;
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

public interface LinStandardService {
	public boolean savelinstandard(LinStandard lst);
	public List<LinStandard>getlinlist(int id);
	public List<PostClassline>getlinlist(String name);
	public List<PostClassLineInfo> getlinbyid(String id);
	public List<PostClassline>getlinnameandno(String lxid);
	public List<LinStandard> getLinInfo(int rows,int page,String linname);
	public int getLin(String linname);
	public List<LinStandard>getLinbyid(String linid);
	public List<LinStandard>getLinName(String linname);
	public int deleteLinById(String[] del);
	public int checkname(String linname);
	public List <Remark>getRemark(String id);
	public int getLincount(String[] del);
	public List<LinStandard>getallLinInfo(String linname);
	public int bdcar(List<Linstandard_truck>ltlist);
	public List<Linstandard_truck>getlincar(String getLinbyidforbd);
	public int deletecarbyno(String linid);
	/**
	 * 查询重复的线路绑定
	 * @param linid
	 * @param tId
	 * @return
	 */
	public int checkAgain(String linid,String tid);
	/**
	 * 保存车辆和线路的绑定
	 * @param lt
	 * @return
	 */
	public int saveLinstand(Linstandard_truck lt);
	
	
	
	public List<ShippingOrder>getorderbyaid(String aid);
	 List<Warehouse>getallremark();//加载所有的reamk信息
	 List<Warehouse>getallremarkbydname(String dname);//通过连锁店名字获取信息
}
