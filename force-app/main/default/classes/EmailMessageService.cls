public with sharing class EmailMessageService {
    public static void onEmail(List<EmailMessage> emails) {
        Set<Id> caseIds = new Set<Id>();
        for (EmailMessage e : emails) if (e.ParentId != null && String.valueOf(e.ParentId).startsWith('500')) caseIds.add(e.ParentId);
        List<Case> cases = [SELECT Id, First_Response_Done__c FROM Case WHERE Id IN :caseIds];
        for (Case c : cases) c.First_Response_Done__c = true;
        if (!cases.isEmpty()) update cases;
    }
}
