/**
 * MIGRATION: A — after-save Flow Create Records (Task).
 */
public with sharing class CaseTaskService {
    public static void createIntakeTasks(List<Case> cases) {
        List<Task> tasks = new List<Task>();
        for (Case c : cases) {
            tasks.add(new Task(Subject = 'Triage case', WhatId = c.Id, Status = 'Not Started', ActivityDate = Date.today(), Priority = c.Priority));
        }
        if (!tasks.isEmpty()) insert tasks;
    }
}
