package com.jy.thread;

import org.apache.log4j.Logger;

import com.baidu.push.msg.AndroidPushBatchUniMsg;
import com.baidu.push.msg.IOSPushMsgToSingleDevice;


public class IOSMsgThread implements Runnable {
	private static Logger log = Logger.getLogger(IOSMsgThread.class);

	private String message;
	private String[] channelIdNo;
	public IOSMsgThread() {
		super();
		// TODO Auto-generated constructor stub
	}

	public IOSMsgThread(String messages,String[] channelIdNos) {
		channelIdNo=new String[channelIdNos.length];
		this.message=messages;
		this.channelIdNo=channelIdNos;		
		// TODO Auto-generated constructor stub
	}

	public void run() {
		
			try {
				
					for(int i=0;i<channelIdNo.length;i++){
						IOSPushMsgToSingleDevice.IOSPushBatchMsg(message, channelIdNo[i]);
					}
				
			} catch (Exception e) {
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
