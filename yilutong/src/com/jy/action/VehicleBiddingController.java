package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.push.msg.AndroidPushBatchUniMsgNew;
import com.baidu.yun.push.exception.PushClientException;
import com.baidu.yun.push.exception.PushServerException;
import com.jy.model.CreateAgreement;
import com.jy.model.VehiclevBidding;
import com.jy.service.VehicleBiddingService;
import com.jy.thread.CAInfoPushMessage;
import com.jy.thread.PushMsgThread;

/**
 * 车辆竞价
 * 
 * @author 90
 * 
 */
@Controller
@RequestMapping(value = "/vehicleBidding.do")
public class VehicleBiddingController {
	@Resource
	private VehicleBiddingService biddingService;

	// 车辆竞价
	@RequestMapping(params = "method=getVehicleBidding")
	public String getVehicleBidding() {
		return "vehicleBidding/vehicleBidding";
	}

	// 确定车辆信息
	@RequestMapping(params = "method=getDetermineVehicle")
	public String getDetermineVehicle(HttpServletRequest request, String id,
			String agreement_number) {
		request.setAttribute("id", id);
		request.setAttribute("agreement_number", agreement_number);
		return "vehicleBidding/determineVehicle";
	}

	// 确定车辆信息
	@RequestMapping(params = "method=getDetermineVehicleMessage")
	public @ResponseBody
	Map getDetermineVehicleMessage(String rows, String page, String cid,
			String car_name, String car_number1, String phone_number) {
		Integer rows1 = 0;// 当前有几行
		Integer page1 = 1;// 当前有几页
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		if (page != null && !"".equals(page)) {
			page1 = Integer.parseInt(page);
		}
		List<VehiclevBidding> list = biddingService.getDetermineVehicleMessage(
				(page1 - 1) * rows1, rows1, cid, car_name, car_number1,
				phone_number);
		int count = biddingService.getDetermineVehicleTotal(cid, car_name,
				car_number1, phone_number);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", count);
		map.put("rows", list);
		return map;
	}

	// 确定车辆
	@RequestMapping(params = "method=determineVehicleDriver")
	public @ResponseBody
	boolean determineVehicleDriver(String agreement_number, String allMoney,
			String agreement_id, String vehiclebidding_id, String driver_id,
			String plate_number, String driver_name, String car_id,
			String phone_number, String is_receipt_free) {
		boolean b = false;
		int i = biddingService.determineVehicleDriver(allMoney, agreement_id,
				vehiclebidding_id, driver_id, plate_number, driver_name,
				car_id, phone_number, is_receipt_free);

		if (i > 0) {
			// 获取该司机的设备号
			String channelIdNo = biddingService.getChannelIdNo(driver_id);
			if (channelIdNo!=null&&!channelIdNo.equals("")) {
				String message = "你竞价的协议,编号为:" + agreement_number
						+ "您被确认，请您尽快完成配送";
				String[] channelId = channelIdNo.split(",");
				String title = "确定车辆";
				JSONObject jsonCustormCont = new JSONObject();
				JSONObject json = new JSONObject();
				json.put("type", "2");
				jsonCustormCont.put("successMsg", json);
				new Thread(new CAInfoPushMessage(message, channelId, title,
						"0", jsonCustormCont)).start();
				b = true;
			}
		}
		return b;
	}

	// 确定车辆信息
	@RequestMapping(params = "method=getChakanDetermineVehicle")
	public String getChakanDetermineVehicle(HttpServletRequest request,
			String id) {
		request.setAttribute("id", id);
		return "vehicleBidding/chakandetermineVehicle";
	}

	// 修改价格调转页面
	@RequestMapping(params = "method=editPrice")
	public String editPrice(HttpServletRequest request, String id,String ca) {
		request.setAttribute("id", id);
		request.setAttribute("ca", ca);
		return "vehicleBidding/editprice";
	}

	// 修改推送消息
	@RequestMapping(params = "method=editPriceInfo")
	public @ResponseBody boolean editPriceInfo(String id,String price,String ca) {
	    boolean b = false;
	    String channelIdNo= biddingService.getChannelIdNo(id);
	    if(channelIdNo!=null&&!channelIdNo.equals("")){
	    	String [] channelIds=channelIdNo.split(",");
	    	if(channelIds.length>0){
	    		new Thread(new myThread(biddingService,channelIds,ca,price)).start();
		    	b=true;
	    	}
	    	
	    }
		return b;
	}

}
//内部类修改价格
class myThread implements Runnable{
	private static Logger log = Logger.getLogger(PushMsgThread.class);
	private VehicleBiddingService biddingService;
	private String[] channelIdNo;
	private String agreement_id;
	private String price;
	
	public myThread() {
		super();
	}
	
	public myThread(VehicleBiddingService biddingService, String[] channelIdNo,
			String agreement_id, String price) {
		super();
		this.biddingService = biddingService;
		this.channelIdNo = channelIdNo;
		this.agreement_id = agreement_id;
		this.price = price;
	}
	public void run() {
	    for (int i = 0; i < channelIdNo.length; i++) {
	    	CreateAgreement message = biddingService.getEidtPriceMessage(channelIdNo[i], agreement_id);
			try {
				String title1="竞价价格修改";
				String message1="您竞价的协议信息要求修改价格，点击查看";
				JSONObject jsonCustormCont = new JSONObject();
				JSONObject json = new JSONObject();
				json.put("type", "1");
				json.put("message", message);
				json.put("price",price);
				jsonCustormCont.put("successMsg", json);
				AndroidPushBatchUniMsgNew.androidPushBatchMsg(title1,message1,channelIdNo,jsonCustormCont);
			} catch (PushClientException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (PushServerException e) {
				try {
					//Thread.sleep(60 * 1000);
				} catch (Exception e1) {
					log.error("{}", e1);
				}
				System.out.println("错误啦!");

				log.error("{}", e);
			}
	    }
		
	}
}
