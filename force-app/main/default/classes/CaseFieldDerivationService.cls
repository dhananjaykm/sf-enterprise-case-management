/**
 * MIGRATION: A — before-save Flow.
 */
public with sharing class CaseFieldDerivationService {
    public static void derive(List<Case> cases) {
        for (Case c : cases) {
            if (String.isBlank(c.Channel__c) && String.isNotBlank(c.Origin)) {
                c.Channel__c = c.Origin == 'Email' ? 'Email' : (c.Origin == 'Phone' ? 'Phone' : 'Web');
            }
            if (String.isBlank(c.Severity__c)) {
                c.Severity__c = c.Priority == 'High' ? 'S1' : 'S3';
            }
        }
    }
}
