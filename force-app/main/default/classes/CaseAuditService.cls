public with sharing class CaseAuditService {
    public static void write(List<Case> cases, String action) {
        List<Case_Audit__c> rows = new List<Case_Audit__c>();
        for (Case c : cases) rows.add(new Case_Audit__c(Case__c = c.Id, Action__c = action, Detail__c = c.Status));
        if (!rows.isEmpty()) insert rows;
        ApplicationLogger.info('CaseAuditService', action + ':' + cases.size());
    }
}
