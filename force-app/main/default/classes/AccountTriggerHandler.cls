public with sharing class AccountTriggerHandler extends TriggerHandlerBase {
    public override void afterUpdate(List<SObject> newList, Map<Id, SObject> oldMap) {
        ApplicationLogger.info('AccountTrigger', 'updated');
    }
}
