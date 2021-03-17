package _00_util;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeUtils {

	public static String getDateToString() {
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String strDate = sdFormat.format(date);
		return strDate;
	}
	
	public static Timestamp getTimestamps() {
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		return ts;
	}
	
	//指定日期加上天數
	public static long addDate(Date date, long day){
		long time = date.getTime(); // 得到指定日期的毫秒數
		day = day * 24 * 60 * 60 * 1000; // 要加上的天數轉換成毫秒數
		time += day; // 相加得到新的毫秒數
		return time; // 最後日期的總毫秒數
	}
}
