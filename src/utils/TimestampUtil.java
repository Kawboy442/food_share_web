package utils;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class TimestampUtil {
	public static String TimestampDiff(String todayString, String postDateString, String format) throws ParseException {
		LocalDateTime today = toLocalDateTime(todayString, format);
		LocalDateTime postDate = toLocalDateTime(postDateString, format);

		long year = ChronoUnit.YEARS.between(postDate, today);
		long month = ChronoUnit.MONTHS.between(postDate, today);
		long day = ChronoUnit.DAYS.between(postDate, today);
		long hour = ChronoUnit.HOURS.between(postDate, today);
		long minute = ChronoUnit.MINUTES.between(postDate, today);
		long second = ChronoUnit.SECONDS.between(postDate, today);

		if(year > 1){
			return String.valueOf(year) + "年前";
		} else if(month == 12) {
			return "1年前";
		} else if(month > 1) {
			return String.valueOf(month) + "ヶ月前";
		} else if(day >= 30 && day < 60) {
			return "1ヶ月前";
		} else if(day > 1) {
			return String.valueOf(day) + "日前";
		} else if(hour >= 24 && hour < 48){
			return "1日前";
		} else if(hour > 1) {
			return String.valueOf(hour) + "時間前";
		} else if(minute >= 60 && minute < 120){
			return "1時間前";
		} else if(minute > 1) {
			return String.valueOf(minute) + "分前";
		} else if(second >= 60 && second < 120){
			return "1分前";
		}else {
			return String.valueOf(second) + "秒前";
		}
	}

	// 日時のStringをLocalDateTimeへ変換するメソッド (参考: https://qiita.com/riekure/items/d83d4ea5d8a19a267453)
	public static LocalDateTime stringToLocalDateTime(String date, String format) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date formatDate = sdf.parse(date);
		return LocalDateTime.ofInstant(formatDate.toInstant(), ZoneId.systemDefault());
	}

	// LocalDateTimeを日時のStringへ変換するメソッド (参考: https://qiita.com/riekure/items/d83d4ea5d8a19a267453)
	public static String localDateTimeToString(LocalDateTime localDateTime, String format) {
		DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(format);
		return localDateTime.format(dateTimeFormatter);
	}

	// Timestampを日時のStringへ変換するメソッド (参考: https://qiita.com/SE-studying-now/items/a635a0d465cf035946ed)
	public static String timestampToString (Timestamp timestamp, String format) {
		LocalDateTime ldt = timestamp.toLocalDateTime();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(format);
		return dtf.format(ldt);
	}

}
