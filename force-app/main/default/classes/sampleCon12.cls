public class sampleCon12{
    public string selectedpickvalue{get;set;}
    public List<SelectOption> options;
   public List<SelectOption> countries{get;set;}
    
    Office_Location__c of1;
    public sampleCon12(ApexPages.StandardController con) {
    Id i=Apexpages.currentpage().getparameters().get('ParentId');
    mycustom2__c m=[select Translate__c from mycustom2__c where id=:i LIMIT 1];
    countries = new List<SelectOption>();
    Schema.DescribeFieldResult fieldResult =Office_Location__c.Country__c.getDescribe();
    Schema.DescribeFieldResult fieldResult1 =Office_Location__c.Country_french__c.getDescribe();
    List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
    List<Schema.PicklistEntry> ple1 = fieldResult1.getPicklistValues();
    if(m.Translate__c==false){
        for( Schema.PicklistEntry f : ple)
        {
            countries.add(new SelectOption(f.getLabel(),f.getValue()));
        } 
    }else{
            countries.add(new SelectOption('America','Amérique'));
            countries.add(new SelectOption('India','Inde'));
            countries.add(new SelectOption('Australia','Australie'));
            countries.add(new SelectOption('Srilanka','Srilanka'));
            countries.add(new SelectOption('NewZeland','nouvelle-Zélande'));
    }     
  }
  public void clicking(){
  
  }
}