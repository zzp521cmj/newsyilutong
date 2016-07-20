package com.jy.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CarInvoice;
import com.jy.model.CarMaintenance;
import com.jy.model.Registration;
import com.jy.model.TransportCard;
import com.jy.model.TravelCard;
import com.jy.model.TravelImg;

/**
 * 固定车辆信息
 * 
 * @author lx
 */
public interface TravelCardService {

	public List<TravelCard> getTravel(Integer page, Integer rows,
			String plateNumber, String did, String carType,String driverid,String box_add);

	/**
	 * 总条数
	 * 
	 * @return
	 */
	public int getCount(String plateNumber, String did, String carType,String driverid,String box_add);

	public List<TravelCard> getCars();

	public TravelCard getOneCar(String id);

	/**
	 * 新增车辆
	 * 
	 * @param travel
	 * @return
	 */
	public int addTravel(TravelCard travel);

	public int addTran(TransportCard tran);

	public int addReg(Registration reg);

	public int addInvoice(CarInvoice invoice);

	public int addMain(CarMaintenance main);

	/**
	 * 获取修改信息
	 * 
	 * @param travelCardId
	 * @return
	 */
	public TravelCard getTra(String travelCardId);

	/**
	 * 修改车辆
	 * 
	 * @param travel
	 * @return
	 */
	public int editTra(TravelCard travel);

	public int editTran(TransportCard tran);

	public int editReg(Registration reg);

	public int editInvoice(CarInvoice invoice);

	public int editMain(CarMaintenance main);

	/**
	 * 批量删除
	 * 
	 * @param delTruck
	 * @return
	 */
	public int deleteTravel(String[] travelCardId);

	public int checkAgreement(String[] travelCardId);

	public boolean usercar(String car, String id);

	public TravelCard getUserTemCar(String id);

	public boolean delusercar(String id);

	public List<TravelCard> getCar_Num(String plateNumber, String xxx);

	public int checkTemCarName(String name);

	public int checkTraCarName(String name);

	public List<TravelCard> getAllCar(String driverid,String[] putCarId);

	List<TravelCard> getAllCarlist(String plateNumber, String did,String driverid,String carType,String box_add,String[] putCarId);

	// 当月年审到期
	List<TravelCard> dangyueTravelCard(String year, String month);

	// 二级维护到期
	List<TravelCard> dangyueTravelCardtwo(String year, String month);

	// 查询user对应的固定车辆id
	public TravelCard getUserTravel(String user_id);

	// 保存图片
	int saveTravelImg(List<TravelImg> list);

	// 查询订单签收图片
	List<TravelImg> getTravelImg(String travelImg);
	
	//app注册添加车俩信息
	int appAddTravel(TravelCard travel);
}
