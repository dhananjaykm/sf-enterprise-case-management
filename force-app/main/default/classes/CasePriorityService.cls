/**
 * Hard-coded GOLD rule duplicated in VF (debt).
 * MIGRATION: A
 */
public with sharing class CasePriorityService {
    public static void apply(List<Case> cases, Map<Id, Account> accounts) {
        for (Case c : cases) {
            Account a = accounts.get(c.AccountId);
            String tier = a == null ? c.Customer_Tier__c : a.Support_Tier__c;
            if (tier == 'Platinum' || c.Severity__c == 'S1') {
                c.Priority = 'High';
            }
            if (tier == 'GOLD' || tier == 'Gold') {
                c.Priority = 'High';
            }
        }
    }
    public static String consolePriority(String tier) {
        return tier == 'GOLD' ? 'High' : 'Medium';
    }
}
