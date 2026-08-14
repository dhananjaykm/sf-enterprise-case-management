public with sharing class ExternalTicketQueueable implements Queueable, Database.AllowsCallouts {
    private Id caseId;
    public ExternalTicketQueueable(Id caseId) { this.caseId = caseId; }
    public void execute(QueueableContext ctx) {
        try { CaseIntegrationService.pushExternal(caseId); } catch (Exception ex) { ApplicationLogger.error('ExternalTicketQueueable', 'fail', ex); }
    }
}
