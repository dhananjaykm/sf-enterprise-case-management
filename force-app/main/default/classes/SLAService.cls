/**
 * Legacy SLA using business calendar.
 * MIGRATION: E (algorithm). Orchestration around it is D.
 */
public with sharing class SLAService {
    public static void calculate(List<Case> cases) {
        List<SLA_Clock__c> clocks = new List<SLA_Clock__c>();
        for (Case c : cases) {
            Integer target = c.Priority == 'High' ? 60 : 480;
            Datetime due = BusinessCalendarService.addBusinessMinutes(Datetime.now(), target);
            c.SLA_Due__c = due;
            if (c.Id != null) {
                clocks.add(new SLA_Clock__c(Case__c = c.Id, Target_Minutes__c = target, Elapsed_Minutes__c = 0, Status__c = 'Running', Start_At__c = Datetime.now(), Due_At__c = due));
            }
        }
        if (!clocks.isEmpty()) insert clocks;
    }
}
