public with sharing class EmailMessageTriggerHandler extends TriggerHandlerBase {
    public override void afterInsert(List<SObject> newList) { EmailMessageService.onEmail((List<EmailMessage>) newList); }
}
