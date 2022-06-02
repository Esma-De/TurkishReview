// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

/*
string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

myBatchApex_SFT cls = new myBatchApex_SFT();
Id jobIds = Database.executeBatch(cls);
system.debug('@@@:::'+jobIds);
*/
//myBatchApex_SFP cls = new myBatchApex_SFP();
//id jobId = Database.executeBatch(cls, 50); //Default değeri 200

AccountBatch cls = new AccountBatch();
id jobId = Database.executeBatch(cls, 10);

public with sharing class InactiveOppsTaskCreationSchedulable implements Schedulable{
    public void execute(SchedulableContext sc) {
        InactiveOppsTaskCreationBatch b = new InactiveOppsTaskCreationBatch();
        database.executeBatch(b,40);
    }
}


