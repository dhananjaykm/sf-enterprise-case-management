public with sharing class SlaCheckScheduler implements Schedulable {
    public void execute(SchedulableContext sc) { System.enqueueJob(new SlaCheckQueueable()); }
}
