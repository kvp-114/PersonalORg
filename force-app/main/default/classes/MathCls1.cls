public class MathCls1 {
 public String num1{get;set;}
 public String num2{get;set;}
 Public String Result{get;set;}
 
 public MathCls1(){
   num1 = null;
   num2= null;
 
 }
 public  PageReference add(){
  if((num1!=null && num2 != null&&num1!=''&&num2!='')){
 System.debug('*******************'+num1);
 Result=String.valueOF(integer.valueOF(num1)+integer.valueOF(num2));
  }
  

 else {

  ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error,'Sample Success Message')); 
  return null;
  }
  return null;
 
 }
 Public void sub(){
 //Result=num1-num2;
 }
 
 public void mul(){
 //Result=num1*num2;
 }
 
 public void Div(){
 //Result=num1/num2;
 }
 }