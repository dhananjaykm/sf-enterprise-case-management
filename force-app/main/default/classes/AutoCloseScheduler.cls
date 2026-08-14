/**
 * MIGRATION: A — scheduled-triggered Flow candidate.
 */
public with sharing class AutoCloseScheduler implements Schedulable {
    public void execute(SchedulableContext sc) {
        Support_Settings__c s = Support_Settings__c.getInstance();
        if (s == null || !s.Enable_Auto_Close__c) return;
        List<Case> stale = [SELECT Id, Status FROM Case WHERE Status = 'New' AND CreatedDate < :Datetime.now().addDays(-30) LIMIT 100];
        for (Case c : stale) c.Status = 'Closed';
        if (!stale.isEmpty()) update stale;
    }
}
