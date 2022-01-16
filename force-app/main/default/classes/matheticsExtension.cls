public with sharing class matheticsExtension {
    Integer inputVal1;
    Integer inputVal2;
    Integer output;

    public matheticsExtension(){ 
    
        
    } 
    public integer getvalue1(){
        return inputVal1;
    }
    public integer setValue1(integer val1){
        System.debug('************'+val1);
        inputVal1  = val1;
        return null;
    
    }
    public integer setValue2(integer val2){
         
        inputVal2  = val2;
        return null;
    }
    
    public Integer getValue2(){
    
    return inputVal2;
    }
     public integer setOutput(integer output){
    
        return null;
    }
     public integer getOutput(){
    
        return output;
    }
    public void addition(){
        System.debug('*******addition*********'+inputVal1);
        System.debug('************'+inputVal2);
        output  =  inputVal1+inputVal2;
        
    }
    
    public Void Subtraction(){
        if(inputVal1>inputVal2){
            output  =  inputVal1-inputVal2;
        
        }else{
            output  =  inputVal2-inputVal1;
        }
    }
    public void multiplication(){
        output  =  inputVal2*inputVal1;
    }
    public Pagereference division(){
        if(inputVal2==0){
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.error,'Invalid denominator'));
           return null; 
        }else{
            output  =  inputVal1/inputVal2;
            return null;
        }
    }
    
}