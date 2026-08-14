public with sharing class ContractService {
    public static Boolean hasActiveContract(Id accountId) {
        if (accountId == null) return false;
        return [SELECT COUNT() FROM Contract WHERE AccountId = :accountId AND Status = 'Activated'] > 0;
    }
}
