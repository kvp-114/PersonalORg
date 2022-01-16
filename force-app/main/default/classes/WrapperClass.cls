public class WrapperClass {

public List<InnerClass > wrapList{get;set;}
    public wrapperclass(){
        wrapList = new List<InnerClass>();
        List<mycustom2__c > mycumList = [Select name from mycustom2__c limit 50000];
        for(mycustom2__c  each : mycumList){
            InnerClass  inc = new InnerClass();
            inc.mycumobj = each;
            inc.wrapcheck = false;
            
            wrapList .add(inc);
        }
         
    }
    public void Display(){
        for(innerclass inc : wrapList){
            System.debug('***checkbox***'+inc.wrapcheck+'****name*****'+inc.mycumobj.name);
            
        
        }
    
    }

    public class InnerClass {
        public mycustom2__c mycumobj{get;set;}
        public boolean wrapcheck{get;set;}
    }
}