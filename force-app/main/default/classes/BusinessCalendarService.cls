/**
 * Minute-level business calendar walk. CPU heavy.
 * MIGRATION: E — keep Apex.
 */
public with sharing class BusinessCalendarService {
    public static Datetime addBusinessMinutes(Datetime startDt, Integer minutes) {
        Set<Date> holidays = HolidaySelector.dates();
        Datetime cursor = startDt;
        Integer remaining = minutes;
        Integer guard = 0;
        while (remaining > 0 && guard < 20000) {
            cursor = cursor.addMinutes(1);
            Date d = cursor.date();
            Integer hour = cursor.hour();
            Boolean weekend = DateUtil.isWeekend(d);
            Boolean holiday = holidays.contains(d);
            if (!weekend && !holiday && hour >= 8 && hour < 18) {
                remaining--;
            }
            guard++;
        }
        return cursor;
    }
}
