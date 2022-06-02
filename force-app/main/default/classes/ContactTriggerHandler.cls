public with sharing class ContactTriggerHandler {
    public static void partnerRefferalAdderror(Contact[] triggerOld, Map<Id,Contact> triggerNewMap) {
        for(Contact con : triggerOld){
            if(con.LeadSource == 'Partner Refferal'){
                triggerNewMap.get(con.Id).LeadSource.addError('You cannot update Partner Refferal record!');

            }
        }
        

    }
}
