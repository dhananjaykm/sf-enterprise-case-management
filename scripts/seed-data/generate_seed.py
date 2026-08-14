#!/usr/bin/env python3
import csv
from pathlib import Path
out = Path(__file__).parent / "generated"
out.mkdir(exist_ok=True)
def w(name, headers, rows):
    with (out / name).open("w", newline="") as f:
        wr = csv.DictWriter(f, fieldnames=headers); wr.writeheader(); wr.writerows(rows)
w("Account.csv", ["Name", "Support_Tier__c"], [{"Name": f"Customer {i:05d}", "Support_Tier__c": ["Standard","Gold","Platinum"][i%3]} for i in range(1, 5001)])
w("Case.csv", ["Subject", "Status", "Origin", "Priority", "Channel__c"],
  [{"Subject": f"Case {i}", "Status": "New", "Origin": ["Phone","Email","Web"][i%3], "Priority": ["Low","Medium","High"][i%3], "Channel__c": ["Phone","Email","Web"][i%3]} for i in range(1, 50001)])
print("Wrote 5k accounts and 50k cases CSV")
