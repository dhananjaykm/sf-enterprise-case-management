@IsTest
private class InvocableCaseTest {

    @IsTest static void slaInvocable() {
        Case c = new Case(Subject = 'i', Origin = 'Web', Status = 'New');
        insert c;
        CalculateSLAInvocable.Request r = new CalculateSLAInvocable.Request();
        r.caseId = c.Id;
        Test.startTest();
        List<CalculateSLAInvocable.Response> out = CalculateSLAInvocable.calculate(new List<CalculateSLAInvocable.Request>{ r });
        Test.stopTest();
        System.assertNotEquals(null, out[0].dueAt);
    }

}
