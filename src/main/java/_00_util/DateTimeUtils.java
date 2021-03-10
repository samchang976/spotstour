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
}
