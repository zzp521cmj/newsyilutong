package com.jy.quartz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;


import com.jy.common.DateUtils;
import com.jy.model.PostClassline;
import com.jy.model.Taskonlineimport;
import com.jy.service.QuartzService;
import com.jy.service.TaskonlineimportService;

public class MyJob {
	@Resource
	private QuartzService quartzService;
	@Resource
	private TaskonlineimportService taskonlineimportService;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
	
	public void work() {
		System.out.println("date:" + new Date().toString());
		List<PostClassline> list=quartzService.getPostClassLineInfo();
		for (PostClassline postClassline : list) {
			switch (postClassline.getRegular_type()) {
			//每天
			case 1:
				if(postClassline.getDays()==0){
					//结束类型 1、永不结束 2、发生次数 3、到达某天&&postClassline.getEffective_date()
					try {
						if(postClassline.getEnd_type()==1
								&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
							quartzService.insertPostClassLineInfo(postClassline);
						}else if(postClassline.getEnd_type()==2){
							int count=quartzService.getPostLineCodeCount(postClassline.getClasslineId());
							if(count<postClassline.getEnd_num()
								&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
								quartzService.insertPostClassLineInfo(postClassline);
							}
						}else if(postClassline.getEnd_type()==3){
								if(daysBetween(sdf.parse(postClassline.getEnd_date()),new Date())>0
										&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
									quartzService.insertPostClassLineInfo(postClassline);
								}
						}
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}else{
					try {
						if(daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())%postClassline.getDays()==0){
							//结束类型 1、永不结束 2、发生次数 3、到达某天
							if(postClassline.getEnd_type()==1
									&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
								quartzService.insertPostClassLineInfo(postClassline);
							}else if(postClassline.getEnd_type()==2
									&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
								int count=quartzService.getPostLineCodeCount(postClassline.getClasslineId());
								if(count<postClassline.getEnd_num()){
									quartzService.insertPostClassLineInfo(postClassline);
								}
							}else if(postClassline.getEnd_type()==3){
									if(daysBetween(sdf.parse(postClassline.getEnd_date()),new Date())>0
											&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
										quartzService.insertPostClassLineInfo(postClassline);
									}
								
							}
						}
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				break;
			//每周
			case 0:
				String [] str=postClassline.getRepetition_period().split(",");
				int nowweek=getWeekOfDate(new Date());
				if(str!=null){
					for (int i = 0; i < str.length; i++) {
						if(Integer.parseInt(str[i])==nowweek){
							//结束类型 1、永不结束 2、发生次数 3、到达某天
							try {
								if(postClassline.getEnd_type()==1
										&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
									quartzService.insertPostClassLineInfo(postClassline);
								}else if(postClassline.getEnd_type()==2){
									int count=quartzService.getPostLineCodeCount(postClassline.getClasslineId());
										if(count<postClassline.getEnd_num()
												&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
											quartzService.insertPostClassLineInfo(postClassline);
										}
								}else if(postClassline.getEnd_type()==3){
										if(daysBetween(sdf.parse(postClassline.getEnd_date()),new Date())>0
												&&daysBetween(sdf.parse(postClassline.getEffective_date()),new Date())>=0){
											quartzService.insertPostClassLineInfo(postClassline);
										}
								}
							} catch (ParseException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				}
				break;
			default:
				System.out.println("都不满足");
				break;
			}
		}
		System.out.println("date:" + new Date().toString());
   }
	public static void main(String[] args) {
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 

		try {
			System.out.println(daysBetween(sdf.parse("2015-06-11"),new Date()));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
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
			// TODO Auto-generated catch block
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
    public static int getWeekOfDate(Date dt) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(dt);
        int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
        if (w < 0)
            w = 0;
        return w;
    }
}
