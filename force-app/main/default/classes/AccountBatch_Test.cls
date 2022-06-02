@istest
public with sharing class AccountBatch_Test {
    @istest
    public static void batchTest(){
        //Kayıt oluşturma
       
        List<Account> listAcc = new List<Account>();
        for(integer i = 0 ; i < 200 ; i++){
            Account acc = new Account();
            acc.Name  = 'Batch Test' + i ;
            acc.Description = 'This field updated in the Batchable Apex';
            listAcc.add(acc);
        }
        insert listAcc;
        // Test yapılması
        Test.StartTest();
            AccountBatch cls = new AccountBatch();
            Database.executeBatch(cls, 200); // Batch Size değeri üzerinde işlem yapılacak kayıt sayısına eşit yada fazla olmalı
        Test.StopTest();
        Account acc = [SELECT id, Name, Description  FROM Account LIMIT 1];
        System.assertEquals ('This field updated in the Batchable Apex', acc.Description);
    }
}