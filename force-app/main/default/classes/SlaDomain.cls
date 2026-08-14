public with sharing class SlaDomain {
    private List<SObject> records;
    public SlaDomain(List<SObject> records) { this.records = records; }
    public void stamp() {
        for (SObject r : records) {
            if (r.get('Id') != null) continue;
        }
    }
}
