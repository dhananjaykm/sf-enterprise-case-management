public with sharing class CalculateSLAInvocable {
    public class Request { @InvocableVariable(required=true) public Id caseId; }
    public class Response { @InvocableVariable public Datetime dueAt; }
    @InvocableMethod(label='Calculate SLA')
    public static List<Response> calculate(List<Request> reqs) {
        Set<Id> ids = new Set<Id>();
        for (Request r : reqs) ids.add(r.caseId);
        List<Case> cases = CaseSelector.byIds(ids);
        SimpleSLAService.apply(cases);
        update cases;
        List<Response> out = new List<Response>();
        for (Case c : cases) { Response x = new Response(); x.dueAt = c.SLA_Due__c; out.add(x); }
        return out;
    }
}
