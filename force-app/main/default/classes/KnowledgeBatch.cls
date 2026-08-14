public with sharing class KnowledgeBatch implements Database.Batchable<SObject> {
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, Subject FROM Case WHERE Status != 'Closed']);
    }
    public void execute(Database.BatchableContext bc, List<Case> scope) { KnowledgeService.suggest(scope); }
    public void finish(Database.BatchableContext bc) {}
}
