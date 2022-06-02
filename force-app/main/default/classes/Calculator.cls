public with sharing class Calculator {
    public Calculator() {

    }

    public Integer add(integer a, integer b){

        Integer sum = a + b;
        return sum;

    }

    public void printNewMessage(String msg){
        System.debug(msg);
    }
}
