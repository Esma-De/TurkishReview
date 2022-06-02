global class myBatchApex_SFT implements Database.Batchable<sObject> {
    global Database.QueryLocator  start(Database.BatchableContext bc) {
        return Database.getQueryLocator([Select id,Description__c from Salesforce_Project__c]);
    }
    global void execute(Database.BatchableContext bc, List<Salesforce_Project__c> scope){
        // process each batch of records
        List<Salesforce_Project__c> lstUpdRcds = new List<Salesforce_Project__c>();
        if(scope != null && scope.size()>0){
            for(Salesforce_Project__c rcd : scope){
                rcd.Description__c = 'This field Update_v3';
                lstUpdRcds.add(rcd);
            }
        }
        if(lstUpdRcds != null){
            system.debug('@@@:: size::'+lstUpdRcds.size());
            update lstUpdRcds;
        }
    }
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
    }
}