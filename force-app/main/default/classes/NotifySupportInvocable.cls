public with sharing class NotifySupportInvocable {
    public class Request { @InvocableVariable public Id caseId; @InvocableVariable public String message; }
    @InvocableMethod(label='Notify Support')
    public static void notify(List<Request> reqs) {
        List<Task> tasks = new List<Task>();
        for (Request r : reqs) tasks.add(new Task(Subject = r.message, WhatId = r.caseId, Status = 'Not Started', ActivityDate = Date.today()));
        insert tasks;
    }
}
