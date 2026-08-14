public with sharing class WorkOrderCaseService {
    public static void sync(List<SObject> orders) {
        ApplicationLogger.info('WorkOrderCaseService', 'sync ' + orders.size());
    }
}
