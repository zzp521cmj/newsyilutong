package com.jy.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.jy.model.Company;
import com.jy.model.Department;
import com.jy.model.MsgModel;
import com.jy.model.OrderHistory;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.jiLuLiShi;

public  interface ShippingOrderDao {
	/**
	 * 添加修改历史记录
	 * */
    public int InsertShippjilu(jiLuLiShi js);
	/**
	 * 制作协议分页
	 * @param del
	 * @return
	 */
	 List<ShippingOrder> getShipOrderCAM(int rows, int page,@Param("array") String[] pid);
	 
	int getShipOrder(String name ,String  phone_number,String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String userid,String weitoudanhao);//查询总数
	List<ShippingOrder> getShipOrderInfo(int rows,int page,String name ,String phone_number,String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String userid,String weitoudanhao );	//查询司机
	 int deleteShipOrder(@Param("array") String[] del);//删除
	 int saveShipOrder(ShippingOrder d);//保存
	 ShippingOrder getUpdateShipOrder(String id);//修改查询
	 int updateShipOrder(ShippingOrder d);//用户修改
	 
	 int isArrive(@Param("array") String[] del);//到达
	 /**
	  * 确定到达时候修改客户车到时间
	  * @param custom_id
	  * @return
	  */
	 int isArriveCoustom(String custom_id);
	 int isNotArrive(@Param("array") String[] del);//取消到达
	 /**
	  * 到达订单历史表存储
	  * @param order
	  * @return
	  */
	 int saveOrderHistory(List<OrderHistory> order);
	 /**
	  * 取消到达删除数据
	  * @param order
	  * @return
	  */
	 int deleteOrderHistory(@Param("array")String[] order);
	/*
	 * 获取数据下拉表的查询
	 * */
	List<ShippingOrder> getPlateNumberLength(String number);
	ShippingOrder getNumber(String number);//重复订单号查询
	int getAorder(String number);//重复订单号查询
	List<ShippingOrder> getShipOrderAll(@Param("array")String[] customid,String custom_name1);
	//协议制作订单查询
	int getShipOrderCA(String id,String startDate,String end_date,String ddId,String order_state,String pay_type,String perpole,String end_address,String send_address,String phone_number);//查询总数
	List<ShippingOrder> getShipOrderInfoCA(int rows,int page,String id,String startDate,String end_date,String ddId,String order_state,String pay_type,String perpole,String end_address,String send_address,String phone_number);	//查询
	/**
	 * 删除有需求关联的订单信息
	 * @param del
	 * @return
	 */
	int deleteShipToDemand(@Param("array")String []del);
	/**
	 * 删除订单修改信息
	 */
	int deleteOrderEH(@Param("array")String []del);
	/**
	 * hqhadd
	 */
	//订单签收导出
	List<ShippingOrder> getSignOutput( String name, String start_date, String end_date,
			String shipping_order_state,String custom_name,String receipt,String address,String dirivid,@Param("array")String[] fieleid);
	//上级部门导出查询
    public List<Department> getDepartment(String fieleid);
    /**
     * 导出
     * */
    public  List<Company> getUpdateCompany(String id);
	//所有人员的查询
	List<ShippingOrder> getSignShipOrder(int rows,int page,String name,String start_date,String end_date,String shipping_order_state,String custom_name,String receipt,String address,String dirivid);
	//public  List<Driver> getDriver(String driver_name);
	int getSignShipOrdercount(String name,String start_date,String end_date,String shipping_order_state,String custom_name,String receipt,String address,String dirivid);
	ShippingOrder getUpdateSignShipOrder(String id);//修改查询
	List<ShippingOrder> getSignShipOrder1(int rows,int page,String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
	int getSignShipOrdercount1(String name ,String phone_number, String type,String start_date,String end_date,String did,String shipping_order_state);
	
	int saveSignShipOrder(Sign_order sign_order);
	int updatestate(String shiping_order_id);
	/**
	 * 批量导入
	 * @param tlist
	 * @return
	 */
	int saveShipOrders(List<ShippingOrder> tlist);
	/**
	 * 图片路径
	 * @param sign_id
	 * @param paths
	 * @param paths2 
	 * @return
	 */
	int saveSignImages(String uuid, String order_id, String paths);
	
	/**
	 * 获取司机的运单
	 * @param car_id
	 * @return
	 */
	List<ShippingOrder> getCarShipOrder(String car_id);

	List<ShippingOrder> getUpdateShipOrderArray(String[] checkarray);
	/**
	 * 获取扫描信息
	 * @param string
	 * @return
	 */
	ShippingOrder getAppShipOrder(String string);
	/**
	 * zzp添加发送短信模板
	 * @param msgTitle
	 * @param msgContent
	 * @return
	 */
	int sendMsgModelInfo(MsgModel mm);
	/**
	 * zzp添加select查询短息模板
	 * @return
	 */
	List<MsgModel> getMsgModel();

	String sendMsgContent(String msgid);
	/**
	 * 跟踪订单
	 * @return
	 */
	List<OrderHistory> getShowOrder(String pid);
	int appupdatestate(String shiping_order_id);
	/**
	 * 订单历史修改记录
	 * @param d
	 * @return
	 */
	int  saveOrderEHistory(ShippingOrder d);
	int deleteOrders(@Param("array")String [] del);
	/**
	 * 电话预约
	 * */
	int updatePhone(@Param("array")String [] del,String tiem,String maeks);
	 //保存图片
	 int  saveFilename(	List<ShipperOrderImg> list);
	// 查询订单签收图片
		List<ShipperOrderImg> getSingShiperOrderImg(String orderId);
}
