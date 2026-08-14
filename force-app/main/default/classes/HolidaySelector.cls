public with sharing class HolidaySelector {
    public static Set<Date> dates() {
        Set<Date> d = new Set<Date>();
        for (Holiday__c h : [SELECT Holiday_Date__c FROM Holiday__c]) d.add(h.Holiday_Date__c);
        return d;
    }
}
