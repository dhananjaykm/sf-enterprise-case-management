# Architecture

CaseTrigger → Handler → Entitlement, Priority, Routing, SimpleSLA, Tasks, Escalation, Warranty, Knowledge, Audit.

Secondary triggers: CaseComment, EmailMessage, Task, Account, Asset, WorkOrder, Escalation.

Technical debt: CasePriorityService vs VF extraAction GOLD rule; CaseFutureActions SOQL-in-loop on accounts (do not copy).
