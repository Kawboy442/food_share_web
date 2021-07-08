package test;

import static org.junit.Assert.*;

import java.text.ParseException;

import org.junit.Test;

import utils.TimestampUtil;

public class TimestampUtilTest {

	String format = "yyyy-MM-dd HH:mm:ss.S";

	String todayString = "2021-07-07 21:00:00.0";

	String yearCheckString = "2011-07-07 21:00:00.0";
	String oneYearCheckString = "2020-07-07 21:00:00.0";
	String monthCheckString = "2021-05-07 21:00:00.0";
	String oneMonthCheckString = "2021-06-06 21:00:00.0";
	String dayCheckString = "2021-07-04 21:00:00.0";
	String oneDayCheckString = "2021-07-06 21:00:00.0";
	String hourCheckString = "2021-07-07 17:00:00.0";
	String oneHourCheckString = "2021-07-07 20:00:00.0";
	String minuteCheckString = "2021-07-07 20:10:00.0";
	String oneMinuteCheckString = "2021-07-07 20:59:00.0";
	String secondCheckString = "2021-07-07 20:59:01.0";

	@Test
	public void testYearDiff() throws ParseException {
		String yearDiff = TimestampUtil.TimestampDiff(todayString, yearCheckString, format);
		assertEquals("10年前", yearDiff);
	}

	@Test
	public void testOneYearDiff() throws ParseException {
		String oneYearDiff = TimestampUtil.TimestampDiff(todayString, oneYearCheckString, format);
		assertEquals("1年前", oneYearDiff);
	}

	@Test
	public void testMonthDiff() throws ParseException {
		String monthDiff = TimestampUtil.TimestampDiff(todayString, monthCheckString, format);
		assertEquals("2ヶ月前", monthDiff);
	}

	@Test
	public void testOneMonthDiff() throws ParseException {
		String oneMonthDiff = TimestampUtil.TimestampDiff(todayString, oneMonthCheckString, format);
		assertEquals("1ヶ月前", oneMonthDiff);
	}

	@Test
	public void testDayDiff() throws ParseException {
		String dayDiff = TimestampUtil.TimestampDiff(todayString, dayCheckString, format);
		assertEquals("3日前", dayDiff);
	}

	@Test
	public void testOneDayDiff() throws ParseException {
		String oneDayDiff = TimestampUtil.TimestampDiff(todayString, oneDayCheckString, format);
		assertEquals("1日前", oneDayDiff);
	}

	@Test
	public void testHourDiff() throws ParseException {
		String hourDiff = TimestampUtil.TimestampDiff(todayString, hourCheckString, format);
		assertEquals("4時間前", hourDiff);
	}

	@Test
	public void testOneHourDiff() throws ParseException {
		String oneHourDiff = TimestampUtil.TimestampDiff(todayString, oneHourCheckString, format);
		assertEquals("1時間前", oneHourDiff);
	}

	@Test
	public void testMinuteDiff() throws ParseException {
		String minuteDiff = TimestampUtil.TimestampDiff(todayString, minuteCheckString, format);
		assertEquals("50分前", minuteDiff);
	}

	@Test
	public void testOneMinuteDiff() throws ParseException {
		String oneMinuteiff = TimestampUtil.TimestampDiff(todayString, oneMinuteCheckString, format);
		assertEquals("1分前", oneMinuteiff);
	}

	@Test
	public void testSecondDiff() throws ParseException {
		String secondDiff = TimestampUtil.TimestampDiff(todayString, secondCheckString, format);
		assertEquals("59秒前", secondDiff);
	}

}
