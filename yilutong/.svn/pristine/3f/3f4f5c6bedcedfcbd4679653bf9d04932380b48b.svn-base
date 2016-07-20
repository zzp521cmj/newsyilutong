package com.jy.quartz;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;




import com.jy.model.Maps;
import com.jy.service.DataSetService;

public class DataSet {
	@Resource
	private DataSetService dataSetService;
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
	
	public void dataset() {
		try {
			List<Maps>mlist=dataSetService.updatestatefromtime();
			List<String>carnos=new ArrayList<String>();
			for (Maps maps : mlist) {
				if(null!=maps.getCarno()&&maps.getTimesmin()>30){//超过30分钟没有接收到新的数据-即更改为离线状态
					carnos.add(maps.getCarno());//记录所有超时的车辆
				}
			}
			//根据所得的车牌号进行更新gps状态的操作
			int i=0;
			if(carnos!=null&&carnos.size()>0){
				i=dataSetService.updatestatebycarnos(carnos);
			}
			if(i==0){
				System.out.println("没有");
			}else{
				System.out.println("更新了"+i+"条记录");
			}
		} catch (Exception e) {
			
		}
   }
}
