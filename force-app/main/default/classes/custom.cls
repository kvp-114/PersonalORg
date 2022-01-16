Public  class custom{
public list<mycustom__c> my{get;set;}
public Boolean exp1{get;set;}
public Boolean exp2{get;set;}
public mycustom__c c{get;set;}

public mycustom__c c1;
public custom(){
exp1=true;
exp2=false;
c=new mycustom__c();
my=[select amount__c,mycustoname__c, id from mycustom__c];


}
 public void update1() {
 exp1=false;
 exp2=true;

       
        
    }
    public void save(){
      c1= new mycustom__c();
     c1.mycustoname__c=c.mycustoname__c;
     c1.amount__c=c.amount__c;
      
   insert c1;
    }

}