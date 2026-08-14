public with sharing class HolidayService {
    public static Boolean isHoliday(Date d) {
        return HolidaySelector.dates().contains(d);
    }
}
