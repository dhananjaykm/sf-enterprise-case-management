/**
 * Naive keyword score. MIGRATION: D/E
 */
public with sharing class KnowledgeService {
    public static void suggest(List<Case> cases) {
        List<Knowledge_Suggestion__c> rows = new List<Knowledge_Suggestion__c>();
        for (Case c : cases) {
            Decimal score = String.isBlank(c.Subject) ? 10 : Math.min(99, c.Subject.length());
            rows.add(new Knowledge_Suggestion__c(Case__c = c.Id, Title__c = 'Suggested article', Score__c = score));
        }
        if (!rows.isEmpty()) insert rows;
    }
}
