global class AccountBatch implements Database.Batchable<sObject>, Database.stateful {
    /*PART B – Batchable Apex – Test Class 29 May 2022
1. Update the description field of all the account records. Do it via batch apex. Add an explanation to the description fields. (Exp: ‘This field updated in the Batchable Apex’) . At the end of the batch execution finishes, print the total number of batch executions were there and total number of records processed
2. Write the test class for the batch class written in previous question. */

Integer recNum = 0;
Integer batchNum = 0;

   
    //start
    global Database.QueryLocator  start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT id,Description FROM Account]);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope){
        // process each batch of records
        List<Account> lstUpdRcds = new List<Account>();
        if(scope != null && scope.size()>0){
            for(Account rcd : scope){
                rcd.Description = 'This field updated in the Batchable Apex';
                lstUpdRcds.add(rcd);
                recNum++;
            }
        }
        if(lstUpdRcds != null){
            system.debug('@@@:: size::'+lstUpdRcds.size());
            update lstUpdRcds;
            batchNum++;
        }
    }
    global void finish(Database.BatchableContext bc){
        system.debug('Total number of batch executions: ' + batchNum + ', Total number of processed records: ' + recNum);
        // execute any post-processing operations
    }
}

