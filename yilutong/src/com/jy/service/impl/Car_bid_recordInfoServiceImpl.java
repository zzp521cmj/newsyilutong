package com.jy.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.jy.common.UUIDUtils;
import com.jy.dao.Car_bid_recordDao;
import com.jy.dao.Demand_releaseDao;
import com.jy.dao.TemporaryCarDao;
import com.jy.dao.TravelCardDao;
import com.jy.dao.VehicleAuctionDao;
import com.jy.model.Car_bid_record;
import com.jy.model.Car_bid_recordforoutput;
import com.jy.model.Demand_release;
import com.jy.model.TemporaryCar;
import com.jy.model.TravelCard;
import com.jy.model.Vehicle_auction;
import com.jy.service.Car_bid_recordInfoService;
@Controller
public class Car_bid_recordInfoServiceImpl implements Car_bid_recordInfoService{
	@Resource
	private Car_bid_recordDao abd;
	@Resource
	public Demand_releaseDao demand_releaseDao;
	@Resource
	public VehicleAuctionDao vehicleAuctionDao;
	@Resource 
	private TemporaryCarDao temdao;
	@Resource 
	private TravelCardDao tradao;
	public List <Car_bid_record>getCar_bid_recordInfo(int rows,int page,String publisher,String contactInformation,String plate_number){
		List<Car_bid_record> list=abd.getCar_bid_recordInfo(rows, page,publisher,contactInformation,plate_number);
		return list;
	}
	public int getCar_bid_record(String publisher,String contactInformation,String plate_number){
		int count=abd.getCar_bid_record(publisher,contactInformation,plate_number);
		return count;
	}
	public List<Car_bid_record> getCar_idLength(String plate_number){
		List<Car_bid_record>list=abd.getCar_idLength(plate_number);
		return list;
	}
	public List<Car_bid_record> getManuals(int i, int page, String zhuang,
			String xie, String models, String truckTypeId, String publisher,String determine) {
		return abd.getManuals(i,page,zhuang,xie,models,truckTypeId,publisher,determine);
	}
	public int getManualsCount(String zhuang, String xie, String models,
			String truckTypeId, String publisher,String determine) {
		
		return abd.getManualsCount(zhuang,xie,models,truckTypeId,publisher,determine);
	}
	public int addManual(Car_bid_record r,String ids) {
		Demand_release d = new Demand_release();
		String uuid = UUIDUtils.getUUID();
		String[] id = ids.split(",");
		if(ids.length()>0){
			for(int i=0;i<id.length;i++){
				demand_releaseDao.addDingdanid(UUIDUtils.getUUID(),id[i],uuid);
			}
		}
		d.setLength_id(r.getLength_id());
		d.setDemandReleaseId(uuid);
		d.setCityOfLoadingId(r.getCityOfLoadingId());
		d.setUnloadingCityId(r.getUnloadingCityId());
		d.setZhuangCity(r.getZhuangCity());
		d.setXieCity(r.getXieCity());
		d.setLoadingAddress(r.getLoadingAddress());
		d.setUnloadingAddress(r.getUnloadingAddress());
		d.setTruckTypeId(r.getTruckTypeId());
		d.setPublisher(r.getPublisher());
		d.setRanges(r.getRanges());
		d.setWeight(r.getWeight());
		d.setModels(r.getModels());
		d.setRemarks(r.getRemarks());
		d.setLine_id(r.getLine_id());
		d.setContactInformation(r.getContactInformation());
		TravelCard car = tradao.getOneCar(r.getTemporary_car_id());
		int i = demand_releaseDao.addDemand_release(d);
		Vehicle_auction v = new Vehicle_auction();
		v.setVehicleAuctionId(UUIDUtils.getUUID());
		v.setUserid(car.getUser());
		v.setDemandReleaseId(uuid);
		v.setPrice(r.getPrice());
		v.setDetermine(0);
		v.setTemporary_car_id(r.getTemporary_car_id());
		int j = vehicleAuctionDao.insert(v);
		return j;
	}
	public  List<Car_bid_recordforoutput> getdc(String driname, String tele, String carno) {
		 List<Car_bid_recordforoutput>out=abd.getdc(driname,tele,carno);
			return out;
	}
	public List<Car_bid_record> getAllCar(String username, String plateNumber,
			String tel) {
		// TODO Auto-generated method stub
		return abd.getAllCar(username, plateNumber, tel);
	}
	
}
