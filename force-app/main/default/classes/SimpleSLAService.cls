/**
 * Flow-friendly SLA: lookup policy minutes, set due date with addMinutes.
 * Parallel to complex BusinessCalendarService.
 * MIGRATION: A
 */
public with sharing class SimpleSLAService {
    public static void apply(List<Case> cases) {
        Map<String, Integer> minutes = new Map<String, Integer>();
        for (SLA_Policy__mdt p : [SELECT Priority__c, Minutes__c, Tier__c FROM SLA_Policy__mdt]) {
            minutes.put(p.Tier__c + ':' + p.Priority__c, Integer.valueOf(p.Minutes__c));
        }
        for (Case c : cases) {
            String key = (c.Customer_Tier__c == null ? 'Standard' : c.Customer_Tier__c) + ':' + (c.Priority == null ? 'Medium' : c.Priority);
            Integer m = minutes.containsKey(key) ? minutes.get(key) : 480;
            c.SLA_Simple_Minutes__c = m;
            c.SLA_Due__c = Datetime.now().addMinutes(m);
        }
    }
}
