trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update) {
  if(trigger.isBefore){

      if(trigger.isInsert){

      //Solution Part 3 Question 2
          OpportunityTriggerHandler.setOppCloseDate(trigger.new);

      //Extra Solution
          //OpportunityTriggerHandler.calcDiscountAmount(trigger.new);
      }
      //Solution Part 1 Question 2 and 3
      if(trigger.isUpdate){
          //Question 2 
          OpportunityTriggerHandler.prntAmntClsDate(trigger.new, trigger.oldMap);
          //Question 3
          OpportunityTriggerHandler.prntNameDesc(trigger.new, trigger.oldMap);

          OpportunityTriggerHandler.stageWonLostCheck(trigger.old, trigger.NewMap);

          //OpportunityTriggerHandler.calcDiscountAmount(trigger.new);
      }
  }

  if(trigger.isAfter){

      if(trigger.isInsert){
        //Solution Part 1 Question 1
          OpportunityTriggerHandler.prntInfoOpp(trigger.new);
      }
  }
}