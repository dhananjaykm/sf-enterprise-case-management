public with sharing class CaseCommentService {
    public static void onComment(List<CaseComment> comments) {
        Set<Id> caseIds = new Set<Id>();
        for (CaseComment cc : comments) caseIds.add(cc.ParentId);
        List<Case> cases = [SELECT Id, First_Response_Done__c FROM Case WHERE Id IN :caseIds];
        for (Case c : cases) c.First_Response_Done__c = true;
        update cases;
    }
}
