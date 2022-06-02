    /*PART C – Batchable – Schedulable Apex 29 May 2022
1. Write a logic to Create tasks for all the opportunities other than the closed won or closed lost and on which there was no activity since last 7 days.
Populate the Task field values as follows:
Field = Value
Subject = Other (Store in a Custom Label)
CloseDate =Today if Opportunity close date is already passed otherwise Opportunity Close Date – 2 Days.
Description = Reminder – Please act on the Opportunity (Store in a Custom Label)
Related (WhatId) = Opportunity Id
Assigned To (OwnerId) = Opportunity Owner Id
Status = In Progress
Above logic needs to be implemented via Batch Apex
2. Write a Schedulable class to schedule the above created batch from Apex scheduler in salesforce. Schedule the batch so that it runs once in a week on every Monday 1pm*/
/* 1. Write a logic to Create tasks for all the opportunities other than the closed won or closed lost and on which there was no activity since last 7 days.
Populate the Task field values as follows:
Field Value
Subject Other (Store in a Custom Label)
CloseDate Today if Opportunity close date is already passed otherwise Opportunity Close Date – 2 Days.
Description Reminder – Please act on the Opportunity (Store in a Custom Label) */

global with sharing class OppTaskBatch implements  Schedulable, Database.Batchable<sObject> {
        global void execute(SchedulableContext sc){
            Database.executeBatch(this);
        }

        public database.QueryLocator start(Database.BatchableContext bc)  {
            
            return Database.getQueryLocator([Select id, StageName, LastModifiedDate FROM Opportunity Where StageName != 'Closed Won' AND StageName != 'Closed Lost' AND LastModifiedDate < LAST_N_DAYS:7]);
            // 1. alternatif: LAST_N_DAYS:7 =  today().addDay(-7)

        }

        global void execute(Database.BatchableContext bc, List<Opportunity> scope){
            List<Task> lstTask = new List<Task>();
            if(scope != null && scope.size()>0){
                for(Opportunity rcd : scope){
                    Task tsk = new Task ();

                    if (rcd.CloseDate < Date.today()) {
                        tsk.ActivityDate = Date.today();
                        
                    }else {
                        tsk.ActivityDate = rcd.CloseDate.addDays(-2);
                    }
                    tsk.WhatId = rcd.Id;
                    tsk.OwnerId = rcd.OwnerId;
                    tsk.subject = system.Label.Task_1;
                    tsk.Description = system.Label.Task_2;
                    tsk.Status = 'In Progress';
                    lstTask.add(tsk);
                    
                }
               
            }
            if (!lstTask.isEmpty()) {
                    
                insert lstTask;
            }
               
        }
        global void finish(Database.BatchableContext bc){
            //System.debug('@@@@:::::' + lstTask);
            
        }
        
}