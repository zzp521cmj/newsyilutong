package com.jy.action;
/**
 * @author hqh
 * PS:数据处理
 * createtime：2015-7-14
 * update：
 * 
 */
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;







import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jy.common.UUIDUtils;
import com.jy.model.Monitor;
import com.jy.model.Truck;
import com.jy.service.DataHandlingService;

@Controller
@RequestMapping(value = "/dataHandling.do")
public class DataHandlingController {
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
	@Resource
	private DataHandlingService dataHandlingService;
	
	@RequestMapping(params="method=getDate")
	public String getData(String json){
		System.out.println(json);
		//当json为1的时候，数据传输
		String s="";
		List<String> carnos=new ArrayList<String>();
		try {
			if(json!=null){
			s=URLDecoder.decode(json, "utf-8");
			}
			System.out.println(s);
			//数据传输
			if(s.equals("[{\"params\":\"1\"}]")||s=="[{\"params\":\"1\"}]"){//条件符合
				try {
					List<Monitor>monitorList=dataHandlingService.getData();//读取临时表所有数据
					dataHandlingService.deletelscarsinfo();//删除临时表
					List<Truck>carnolist=dataHandlingService.getcarlist();//获取车牌号id的集合
					for (Monitor monitor : monitorList) {
						monitor.setMonitorid(UUIDUtils.getUUID());
						String carno=monitor.getCarid();
						carnos.add(carno);
						if(monitor.getGpsstate().equals("0.0")){
							monitor.setState("2");
						}else{
							monitor.setState("1");
						}
						for (int i = 0; i < carnolist.size(); i++) {
							if(carnolist.get(i).getPlateNumber().equals(carno)){
								monitor.setCarno(carnolist.get(i).getCarId());
								monitor.setDepartmentid(carnolist.get(i).getInstitutionId()+"");
								
							}
						}
					}
					//删除表中匹配的数据然后执行保存操作
					int k=dataHandlingService.deletelmdcarsinfo(carnos);
					System.out.println("删除+"+k);
					int j=dataHandlingService.savecarlminfo(monitorList);
					System.out.println("保存了"+j);
					//开始保存操作--保存到week表中
					int l=dataHandlingService.savecarsinfo(monitorList);
					System.out.println("保存了"+l);
					/*for (Monitor monitor : monitorList) {
						System.out.println(monitor.getCarid());
						System.out.println(monitor.getGpsstate());
					}*/
					for (int i = 0; i < carnos.size(); i++) {
						System.out.println(carnos.get(i)+"应该删除的车牌号");
					}
				} catch (Exception e) {
					e.printStackTrace();
					return "";
				}
			}else{
				return "";
			}
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "";
	}
	//查询week表中的数据
	/*int i=dataHandlingService.selectcarsinfocount();
	if(i>1000000){//查询week表数据多少当大于100w时执行清空此表，并把表数据保存到jy_monitor_data_month
		INSERT INTO jy_monitor_data_week SELECT DISTINCT * FROM jy_monitor_data//执行数据转移的sql
	}*/
	 /**  
     * 计算两个日期之间相差的天数  
     * @param smdate 较小的时间 
     * @param bdate  较大的时间 
     * @return 相差天数 
     * @throws ParseException  
     */    
    public static int daysBetween(Date smdate,Date bdate)
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        try {
			smdate=sdf.parse(sdf.format(smdate));
			 bdate=sdf.parse(sdf.format(bdate));  
		} catch (ParseException e) {
			e.printStackTrace();
		}  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(smdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(bdate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
    } 
}
