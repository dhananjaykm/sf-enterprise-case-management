/**
 * MIGRATION: A
 */
public with sharing class CaseNotificationService {
    public static void notifyTeam(List<Case> cases) {
        List<Task> tasks = new List<Task>();
        for (Case c : cases) {
            if (c.Priority == 'High') {
                tasks.add(new Task(Subject = 'High priority case', WhatId = c.Id, Status = 'Not Started', ActivityDate = Date.today()));
            }
        }
        if (!tasks.isEmpty()) insert tasks;
    }
}
