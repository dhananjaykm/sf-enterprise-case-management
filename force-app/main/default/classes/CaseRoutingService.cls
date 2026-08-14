/**
 * Channel → tier → product → queue.
 * MIGRATION: A — record-triggered Flow with Decision elements.
 */
public with sharing class CaseRoutingService {
    public static void route(List<Case> cases) {
        List<Case_Skill__c> skills = [SELECT Product_Family__c, Queue_Name__c FROM Case_Skill__c];
        for (Case c : cases) {
            String queue = 'Default_Support';
            if (c.Channel__c == 'Partner') queue = 'Partner_Support';
            if (c.Customer_Tier__c == 'Platinum') queue = 'VIP_Support';
            for (Case_Skill__c s : skills) {
                if (s.Product_Family__c == c.Product_Family__c) queue = s.Queue_Name__c;
            }
            c.Routing_Queue__c = queue;
        }
    }
}
