public with sharing class AssetTriggerHandler extends TriggerHandlerBase {
    public override void afterUpdate(List<SObject> newList, Map<Id, SObject> oldMap) { AssetCaseService.onAssetUpdate((List<Asset>) newList); }
}
