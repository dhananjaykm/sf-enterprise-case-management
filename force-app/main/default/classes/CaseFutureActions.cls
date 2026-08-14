public with sharing class CaseFutureActions {
    @future
    public static void bumpAccountCounts(Set<Id> accountIds) {
        List<Account> accounts = [SELECT Id, Open_Case_Count__c FROM Account WHERE Id IN :accountIds];
        for (Account a : accounts) {
            a.Open_Case_Count__c = [SELECT COUNT() FROM Case WHERE AccountId = :a.Id AND Status != 'Closed'];
        }
        update accounts;
    }
}
