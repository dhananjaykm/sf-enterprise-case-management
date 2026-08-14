public with sharing class EntitlementSelector {
    public static Map<Id, Entitlement_Override__c> byAccount(Set<Id> accountIds) {
        Map<Id, Entitlement_Override__c> m = new Map<Id, Entitlement_Override__c>();
        for (Entitlement_Override__c e : [SELECT Id, Account__c, Tier__c, Response_Minutes__c FROM Entitlement_Override__c WHERE Account__c IN :accountIds]) {
            m.put(e.Account__c, e);
        }
        return m;
    }
}
