trigger TriggerAccount on Account (before insert, before update, after insert, after update) {
    
  //Req: look out how trigger.newMap and trigger.oldMap data appears in vaious events
 //Return types is Map
  //Handles one or multiple records
 List<Account> nwLstAcc = trigger.new;           //LIST
 List<Account> oldLstAcc = trigger.old;          //LIST
 Map<Id,Account> mpTrgNewMap = trigger.newMap;   //MAP
 Map<Id,Account> mpTrgOldMap = trigger.oldMap;   //MAP
 //mpOldAcc, mpNewAcc......
 if(trigger.isBefore){
     if(trigger.isInsert){
         System.debug('@@@ BEFORE INST:::TRG NEW:'+nwLstAcc);
         System.debug('@@@ BEFORE INST:::TRG OLD:'+oldLstAcc);           //null
         System.debug('@@@ BEFORE INST:::TRG NEW MAP:'+mpTrgNewMap);     //null
         System.debug('@@@ BEFORE INST:::TRG OLD MAP:'+mpTrgOldMap);     //null
     }
     if(trigger.isUpdate){
         System.debug('@@@ BEFORE UPD:::TRG NEW:'+nwLstAcc);
         System.debug('@@@ BEFORE UPD:::TRG OLD:'+oldLstAcc);
         System.debug('@@@ BEFORE UPD:::TRG NEW MAP:'+mpTrgNewMap);
         System.debug('@@@ BEFORE UPD:::TRG OLD MAP:'+mpTrgOldMap);
     }
 }
 if(trigger.isAfter){
     if(trigger.isInsert){
         System.debug('@@@ AFTER INSERT:::TRG NEW:'+nwLstAcc);
         System.debug('@@@ AFTER INSERT:::TRG OLD:'+oldLstAcc);
         System.debug('@@@ AFTER INSERT:::TRG NEW MAP:'+mpTrgNewMap);
         System.debug('@@@ AFTER INSERT:::TRG OLD MAP:'+mpTrgOldMap);
     }
     if(trigger.isUpdate){
         System.debug('@@@ AFTER UPD:::TRG NEW:'+nwLstAcc);
         System.debug('@@@ AFTER UPD:::TRG OLD:'+oldLstAcc);
         System.debug('@@@ AFTER UPD:::TRG NEW MAP:'+mpTrgNewMap);
         System.debug('@@@ AFTER UPD:::TRG OLD MAP:'+mpTrgOldMap);
         AccountTriggerHandlerFuture.accRatingUpdate(trigger.New, trigger.OldMap);
     }
 }
}