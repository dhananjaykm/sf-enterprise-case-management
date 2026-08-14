@IsTest
private class BusinessCalendarServiceTest {

    @IsTest static void addsMinutes() {
        Datetime due = BusinessCalendarService.addBusinessMinutes(Datetime.now(), 5);
        System.assert(due > Datetime.now());
        System.assertNotEquals(null, CryptoTokenService.hmac('abc'));
    }

}
