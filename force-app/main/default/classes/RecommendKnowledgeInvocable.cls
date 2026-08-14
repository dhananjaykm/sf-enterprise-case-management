public with sharing class RecommendKnowledgeInvocable {
    public class Request { @InvocableVariable public Id caseId; }
    @InvocableMethod(label='Recommend Knowledge')
    public static void recommend(List<Request> reqs) {
        Set<Id> ids = new Set<Id>();
        for (Request r : reqs) ids.add(r.caseId);
        KnowledgeService.suggest(CaseSelector.byIds(ids));
    }
}
