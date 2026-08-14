public with sharing class EscalationQueueable implements Queueable {
    private Set<Id> caseIds;
    public EscalationQueueable(Set<Id> caseIds) { this.caseIds = caseIds; }
    public void execute(QueueableContext ctx) {
        EscalationService.evaluate(CaseSelector.byIds(caseIds));
    }
}
