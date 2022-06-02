trigger TriggerContact on Contact (before insert, before update, after insert, after update) {

  if(trigger.isBefore){
    if(trigger.isInsert){
      /*System.debug('Before insert:: Trigger New:::' + Trigger.new);
      List<Contact> lstCon = trigger.new;
      for(Contact con : lstCon){
        con.Title = 'Soft Innovas';*/
      }
      


    }
    if(trigger.isUpdate){

      ContactTriggerHandler.partnerRefferalAdderror(trigger.Old, Trigger.newMap);

    }
  


  if(trigger.isAfter){
    if(trigger.isInsert){
      /*System.debug('After insert:: Trigger New:::' + Trigger.new);*/

    }
    if(trigger.isUpdate){
      
    }
  }
}

