/**
 * MIGRATION: D — Critical branch is Flow; SLA check scheduling is scheduled path / keep queueable.
 */
public with sharing class EscalationService {
    public static void evaluate(List<Case> cases) {
        List<Case_Escalation__c> rows = new List<Case_Escalation__c>();
        List<Case_Escalated__e> events = new List<Case_Escalated__e>();
        for (Case c : cases) {
            if (c.Priority == 'High' || c.Severity__c == 'S1') {
                rows.add(new Case_Escalation__c(Case__c = c.Id, Level__c = 'L2', Status__c = 'Open', Due_At__c = Datetime.now().addHours(4)));
                events.add(new Case_Escalated__e(Case_Id__c = String.valueOf(c.Id), Priority__c = c.Priority));
            }
        }
        if (!rows.isEmpty()) insert rows;
        if (!events.isEmpty()) EventBus.publish(events);
    }
}
