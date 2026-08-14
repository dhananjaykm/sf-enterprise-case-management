@IsTest
private class AsyncCaseTest {

    @IsTest static void schedulers() {
        Test.startTest();
        System.schedule('sla-check', '0 0 3 * * ?', new SlaCheckScheduler());
        System.schedule('auto-close', '0 0 4 * * ?', new AutoCloseScheduler());
        Database.executeBatch(new SlaSweepBatch(), 50);
        Test.stopTest();
        System.assertEquals(2, [SELECT COUNT() FROM CronTrigger WHERE CronJobDetail.Name IN ('sla-check','auto-close')]);
    }

}
