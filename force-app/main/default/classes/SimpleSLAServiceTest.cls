@IsTest
private class SimpleSLAServiceTest {

    @IsTest static void setsDue() {
        Case c = new Case(Subject = 'sla', Origin = 'Email', Status = 'New', Priority = 'Medium');
        insert c;
        Case stored = [SELECT SLA_Due__c, SLA_Simple_Minutes__c FROM Case WHERE Id = :c.Id];
        System.assertNotEquals(null, stored.SLA_Due__c);
    }

}
