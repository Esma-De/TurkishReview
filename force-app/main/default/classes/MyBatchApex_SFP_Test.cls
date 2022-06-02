@istest
public with sharing class MyBatchApex_SFP_Test {
    @istest
    public static void batchTest(){
        //Kayıt oluşturma
        List<Salesforce_Project__c> listSFP = new List<Salesforce_Project__c>();
        for(integer i = 0 ; i < 200 ; i++){
            Salesforce_Project__c sfp = new Salesforce_Project__c();
            sfp.Project_Name__c  = 'Batch Project';
            sfp.Description__c = '';
            listSFP.add(sfp);
        }
        insert listSFP;
        // Test yapılması
        Test.StartTest();
            myBatchApex_SFT cls = new myBatchApex_SFT();
            Database.executeBatch(cls, 200); // Batch Size değeri üzerinde işlem yapılacak kayıt sayısına eşit yada fazla olmalı
        Test.StopTest();
        Salesforce_Project__c sfp = [SELECT id, Description__c FROM Salesforce_Project__c LIMIT 1];
        System.assertEquals ('This field Update_v6', sfp.Description__c);
    }
}
