@IsTest
private class EscalationServiceTest {

    @IsTest static void highPriorityEscalates() {
        Case c = new Case(Subject = 'down', Origin = 'Phone', Status = 'New', Priority = 'High', Severity__c = 'S1');
        Test.startTest(); insert c; Test.stopTest();
        System.assertEquals(1, [SELECT COUNT() FROM Case_Escalation__c WHERE Case__c = :c.Id]);
    }

}
