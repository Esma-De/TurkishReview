trigger UpdateSFTicketHandlerTrigger on Salesforce_Project__c (after update) {
  if(trigger.isBefore){
      if(trigger.isInsert){
        
      }
      if(trigger.isUpdate){
      
      }
  }
  if(trigger.isAfter){
    if(trigger.isInsert){
     
    }
    if(trigger.isUpdate){
      UpdateSFTicketHandler.sfpUpdate(trigger.New, trigger.OldMap);
    }
  }
}

