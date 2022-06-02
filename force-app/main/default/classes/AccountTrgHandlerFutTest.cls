@istest
public with sharing class AccountTrgHandlerFutTest {

    @TestSetup
    static void makeData(){
        
        List<Account> accList = new List<Account>();
        for (integer i = 0 ; i<200 ; i++){
            Account acc = new Account();
            acc.Name = 'Future Test' + i;
            acc.Rating = 'Cold';
            accList.add(acc);
        }
        insert accList;

        List<Opportunity> oppList = new List<Opportunity> ();
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = 'Future Update';
            opp.CloseDate = Date.today();
            opp.StageName = 'Prospecting';
            opp.Type = 'New Customer';
            opp.AccountId = acc.id;
            oppList.add(opp);
        }

        insert oppList;
    }

    @istest
    static void oppUpdate_Test(){
        List<Account> accList = [SELECT id, Rating FROM Account WHERE Rating != 'Hot'];
        Test.startTest();
        for(Account acc : accList){
            acc.Rating = 'Hot';
        }
        update accList;
        Test.stopTest();

        List<Opportunity> oppList = [SELECT id, Type FROM Opportunity];
        //WHERE AccountId IN (SELECT ID FROM Account WHERE Id IN: acclist)
        for (Opportunity opp : oppList){
            System.assertEquals ('Existing Customer - Upgrade', opp.Type); 
        }
    }
}