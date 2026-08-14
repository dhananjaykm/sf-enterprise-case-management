public with sharing class CaseSelector {
    public static List<Case> byIds(Set<Id> ids) {
        return [SELECT Id, Subject, Status, Priority, Origin, AccountId, ContactId, OwnerId,
                       Customer_Tier__c, Product_Family__c, Channel__c, Severity__c, SLA_Due__c,
                       SLA_Simple_Minutes__c, Routing_Queue__c, Health_Score__c, First_Response_Done__c, Reopen_Count__c
                FROM Case WHERE Id IN :ids];
    }
}
