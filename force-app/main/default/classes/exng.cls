public class exng{
public Integer value1{get;set;}
public Integer value2{get;set;}
public boolean pg1{get;set;}
public boolean pg2{get;set;}
public exng(){
pg1=true;
pg2=false;
}
public void swap(){
integer s;
    if(value1==70&&value2==80){
    s=value1;
    value1=value2;
    value2=s;
   
pg1=false;
pg2=true;
}
else
apexpages.addmessage(new apexpages.message(apexpages.severity.error,'not matching'));
}
}