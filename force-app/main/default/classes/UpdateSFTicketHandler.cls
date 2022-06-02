public with sharing class UpdateSFTicketHandler {

    //PART A – Future Method – Test Class 29 Mayis 2022
    //1. Write a trigger for Salesforce Project when the status of the Salesforce Project record is updated as ‘Completed’ , update the status of the related Salesforce Ticket records // as ‘Completed’ in a future method.
    //2. Write the test class of this trigger handler class.
    public static void sfpUpdate(List<Salesforce_Project__c> triggerNew, Map<id,Salesforce_Project__c> triggerOldMap){

        Set<id> sfIds = new Set<Id>();

        for(Salesforce_Project__c sf : triggerNew){
            Salesforce_Project__c sfOld = triggerOldMap.get(sf.id); 
            if(sf.Status__c != sfOld.Status__c && sf.Status__c == 'Completed'){
                sfIds.add(sf.id);
            }
        }

        if(sfIds != null && sfIds.size() > 0){

            updateProTic(sfIds);
        }
    }

    @future
    public static void updateProTic (Set<Id> idSF){
        List<Salesforce_Ticket__c> sftList = [SELECT id, Status__c 
                                     FROM Salesforce_Ticket__c 
                                     WHERE Salesforce_Project__c IN: idSF 
                                     AND Status__c != 'Completed'];
        if(idSF != null && idSF.size() > 0){
            for (Salesforce_Ticket__c sfT : sftList){
                sfT.Status__c = 'Completed';
            }
        }

        if(sftList != null && sftList.size()>0){
            update sftList;
        }
    }
}
