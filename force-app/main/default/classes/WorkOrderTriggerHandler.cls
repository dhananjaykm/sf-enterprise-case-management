public with sharing class WorkOrderTriggerHandler extends TriggerHandlerBase {
    public override void afterInsert(List<SObject> newList) { WorkOrderCaseService.sync(newList); }
}
