/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 05-17-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public with sharing class OpportunityTriggerHandler {
    //Part1 Q-1 When an opportunity is created show a debug message 
    //([OpportunityName] – [CloseDate] – [Amount]) for each 
    //opportunity and print the total number of opportunities 
    //created in the transaction. For example: Demo Opportunity – 20/10/2022 – 40000.
    public static void prntInfoOpp(List<Opportunity> trgNew) {
        Integer totalOppsCreated = trgNew.size();
        System.debug('Total number of Opps created = '+ totalOppsCreated);
        for(Opportunity opp : trgNew){
            System.debug(opp.Id+ ' - ' +opp.Name + ' - ' + opp.CloseDate + ' - ' +opp.Amount);
        }
    }

    
    //Part1 Q-2
    public static void prntAmntClsDate(List<Opportunity> trgNew, Map<Id, Opportunity> trgOldMap){
        for(Opportunity opp : trgNew){
            //first getting the old record with the help of Id(never changes) in record record
            Opportunity oppOld = trgOldMap.get(opp.Id);
            System.debug('Old Amount = '+oppOld.Amount + ' New Amount = '+opp.Amount);
            System.debug('Old Close date = '+oppOld.CloseDate + ' New Close date = '+opp.CloseDate);
        }
    }
    //Part1 Q-3
    public static void prntNameDesc (List<Opportunity> trgNew, Map<Id, Opportunity> trgOldMap){
        for(Opportunity opp : trgNew){
            //first getting the old record with the help of Id(never changes) in record record
            Opportunity oppOld = trgOldMap.get(opp.Id);
            //Question 3 solution
            String newStageName = opp.StageName;//Updated stage name
            String oldStageName = oppOld.StageName;//Original stage name

            if(opp.StageName == 'Qualification'){
                opp.LeadSource = 'Web';
            }
            
            if(oldStageName != newStageName){
                System.debug('Opportunity Name = '+opp.Name);
                System.debug('Opportunity Description = '+opp.Description);
                //Question 7 solution
                /*if(newStageName == 'Closed Lost'){
                    opp.Description = 'Opportunity is lost. Please log a case with investigation team to start investigation.';
                }*/
            }
        }
    }


    //Part-2 Q-2 Make sure user is not able to change the status of an opportunity once
    // opportunity is updated to closed won or closed lost.
    public static void stageWonLostCheck(list<opportunity> triggerOld, map<id, opportunity> triggerNewMap){
        for(Opportunity opp: triggerOld){
            if(opp.StageName=='Closed Won' || opp.StageName=='Closed Lost'){
                Opportunity oppNew = triggerNewMap.get(opp.id);
                if(opp.StageName != oppNew.StageName){
                    oppNew.StageName.addError('Stage Name can not be changed if it is Closed Won/Lost');
                }
            }
        }
    }

// Part-3 Q-2 //Whenever new Opportunity is created with stageName as closed won or closed lost, then set
// closeDate as today otherwise set closed date as 15 days from today
    public static void setOppCloseDate(Opportunity[] triggerNew){
        for(Opportunity opp: triggerNew){
            if(opp.stageName=='Closed Won' || opp.stageName=='Closed Lost'){
                opp.CloseDate= date.today();
            }else{
                opp.CloseDate= date.today().addDays(15);
            }
        }
    }

   /* public static void calcDiscountAmount(list<opportunity> triggerNew){
        for(Opportunity opp : triggerNew){
            if(opp.Discount_Percentage__c != null && opp.Amount != null){
                opp.Discount_Amount__c = opp.Discount_Percentage__c * opp.Amount / 100; 
            }else {
                opp.Discount_Amount__c = null;
            }
        }
    }*/
}