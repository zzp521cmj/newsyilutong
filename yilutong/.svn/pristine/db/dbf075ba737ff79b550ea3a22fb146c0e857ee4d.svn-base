package com.jy.action;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.push.msg.AndroidPushBatchUniMsg;
import com.baidu.push.msg.IOSPushMsgToSingleDevice;
import com.jy.common.UUIDUtils;
import com.jy.model.JITMonitor;
import com.jy.model.LinStandard;
import com.jy.model.Maps;
import com.jy.model.MonitorRuning;
import com.jy.model.MonitorSet;
import com.jy.model.SiteLine;
import com.jy.model.SiteMilesTime;
import com.jy.model.SiteState;
import com.jy.model.User;
import com.jy.service.AlarmService;

/*
 * 报警管理
 * */
@Controller
@RequestMapping(value="/alarm.do")
public class AlarmController {
	@Resource
	private AlarmService as;
	//获取最新定位数据
	@RequestMapping(params = "method=getMaps")
	public @ResponseBody List<Maps> getMaps(){
		List<Maps> list = as.getMaps();
		/*for(Maps m:list){
			System.out.println(m.getCarid());
			
		}*/
		return list;
		
	}
	//获取线路信息
	@RequestMapping(params = "method=getLine")
	public @ResponseBody LinStandard getLine(String id){
		//String car = as.getCarnumber(id);
		String lineid = as.getLine(id);
		//System.out.println(lineid);
		LinStandard d = new LinStandard();
		List<LinStandard> Position = as.getlinePosition(lineid);
		for(LinStandard l :Position){
			d=l;
		}
		//System.out.println(Position);
		return d;
		
	}//添加一个报警信息
	@RequestMapping(params = "method=addLineMonitor")
	public void addLineMonitor(MonitorRuning mr){
		mr.setMonitor_id(UUIDUtils.getUUID());
		as.addLineMonitor(mr);
	}
	//获取报警设置信息
		@RequestMapping(params = "method=getMonitorSet")
		public @ResponseBody MonitorSet getMonitorSet(){
			MonitorSet set  = as.getMonitorSet();
			return set;
		}
	//获取数据库的线路信息状态,好确定是添加或更新
		@RequestMapping(params = "method=getSiteState")
		public @ResponseBody Boolean getSiteState(String line_id,String car_id){
			int i = as.getSiteState(car_id, line_id);
			if(i>0){
				return true;
			}else{
				return false;
			}
		}
		//获取数据库的线路信息状态找寻上次进入站点,本次出站点的情况.
				@RequestMapping(params = "method=getSiteState1")
				public @ResponseBody Boolean getThisSiteState1(SiteState ss){
					int i = as.getThisSiteState1(ss);
					if(i>0){
						return true;
					}else{
						return false;
					}
				}
				//判断是否记录进入站点情况下里程数和时间并作记录
				@RequestMapping(params = "method=getMileTime")
				public @ResponseBody Boolean getMileTime(SiteMilesTime smt,String Range,String runing){
					int i = as.getMileTime(smt);
					
					if(i>0){
						return true;
					}else{
						smt.setId(UUIDUtils.getUUID());
						as.addMileTime(smt);
						SiteMilesTime tt = as.getStartSite(smt);
						if(smt.getSite_flag()==0&&tt!=null){
						if(runing.equals("1")){
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							Integer d = as.getPlanTime(smt.getLine_id());//预计运行时间
							if(d==null){
								d=0;
							}
							String TTT = change(d*60);
							String time1 = smt.getTime();
							String time2 = tt.getTime();
							try {
								 long result = (df.parse(time1).getTime() - df.parse(time2)  
						                    .getTime()) / 60000;
								 
								 int ii = (int)(result-d);
								 String xxx = change((int)(ii*60));
								 if(ii>5){//超出时间报警
									 JITMonitor jit = new JITMonitor();
									 jit.setJmonitor_id(UUIDUtils.getUUID());
									 jit.setCar_id(smt.getCar_id());
									 jit.setEquipment_id(smt.getBeidouid());
									 jit.setDepartment_id(smt.getDid());
									 jit.setJmonitor_type(2);
									 jit.setJmonitor_time(smt.getTime());
									 jit.setJmonitor_state(0);
									 jit.setTime_stay_plan(TTT);
									 jit.setTime_stay_real(change((int)(result*60)));
									 jit.setTime_beyond(xxx);
									 as.addStayTimeMonitor(jit);
									 String userid = as.getUserId(smt.getCar_id());
									 if(userid!=null){
										 
										// System.out.println("第六步到了");
										 User user = as.getPhoneId(userid);
										 String[] channelIds = {user.getChannelId()};
										 String description ="编号:"+smt.getCar_number()+"您本次线路运行时间超出计划运行时间"
												 +xxx;
										 if(user.getDevice_type().equals("1")){
											 String msgtitle = "运行时间警告";
											 //System.out.println(description);
											 AndroidPushBatchUniMsg.androidPushBatchMsg(msgtitle,description,channelIds); 
										 }else if(user.getDevice_type().equals("2")){
											 IOSPushMsgToSingleDevice.IOSPushBatchMsg(description, user.getChannelId());
										 }
										 	 
									 }
									 
								 }
							} catch (Exception e) {
								// TODO: handle exception
								e.printStackTrace();
							}
							
						}
						//运行距离监控....
						if(Range.equals("1")){
							//System.out.println("第一步");
							Double b  = smt.getMiles()-tt.getMiles();
							//System.out.println("b"+b);
							String d2  = as.getshijiMiles(smt.getLine_id());
							//System.out.println("d2"+d2);
							 DecimalFormat decimal = new DecimalFormat( "0.00");
							Double b2 = Double.parseDouble(d2);
							//System.out.println("b2"+b2);
							Double xxx = b-b2;
							String scd = decimal.format(xxx);
							xxx = Double.parseDouble(scd);
							String gl = String.valueOf(xxx);
							//System.out.println(xxx);
							if(xxx>2){
								//System.out.println("第二步");
								MonitorRuning mr = new MonitorRuning();
								mr.setCar_id(smt.getCar_id());
								mr.setDepartment_id(smt.getDid());
								mr.setEquipment_id(smt.getBeidouid());
								mr.setMonitor_id(UUIDUtils.getUUID());
								mr.setMonitor_plan_range(d2);
								mr.setMonitor_real_range(String.valueOf(b));
								mr.setMonitor_state(0);
								mr.setMonitor_time(smt.getTime());
								mr.setMonitor_type(2);
								mr.setOut_of_range(gl);
								 as.addLineMonitor(mr);
								 String userid = as.getUserId(smt.getCar_id());
								 if(userid!=null){
									 try {
									// System.out.println("第三步");
									 //System.out.println("第六步到了");
									 User user = as.getPhoneId(userid);
									 String description ="编号:"+smt.getCar_number()+"您本次线路的行驶距离已经超出计划行驶距离"
											 +gl+"公里";
									 String[] channelIds = {user.getChannelId()};
									 if(user.getDevice_type().equals("1")){
										 String msgtitle = "行驶距离警告";
											 AndroidPushBatchUniMsg.androidPushBatchMsg(msgtitle,description,channelIds);	
											
									 }else if(user.getDevice_type().equals("2")){
										 IOSPushMsgToSingleDevice.IOSPushBatchMsg(description, user.getChannelId());
									 }
									
								 }
								  catch (Exception e) {
										// TODO: handle exception
										e.printStackTrace();
									}
								 }
							}
							
						}
								 
						}
						return false;
					}
				}
				
				//结束行程返回到首站点后的数据计算
				@RequestMapping(params = "method=returnSite")
				public void returnSite(SiteMilesTime smt,String stopPoint){
					int i = as.getMileTime(smt);
					if(i>0){
						SiteMilesTime s = as.getStartSite(smt);
						SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						if(s!=null){
							String nowtime = smt.getTime();
							String testtime = s.getTime();
							 try {  
								 
						            long result = (d.parse(nowtime).getTime() - d.parse(testtime)  
						                    .getTime()) / 3600000;// 当前时间减去测试时间  
						                                        // 这个的除以1000得到秒，相应的60000得到分，3600000得到小时  
						            if(result>1){
						            	if(stopPoint.equals("1")){
						            		List<SiteLine> list = as.getSite(smt.getLine_id());
							            	String site ="";
							            	for(SiteLine sl:list){
							            		SiteMilesTime t = new SiteMilesTime();
							            		t.setCar_number(smt.getCar_number());
							            		t.setLine_id(smt.getLine_id());
							            		t.setSite_flag(sl.getSiteFlag());
							            		t.setSite_state(1);
							            		t.setSiteorder(sl.getSiteorder());
							            		int i2 = as.getMileTime(t);
							            		if(i2>0){
							            			
							            		}else{
							            		site+=sl.getSiteName()+",";	
							            			
							            		}
							            	}
							            	
							            	if(site.length()>0){
							            	site = site.substring(0,site.length()-1);
							            	}
							            	
							            	MonitorRuning mr = new MonitorRuning();
											mr.setCar_id(smt.getCar_id());
											mr.setDepartment_id(smt.getDid());
											mr.setEquipment_id(smt.getBeidouid());
											mr.setMonitor_id(UUIDUtils.getUUID());
											mr.setMonitor_state(0);
											mr.setNot_to_site(site);
											mr.setMonitor_time(smt.getTime());
											mr.setMonitor_type(3);
											 as.addLineMonitor(mr);
											 String userid = as.getUserId(smt.getCar_id());
											 if(userid!=null){
												 //System.out.println("第六步到了");
												 User user = as.getPhoneId(userid);
												 String[] channelIds = {user.getChannelId()};
												 String description ="编号:"+smt.getCar_number()+"您本次线路没有在"
														 +site+"停靠点停靠";
												 if(user.getDevice_type().equals("1")){
													 String msgtitle = "停靠点警告";
													 AndroidPushBatchUniMsg.androidPushBatchMsg(msgtitle,description,channelIds);
												 }else if(user.getDevice_type().equals("2")){
													 IOSPushMsgToSingleDevice.IOSPushBatchMsg(description, user.getChannelId());
												 }
												 
											 }
						            		
						            	}
						            	
						            	as.delSiteMilesTime(smt);
						            	smt.setId(UUIDUtils.getUUID());
						            	as.addMileTime(smt);
						            }
							 } catch (Exception e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}  
						}else{
						}
						
					}else{
						smt.setId(UUIDUtils.getUUID());
						as.addMileTime(smt);
						
					}
					
				}
				//判断是否记录离开站点情况下里程数和时间并作记录,添加站点作业时间报警
				@RequestMapping(params = "method=addMilesTimeLeave")
				public @ResponseBody Boolean addMilesTimeLeave(SiteMilesTime smt,String doing,String runing){
					//System.out.println("first"+smt.getSite_flag());
					smt.setSite_state(1);
					int i = as.getMileTime(smt);
					if(i>0){
						//System.out.println("第一步到了");
						smt.setSite_state(0);
						/*System.out.println(smt.getCar_number());
						System.out.println(smt.getLine_id());
						System.out.println(smt.getSite_flag());
						System.out.println(smt.getSite_state());
						System.out.println(smt.getSiteorder());*/
						int i2 = as.getMileTime(smt);
						if(i2>0){
							//System.out.println("怎么可能会来这里啊");
							return true;
							
						}else{
							//System.out.println("第二步到了");
							smt.setId(UUIDUtils.getUUID());
							as.addMileTime(smt);
							if(smt.getSite_flag()==1){
								if(runing.equals("1")){
									//System.out.println("第三步到了");
									SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd ");
									SimpleDateFormat d = new SimpleDateFormat("HH:mm:ss");
									String LineTime =  as.getClass_line(smt.getLine_id());
									String LineTime2 = smt.getTime();
									String Time1 = LineTime.substring(11);
									Time1 = Time1.substring(0,Time1.length()-2);
									String Time2 = LineTime2.substring(11);
									try {
										Date d1 = d.parse(Time1);
										Date d2 = d.parse(Time2);
										 Calendar cal = Calendar.getInstance();    
									        cal.setTime(d1);    
									        long time1 = cal.getTimeInMillis();                 
									        cal.setTime(d2);    
									        long time2 = cal.getTimeInMillis();         
									        long between_days=(time2-time1)/(1000);
									        long between_days2=(time2-time1)/(1000*60);
									       int xfff = Integer.parseInt(String.valueOf(between_days));
									       String result = change(xfff);
									       if(between_days2>5){//添加报警信息
									    	   Date date2=new Date();
									    	   String timess = date.format(date2);
									    	   			timess+=Time1;
													 JITMonitor jit = new JITMonitor();
													 jit.setJmonitor_id(UUIDUtils.getUUID());
													 jit.setCar_id(smt.getCar_id());
													 jit.setEquipment_id(smt.getBeidouid());
													 jit.setDepartment_id(smt.getDid());
													 jit.setJmonitor_type(1);
													 jit.setJmonitor_time(smt.getTime());
													 jit.setJmonitor_state(0);
													 jit.setTime_plan(timess);
													 jit.setTime_real(smt.getTime());
													 jit.setTime_beyond(result);
													 as.addStayTimeMonitor(jit);
													 String userid = as.getUserId(smt.getCar_id());
													 if(userid!=null){
														// System.out.println("第六步到了");
														 User user = as.getPhoneId(userid);
														 String[] channelIds = {user.getChannelId()};
														 String description ="编号:"+smt.getCar_number()+"您的发车时间超出计划发车时间"
																 +result;
														 if(user.getDevice_type().equals("1")){
															 String msgtitle = "发运时间警告";
															 AndroidPushBatchUniMsg.androidPushBatchMsg(msgtitle,description,channelIds);
														 }else if(user.getDevice_type().equals("2")){
															 IOSPushMsgToSingleDevice.IOSPushBatchMsg(description, user.getChannelId());
														 }
														 	 
														 
													 }
									       }
									} catch (Exception e) {
										e.printStackTrace();
									}
									
								}
							}
							if(smt.getSite_flag()==2){
								if(doing.equals("1")){
									//System.out.println("第四步到了");
									SimpleDateFormat d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
									SiteLine line = new SiteLine();
									line.setClassline_Id(smt.getLine_id());
									line.setSiteFlag(smt.getSite_flag());
									line.setSiteorder(smt.getSiteorder());
									SiteLine sl = as.getSiteStayTime(line);
									Long times = Long.parseLong(sl.getSiteStayTime());
									String timeT1 = smt.getTime();
									smt.setSite_state(1);
									SiteMilesTime smtss = as.getMileTimeModel(smt);
									String timeT2 = smtss.getTime();
									try {
										 long result = (d.parse(timeT1).getTime() - d.parse(timeT2)  
								                    .getTime()) / 60000;
										 long result2 = (d.parse(timeT1).getTime() - d.parse(timeT2)  
								                    .getTime()) / 1000;
										 long xxx = result-times;
										 Integer stay = Integer.parseInt(sl.getSiteStayTime())*60;
										 String stayTime = change(stay);
										 String realTime = change((int)result2);
										 //System.out.println(xxx);
										 if(xxx>5){//节点作业时间报警
											// System.out.println("第五步到了");
											 String yyy = change((int)(xxx*60));
											 JITMonitor jit = new JITMonitor();
											 jit.setJmonitor_id(UUIDUtils.getUUID());
											 jit.setCar_id(smt.getCar_id());
											 jit.setEquipment_id(smt.getBeidouid());
											 jit.setDepartment_id(smt.getDid());
											 jit.setJmonitor_type(3);
											 jit.setJmonitor_time(smt.getTime());
											 jit.setJmonitor_state(0);
											 jit.setTime_stay_plan(stayTime);
											 jit.setTime_stay_real(realTime);
											 jit.setTime_beyond(yyy);
											 as.addStayTimeMonitor(jit);
											 String userid = as.getUserId(smt.getCar_id());
											 if(userid!=null){
												 //System.out.println("第六步到了");
												 User user = as.getPhoneId(userid);
												 String[] channelIds = {user.getChannelId()};
												 String description ="编号:"+smt.getCar_number()+"您在节点的停留时间已经超出计划停留时间"
														 +yyy;
												 if(user.getDevice_type().equals("1")){
													 String msgtitle = "节点作业时间警告";
													 AndroidPushBatchUniMsg.androidPushBatchMsg(msgtitle,description,channelIds);
												 }else if(user.getDevice_type().equals("2")){
													 IOSPushMsgToSingleDevice.IOSPushBatchMsg(description, user.getChannelId());
												 }
													 
												 
											 }
											 
										 }
									} catch (Exception e) {
										// TODO: handle exception
										e.printStackTrace();
									}
									
								}
								
							}
							
							
							return false;
							
						}
					}else{
						return false;
					}
				}
		//添加数据库的线路信息状态(到达或出去)
				@RequestMapping(params = "method=addSiteState")
				public @ResponseBody Boolean addSiteState(SiteState ss){
					//System.out.println(ss.getSite_time_this());
					ss.setId(UUIDUtils.getUUID());
					int i = as.addSiteState(ss);
					if(i>0){
						return true;
					}else{
						return false;
					}
				}
				/*//计算里程数是否超出
				@RequestMapping(params = "method=jisuanMiles")
				public @ResponseBody Boolean jisuanMiles(SiteMilesTime ss){
					SiteMilesTime hh = as.getStartSite(ss);
					if(hh!=null){
						Double b  = ss.getMiles()-hh.getMiles();
						String d  = as.getshijiMiles(ss.getLine_id());
						Double b2 = Double.parseDouble(d);
						Double xxx = b-b2;
						String gl = String.valueOf(xxx);
						if(xxx>2){
							MonitorRuning mr = new MonitorRuning();
							mr.setCar_id(ss.getCar_id());
							mr.setDepartment_id(ss.getDid());
							mr.setEquipment_id(ss.getBeidouid());
							mr.setMonitor_id(UUIDUtils.getUUID());
							mr.setMonitor_plan_range(d);
							mr.setMonitor_real_range(String.valueOf(b));
							mr.setMonitor_state(0);
							mr.setMonitor_time(ss.getTime());
							mr.setMonitor_type(2);
							mr.setOut_of_range(gl);
							 as.addLineMonitor(mr);
							 String userid = as.getUserId(ss.getCar_id());
							 if(userid!=null){
								 //System.out.println("第六步到了");
								 String msgtitle = "行驶距离警告";
								 String description ="编号:"+ss.getCar_number()+"您本次线路的行驶距离已经超出计划行驶距离"
										 +gl+"公里";
								 System.out.println(description);
								 String phoneid = as.getPhoneId(userid);
								 String[] channelIds = {phoneid};
								 try {
									 AndroidPushBatchUniMsg.androidPushBatchMsg(msgtitle,description,channelIds);	
								} catch (Exception e) {
									// TODO: handle exception
									e.printStackTrace();
								}
							 }
						}else{
							
						}
					}
						return false;
				}*/
				
				//更新数据库的线路信息状态(到达或出去)
				@RequestMapping(params = "method=updateSiteState")
				public @ResponseBody Boolean updateSiteState(SiteState ss){
					SiteState s = as.getOneSiteState(ss.getCar_id(),ss.getLine_id_this());
					ss.setId(s.getId());
					ss.setLine_id_last(s.getLine_id_this());
					ss.setSite_flag_last(s.getSite_flag_this());
					ss.setSite_id_last(s.getSite_id_this());
					ss.setSite_state_last(s.getSite_state_this());
					ss.setSite_time_last(s.getSite_time_this());
					ss.setSiteorder_last(s.getSiteorder_this());
					int i = as.updateSiteState(ss);
					if(i>0){
						return true;
					}else{
						return false;
					}
				}
	//获取该线路站点信息
	@RequestMapping(params = "method=getSite")
	public @ResponseBody List<SiteLine> getSite(String id){
		List<SiteLine> list = as.getSite(id);
		
		return list;
		
	}
	public static String change(int second){  
        int h = 0;  
        int d = 0;  
        int s = 0;  
        int temp = second%3600;  
             if(second>3600){  
               h= second/3600;  
                    if(temp!=0){  
               if(temp>60){  
               d = temp/60;  
            if(temp%60!=0){  
               s = temp%60;  
            }  
            }else{  
               s = temp;  
            }  
           }  
          }else{  
              d = second/60;  
           if(second%60!=0){  
              s = second%60;  
           }  
          }  
             String xx="";
             if(h!=0){
            	 xx+=h+"时";
             }
             if(d!=0){
            	 xx+=d+"分";
             } 
             if(s!=0){
            	 xx+=s+"秒";
             }
          return xx;
       }  
}
