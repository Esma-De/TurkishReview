@isTest
public with sharing class UpdateSFTicketHandler_Test {
    @TestSetup
    static void makeData(){
        
        List<Salesforce_Project__c> sfpList = new List<Salesforce_Project__c>();
        for (integer i = 0 ; i<=200 ; i++){
            Salesforce_Project__c sfp = new Salesforce_Project__c();
            sfp.Project_Name__c = 'Future Test' + i;
            sfp.Status__c = 'New';
            sfpList.add(sfp);
        }
        insert sfpList;

        List<Salesforce_Ticket__c> stList = new List<Salesforce_Ticket__c> ();
        for(Salesforce_Project__c sfp : sfpList){
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Future Update';         
            st.Status__c = 'Testing';            
            st.Salesforce_Project__c = sfp.id;
            stList.add(st);
        }

        insert stList;
    }

    @istest
    static void stUpdate_Test(){
        List<Salesforce_Project__c> spList = [SELECT id, Status__c FROM Salesforce_Project__c WHERE Status__c != 'Completed'];
        Test.startTest();
        for(Salesforce_Project__c sp : spList){
            sp.Status__c = 'Completed';
        }
        update spList;
        Test.stopTest();

        List<Salesforce_Ticket__c> stList = [SELECT id, Status__c FROM Salesforce_Ticket__c];
        //WHERE AccountId IN (SELECT ID FROM Account WHERE Id IN: acclist)
        for (Salesforce_Ticket__c st : stList){
            System.assertEquals ('Completed', st.Status__c); 
        }
    }
}
