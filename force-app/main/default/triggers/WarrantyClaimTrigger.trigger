trigger WarrantyClaimTrigger on Warranty_Claim__c (before insert) {
    for (Warranty_Claim__c w : Trigger.new) if (String.isBlank(w.Status__c)) w.Status__c = 'Pending';
}
