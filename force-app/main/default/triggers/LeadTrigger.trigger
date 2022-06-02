trigger LeadTrigger on Lead (before insert, before update, after insert) {

  System.debug('Trigger size: '+ Trigger.size);
  System.debug('is trigger: '+ Trigger.isExecuting);
  System.debug('Operation type: '+ Trigger.operationType);


  switch on Trigger.operationType {

    when BEFORE_INSERT {    
      for(Lead leadRecord : Trigger.new){
        if(String.isBlank(leadRecord.LeadSource)){ 
           leadRecord.LeadSource = 'Other';
        }
        if(String.isBlank(leadRecord.Industry) && Trigger.isInsert){ 
          leadRecord.addError('The industry field cannot be blank');
        }
      }
    }

    when AFTER_INSERT {
      for(Lead leadRecord : Trigger.new){
        Task leadTask = new Task(Subject='Follow up on Lead Status', WhoId=leadRecord.Id);
        //leadTask.Subject = ' Follow up on Lead Status';
        //leadTask.WhoId=leadRecord.Id;
        insert leadTask;        
      }     
    }

    when BEFORE_UPDATE {
      for(Lead leadRecord : Trigger.new){
        if(leadRecord.Status == 'Closed - Converted' || leadRecord.Status == 'Closed Not - Converted' && Trigger.oldMap.get(leadRecord.Id).Status == 'Open - Not Contacted' ){
          leadRecord.addError('You cannot directly close an open lead record');
        }
      }  
    }

  }
  
}

