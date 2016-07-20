package com.jy.action;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jy.common.SessionInfo;
import com.jy.common.UUIDUtils;
import com.jy.dao.Json;
import com.jy.model.ConfirmMsg;
import com.jy.model.Demand_release;
import com.jy.model.DetemineVehicle;
import com.jy.model.Linstandard_truck;
import com.jy.model.User;
import com.jy.model.Vehicle_auction;
import com.jy.service.Demand_releaseService;
import com.jy.service.DetemineVehicleService;
import com.jy.service.LinStandardService;
import com.jy.service.UserInfoService;
import com.jy.service.VehicleAuctionService;
import com.jy.thread.IOSMsgThread;
import com.jy.thread.MsgThread;

/**
 * 确定车辆controller
 * 
 * @author zkj 2015年5月26日 14:30:25
 */
@Controller
@RequestMapping(value = "/detemineveh.do")
public class DetemineVehicleController {

	@Resource
	private DetemineVehicleService detemineVehicleService;
	@Resource
	private UserInfoService uis;
	@Resource
	private Demand_releaseService dss;
	@Resource
	private LinStandardService ls;
	@Resource
	private VehicleAuctionService vs;
	/**
	 * 确定竞价
	 */
	@RequestMapping(params = "method=determineVehicle")
	public String DemandReleasePage(String menu_id,HttpSession session,String demandReleaseId,
			HttpServletRequest request) {
		Integer[] rid =(Integer[])session.getAttribute(SessionInfo.SessionRote);
		Integer id = Integer.parseInt(menu_id);
		List<String> list = uis.getFunctions(id,rid);
		if(list.size()>0){
		StringBuffer bf = new StringBuffer();
		for(String ss:list){
			bf.append(ss);
			bf.append(",");
			
		}
		bf.deleteCharAt(bf.length()-1);
		session.setAttribute("function", bf.toString());
		}else{
			session.setAttribute("function", "");
			
		}
		request.setAttribute("flg1", demandReleaseId);
		return "TemVehicle/determineVehicle";
	}

	/**
	 * 
	 */
	@RequestMapping(params = "method=determineVehicle1")
	public String DemandReleasePageq(String pid, HttpServletRequest request) {
		request.setAttribute("flg2", pid);
		return "TemVehicle/detailsDriver";
	}

	// 查询
	@RequestMapping(params = "method=getdetermineVehicle")
	public @ResponseBody
	Map<String, Object> getSelectDemand_release(String page, String rows,
			String pid) {
		// 当前第几页
		Integer page2 = 1;
		// 当前页一共几条
		Integer rows1 = 0;
		if (page != null && !"".equals(page)) {
			page2 = Integer.parseInt(page);
		}
		if (rows != null && !"".equals(rows)) {
			rows1 = Integer.parseInt(rows);
		}
		List<DetemineVehicle> demand_release = detemineVehicleService
				.getdetermineVehicle((page2 - 1) * rows1, rows1, pid);
		int total = detemineVehicleService.getCount(pid);
		// json返回串
		Map<String, Object> map = new HashMap<String, Object>();
		//System.out.println(demand_release.size());
		if(demand_release.size()>0){
			DetemineVehicle zuidi=detemineVehicleService.zuidiPrice(demand_release.get(0).getPlate_number());
			//System.out.println(zuidi);
			demand_release.get(0).setZuidi(zuidi.getZuidi());
			demand_release.get(0).setCou(zuidi.getCou());
		}
		map.put("total", total);
		map.put("rows", demand_release);
		return map;
	}

	// 确定车辆
	@RequestMapping(params = "method=getDetermineVehicle1")
	public @ResponseBody
	Json updateDemand_release(String pid,String sss) {
		Json json = new Json();
		String[] channelIds = new String[1];
		//没有确定的
		String[] channelIdNo=null;
		int i = detemineVehicleService.updateDetermineVehicle(pid,sss);
		//获取竞价的需求
		Demand_release dr=dss.getSelectDemand_release(sss);
		Vehicle_auction datev=vs.getCarIdDete_Vehiche(dr.getDemandReleaseId());
		int count=ls.checkAgain(dr.getLine_id(), datev.getTemporary_car_id());
		if(count==0){
			Linstandard_truck lt=new Linstandard_truck();
			lt.setJltid(UUIDUtils.getUUID());
			lt.setLid(dr.getLine_id());
			lt.setTid(datev.getTemporary_car_id());
			lt.setTname(datev.getPlateNumber());
			ls.saveLinstand(lt);
		}
		//查询没有确定需求的信息
		List<DetemineVehicle> dv=detemineVehicleService.getdetermineVehicleNotrue(dr.getDemandReleaseId());

		//存储没有确定的车辆id
		String[] carids=new String[dv.size()];
		//拼写竞价成功
		StringBuffer str=new StringBuffer();
		str.append("您好，您参与的").append(dr.getZhuang()+dr.getLoadingAddress()).append("到").append(dr.getXie()+dr.getUnloadingAddress())
		.append("线路货物运输任务竞价成功,请在通知后一小时内到指定地点装货，联系电话：").append(dr.getContactInformation());

		//拼写竞价失败
		StringBuffer strerror=new StringBuffer();
		strerror.append("您好，您参与的").append(dr.getZhuang()+dr.getLoadingAddress()).append("到").append(dr.getXie()+dr.getUnloadingAddress())
		.append("线路货物运输任务竞价失败，感谢您的参与，期待下次合作。");

		
		//获取确定车辆的carid
		String carid=detemineVehicleService.getTemporary_carId(pid);
		System.out.println(carid);
		if (i > 0) {
			//确定成功以后查询剩余没有确定成功的车辆信息
			for(int j=0;j<dv.size();j++){
				carids[j]=dv.get(j).getTravel_card_id();
			}
			
			//没有确定车辆
			if(carids.length>0){
				List<User> users=detemineVehicleService.getCannIds(carids);
				channelIdNo = new String[users.size()];
				
				for(int u=0;u<users.size();u++){
					System.out.println("没有确定的用户："+users.get(u).getUsername());
					System.out.println("没有确定的设备："+users.get(u).getChannelId());
					channelIdNo[u]=users.get(u).getChannelId();
				}
				try {
					//AndroidPushBatchUniMsg.androidPushBatchMsg("确定车辆消息","您的车辆竞价失败,感谢您的参与,请及时查看", channelIdNo);
					//if("1".equals(user.getDevice_type()))
					new Thread(new MsgThread("您的车辆竞价失败,感谢您的参与,请及时查看", channelIdNo)).start();
					new Thread(new IOSMsgThread("您的车辆竞价失败,感谢您的参与,请及时查看", channelIdNo)).start();

					//else if("2".equals(user.getDevice_type()))
					for(int c=0;c<carids.length;c++){
						//已经确认的消息
						ConfirmMsg confirmMsg=new ConfirmMsg();
						confirmMsg.setConfirm_id(UUIDUtils.getUUID());
						confirmMsg.setCar_id(carids[c]);
						confirmMsg.setMessage(strerror.toString());
						confirmMsg.setTel(dr.getContactInformation());
						confirmMsg.setState(2);
						boolean flag=detemineVehicleService.saveConfirmMsg(confirmMsg);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			}
			
			//确定车辆的信息
			if(carid!=null&&!"".equals(carid)){
				//获取司机手机设备id
				User user=detemineVehicleService.getCannId(carid);
				if(user.getChannelId()==null||"".equals(user.getChannelId())){
					channelIds[0]=user.getChannelId();
					try {
						System.out.println("设备号:"+user.getChannelId());
						if("1".equals(user.getDevice_type()))
						new Thread(new MsgThread("您的车辆竞价已经确认，请及时查看", channelIds)).start();
						else if("2".equals(user.getDevice_type()))
						new Thread(new IOSMsgThread("您的车辆竞价已经确认，请及时查看", channelIds)).start();
						//把确认具体消息存入数据库
						//已经确认的消息
						ConfirmMsg confirmMsg=new ConfirmMsg();
						confirmMsg.setConfirm_id(UUIDUtils.getUUID());
						confirmMsg.setCar_id(carid);
						confirmMsg.setMessage(str.toString());
						confirmMsg.setTel(dr.getContactInformation());
						confirmMsg.setState(1);
						boolean flag=detemineVehicleService.saveConfirmMsg(confirmMsg);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
					
					
				}
				
			//没有确定车辆的信息
			
			json.setFlag(true);
			return json;
		}
		json.setFlag(false);
		return json;
	}
	// 确定车辆
		@RequestMapping(params = "method=checkDetermineVehicle")
		public @ResponseBody
		Json checkDetermineVehicle(String sss) {
			Json json = new Json();
			int i = detemineVehicleService.checkDetermineVehicle(sss);
			if (i > 0) {
				json.setFlag(true);
				return json;
			}
			json.setFlag(false);
			return json;
		}
}
