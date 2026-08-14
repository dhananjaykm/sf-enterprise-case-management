/**
 * Shared test data factory. Tests must not use SeeAllData=true.
 */
@IsTest
public class TestDataFactory {
    public static User createUser(String alias) {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User' LIMIT 1];
        String unique = alias + String.valueOf(Crypto.getRandomInteger());
        User u = new User(
            Alias = alias.left(8),
            Email = unique + '@example.invalid',
            EmailEncodingKey = 'UTF-8',
            LastName = alias,
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            TimeZoneSidKey = 'America/Los_Angeles',
            ProfileId = p.Id,
            UserName = unique + '@example.invalid'
        );
        insert u;
        return u;
    }

    public static Account createAccount(String name) {
        Account a = new Account(Name = name);
        insert a;
        return a;
    }


    public static Case createCase(Id accountId) {
        Case c = new Case(Subject = 'Leak at store', Origin = 'Phone', Status = 'New', AccountId = accountId);
        insert c; return c;
    }

}
