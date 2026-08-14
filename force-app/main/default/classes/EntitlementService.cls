/**
 * MIGRATION: A — Get Records Entitlement_Override__c.
 */
public with sharing class EntitlementService {
    public static void applyTier(List<Case> cases) {
        Set<Id> accountIds = new Set<Id>();
        for (Case c : cases) if (c.AccountId != null) accountIds.add(c.AccountId);
        Map<Id, Account> accounts = AccountSelector.byIds(accountIds);
        Map<Id, Entitlement_Override__c> ov = EntitlementSelector.byAccount(accountIds);
        for (Case c : cases) {
            if (ov.containsKey(c.AccountId)) {
                c.Customer_Tier__c = ov.get(c.AccountId).Tier__c;
            } else if (accounts.containsKey(c.AccountId)) {
                c.Customer_Tier__c = accounts.get(c.AccountId).Support_Tier__c;
            }
        }
    }
}
