/**
 * MIGRATION: F/A — wizard is Screen Flow; status update is record-triggered.
 */
public with sharing class CaseClosureService {
    public static void close(List<Case> cases, String reason) {
        for (Case c : cases) {
            c.Status = 'Closed';
        }
        update cases;
    }
}
