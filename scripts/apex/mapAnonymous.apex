map<Integer, String> denemeMap = new map<Integer, String>();

denemeMap.put(0, 'Kedi');
denemeMap.put(1, 'Kopek');
denemeMap.put(4, 'Inek');
denemeMap.put(5, 'Tavsan');
denemeMap.put(7, 'Ordek');
denemeMap.put(8, 'Tilki');
denemeMap.put(1, 'Karga');

system.debug(denemeMap);
system.debug('Mapimizin size i: ' + denemeMap.size());

Set<Integer> setDeneme = denemeMap.keySet();
system.debug(' @@ Key degerlerimizi: '+ setDeneme);

List<String> listDeneme = denemeMap.values();
system.debug(' @@ Values degerlerimizi: '+ listDeneme);

String hayvanIsmi = denemeMap.get(7);
System.debug(' @@ 7. key\'deki value: ' + hayvanIsmi);

String hayvanIsmi1 = denemeMap.get(1);
System.debug(' @@ 1. key\'deki value: ' + hayvanIsmi1);

DMLdenemeleri.insertStdObjRec();
DMLdenemeleri.updateStdObj();
DMLdenemeleri.dmlMultRecInsert_right();
DMLdenemeleri.dmlMultRecUpdate();
DMLdenemeleri.dmlMultRecUpsert();
DMLdenemeleri.dmlMultRecDelete();
DMLdenemeleri.dmlMultRecUndelete();