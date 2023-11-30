public with sharing class AccountBusinessPlanController {
    @AuraEnabled(cacheable=true)
    public static List<Account_Business_Plan__c> getAccountBusinessPlans(Id accountId) {
        return [SELECT Id, Plan_Text__c, Plan_Status__c, Target_Revenue__c, Target_Margin__c, Planned_Activities__c, Next_Steps__c
                FROM Account_Business_Plan__c
                WHERE Account__c = :accountId];
    }
}