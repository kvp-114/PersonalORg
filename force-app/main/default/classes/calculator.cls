public class calculator
{
public integer value1{get;set;}
public integer value2{get;set;}
public integer OutputValue{get;set;}

   public calculator(){
   
   }
   public void add(){
   OutputValue=value1+value2;
   } 
   public void sub(){
   OutputValue=value1-value2;
   }
   public void mul(){
   OutputValue=value1*value2;
   }
   public void div(){
   OutputValue=value1/value2;
   }
 
}