public with sharing class CaseCommentTriggerHandler extends TriggerHandlerBase {
    public override void afterInsert(List<SObject> newList) { CaseCommentService.onComment((List<CaseComment>) newList); }
}
