package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jy.common.UUIDUtils;
import com.jy.dao.ShippingOrderDao;
import com.jy.model.MsgModel;
import com.jy.model.OrderHistory;
import com.jy.model.ShipperOrderImg;
import com.jy.model.ShippingOrder;
import com.jy.model.Sign_order;
import com.jy.model.jiLuLiShi;
import com.jy.service.ShippingOrderInfoService;

@Service("ShippingOrderInfoService")

public class ShippingOrderInfoServiceImpl  implements ShippingOrderInfoService{
	@Resource
	private ShippingOrderDao so_dao;
	//查询分页

	public List<ShippingOrder> getShipOrderInfo(int rows, int page,
			String name, String phone_number, String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String userid,String weitoudanhao) {
		 List<ShippingOrder> list=so_dao.getShipOrderInfo(rows, page, name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address,userid,weitoudanhao);
		return list;
	}

	public int getShipOrder(String name, String phone_number,
			String type,String start_date,String end_date,String pid,String phone,String order_state,String pay_type,String send_address,String userid,String weitoudanhao) {
		int count=so_dao.getShipOrder(name, phone_number, type, start_date, end_date, pid, phone, order_state, pay_type, send_address,userid,weitoudanhao);
		return count;
	}

	public int deleteShipOrder(String[] del) {
		int i=so_dao.deleteShipOrder(del);
		return i;
	}
	
	public int saveShipOrder(ShippingOrder d) {
		int i=so_dao.saveShipOrder(d);
		return i;
	}

	public ShippingOrder getUpdateShipOrder(String id) {
		ShippingOrder sp=so_dao.getUpdateShipOrder(id);
		return sp;
	}

	public int updateShipOrder(ShippingOrder d) {
		int i=so_dao.updateShipOrder(d);
		return i;
	}

	public List<ShippingOrder> getPlateNumberLength(String number) {
		List<ShippingOrder> list=so_dao.getPlateNumberLength(number);
		return list;
	}

	public List<ShippingOrder> getShipOrderAll(String[] customid,String custom_name1) {
		List<ShippingOrder> list=so_dao.getShipOrderAll(customid,custom_name1);
		return list;
	}
		//重复订单号
	public ShippingOrder getNumber(String number) {
		ShippingOrder der=so_dao.getNumber(number);
		return der;
	}

	public List<ShippingOrder> getSignShipOrder(Integer rows, Integer page,
			String name, String start_date,String end_date,String shipping_order_state,String custom_name,String receipt,String address,String dirivid) {
		List<ShippingOrder> list=so_dao.getSignShipOrder(rows, page, name,start_date,end_date,shipping_order_state,custom_name,receipt,address,dirivid);
		return list;
	}

	public int getSignShipOrdercount(String name,String start_date, String end_date,String shipping_order_state,String custom_name,String receipt,String address,String dirivid) {
		int count=so_dao.getSignShipOrdercount(name,start_date,end_date,shipping_order_state,custom_name,receipt,address,dirivid);
		return count;
	}

	public List<ShippingOrder> getSignShipOrder1(int rows, int page,
			String name, String phone_number, String type, String start_date,
			String end_date,String did,String shipping_order_state) {
		List<ShippingOrder> list=so_dao.getSignShipOrder1(rows, page, name,  phone_number,type,start_date,end_date,did,shipping_order_state);
		return list;
	}

	public int getSignShipOrdercount1(String name, String phone_number, String type,
			String start_date, String end_date,String did,String shipping_order_state) {
		int count=so_dao.getSignShipOrdercount1(name, phone_number, type,start_date,end_date,did,shipping_order_state);
		return count;
	}
	
	public int saveSignShipOrder(Sign_order sign_order) {
		int count=0;
		try {
			String sid=UUIDUtils.getUUID();
			count=so_dao.saveSignShipOrder(sign_order);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

	public int updatestate(String shiping_order_id) {
		int count=0;
		/*try {*/
			count=so_dao.appupdatestate(shiping_order_id);
			System.out.println("成功没："+count);
		/*} catch (Exception e) {
			e.printStackTrace();
		}*/
		return count;
	}

	public int getShipOrderCA(String id,String startDate,String end_date,String ddId,String order_state,String pay_type,String perpole,String end_address,String send_address,String phone_number) {
	int i=so_dao.getShipOrderCA(id,startDate, end_date, ddId, order_state, pay_type,perpole,end_address,send_address,phone_number);
		return i;
	}

	public List<ShippingOrder> getShipOrderInfoCA(int rows, int page,
			String id,String startDate,String end_date,String ddId,String order_state,String pay_type,String perpole,String end_address,String send_address,String phone_number) {
		List<ShippingOrder> list=so_dao.getShipOrderInfoCA(rows, page, id,startDate, end_date, ddId, order_state, pay_type,perpole,end_address,send_address,phone_number);
		return list;
	}

	public ShippingOrder getUpdateSignShipOrder(String id) {
		ShippingOrder sp=so_dao.getUpdateSignShipOrder(id);
		return sp;
	}
	/**
	 * 制作协议订单的查询
	 */
	public List<ShippingOrder> getShipOrderCAM(int rows, int page, String[] pid) {
		 List<ShippingOrder>list=so_dao.getShipOrderCAM(rows,page,pid);
		return list;
	}
	/**
	 * 删除与需求相关的低订单需求
	 */
	public int deleteShipToDemand(String []del) {
		int i=so_dao.deleteShipToDemand(del);
		return i;
	}
	/**
	 * 导入
	 * @param tlist
	 * @return
	 */
	public int saveimp(List<ShippingOrder> tlist) {
		// TODO Auto-generated method stub
		
		int i=so_dao.saveShipOrders(tlist);
		return i;
	}
	/**
	 * 图片路径上传
	 */
	public int saveSignImages(String uuid, String order_id, String paths) {
		// TODO Auto-generated method stub
		int i=so_dao.saveSignImages(uuid,order_id,paths);
		return i;
	}
	/**
	 * 获取司机的订单
	 */
	public List<ShippingOrder> getCarShipOrder(String car_id) {
		// TODO Auto-generated method stub
		List<ShippingOrder> der=so_dao.getCarShipOrder(car_id);
		return der;
	}

	public List<ShippingOrder> getUpdateShipOrderArray(String[] checkarray) {
		// TODO Auto-generated method stub
		List<ShippingOrder> sp=so_dao.getUpdateShipOrderArray(checkarray);
		return sp;
	}
	/**
	 * 查询扫描信息
	 */
	public ShippingOrder getAppShipOrder(String string) {
		// TODO Auto-generated method stub
		ShippingOrder sp=so_dao.getAppShipOrder(string);
		return sp;
	}

	public int getAorder(String number) {
		int i=so_dao.getAorder(number);
		return i;
	}
	//到达
	public int isArrive(String[] del) {
		int i=so_dao.isArrive(del);
		return i;
	}
	 /**
	  * 确定到达时候修改客户车到时间
	  * @param custom_id
	  * @return
	  */
	public  int isArriveCoustom(String custom_id){
		return so_dao.isArriveCoustom(custom_id);
	}
	//取消到达
	public int isNotArrive(String[] del) {
		int i=so_dao.isNotArrive(del);
		return i;
	}

	 /**
	  * 到达订单历史表存储
	  * @param order
	  * @return
	  */
	 public int saveOrderHistory(List<OrderHistory> order){
		 int i=so_dao.saveOrderHistory(order);
		 return i;
	 }
	 /**
	  * 取消到达删除数据
	  * @param order
	  * @return
	  */
	public  int deleteOrderHistory(String[] order){
		int i=so_dao.deleteOrderHistory(order);
		return i;
		
	}

	public int sendMsgModelInfo(String msgTitle, String msgContent) {
		// TODO Auto-generated method stub
		MsgModel mm=new MsgModel();
		mm.setModel_content(msgContent);
		mm.setModel_id(UUIDUtils.getUUID());
		mm.setModel_title(msgTitle);
		int flag=so_dao.sendMsgModelInfo(mm);
		return flag;
	}

	public List<MsgModel> getMsgModel() {
		// TODO Auto-generated method stub
		List<MsgModel> list=so_dao.getMsgModel();
		return list;
	}

	public String sendMsgContent(String msgid) {
		// TODO Auto-generated method stub
		String senmsg=so_dao.sendMsgContent(msgid);
		return senmsg;
	}

	public List<OrderHistory> getShowOrder(String pid) {
		// TODO Auto-generated method stub
		return so_dao.getShowOrder(pid);
	}
	/**
	 * 订单历史修改记录
	 * @param d
	 * @return
	 */
	public int  saveOrderEHistory(ShippingOrder d){
		int i= so_dao.saveOrderEHistory(d);
		return i;
	}
	/**
	 * 删除订单修改信息
	 */
	public 	int deleteOrderEH(String []del){
		int i= so_dao.deleteOrderEH(del);
		return i;		
	}

	public int deleteOrders(String[] del) {
		return so_dao.deleteOrders(del);
	}

	public List<ShippingOrder> getSignOutput( String name, String start_date, String end_date,
			String shipping_order_state,String custom_name,String receipt,String address,String dirivid,String[] fieleid) {
		
		return so_dao.getSignOutput(name, start_date, end_date,shipping_order_state, custom_name, receipt, address,dirivid, fieleid);
	}

	public int updatePhone(String [] del,String tiem,String maeks){
		return so_dao.updatePhone(del, tiem, maeks);
	}

	public int saveFilename(List<ShipperOrderImg> list) {
		return so_dao.saveFilename(list);
	}

	public List<ShipperOrderImg> getSingShiperOrderImg(String orderId) {
		return so_dao.getSingShiperOrderImg(orderId);
	}

	public int InsertShippjilu(jiLuLiShi js) {
		// TODO Auto-generated method stub
		return so_dao.InsertShippjilu(js);
	}
}
