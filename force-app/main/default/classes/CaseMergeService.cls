/**
 * MIGRATION: G — merge semantics are unsafe in Flow.
 */
public with sharing class CaseMergeService {
    public static void mergeCases(Id masterId, Id duplicateId) {
        Case dup = [SELECT Id, Description FROM Case WHERE Id = :duplicateId];
        Case master = [SELECT Id, Description FROM Case WHERE Id = :masterId];
        master.Description = (master.Description == null ? '' : master.Description) + '\n' + dup.Description;
        update master;
        dup.Status = 'Closed';
        update dup;
    }
}
