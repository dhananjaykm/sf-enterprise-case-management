public with sharing class SlaCheckQueueable implements Queueable {
    public void execute(QueueableContext ctx) {
        List<SLA_Clock__c> clocks = [SELECT Id, Due_At__c, Status__c FROM SLA_Clock__c WHERE Status__c = 'Running' AND Due_At__c < :Datetime.now() LIMIT 200];
        for (SLA_Clock__c c : clocks) c.Status__c = 'Breached';
        if (!clocks.isEmpty()) update clocks;
    }
}
