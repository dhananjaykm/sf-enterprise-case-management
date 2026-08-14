# sf-enterprise-case-management

Largest legacy Service Cloud org in the suite (~100+ Apex classes, 20+ Visualforce pages, Aura + LWC). **No Flow metadata.**

Contains both a **simple SLA** path (Flow-friendly) and a **business-calendar SLA** path (keep Apex), plus duplicate GOLD priority rules.

```bash
sf org create scratch -f config/project-scratch-def.json -a case-mgmt
sf project deploy start -o case-mgmt
python3 scripts/seed-data/generate_seed.py
```
