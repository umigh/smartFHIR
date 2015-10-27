package edu.gatech.cs6400.php.util;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


public class DateUtil {
	public static Date toDate(String date,String pattern) throws ParseException {
		SimpleDateFormat format=new SimpleDateFormat(pattern);
		return format.parse(date);
	}
}
