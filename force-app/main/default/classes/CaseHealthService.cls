public with sharing class CaseHealthService {
    public static void score(List<Case> cases) {
        for (Case c : cases) {
            Decimal s = 50;
            if (c.Priority == 'High') s -= 20;
            if (c.First_Response_Done__c) s += 15;
            c.Health_Score__c = s;
        }
    }
}
