package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.jy.common.UUIDUtils;
import com.jy.dao.TravelCardDao;
import com.jy.model.CarInvoice;
import com.jy.model.CarMaintenance;
import com.jy.model.Registration;
import com.jy.model.TransportCard;
import com.jy.model.TravelCard;
import com.jy.model.TravelImg;
import com.jy.service.TravelCardService;

/**
 * 固定车辆信息
 * 
 * @author lx
 */
@Component
@Transactional
public class TravelCardServiceImpl implements TravelCardService {
	@Resource
	private TravelCardDao traveldao;
	private String uuid;

	public List<TravelCard> getTravel(Integer page, Integer rows,
			String plateNumber, String did, String carType,String driverid,String box_add) {
		List<TravelCard> list = traveldao.getTravel(page, rows, plateNumber,
				did, carType,driverid,box_add);
		return list;
	}

	public int getCount(String plateNumber, String did, String carType,String driverid,String box_add) {
		int i = traveldao.getCount(plateNumber, did, carType,driverid,box_add);
		return i;
	}

	public int addTravel(TravelCard travel) {

		int tra = traveldao.addTravel(travel);
		return tra;
	}

	public int addTran(TransportCard tran) {
		tran.setRoadTransportCardId(UUIDUtils.getUUID());
		int tr = traveldao.addTran(tran);
		return tr;
	}

	public int addReg(Registration reg) {
		reg.setRegistrationCardId(UUIDUtils.getUUID());
		int re = traveldao.addReg(reg);
		return re;
	}

	public int addInvoice(CarInvoice invoice) {
		invoice.setInvoiceId(UUIDUtils.getUUID());
		int invo = traveldao.addInvoice(invoice);
		return invo;
	}

	public int addMain(CarMaintenance main) {
		main.setSecondaryMaintenanceCardId(UUIDUtils.getUUID());
		int ma = traveldao.addMain(main);
		return ma;
	}

	public TravelCard getTra(String travelCardId) {
		TravelCard travel = traveldao.getTra(travelCardId);
		return travel;
	}

	public int editTra(TravelCard travel) {
		int edit = traveldao.editTra(travel);
		return edit;
	}

	public int editTran(TransportCard tran) {
		int trans = traveldao.editTran(tran);
		return trans;
	}

	public int editReg(Registration reg) {
		int regs = traveldao.editReg(reg);
		return regs;
	}

	public int editInvoice(CarInvoice invoice) {
		int inv = traveldao.editInvoice(invoice);
		return inv;
	}

	public int editMain(CarMaintenance main) {
		int ma = traveldao.editMain(main);
		return ma;
	}

	public int deleteTravel(String[] travelCardId) {
		int del = traveldao.deleteTravel(travelCardId);
		int tran = traveldao.deleteTran(travelCardId);
		int reg = traveldao.deleteMain(travelCardId);
		int invoice = traveldao.deleteReg(travelCardId);
		int main = traveldao.deleteInvoice(travelCardId);
		int baoxian = traveldao.deletebaoxian(travelCardId);
		return del;
	}

	public List<TravelCard> getCars() {

		return traveldao.getCars();
	}

	public boolean usercar(String car, String id) {
		int i = traveldao.usercar(car, id);
		if (i > 0)
			return true;
		else
			return false;
	}

	public TravelCard getUserTemCar(String id) {
		return traveldao.getUserTemCar(id);
	}

	public boolean delusercar(String id) {
		int i = traveldao.delusercar(id);
		if (i > 0)
			return true;
		else
			return false;
	}

	public List<TravelCard> getCar_Num(String plateNumber, String xxx) {

		return traveldao.getCar_Num(plateNumber, xxx);
	}

	public int checkAgreement(String[] travelCardId) {
		int i = traveldao.checkAgreement(travelCardId);
		return i;
	}

	public TravelCard getOneCar(String id) {
		return traveldao.getOneCar(id);
	}

	public int checkTemCarName(String name) {
		return traveldao.checkTemCarName(name);
	}

	public int checkTraCarName(String name) {
		// TODO Auto-generated method stub
		return traveldao.checkTraCarName(name);
	}

	public List<TravelCard> getAllCar(String driverid,String[] putCarId) {
		// TODO Auto-generated method stub
		return traveldao.getAllCar(driverid,putCarId);
	}

	// 当月年审到期
	public List<TravelCard> dangyueTravelCard(String year, String month) {
		List<TravelCard> list = traveldao.dangyueTravelCard(year, month);
		return list;
	}

	// 二级维护到期
	public List<TravelCard> dangyueTravelCardtwo(String year, String month) {
		List<TravelCard> list = traveldao.dangyueTravelCardtwo(year, month);
		return list;
	}

	// 根据用户查询固定车辆
	public TravelCard getUserTravel(String user_id) {
		// TODO Auto-generated method stub
		TravelCard tc = traveldao.getUserTravel(user_id);
		return tc;
	}

	public List<TravelCard> getAllCarlist(String plateNumber, String did,String driverid,String carType,String box_add,String[] putCarId) {
		// TODO Auto-generated method stub
		
		return traveldao.getAllCarlist(plateNumber, did,driverid,carType,box_add,putCarId);
	}

	public int saveTravelImg(List<TravelImg> list) {
		// TODO Auto-generated method stub
		return traveldao.saveTravelImg(list);
	}

	public List<TravelImg> getTravelImg(String travelImg) {
		// TODO Auto-generated method stub
		return traveldao.getTravelImg(travelImg);
	}

	public int appAddTravel(TravelCard travel) {
		// TODO Auto-generated method stub
		return traveldao.appAddTravel(travel);
	}

}
