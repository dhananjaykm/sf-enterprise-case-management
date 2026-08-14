public with sharing class EscalationDomain {
    private List<SObject> records;
    public EscalationDomain(List<SObject> records) { this.records = records; }
    public void stamp() {
        for (SObject r : records) {
            if (r.get('Id') != null) continue;
        }
    }
}
