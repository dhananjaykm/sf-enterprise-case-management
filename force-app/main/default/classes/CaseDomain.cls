public with sharing class CaseDomain {
    private List<SObject> records;
    public CaseDomain(List<SObject> records) { this.records = records; }
    public void stamp() {
        for (SObject r : records) {
            if (r.get('Id') != null) continue;
        }
    }
}
