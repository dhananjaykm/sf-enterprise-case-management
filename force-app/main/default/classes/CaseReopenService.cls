public with sharing class CaseReopenService {
    public static void reopen(List<Case> cases) {
        for (Case c : cases) {
            if (c.Status == 'Closed') {
                c.Status = 'New';
                c.Reopen_Count__c = (c.Reopen_Count__c == null ? 0 : c.Reopen_Count__c) + 1;
            }
        }
    }
}
