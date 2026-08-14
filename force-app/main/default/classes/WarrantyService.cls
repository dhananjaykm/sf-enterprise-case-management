/**
 * MIGRATION: B — date compare is Flow; asset graph may stay Apex.
 */
public with sharing class WarrantyService {
    public static void validate(List<Case> cases) {
        Set<Id> assetIds = new Set<Id>();
        for (Case c : cases) if (c.AssetId != null) assetIds.add(c.AssetId);
        Map<Id, Asset> assets = new Map<Id, Asset>([SELECT Id, InstallDate, UsageEndDate FROM Asset WHERE Id IN :assetIds]);
        List<Warranty_Claim__c> claims = new List<Warranty_Claim__c>();
        for (Case c : cases) {
            Asset a = assets.get(c.AssetId);
            String status = 'Pending';
            Date expires = Date.today().addYears(1);
            if (a != null && a.UsageEndDate != null) {
                expires = a.UsageEndDate;
                status = a.UsageEndDate < Date.today() ? 'Expired' : 'Valid';
            }
            if (c.Id != null) claims.add(new Warranty_Claim__c(Case__c = c.Id, Asset__c = c.AssetId, Status__c = status, Expires_On__c = expires));
        }
        if (!claims.isEmpty()) insert claims;
    }
}
