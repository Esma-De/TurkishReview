@isTest
public with sharing class OpportunityTrgHndTest {

    @TestSetup
    static void makeData(){
        List<Opportunity> lstOpp = new List<Opportunity>();

        Opportunity opp1 = new Opportunity();
        opp1.Name = 'Opp1';
        opp1.StageName = 'Qualification';
        opp1.CloseDate = Date.newInstance(2022, 5, 7);
        lstOpp.add(opp1);

        Opportunity opp2 = new Opportunity();
        opp2.Name = 'Opp2';
        opp2.StageName = 'Closed Won';
        opp2.CloseDate = Date.newInstance(2022,6 , 7);
        lstOpp.add(opp2);

        Opportunity opp3 = new Opportunity();
        opp3.Name = 'Opp3';
        opp3.StageName = 'Closed Lost';
        opp3.CloseDate = Date.newInstance(2022, 7, 7);
        lstOpp.add(opp3);

        insert lstOpp; 
    }

    @isTest
    public static void stageWonLostCheck_Test() {

        // List<Opportunity> lstOpp = [Select id, StageName from Opportunity Where StageName = 'Qualification' Limit 1];
        // Opportunity opp = lstOpp[0];
// Kayıt hazırlığı

        Test.startTest();
            Opportunity testrec1 = [Select id, StageName from Opportunity Where StageName = 'Qualification' Limit 1];
            testrec1.stagename = 'Prospecting';
            update testrec1;
            try{
                Opportunity testrec2 = [Select id, StageName from Opportunity Where StageName = 'Closed Won' Limit 1];
                testrec2.stagename = 'Prospecting';
                update testrec2;
            }catch (Exception e){
                System.debug(e);

            }
        Test.stopTest();

//assertEquals kontrolleri
    }

}
