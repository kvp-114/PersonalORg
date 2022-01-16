public class sampleCon1{
    public string selectedpickvalue{get;set;}
    public List<SelectOption> getCountries()
    {
      List<SelectOption> options = new List<SelectOption>();
      Schema.DescribeFieldResult fieldResult =Office_Location__c.Country__c.getDescribe();
      List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
       for( Schema.PicklistEntry f : ple)
       {
          options.add(new SelectOption(f.getLabel(), f.getValue()));
       }       
       return options;
    }
}