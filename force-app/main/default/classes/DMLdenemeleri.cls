public with sharing class DMLdenemeleri {
    public static void insertStdObjRec() {

        Opportunity opp = new Opportunity();
        /*opp.Name = 'Test kayit-5';
        opp.StageName = 'Closed Lost';
        opp.CloseDate = Date.newInstance(2015, 04, 23);
        insert opp;
        System.debug(opp.Id);

        System.debug('Update oncesi: ' + opp);
        opp.Name = ' Test kayit-5 Update';
        update opp;
        System.debug('Update sonrasi: ' + opp);*/

        opp = [SELECT Id FROM Opportunity WHERE Id = '0068d000004OlVCAA0'];
        System.debug(opp);
        opp.Name = 'Test 2 gitti geldi';
        update opp;

    }

    public static void dmlMultRecInsert_right(){
        List<Account> listAcc = new List<Account>();
        
        Account acc;

        for (Integer i = 0 ; i<151; i++){
            acc = new Account();
            acc.Name = 'Test Record-' + i;
            acc.Website = 'www.test' + i + '.com';
            acc.Rating = 'Hot';
            listAcc.add(acc);
        }

        if(listAcc != null && listAcc.size() > 0){
            insert listAcc;
        }
    }

       /* public static void dmlMultRecUpdate(){

            List <Account> lstAcc = [SELECT ID, NAME, Website, Rating FROM Account WHERE Name LIKE 'Test Record%' AND Ammount > 10000 OR CreatedDate = today];
    
            List<Account> lstUpdateAcc = new List<Account>();
    
            if (lstAcc != null && lstAcc.size()>0){
                for(Account acc  : lstAcc){
                    acc.Name += 'updated'; //Test Record 1 update
                    acc.Rating = 'Cold';
                    acc.Description = 'Bu kayit güncellenmiştir.';
                    
                    lstUpdateAcc.add(acc);
                }
            }
            if (lstUpdateAcc != null && lstUpdateAcc.size()>0){
                update lstUpdateAcc;
            }
        } */

        public static void dmlMultiRecUpsert(){
            List<String> lstNames = new List<String>{'Deneme' , 'Force'};
            List<Account> lstUpsert = new List<Account>();

        List<Account> lstUpdate = [
                                    SELECT id, Name, Description 
                                    FROM Account
                                    WHERE  Name IN: lstNames
                                  ];

        for(Account forAcc : lstUpdate){
            forAcc.Description = 'BU kayit upsert işlemi ile update edildi';
            lstUpsert.add(forAcc);
        }

        Account acc1 = new Account();
        acc1.Name = 'Deneme Upsert1';
        acc1.Rating = 'Cold';
        acc1.Description = 'Bu kayit upsert işlemi ile olulturulmuştur.';

        lstUpsert.add(acc1);

        if(lstUpsert != null && lstUpsert.size()>0){
            upsert lstUpsert;
        }

        }
        public static void dmlMultRecDelete(){
            List<Account> lstDelete = [
                                        SELECT id, name 
                                        FROM Account
                                        WHERE Name LIKE 'Test%'
                                      ];
    
            System.debug('Şu an '+ lstDelete.size() + 'sayida kaydi sileceksiniz');
    
            if(lstDelete != null && lstDelete.size()>0){
                delete lstDelete;
            }
        }
    
        public static void dmlMultRecUndelete(){
            List<Account> lstUndelete = [
                                        SELECT id, name 
                                        FROM Account
                                        WHERE Name LIKE 'Test%' ALL ROWS
                                      ];
    
            System.debug('Şu an '+ lstUnDelete.size() + 'sayida kaydi geri getirilecektir');
    
            if(lstUndelete != null && lstUndelete.size()>0){
                undelete lstUndelete;
            }
        }
    
    }
    
    
    
    


