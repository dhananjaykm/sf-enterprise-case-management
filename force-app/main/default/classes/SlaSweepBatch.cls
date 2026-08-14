public with sharing class SlaSweepBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Status__c, Due_At__c FROM SLA_Clock__c WHERE Status__c = 'Running']);
    }
    public void execute(Database.BatchableContext bc, List<SLA_Clock__c> scope) {
        for (SLA_Clock__c c : scope) if (c.Due_At__c < Datetime.now()) c.Status__c = 'Breached';
        update scope;
    }
    public void finish(Database.BatchableContext bc) {}
}
