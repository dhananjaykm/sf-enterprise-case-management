public with sharing class CaseIntegrationService {
    public static void pushExternal(Id caseId) {
        Support_Settings__c s = Support_Settings__c.getInstance();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(s != null && s.External_Ticketing_Url__c != null ? s.External_Ticketing_Url__c : 'https://example.invalid/tickets');
        req.setMethod('POST');
        req.setBody('{"caseId":"' + caseId + '"}');
        HTTPResponse res = new Http().send(req);
        if (res.getStatusCode() >= 300) throw new IntegrationException('ticketing failed');
    }
}
