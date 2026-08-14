public with sharing class WarrantyDomain {
    private List<SObject> records;
    public WarrantyDomain(List<SObject> records) { this.records = records; }
    public void stamp() {
        for (SObject r : records) {
            if (r.get('Id') != null) continue;
        }
    }
}
