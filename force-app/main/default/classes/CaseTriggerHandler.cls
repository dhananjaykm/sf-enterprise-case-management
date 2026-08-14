public with sharing class CaseTriggerHandler extends TriggerHandlerBase {
    public override void beforeInsert(List<SObject> newList) {
        List<Case> cases = (List<Case>) newList;
        CaseFieldDerivationService.derive(cases);
        EntitlementService.applyTier(cases);
        Set<Id> accountIds = new Set<Id>();
        for (Case c : cases) if (c.AccountId != null) accountIds.add(c.AccountId);
        CasePriorityService.apply(cases, AccountSelector.byIds(accountIds));
        CaseRoutingService.route(cases);
        SimpleSLAService.apply(cases);
        CaseHealthService.score(cases);
    }
    public override void beforeUpdate(List<SObject> newList, Map<Id, SObject> oldMap) {
        CaseReopenService.reopen((List<Case>) newList);
        CaseHealthService.score((List<Case>) newList);
    }
    public override void afterInsert(List<SObject> newList) {
        List<Case> cases = (List<Case>) newList;
        CaseTaskService.createIntakeTasks(cases);
        CaseNotificationService.notifyTeam(cases);
        EscalationService.evaluate(cases);
        CaseAuditService.write(cases, 'insert');
        WarrantyService.validate(cases);
        KnowledgeService.suggest(cases);
    }
}
