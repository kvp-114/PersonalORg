public class Accountdisplay{
public Account  acc{get;set;}
public String save{get;set;}
public String display{get;set;}
    public Accountdisplay(){
    save='True';
    display='False';
     acc=new Account();
     
    
    }
    public Account getaccount(){
    return acc;
    
    }
     public void save(){
     insert acc;
     save='false';
     display='true';
    System.debug('vijay');
    }
}