public with sharing class TaskTriggerHandler extends TriggerHandlerBase {
    public override void afterInsert(List<SObject> newList) { ApplicationLogger.info('TaskTrigger', String.valueOf(newList.size())); }
}
