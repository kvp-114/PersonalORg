Public virtual class Report {

   Public class CustomReport extends Report {
   // Create a list of report objects
      //Report[] Reports = new Report[5];
      List<report> Reports  = new list<Report>();

   // Create a custom report object
      CustomReport a = new CustomReport();
      CustomReport() {
           // Because the custom report is a sub class of the Report class,
           // you can add the custom report object a to the list of report objects
              Reports.add(a);
        
           // The following is not legal, because the compiler does not know that what you are 
           // returning is a custom report. You must use cast to tell it that you know what
           // type you are returning
           // CustomReport c = Reports.get(0);
        
           // Instead, get the first item in the list by casting it back to a custom report object
              CustomReport c = (CustomReport) Reports.get(0);
      } 

  
   }
}