package net.biz.util;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.time.DateFormatUtils;

/**
 * 封装日期操作
 * 
 * @author wonder
 * 
 */
public class DateUtils {

	public static final long DAY_IN_MILLISECOND = 24 * 60 * 60 * 1000;

	public static Date addDay(Date date, int day) {
		return org.apache.commons.lang.time.DateUtils.addDays(date, day);
	}

	public static Date addWeek(Date date, int week) {
		return org.apache.commons.lang.time.DateUtils.addWeeks(date, week);
	}

	public static Date addMonth(Date date, int month) {
		return org.apache.commons.lang.time.DateUtils.addMonths(date, month);
	}

	public static Date getDate(Date date) {
		return parseDate(format(date, "yyyyMMdd"), "yyyyMMdd");
	}

	public static Date addTime(Date date, int hours, int mins, int seconds) {
		Date d = org.apache.commons.lang.time.DateUtils.addHours(date, hours);
		d = org.apache.commons.lang.time.DateUtils.addMinutes(d, mins);
		return org.apache.commons.lang.time.DateUtils.addSeconds(d, seconds);
	}

	public static Date getPreMonthDate(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int month = calendar.get(Calendar.MONTH);
		calendar.set(Calendar.MONTH, month - 1);
		return calendar.getTime();
	}

	public static Date getPreYearDate(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		int year = calendar.get(Calendar.YEAR);
		calendar.set(Calendar.YEAR, year - 1);
		return calendar.getTime();
	}

	public static int get(Date date, int field) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		return c.get(field);
	}

	/**
	 * 解析日期
	 * 
	 * @param date
	 * @param pattern
	 *            yyyy-MM-dd
	 * @return
	 */
	public static Date parseDate(String dateString, String pattern) {
		try {
			return org.apache.commons.lang.time.DateUtils.parseDate(dateString,
					new String[] { pattern });
		} catch (ParseException e) {
			return null;
		}

	}

	/**
	 * 
	 * @param date
	 * @param patterns
	 * @return
	 */
	public static Date parseDate(String dateString, String[] patterns) {
		try {
			return org.apache.commons.lang.time.DateUtils.parseDate(dateString,
					patterns);
		} catch (ParseException e) {
			return null;
		}

	}

	/**
	 * 
	 * @param year
	 * @param month
	 * @param date
	 * @return
	 */
	public static Date newDate(int year, int month, int date) {
		return parseDate("" + year + month + date, month >= 10 ? "yyyyMMdd"
				: "yyyyMdd");
	}

	/**
	 * 
	 * @param year
	 * @param month
	 * @param date
	 * @return
	 */
	public static String format(int year, int month, int date, String pattern) {
		return DateFormatUtils.format(newDate(year, month, date), pattern);
	}

	/**
	 * 
	 * @param date
	 * @return
	 */
	public static String format(Date date) {
		return format(date, "yyyy-MM-dd");
	}

	/**
	 * 
	 * @param date
	 * @return
	 */
	public static String format(Date date, String pattern) {
		return DateFormatUtils.format(date, pattern);
	}

	/**
	 * compare the two dates, and return the subtraction between d1 and d2(d1 -
	 * d2) result > 0 when d1 > d2 and result < 0 when d1 < d2
	 * 
	 * @param d1
	 *            Date
	 * @param d2
	 *            Date
	 * @return int
	 */
	public static int compareDateOnDay(Date d1, Date d2) {
		if (d1.getTime() == d2.getTime())
			return 0;
		d1 = org.apache.commons.lang.time.DateUtils.truncate(d1, Calendar.DATE);
		d2 = org.apache.commons.lang.time.DateUtils.truncate(d2, Calendar.DATE);
		long l1 = d1.getTime();
		long l2 = d2.getTime();
		return (int) ((l1 - l2) / DAY_IN_MILLISECOND);
	}

	/**
	 * compare the two dates, and return the subtraction between the dates'
	 * month always return > 0
	 * 
	 * @param d1
	 *            Date
	 * @param d2
	 *            Date
	 * @return int
	 */
	public static int compareDateOnMonth(Date d1, Date d2) {
		if (d1.getTime() == d2.getTime()) {
			return 0;
		}
		int flag = -1;
		// compare the dates, and put the smaller before
		if (d1.getTime() > d2.getTime()) {
			Date temp = d1;
			d1 = d2;
			d2 = temp;
			flag = 1;
		}
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(d1);
		c2.setTime(d2);
		int y1 = c1.get(Calendar.YEAR);
		int y2 = c2.get(Calendar.YEAR);
		int month1 = c1.get(Calendar.MONTH);
		int month2 = c2.get(Calendar.MONTH);
		int months = 0;
		if (y1 == y2) {

			months = month2 - month1;

		} else {

			months = (y2 - y1 - 1) * 12 + (12 - month1) + month2;

		}

		return months * flag;
	}

	/**
	 * judge the year whether is leap year
	 * 
	 * @param year
	 *            int year
	 * @return boolean
	 */
	public static boolean isLeapYear(int year) {
		if ((year % 400 == 0) || ((year % 4 == 0) && (year % 100 != 0))) {
			return true;
		}
		return false;

	}

	/**
	 * return the days of the year gevin
	 * 
	 * @param year
	 *            int year
	 * @return int
	 */
	public static int getYearDays(int year) {
		if (isLeapYear(year)) {
			return 366;
		}
		return 365;
	}

	/**
	 * judge whether the two dates are in same day
	 * 
	 * @param date1
	 * @param date2
	 * @return
	 */
	public static boolean isSameDay(Date date1, Date date2) {
		return org.apache.commons.lang.time.DateUtils.isSameDay(date1, date2);
	}

	public static Date truncate(Date d, int field) {
		return org.apache.commons.lang.time.DateUtils.truncate(d, field);
	}

	public static boolean isLastDayOfMonth(Date date) {
		return isFirstDayOfMonth(addDay(date, 1));
	}

	public static boolean isFirstDayOfMonth(Date date) {
		return get(date, Calendar.DAY_OF_MONTH) == 1;
	}

	// add
	public static Date getLastMonthDay(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month - 1);
		calendar.set(Calendar.DAY_OF_MONTH,
				calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	public static Date getLastMonthDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH,
				calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
		return calendar.getTime();
	}

	public static Date getFirstMonthDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		return calendar.getTime();
	}

	public static Date getFirstMonthDay(int year, int month) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.MONTH, month - 1);
		calendar.set(Calendar.DAY_OF_MONTH, 1);
		return calendar.getTime();
	}

	public static Date getFirstWeekDay(int year, int week) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.WEEK_OF_YEAR, week);
		calendar.set(calendar.DAY_OF_WEEK, 1);
		return addDay(calendar.getTime(), 1);
	}

	public static Date getFirstWeekDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(calendar.DAY_OF_WEEK, 1);
		return addDay(calendar.getTime(), 1);
	}

	public static Date getLastWeekDay(int year, int week) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.YEAR, year);
		calendar.set(Calendar.WEEK_OF_YEAR, week);
		calendar.set(calendar.DAY_OF_WEEK, 7);
		return addDay(calendar.getTime(), 1);
	}

	public static Date getLastWeekDay(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.set(calendar.DAY_OF_WEEK, 7);
		return addDay(calendar.getTime(), 1);
	}

	public static int getWeek(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setFirstDayOfWeek(Calendar.MONDAY);
		calendar.setTime(date);
		return calendar.get(Calendar.WEEK_OF_YEAR);
	}

	public static int getMonth(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.MONTH) + 1;
	}

	public static int getYear(Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		return calendar.get(Calendar.YEAR);
	}

	public static int getInterval(Date d1, Date d2) {
		int betweenDays = 0;
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();
		c1.setTime(d1);
		c2.setTime(d2);
		// 保证第二个时间一定大于第一个时间
		if (c1.after(c2)) {
			c1 = c2;
			c2.setTime(d1);
		}
		int betweenYears = c2.get(Calendar.YEAR) - c1.get(Calendar.YEAR);
		betweenDays = c2.get(Calendar.DAY_OF_YEAR)
				- c1.get(Calendar.DAY_OF_YEAR);
		for (int i = 0; i < betweenYears; i++) {
			c1.set(Calendar.YEAR, (c1.get(Calendar.YEAR) + 1));
			betweenDays += c1.getMaximum(Calendar.DAY_OF_YEAR);
		}

		return betweenDays;
	}

	public static List<Date> getDateList(Date startDate, Date endDate) {
		List<Date> dates = new ArrayList<Date>();

		int betweenDays = DateUtils.getInterval(startDate, endDate);
		for (int i = 0; i <= betweenDays; i++) {
			Date day = DateUtils.addDay(startDate, i);

			if (day.getTime() >= startDate.getTime()
					&& day.getTime() <= endDate.getTime()) {
				dates.add(day);
			}
		}

		return dates;
	}

	public static int getMonthInterval(Date startDate, Date endDate) {
		int betweenMonths = 0;
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		c1.setTime(startDate);
		c2.setTime(endDate);
		// 保证第二个时间一定大于第一个时间
		if (c1.after(c2)) {
			c1 = c2;
			c2.setTime(startDate);
		}

		int y1 = c1.get(Calendar.YEAR);
		int y2 = c2.get(Calendar.YEAR);

		int m1 = c1.get(Calendar.MONTH);
		int m2 = c2.get(Calendar.MONTH);

		if (y2 > y1) {
			betweenMonths += (y2 - y1) * 12;
		}
		betweenMonths += (m2 - m1);

		return betweenMonths;
	}

	public static int getWeekInterval(Date startDate, Date endDate) {
		int betweenWeeks = 0;
		Calendar c1 = Calendar.getInstance();
		Calendar c2 = Calendar.getInstance();

		c1.setTime(startDate);
		c2.setTime(endDate);
		// 保证第二个时间一定大于第一个时间
		if (c1.after(c2)) {
			c1 = c2;
			c2.setTime(startDate);
		}

		int y1 = c1.get(Calendar.YEAR);
		int y2 = c2.get(Calendar.YEAR);

		int w1 = c1.get(Calendar.WEEK_OF_YEAR);
		int w2 = c2.get(Calendar.WEEK_OF_YEAR);

		betweenWeeks += (w2 - w1);
		int betweenYears = y2 - y1;
		for (int i = 0; i < betweenYears; i++) {
			c1.set(Calendar.YEAR, (c1.get(Calendar.YEAR) + 1));
			betweenWeeks += c1.getMaximum(Calendar.WEEK_OF_YEAR);
		}

		return betweenWeeks;
	}

	/**
	 * 日期字符转换为java.sql.Date
	 * 
	 * @param dateString
	 * @param pattern
	 * @return
	 */
	public static java.sql.Date parseSqlDate(String dateString, String pattern) {
		Date d = parseDate(dateString, pattern);
		return d == null ? null : new java.sql.Date(d.getTime());
	}
	/**
	 * 解析yyyy-MM-dd格式的字符串，返回SQL使用的Date
	 * @param dateString
	 * @return java.sql.Date
	 */
	public static java.sql.Date parseFormerSqlDate(String dateString) {
		return parseSqlDate(dateString, "yyyy-MM-dd");
	}
}