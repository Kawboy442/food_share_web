package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;

public class TimestampUtil {
	public static String TimestampDiff(String postDateString) throws ParseException {
		LocalDateTime today = LocalDateTime.now();
		LocalDateTime postDate = toLocalDateTime(postDateString, "yyyy-MM-dd HH:mm:ss");

		long year = ChronoUnit.YEARS.between(postDate, today);
		long month = ChronoUnit.MONTHS.between(postDate, today);
		long day = ChronoUnit.DAYS.between(postDate, today);
		long hour = ChronoUnit.HOURS.between(postDate, today);
		long minute = ChronoUnit.MINUTES.between(postDate, today);
		long second = ChronoUnit.SECONDS.between(postDate, today);

		if(year > 1){
			return String.valueOf(year) + "年前";
		} else if(month > 1) {
			return String.valueOf(month) + "ヶ月前";
		} else if(day > 1) {
			return String.valueOf(day) + "日前";
		} else if(hour > 1) {
			return String.valueOf(hour) + "時間前";
		} else if(minute > 1) {
			return String.valueOf(minute) + "分前";
		} else {
			return String.valueOf(second) + "秒前";
		}
	}

	// 日時のStringをLocalDateTimeへ変換するメソッド (参考: https://qiita.com/riekure/items/d83d4ea5d8a19a267453)
	public static LocalDateTime toLocalDateTime(String date, String format) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		Date formatDate = sdf.parse(date);
		return LocalDateTime.ofInstant(formatDate.toInstant(), ZoneId.systemDefault());
	}

}
