public with sharing class AccountTriggerHandlerFuture {
    //Rating alanı 'Hot' olarak update edilen Account kayıtlarına bağlı 
    //opportunity'lerin Type alnını 'Existing Customer - Upgrade' şeklinde güncelleme
    
    
    public static void accRatingUpdate(List<Account> triggerNew, Map<id,Account> triggerOldMap){

        Set<id> accIds = new Set<Id>();

        for(Account acc : triggerNew){
            Account accOld = triggerOldMap.get(acc.id); 
            if(acc.Rating != accOld.Rating && acc.Rating == 'Hot'){
                accIds.add(acc.id);
            }
        }

        if(accIds != null && accIds.size() > 0){

            updateOppType(accIds);
        }
    }

    @future
    public static void updateOppType (Set<Id> idAcc){
        List<Opportunity> oppList = [SELECT id, Type 
                                     FROM Opportunity 
                                     WHERE Accountid IN: idAcc 
                                     AND Type != 'Existing Customer - Upgrade'];

        for (Opportunity opp : oppList){
            opp.Type = 'Existing Customer - Upgrade';
        }

        if(oppList != null && oppList.size()>0){
            update oppList;
        }
    }

}