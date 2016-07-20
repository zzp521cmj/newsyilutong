package com.jy.common;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;
import java.util.TreeMap;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.jy.service.EquipmentManService;

public class BaiduWeather {
	ApplicationContext ac=new ClassPathXmlApplicationContext(new String[] {"classpath:mybatis-config.xml","classpath:spring.xml"});
	
	private EquipmentManService equipmentManService;
	Logger log=Logger.getLogger(BaiduWeather.class);
	/**
	 * 生成车表
	 * @param dbName 数据库名
	 */
	public void createCarTable(String dbName){
		 equipmentManService=ac.getBean(EquipmentManService.class);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		DateFormat df2 = new SimpleDateFormat("MM-dd");
		try {
			Date day = df.parse(df.format(new Date()));
			Calendar dayc1 = new GregorianCalendar();
			dayc1.setFirstDayOfWeek(Calendar.MONDAY);
			dayc1.setTime(day);
			dayc1.set(Calendar.DAY_OF_WEEK,dayc1.SUNDAY);
			System.out.println(df2.format(dayc1.getTime()));
			if(df2.format(dayc1.getTime()).equals("12-31")){
				dayc1.add(dayc1.DAY_OF_YEAR, 1);
			}
			String start_date=df.format(dayc1.getTime());
			dayc1.add(dayc1.YEAR, 1);
			String end_date=dayc1.get(dayc1.YEAR)+"-01-01";
			System.out.println(start_date+"\t"+end_date);
			Date_start_end(start_date,end_date,dbName);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			log.error("error:--建表失败"+e);
		}
	}
	/**
	 *   按时间生成表
	 * @param start_date
	 * @param end_date
	 * @param dbName
	 * @param type 1生成停留点表   2生成车辆表
	 * @throws ParseException
	 */
	public void Date_start_end(final String start_date,  final String end_date,final String dbName) throws ParseException{
		equipmentManService=ac.getBean(EquipmentManService.class);
		   Calendar dayc1 = new GregorianCalendar();
		   Calendar dayc2 = new GregorianCalendar();
		   DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		   Date daystart = df.parse(start_date); //按照yyyy-MM-dd格式转换为日期
		   Date dayend = df.parse(end_date);
		   dayc1.setTime(daystart); //设置calendar的日期
		   dayc2.setTime(dayend);
		 int num=0;
		for (; dayc1.compareTo(dayc2) <= 0;) {   //dayc1在dayc2之前就循环
			System.out.println("循环的"+dayc1.getTime());
			String name=BaiduWeather.getTableName((df.format(dayc1.getTime())));
			System.out.println(name);
			int i=0;
			i=equipmentManService.createEquTable(dbName+"."+name);
/*			i=equipmentManService.createTingLiu(dbName+".stop"+name);
*/		 	dayc1.add(Calendar.DAY_OF_YEAR, 1);  //加1天
		}
		System.out.println("建表完成");
	}
	public static Map<String,String> dateFen(String startDate,String endDate){
		Map<String,String> datefen=new TreeMap<String,String>();
		datefen.put(getTableName(startDate),"");
		datefen.put(getTableName(endDate),"");
		return datefen;
	}
	
	public static String getTableName(String todate) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		if (todate == null) {
			todate = format.format(new Date());
		}
		try {
			date = format.parse(todate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		calendar.setTime(date);
		
		calendar.set(Calendar.DAY_OF_WEEK,calendar.SUNDAY);
		todate=format.format(calendar.getTime());
		
		String tableName = "";
		int year = 0;
		int month = 0;
		month = calendar.get(Calendar.MONTH);
		year = calendar.get(Calendar.YEAR);
		calendar.set(Calendar.DAY_OF_WEEK,calendar.SUNDAY);
		System.out.println(format.format(calendar.getTime()));
		int num=calendar.get(Calendar.WEEK_OF_YEAR);
		return year + "" + ((month+1)<10 ? "0" + (month+1) : (month+1)) + ""
				+ (num<10?"0"+num:num);
	}
	
	
	/**
	 * @param urlAll
	 *            :请求接口
	 * @param httpArg
	 *            :参数
	 * @return 返回结果
	 */
	public static String request(String httpUrl, String httpArg) {
	    BufferedReader reader = null;
	    String result = null;
	    StringBuffer sbf = new StringBuffer();
	    httpUrl = httpUrl + "?" + httpArg;
	    try {
	        URL url = new URL(httpUrl);
	        HttpURLConnection connection = (HttpURLConnection) url
	                .openConnection();
	        connection.setRequestMethod("GET");
	        // 填入apikey到HTTP header
	        connection.setRequestProperty("apikey",  "6c6cc6d72f2aa8ad833895302602e676");
	        connection.connect();
	        InputStream is = connection.getInputStream();
	        reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
	        String strRead = null;
	        while ((strRead = reader.readLine()) != null) {
	            sbf.append(strRead);
	            sbf.append("\r\n");
	        }
	        reader.close();
	        result = sbf.toString();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	public static String getWeatch(String city) {
		String httpUrl = "http://apis.baidu.com/heweather/weather/free";
		String httpArg = "city="+city;
		
		String jsonResult = request(httpUrl, httpArg);
		JSONObject json=new JSONObject();
		System.out.println(jsonResult);
		JSONObject json1=JSONObject.fromObject(JSONObject.fromObject(JSONArray.fromObject(JSONObject.fromObject(jsonResult).getString("HeWeather data service 3.0")).get(0)).getString("now"));
		json.put("txt",JSONObject.fromObject(json1.get("cond")).get("txt"));
		json.put("tmp",json1.get("tmp"));
		System.out.println(json);
		return json.toString();
	}
	/*{"HeWeather data service 3.0":
		[{
		"aqi":{
			"city":{
				"aqi":"28","co":"1","no2":"31","o3":"44","pm10":"15","pm25":"9","qlty":"�?,"so2":"10"
			}
		 },
		 "basic":{
			 "city":"北京","cnty":"中国","id":"CN101010100","lat":"39.904000","lon":"116.391000",
			 "update":{
			 	"loc":"2016-02-04 09:51","utc":"2016-02-04 01:51"
			  }
		 },
		 "daily_forecast":[
		    {"astro":
		    	{"sr":"07:20","ss":"17:36"},
		     "cond":{"code_d":"101","code_n":"101","txt_d":"多云","txt_n":"多云"},
		     "date":"2016-02-04","hum":"14","pcpn":"0.0","pop":"0","pres":"1032",
		           "tmp":{"max":"4","min":"-5"},"vis":"10","wind":{"deg":"343","dir":"无持续风�?,"sc":"微风","spd":"1"}
		     },
		     {"astro":{"sr":"07:19","ss":"17:37"},
		    	 "cond":{"code_d":"100","code_n":"100","txt_d":"�?,"txt_n":"�?},
		    	 "date":"2016-02-05","hum":"18","pcpn":"0.0","pop":"0","pres":"1032",
		    	 "tmp":{"max":"4","min":"-5"},"vis":"10","wind":{"deg":"321","dir":"北风","sc":"3-4","spd":"16"}
		     },{"astro":{"sr":"07:18","ss":"17:38"},"cond":{"code_d":"100","code_n":"101","txt_d":"�?,"txt_n":"多云"},
		     	"date":"2016-02-06","hum":"13","pcpn":"0.0","pop":"0","pres":"1029","tmp":{"max":"6","min":"-6"},
		     	"vis":"10","wind":{"deg":"309","dir":"无持续风�?,"sc":"微风","spd":"6"}},
		     {"astro":{"sr":"07:17","ss":"17:39"},
		     	"cond":{"code_d":"101","code_n":"100","txt_d":"多云","txt_n":"�?}
		     	,"date":"2016-02-07","hum":"14","pcpn":"0.0","pop":"0","pres":"1022",
		     	"tmp":{"max":"7","min":"-5"},"vis":"10","wind":{"deg":"313","dir":"无持续风�?,"sc":"微风","spd":"4"}},
		     {"astro":{"sr":"07:16","ss":"17:41"},"cond":{"code_d":"100","code_n":"100","txt_d":"�?,"txt_n":"�?},
		     	"date":"2016-02-08","hum":"17","pcpn":"0.0","pop":"0","pres":"1019","tmp":{"max":"9","min":"-3"},
		     	"vis":"10","wind":{"deg":"204","dir":"无持续风�?,"sc":"微风","spd":"6"}},
		     {"astro":{"sr":"07:14","ss":"17:42"},"cond":{"code_d":"100","code_n":"100","txt_d":"�?,"txt_n":"�?},"date":"2016-02-09","hum":"20",
		     "pcpn":"0.0","pop":"0","pres":"1014","tmp":{"max":"10","min":"-3"},"vis":"10","wind":{"deg":"128","dir":"无持续风�?,"sc":"微风","spd":"1"}},
		     {"astro":{"sr":"07:13","ss":"17:43"},"cond":{"code_d":"101","code_n":"104","txt_d":"多云","txt_n":"�?},"date":"2016-02-10","hum":"26",
		     "pcpn":"0.0","pop":"30","pres":"1011","tmp":{"max":"6","min":"-1"},"vis":"10","wind":{"deg":"83","dir":"无持续风�?,"sc":"微风","spd":"7"}}
		     ],
		     "hourly_forecast":[{"date":"2016-02-04 10:00","hum":"21","pop":"0","pres":"1034","tmp":"0","wind":{"deg":"5","dir":"北风","sc":"微风","spd":"13"}}
		     ,{"date":"2016-02-04 13:00","hum":"16","pop":"0","pres":"1032","tmp":"3","wind":{"deg":"231","dir":"西南�?,"sc":"微风","spd":"13"}},
		     {"date":"2016-02-04 16:00","hum":"18","pop":"0","pres":"1031","tmp":"3","wind":{"deg":"333","dir":"西北�?,"sc":"微风","spd":"10"}},
		     {"date":"2016-02-04 19:00","hum":"23","pop":"0","pres":"1032","tmp":"0","wind":{"deg":"319","dir":"西北�?,"sc":"微风","spd":"11"}},
		     {"date":"2016-02-04 22:00","hum":"28","pop":"0","pres":"1033","tmp":"-2","wind":{"deg":"326","dir":"西北�?,"sc":"微风","spd":"14"}}],
		     "now":{"cond":{"code":"100","txt":"�?},"fl":"-6","hum":"21","pcpn":"0","pres":"1033","tmp":"1","vis":"10","wind":{"deg":"20","dir":"东北�?,"sc":"5-6","spd":"33"}},"status":"ok","suggestion":{"comf":{"brf":"较不舒�?","txt":"白天天气晴好，但仍会使您感觉偏冷，不很舒适，请注意�?时添加衣物，以防感冒�?},"cw":{"brf":"较�?�?,"txt":"较�?宜洗车，未来�?��无雨，风力较小，擦洗�?��的汽车至少能保持�?���?},"drsg":{"brf":"�?,"txt":"天气冷，建议�?��服�?羽绒服�?皮夹克加羊毛衫等冬季服装。年老体弱�?宜着厚棉衣�?冬大衣或厚羽绒服�?},"flu":{"brf":"易发","txt":"相对于今天将会出现大幅度降温，易发生感冒，请注意适当增加衣服，加强自我防护避免感冒�?"},"sport":{"brf":"较不�?,"txt":"天气较好，但考虑天气寒冷，推荐您进行室内运动，户外运动时请注意保暖并做好准备活动�?},"trav":{"brf":"适宜","txt":"天气较好，同时又有微风伴您一路同行�?虽会让人感觉有点凉，但仍适宜旅游，可不要错过机会呦！"},"uv":{"brf":"�?��","txt":"属弱紫外线辐射天气，无需特别防护。若长期在户外，建议涂擦SPF�?-12之间的防晒护肤品�?}}}]}
*/
}
