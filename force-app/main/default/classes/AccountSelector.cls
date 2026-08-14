public with sharing class AccountSelector {
    public static Map<Id, Account> byIds(Set<Id> ids) {
        return new Map<Id, Account>([SELECT Id, Support_Tier__c, Open_Case_Count__c FROM Account WHERE Id IN :ids]);
    }
}
