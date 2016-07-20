package com.jy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jy.model.CarInvoice;
import com.jy.model.CarMaintenance;
import com.jy.model.Registration;
import com.jy.model.ShipperOrderImg;
import com.jy.model.TransportCard;
import com.jy.model.TravelCard;
import com.jy.model.TravelImg;
import com.jy.model.Truck;

/**
 * @author lx 固定车辆信息
 */

public interface TravelCardDao {
	/**
	 * 分页查询
	 * 
	 * @param page
	 * @param rows
	 * @param plateNumber
	 * @return
	 */
	List<TravelCard> getTravel(Integer page, Integer rows, String plateNumber,
			String did, String carType,String driverid,String box_add);

	List<TravelCard> getCars();

	List<TravelCard> getAllCar(String driverid,@Param("array") String[] putCarId);

	List<TravelCard> getAllCarlist(String plateNumber, String did,String driverid,String carType,String box_add,@Param("array")String[] putCarId);

	/**
	 * 导出
	 * 
	 * /
	 * 
	 * /** 总条数
	 * 
	 * @return
	 */
	int getCount(String plateNumber, String did, String carType,String driverid,String box_add);

	TravelCard getOneCar(String id);

	/**
	 * 新增车辆
	 * 
	 * @param truck
	 * @return
	 */

	int addTravel(TravelCard travel);

	int addTran(TransportCard tran);

	int addReg(Registration reg);

	int addInvoice(CarInvoice invoice);

	int addMain(CarMaintenance main);

	/**
	 * 查询修改车辆信息
	 * 
	 * @param travelCardId
	 * @return
	 */
	TravelCard getTra(String travelCardId);

	/**
	 * 修改车辆信息
	 * 
	 * @param travel
	 * @return
	 */
	int editTra(TravelCard travel);

	int editTran(TransportCard tran);

	int editReg(Registration reg);

	int editInvoice(CarInvoice invoice);

	int editMain(CarMaintenance main);

	/**
	 * 批量删除
	 * 
	 * @param delTruck
	 * @return
	 */
	int deleteTravel(@Param("array") String[] travelCardId);

	int deleteTran(@Param("array") String[] travelCardId);

	int deleteReg(@Param("array") String[] travelCardId);

	int deleteInvoice(@Param("array") String[] travelCardId);

	int deleteMain(@Param("array") String[] travelCardId);

	int deletebaoxian(@Param("array") String[] travelCardId);

	int checkAgreement(@Param("array") String[] travelCardId);

	/**
	 * 根据车牌号查询
	 * 
	 * @param plateNumber
	 * @return
	 */
	List<TravelCard> getCar_Num(String plateNumber, String xxx);

	int usercar(String car, String id);

	TravelCard getUserTemCar(String id);

	int delusercar(String id);

	int checkTraCarName(String name);

	int checkTemCarName(String name);

	// 当月年审到期
	List<TravelCard> dangyueTravelCard(String year, String month);

	// 二级维护到期
	List<TravelCard> dangyueTravelCardtwo(String year, String month);

	// 根据用户查询车辆id
	TravelCard getUserTravel(String user_id);

	// 保存图片
	int saveTravelImg(List<TravelImg> list);

	// 查询订单签收图片
	List<TravelImg> getTravelImg(String travelImg);

	// app注册添加车俩信息
	int appAddTravel(TravelCard travel);
}