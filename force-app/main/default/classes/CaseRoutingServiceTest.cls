@IsTest
private class CaseRoutingServiceTest {

    @IsTest static void routesPartner() {
        Account a = TestDataFactory.createAccount('Cust');
        Test.startTest();
        Case c = new Case(Subject = 'x', Origin = 'Web', AccountId = a.Id, Channel__c = 'Partner', Status = 'New');
        insert c;
        Test.stopTest();
        System.assertEquals('Partner_Support', [SELECT Routing_Queue__c FROM Case WHERE Id = :c.Id].Routing_Queue__c);
    }
    @IsTest static void bulk() {
        Account a = TestDataFactory.createAccount('Bulk');
        List<Case> rows = new List<Case>();
        for (Integer i = 0; i < 200; i++) rows.add(new Case(Subject = 'c'+i, Origin = 'Phone', Status = 'New', AccountId = a.Id));
        Test.startTest(); insert rows; Test.stopTest();
        System.assertEquals(200, [SELECT COUNT() FROM Case WHERE Id IN :rows]);
    }

}
