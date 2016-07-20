package com.baidu.push.msg;

import net.sf.json.JSONObject;

import com.baidu.yun.core.log.YunLogEvent;
import com.baidu.yun.core.log.YunLogHandler;
import com.baidu.yun.push.auth.PushKeyPair;
import com.baidu.yun.push.client.BaiduPushClient;
import com.baidu.yun.push.constants.BaiduPushConstants;
import com.baidu.yun.push.exception.PushClientException;
import com.baidu.yun.push.exception.PushServerException;
import com.baidu.yun.push.model.PushMsgToAllRequest;
import com.baidu.yun.push.model.PushMsgToAllResponse;

public class AndroidPushMsgToAll {
	public static void androidPushAllMsg(String msgtitle,String content)
			throws PushClientException,PushServerException {
		// 1. get apiKey and secretKey from developer console
		PushKeyPair pair = new PushKeyPair(BaiduPushConstants.ANDROIDAPIKEY,BaiduPushConstants.ANDROIDSECRETKEY);

		// 2. build a BaidupushClient object to access released interfaces
		BaiduPushClient pushClient = new BaiduPushClient(pair,
				BaiduPushConstants.CHANNEL_REST_URL);

		// 3. register a YunLogHandler to get detail interacting information
		// in this request.
		pushClient.setChannelLogHandler(new YunLogHandler() {
			public void onHandle(YunLogEvent event) {
				System.out.println(event.getMessage());
			}
		});

		try {
			JSONObject notification = new JSONObject();
			notification.put("title", msgtitle);
			notification.put("description",content);
			// 4. specify request arguments
			PushMsgToAllRequest request = new PushMsgToAllRequest()
	
					.addMsgExpires(new Integer(3600)).addMessageType(1)
					.addMessage(notification.toString()) //娣诲姞閫忎紶娑堟伅
/*					.addSendTime(System.currentTimeMillis() / 1000 + 120) // 璁剧疆瀹氭椂鎺ㄩ�鏃堕棿锛屽繀闇�秴杩囧綋鍓嶆椂闂翠竴鍒嗛挓锛屽崟浣嶇.瀹炰緥2鍒嗛挓鍚庢帹閫�					
*/					.addDeviceType(3);
			// 5. http request
			PushMsgToAllResponse response = pushClient.pushMsgToAll(request);
			// Http璇锋眰缁撴灉瑙ｆ瀽鎵撳嵃
			System.out.println("msgId: " + response.getMsgId() + ",sendTime: "
					+ response.getSendTime() + ",timerId: "
					+ response.getTimerId());
		} catch (PushClientException e) {
			if (BaiduPushConstants.ERROROPTTYPE) {
				throw e;
			} else {
				e.printStackTrace();
			}
		} catch (PushServerException e) {
			if (BaiduPushConstants.ERROROPTTYPE) {
				throw e;
			} else {
				System.out.println(String.format(
						"requestId: %d, errorCode: %d, errorMessage: %s",
						e.getRequestId(), e.getErrorCode(), e.getErrorMsg()));
			}
		}
	}
}
