package com.jy.common;



import java.util.*;
import java.text.*;

public class TimeBean {

	public static String transTime(String s) {

		StringBuffer time = new StringBuffer();

		time.append(s.substring(0, 4)).append("年").append(s.substring(4, 6))
				.append("月").append(s.substring(6, 8)).append("日").append(
						s.substring(8, 10)).append(":").append(
						s.substring(10, 12)).append(":").append(
						s.substring(12, 14));

		return time.toString();
	}

	public static String transTime2(String s) {

		StringBuffer time = new StringBuffer();

		time.append(s.substring(0, 4)).append("年").append(s.substring(4, 6))
				.append("月").append(s.substring(6, 8)).append("日").append(
						s.substring(8, 10)).append("时").append(
						s.substring(10, 12)).append("分").append(
						s.substring(12, 14)).append("秒");

		return time.toString();
	}

	public static String transTime0(String s) {

		StringBuffer time = new StringBuffer();

		time.append(s.substring(0, 4)).append("年").append(s.substring(4, 6))
				.append("月").append(s.substring(6, 8)).append("日").append(
						s.substring(8, 10)).append("时").append(
						s.substring(10, 12)).append("分");

		return time.toString();
	}

	public static String transTime3(String s) {

		StringBuffer time = new StringBuffer();

		time.append(s.substring(0, 4)).append("年").append(s.substring(4, 6))
				.append("月").append(s.substring(6, 8)).append("日").append(
						s.substring(8, 10)).append("时");

		return time.toString();
	}

	public static String transTime4(String s) {

		StringBuffer time = new StringBuffer();

		time.append(s.substring(0, 4)).append("-").append(s.substring(4, 6))
				.append("-").append(s.substring(6, 8)).append("-").append(
						s.substring(8, 10)).append(":").append(
						s.substring(10, 12)).append(":").append(
						s.substring(12, 14));

		return time.toString();
	}

	public static String transTime5(String s) {

		StringBuffer time = new StringBuffer();

		time.append(s.substring(0, 4)).append("年").append(s.substring(4, 6))
				.append("月").append(s.substring(6, 8)).append("日");

		return time.toString();
	}

	public static String getCurrentDate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(new Date());
	}
	
	public static String getDateToString(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		return sdf.format(date);
	}
	public static Date getStringToDate(String str){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		Date date=new Date();
		try {
			date=sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return date;
	}
	
	public static String getCurrentTime() {
		return getCurrentDate();
	}

	public static String getCurrentTime2() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日HH时mm分ss秒");
		return sdf.format(new Date());
	}

	public static String getCurrentWeek(Date d) {

		SimpleDateFormat sdf = new SimpleDateFormat("E");
		return sdf.format(d);
	}

	public static int getCurrentHour(Date d) {
		return d.getHours();
	}

	public static int getCurrentMinute(Date d) {
		return d.getMinutes();
	}
}
