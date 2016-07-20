package com.jy.common;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

/**
 * 
 * 功能描述：
 * 
 * @author Administrator
 * @Date Jul 19, 2008
 * @Time 9:47:53 AM
 * @version 1.0
 */
public class DateUtils {

	public static Date date = null;

	public static DateFormat dateFormat = null;

	public static Calendar calendar = null;
    //http响应头Expire属性时间格式   
    public static final String HTTP_RESPONSE_DATE_HEADER = "EEE, dd MMM yyyy HH:mm:ss zzz";   
           
    //http响应头Expire属性时间格式工具   
    public static final SimpleDateFormat responseHeaderFormat = new SimpleDateFormat(HTTP_RESPONSE_DATE_HEADER,Locale.US);   
  
    static{   
        responseHeaderFormat.setTimeZone(TimeZone.getTimeZone("GMT"));   
    }  
	/**
	 * 功能描述：格式化日期
	 * 
	 * @param dateStr
	 *            String 字符型日期
	 * @param format
	 *            String 格式
	 * @return Date 日期
	 */
	public static Date parseDate(String dateStr, String format) {
		try {
			dateFormat = new SimpleDateFormat(format);
			String dt = dateStr.replaceAll("-", "/");
			if ((!dt.equals("")) && (dt.length() < format.length())) {
				dt += format.substring(dt.length()).replaceAll("[YyMmDdHhSs]",
						"0");
			}
			date = (Date) dateFormat.parse(dateStr);
		} catch (Exception e) {
		}
		return date;
	}

	/**
	 * 功能描述：格式化日期
	 * 
	 * @param dateStr
	 *            String 字符型日期：YYYY-MM-DD 格式
	 * @return Date
	 */
	public static Date parseDate(String dateStr) {
		return parseDate(dateStr, "yyyy/MM/dd");
	}

	/**
	 * 功能描述：格式化输出日期
	 * 
	 * @param date
	 *            Date 日期
	 * @param format
	 *            String 格式
	 * @return 返回字符型日期
	 */
	public static String format(Date date, String format) {
		String result = "";
		try {
			if (date != null) {
				dateFormat = new SimpleDateFormat(format);
				result = dateFormat.format(date);
			}
		} catch (Exception e) {
		}
		return result;
	}

	/**
	 * 功能描述：
	 * 
	 * @param date
	 *            Date 日期
	 * @return
	 */
	public static String format(Date date) {
		return format(date, "yyyy/MM/dd");
	}

	/**
	 * 功能描述：返回年份
	 * 
	 * @param date
	 *            Date 日期
	 * @return 返回年份
	 */
	public static int getYear2(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.YEAR);
	}

	/**
	 * 功能描述：返回月份
	 * 
	 * @param date
	 *            Date 日期
	 * @return 返回月份
	 */
	public static int getMonth2(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MONTH) + 1;
	}

	/**
	 * 功能描述：返回日份
	 * 
	 * @param date
	 *            Date 日期
	 * @return 返回日份
	 */
	public static int getDay(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * 功能描述：返回小时
	 * 
	 * @param date
	 *            日期
	 * @return 返回小时
	 */
	public static int getHour(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.HOUR_OF_DAY);
	}

	/**
	 * 功能描述：返回分钟
	 * 
	 * @param date
	 *            日期
	 * @return 返回分钟
	 */
	public static int getMinute(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MINUTE);
	}

	/**
	 * 返回秒钟
	 * 
	 * @param date
	 *            Date 日期
	 * @return 返回秒钟
	 */
	public static int getSecond(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.SECOND);
	}

	/**
	 * 功能描述：返回毫秒
	 * 
	 * @param date
	 *            日期
	 * @return 返回毫秒
	 */
	public static long getMillis(Date date) {
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.getTimeInMillis();
	}

	/**
	 * 功能描述：返回字符型日期
	 * 
	 * @param date
	 *            日期
	 * @return 返回字符型日期 yyyy/MM/dd 格式
	 */
	public static String getDate(Date date) {
		return format(date, "yyyy/MM/dd");
	}

	/**
	 * 功能描述：返回字符型时间
	 * 
	 * @param date
	 *            Date 日期
	 * @return 返回字符型时间 HH:mm:ss 格式
	 */
	public static String getTime(Date date) {
		return format(date, "HH:mm:ss");
	}

	/**
	 * 功能描述：返回字符型日期时间
	 * 
	 * @param date
	 *            Date 日期
	 * @return 返回字符型日期时间 yyyy/MM/dd HH:mm:ss 格式
	 */
	public static String getDateTime(Date date) {
		return format(date, "yyyy/MM/dd HH:mm:ss");
	}

	/**
	 * 功能描述：日期相加
	 * 
	 * @param date
	 *            Date 日期
	 * @param day
	 *            int 天数
	 * @return 返回相加后的日期
	 */
	public static Date addDate(Date date, int day) {
		calendar = Calendar.getInstance();
		long millis = getMillis(date) + ((long) day) * 24 * 3600 * 1000;
		calendar.setTimeInMillis(millis);
		return calendar.getTime();
	}

	/**
	 * 功能描述：日期相减
	 * 
	 * @param date
	 *            Date 日期
	 * @param date1
	 *            Date 日期
	 * @return 返回相减后的日期
	 */
	public static int diffDate(Date date, Date date1) {
		return (int) ((getMillis(date) - getMillis(date1)) / (24 * 3600 * 1000));
	}

	
	/**
	 * 功能描述：取得指定月份的第一天
	 * 
	 * @param strdate
	 *            String 字符型日期
	 * @return String yyyy-MM-dd 格式
	 */
	public static String getMonthBegin(String strdate) {
		date = parseDate(strdate);
		return format(date, "yyyy-MM") + "-01";
	}

	/**
	 * 功能描述：取得指定月份的最后一天
	 * 
	 * @param strdate
	 *            String 字符型日期
	 * @return String 日期字符串 yyyy-MM-dd格式
	 */
	public static String getMonthEnd(String strdate) {
		date = parseDate(getMonthBegin(strdate));
		calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.MONTH, 1);
		calendar.add(Calendar.DAY_OF_YEAR, -1);
		return formatDate(calendar.getTime());
	}

	/**
	 * 功能描述：常用的格式化日期
	 * 
	 * @param date
	 *            Date 日期
	 * @return String 日期字符串 yyyy-MM-dd格式
	 */
	public static String formatDate(Date date) {
		return formatDateByFormat(date, "yyyy-MM-dd");
	}

	/**
	 * 功能描述：以指定的格式来格式化日期
	 * 
	 * @param date
	 *            Date 日期
	 * @param format
	 *            String 格式
	 * @return String 日期字符串
	 */
	public static String formatDateByFormat(Date date, String format) {
		String result = "";
		if (date != null) {
			try {
				SimpleDateFormat sdf = new SimpleDateFormat(format);
				result = sdf.format(date);
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		return result;
	}
	/**  
     * 某个时间点的下个月的第一天  
     * @param day  
     * @return  
     */  
    public static Date firstDayInNextMonth(Date day){   
        Calendar c = Calendar.getInstance();   
        c.setTime(day);   
        c.set(Calendar.MONTH, c.get(Calendar.MONTH)+1);   
        c.set(Calendar.DAY_OF_MONTH, 1);   
        c.set(Calendar.HOUR_OF_DAY, 0);   
        c.set(Calendar.MINUTE, 0);   
        c.set(Calendar.SECOND, 0);   
        return c.getTime();   
    }   
  
    /**  
     * 获取某天在星期中的排序值：  
     * 星期日 -> 星期六 对应为：1 -> 7  
     * @param date  
     * @return  
     */  
    public static int getDateInWeek(Date date) {   
        Calendar c = Calendar.getInstance();   
        c.setTime(date);   
        return c.get(Calendar.DAY_OF_WEEK);   
    }   
  
    /**  
     * 获取指定日期后n天的凌晨  
     * @param date  
     * @param n  
     * @return  
     */  
    public static Date getDateNextDay(Date date, int n) {   
        Calendar c = Calendar.getInstance();   
        c.setTime(date);   
        c.add(Calendar.DATE, n);   
        return c.getTime();   
    }   
       
    /**  
     * 获取下n个月后的日期  
     * @param n 月份偏移量  
     * @return  
     */  
    public static Date getDateNextMonth(int n) {   
        Calendar now = Calendar.getInstance();   
        now.set(Calendar.MONTH, now.get(Calendar.MONTH) + n);// 设置时间向前进n个月   
        now.set(Calendar.HOUR_OF_DAY, 0);   
        now.set(Calendar.MINUTE, 0);   
        now.set(Calendar.SECOND, 0);   
        return now.getTime();   
    }   
  
    /**  
     * 获取今天在本月中的号码  
     * @return  
     */  
    public static int getDateOfMoth() {   
        return Calendar.getInstance().get(Calendar.DAY_OF_MONTH);   
    }   
       
    /**  
     * 本月的所有日期集合  
     * @return  
     */  
    public static List<Date> getDatesInMonth() {   
  
        List<Date> dates = new ArrayList<Date>();   
  
        Calendar c = Calendar.getInstance();   
  
        // 设置代表的日期为1号   
        c.set(Calendar.DATE, 1);   
  
        // 获得当前月的最大日期数   
        int maxDay = c.getActualMaximum(Calendar.DATE);   
  
        for (int i = 1; i <= maxDay; i++) {   
            c.set(Calendar.DATE, i);   
            dates.add(c.getTime());   
        }   
  
        return dates;   
    }   
       
    /**  
     * 获取某个时间所在的月份  
     * @param date  
     * @return  
     */  
    public static int getMonth(Date date) {   
        Calendar c = Calendar.getInstance();   
        c.setTime(date);   
        return c.get(Calendar.MONTH) + 1;   
    }   
  
    /**  
     * 获取本月最后一天  
     * @return  
     */  
    public static Date getMonthEnd() {   
        int length = getDateOfMoth();   
        Calendar c = Calendar.getInstance();   
        c.set(Calendar.DATE, length);   
        c.set(Calendar.HOUR, 24);   
        c.set(Calendar.MINUTE, 0);   
        c.set(Calendar.SECOND, 0);   
        return c.getTime();   
    }   
  
    /**  
     * 获取某个时间所在月份的最后一秒  
     * @param date   
     * @return  
     */  
    public static Date getMonthEnd(Date date){   
        if(date == null){   
            return null;   
        }   
        Calendar start = Calendar.getInstance();   
        start.setTime(date);   
        start.set(Calendar.MONTH, start.get(Calendar.MONTH)+1);   
        start.set(Calendar.DAY_OF_MONTH, 1);   
        start.set(Calendar.HOUR, 0);   
        start.set(Calendar.MINUTE, 0);   
        start.set(Calendar.SECOND, 0);   
        return start.getTime();        
    }   
           
    /**  
     * 获取某个时间所在月份的第一天凌晨  
     * @param date   
     * @return  
     */  
    public static Date getMonthStart(Date date){   
        if(date == null){   
            return null;   
        }   
        Calendar start = Calendar.getInstance();   
        start.setTime(date);   
        start.set(Calendar.DAY_OF_MONTH, 1);   
        start.set(Calendar.HOUR, 0);   
        start.set(Calendar.MINUTE, 0);   
        start.set(Calendar.SECOND, 0);   
        return start.getTime();        
    }   
       
    /**  
     * 获取今天凌晨  
     * @return  
     */  
    public static Date getMorning() {   
        return getMorning(new Date());   
    }   
  
    /**  
     * 获取指定时间当天的凌晨  
     * @param date 给定时间当天的凌晨  
     * @return  
     */  
    public static Date getMorning(Date date) {   
        Calendar c = Calendar.getInstance();   
        c.setTime(date);   
        c.set(Calendar.HOUR_OF_DAY, 0);   
        c.set(Calendar.MINUTE, 0);   
        c.set(Calendar.SECOND, 0);   
        return c.getTime();   
    }   
  
    /**  
     * 获取当前时间N天后的凌晨  
     */  
    public static Date getMorningNextDate(int n) {   
        Calendar now = Calendar.getInstance();   
        now.set(Calendar.DATE, now.get(Calendar.DATE) + n); //设置时间向前进n天   
        now.set(Calendar.HOUR_OF_DAY, 0);   
        now.set(Calendar.MINUTE, 0);   
        now.set(Calendar.SECOND, 0);   
        return now.getTime();   
    }   
       
    /**  
     * 系统当前时间过N个月后的时间  
     * @param nextStep 月份偏移量  
     * @return  
     */  
    public static Date getNextMonth(int nextStep){   
        Calendar c = Calendar.getInstance();   
        int m = c.get(Calendar.MONTH);   
        c.set(Calendar.MONTH, m + nextStep);   
        return c.getTime();   
    }   
  
    /**  
     * 计算给定时间推进一个月对应的时间  
     * @param date 给定时间  
     * @return 某时间过一个月后所在的时间  
     */  
    public static Date getNextMonthToday(Date date){   
        Calendar c = Calendar.getInstance();   
        c.setTime(date);   
        c.set(Calendar.MONTH, c.get(Calendar.MONTH)+1);        
        return c.getTime();   
    }   
       
    /**  
     * 获取系统当前时间所在的年份  
     * @return  
     */  
    public static int getYear() {   
        return Calendar.getInstance().get(Calendar.YEAR);   
    }   
       
    /**  
     * 获取给定时间所在的年份  
     * @param date 时间  
     * @return 时间所在的年份  
     */  
    public static int getYear(Date date){   
        Calendar c = Calendar.getInstance();   
        c.setTime(date);   
        return c.get(Calendar.YEAR);   
    }   
  
    /**  
     * 获取某年分的最后一天结束的时间  
     * @param year 年份  
     * @return 指定年份的最后一天结束  
     */  
    public static Date getYearEnd(int year) {   
        Calendar c = Calendar.getInstance();   
        c.set(Calendar.YEAR, year);   
        c.set(Calendar.MONTH,Calendar.DECEMBER);   
        c.set(Calendar.DAY_OF_MONTH, 31);   
        c.set(Calendar.HOUR_OF_DAY, 23);   
        c.set(Calendar.MINUTE, 59);   
        c.set(Calendar.SECOND, 59);   
        return c.getTime();   
    }   
  
    /**  
     * 获取某年份的第一天凌晨  
     * @param year 年份  
     * @return 指定年份的第一天凌晨  
     */  
    public static Date getYearStart(int year) {   
        Calendar c = Calendar.getInstance();   
        c.set(Calendar.YEAR, year);   
        c.set(Calendar.MONTH, Calendar.JANUARY);   
        c.set(Calendar.DAY_OF_MONTH,1);   
        c.set(Calendar.HOUR_OF_DAY, 0);   
        c.set(Calendar.MINUTE, 0);   
        c.set(Calendar.SECOND, 0);   
        return c.getTime();   
    }   

    /***
     * hqh
     * @param args
     */
    public static Date parseDates(String dateStr, String format) {
		try {
			dateFormat = new SimpleDateFormat(format);
			date = (Date) dateFormat.parse(dateStr);
		} catch (Exception e) {
		}
		return date;
	}
    /**
     * 
     * @param date -date1
     * @param date1
     * @return double
     */
    public static double diffDatemin(Date date, Date date1) {
		return (double)Math.round(getMillis(date) - getMillis(date1)) / (1000 * 60);
	}
    
	public static void main(String[] args) {
		Date d = new Date();
		double
		st = DateUtils
				.diffDatemin(DateUtils.parseDate("2015-07-20 13:52:00","yyyy-MM-dd HH:mm:ss"), 
				DateUtils.parseDate("2015-07-20 13:50:03","yyyy-MM-dd HH:mm:ss"));
		System.out.println(st);
		// System.out.println(d.toString());
		// System.out.println(formatDate(d).toString());
		// System.out.println(getMonthBegin(formatDate(d).toString()));
		// System.out.println(getMonthBegin("2008/07/19"));
		// System.out.println(getMonthEnd("2008/07/19"));
		/*	System.out.println(addDate(d,15).toString());*/
	}

}
