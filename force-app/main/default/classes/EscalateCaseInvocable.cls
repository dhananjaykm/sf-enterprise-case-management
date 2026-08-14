public with sharing class EscalateCaseInvocable {
    public class Request { @InvocableVariable(required=true) public Id caseId; }
    @InvocableMethod(label='Escalate Case')
    public static void escalate(List<Request> reqs) {
        Set<Id> ids = new Set<Id>();
        for (Request r : reqs) ids.add(r.caseId);
        EscalationService.evaluate(CaseSelector.byIds(ids));
    }
}
