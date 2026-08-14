public with sharing class EscalationTriggerHandler extends TriggerHandlerBase {
    public override void afterInsert(List<SObject> newList) {
        List<Task> tasks = new List<Task>();
        for (Case_Escalation__c e : (List<Case_Escalation__c>) newList) {
            tasks.add(new Task(Subject = 'Escalation opened', WhatId = e.Id, Status = 'Not Started', ActivityDate = Date.today()));
        }
        insert tasks;
    }
}
