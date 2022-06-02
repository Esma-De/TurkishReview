trigger TriggerAccount2 on Account (before update) {
 
  if(trigger.isBefore){
    if(trigger.isUpdate){
      List<Account> lstAccNew = trigger.new;
      List<Account> lstAccOld = trigger.old;
      /*for(Account accNew : lstAccNew){
       /* for(Account accOld : lstAccOld){
          if(accNew.Id == accOld.Id){
            if(accNew.Rating != accOld.Rating){
              accNew.Description = 'Rating alaninda degisiklik yapilmistir';

            }
          }
        }
       /* if(acc.Active__c == 'Yes'){
          acc.Description = 'ISACTIVE';
        }else{
          acc.Description = '';
        }
      }*/

      
      Account accOld;
      for(Account accNew : lstAccNew){
        accOld = Trigger.oldMap.get(accNew.Id);
        if(accNew.Rating != accOld.Rating){
          accNew.Description = 'Rating alaninda degisiklik yapilmistir';
        }else{
          accNew.Description = 'Rating alaninda degisiklik yapilma__mistir';
        }

      }
    }  
  }   
}
