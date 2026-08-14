trigger SlaClockTrigger on SLA_Clock__c (before insert) {
    for (SLA_Clock__c c : Trigger.new) if (c.Elapsed_Minutes__c == null) c.Elapsed_Minutes__c = 0;
}
