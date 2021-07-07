package test;

import static org.junit.Assert.*;

import java.text.ParseException;

import org.junit.Test;

import utils.TimestampUtil;

public class TimestampUtilTest {

	String todayString = "2021-07-07 21:00:00";

	String yearCheckString = "2011-07-07 21:00:00";
	String oneYearCheckString = "2020-07-07 21:00:00";
	String monthCheckString = "2021-05-07 21:00:00";
	String dayCheckString = "2021-07-04 21:00:00";
	String hourCheckString = "2021-07-07 17:00:00";
	String minuteCheckString = "2021-07-07 20:10:00";
	String secondCheckString = "2021-07-07 20:59:01";

	@Test
	public void testYearDiff() throws ParseException {
		String yearDiff = TimestampUtil.TimestampDiff(todayString, yearCheckString);
		assertEquals("10年前", yearDiff);
	}

	@Test
	public void testOneYearDiff() throws ParseException {
		String oneYearDiff = TimestampUtil.TimestampDiff(todayString, oneYearCheckString);
		assertEquals("1年前", oneYearDiff);
	}

	@Test
	public void testMonthDiff() throws ParseException {
		String monthDiff = TimestampUtil.TimestampDiff(todayString, monthCheckString);
		assertEquals("2ヶ月前", monthDiff);
	}

	@Test
	public void testDayDiff() throws ParseException {
		String dayDiff = TimestampUtil.TimestampDiff(todayString, dayCheckString);
		assertEquals("3日前", dayDiff);
	}

	@Test
	public void testHourDiff() throws ParseException {
		String hourDiff = TimestampUtil.TimestampDiff(todayString, hourCheckString);
		assertEquals("4時間前", hourDiff);
	}

	@Test
	public void testMinuteDiff() throws ParseException {
		String minuteDiff = TimestampUtil.TimestampDiff(todayString, minuteCheckString);
		assertEquals("50分前", minuteDiff);
	}

	@Test
	public void testSecondDiff() throws ParseException {
		String secondDiff = TimestampUtil.TimestampDiff(todayString, secondCheckString);
		assertEquals("59秒前", secondDiff);
	}

}
