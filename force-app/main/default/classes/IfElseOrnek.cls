public with sharing class IfElseOrnek {
    public string odulBelirle( integer sira){

        string odul;

        if (sira == 1) {
            odul = 'Altin';
        } else if (sira == 2) {
            odul = 'Gumus';
        }else if (sira == 3) {
            odul = 'Bronz';
        }else if (sira >= 3 && sira  <= 10) {
            odul = 'Ilk 10\'a girdiniz.';
        }else {
            odul = 'Katilimci sertifikasi.';
        }
        return odul;    
        
    }
}
