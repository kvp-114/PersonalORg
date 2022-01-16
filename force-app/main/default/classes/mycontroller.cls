public with sharing class mycontroller {
    public string richstr{get;set;}
    public string rerendervalue{get;set;}
    public mycontroller(){ richstr='true';
    rerendervalue='pb'; }
    public void clickme(){
        richstr='';
       rerendervalue='pb';
        richstr='true';
        
    }
}