package com.jy.quartz;

import java.text.SimpleDateFormat;
import java.util.Date;


import javax.annotation.Resource;

import com.jy.common.UUIDUtils;
import com.jy.service.ReceiptBaobInfoService;

public class TimerDemo{
	@Resource
	private ReceiptBaobInfoService csi;
	
	 public  void demoTime() {
		 SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
         String date =format.format(new Date());
         int num= csi.outShi(date);
         csi.addDelivery(UUIDUtils.getUUID(),num+"",date);		 
         System.out.println(date+"签收统计量是"+num);
	 }
	
}
