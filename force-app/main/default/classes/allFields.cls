public with sharing class allFields {
    public  List<SelectOption> options{get;set;}
    public string opt{get;set;}
    Public String opLst{get;set;}
    public String serchValue{get;set;}
    public string opt1{get;set;}
    Public String opLst1{get;set;}
    public String serchValue1{get;set;}
    public string opt2{get;set;}
    Public String opLst2{get;set;}
    public String serchValue2{get;set;}
    public string opt3{get;set;}
    Public String opLst3{get;set;}
    public String serchValue3{get;set;}
    public string opt4{get;set;}
    Public String opLst4{get;set;}
    public String serchValue4{get;set;}
    public List<SelectOption> operatorList{get;set;}
    public List<SelectOption> conditions{get;set;}
    public String conditionValue{get;set;}
    public List<string> availableFields{get;set;}
    public List<string> selectedFields{get;set;}
    public allFields(){
        options = new List<SelectOption>();
        SObjectType objToken = Schema.getGlobalDescribe().get('Account');
        DescribeSObjectResult objDef = objToken.getDescribe();
        Map<String, SObjectField> fields = objDef.fields.getMap(); 
        System.debug('*******field map**********'+fields);
        Set<String> fieldSet = fields.keySet();
        for(String s:fieldSet){
            SObjectField fieldToken = fields.get(s);
            DescribeFieldResult selectedField = fieldToken.getDescribe();
            options.add(new SelectOption(selectedField.getName(),selectedField.getLabel()));
            system.debug('******name*********'+selectedField.getName()+'*********lable**********'+selectedField.getLabel());
        }
        operatorList=new List<SelectOption>();
        operatorList.add(new Selectoption('==','Equals'));
        operatorList.add(new Selectoption('!=','NotEquals')); 
        conditions=new List<SelectOption>();
        conditions.add(new Selectoption('AND','AND'));
        conditions.add(new Selectoption('OR','OR'));
    }
    
            
           
}