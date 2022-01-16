public with sharing class sampleCon123 {
    public List<PickListWrapper> listValues{get;set;}
    public Boolean Francelanguage;
    public id parentId;
    public List<selectoption> selectopp1;
    public sampleCon123(ApexPages.StandardController controller) {
        Francelanguage=false;
       parentId= ApexPages.currentPage().getParameters().get('ParentId');
        listValues =new  List<PickListWrapper>();
        selectopp1=new  List<selectoption>();
        if(Francelanguage){
            selectopp1.add(new SelectOption('','---aucun---')); 
            selectopp1.add(new SelectOption('Within 48 hours','Dans les 48 heures')); 
            selectopp1.add(new SelectOption('3 to 4 days','3 a 4 jours')); 
            selectopp1.add(new SelectOption('1 Week','1 semaine')); 
            selectopp1.add(new SelectOption('2 Weeks','2 semaines')); 
            selectopp1.add(new SelectOption('3 Weeks','3 semaines')); 
            selectopp1.add(new SelectOption('4 Weeks','4 semaines')); 
            selectopp1.add(new SelectOption('5 Weeks','5 semaines')); 
            selectopp1.add(new SelectOption('6 Weeks','6 semaines')); 
            selectopp1.add(new SelectOption('7 to 8 weeks','7 to 8 semaines')); 
            selectopp1.add(new SelectOption('More than 8 weeks','Plus de 8 semaines'));
            selectopp1.add(new SelectOption('1 Week if Qty<=999, 4 Weeks if Qty>999','1 semaine si Qte <= 999, 4 semaines si la quantite> 999'));  
            selectopp1.add(new SelectOption('1 Week if Qty<=249, 2 Weeks if Qty>249','1 semaine si Qte <= 249, 2 Semaines si quantite> 249')); 
            selectopp1.add(new SelectOption('In Stock','en stock'));
            selectopp1.add(new SelectOption('other','autre'));
        }
        else{
            selectopp1.add(new SelectOption('','---none---')); 
            selectopp1.add(new SelectOption('Within 48 hours','Within 48 hours')); 
            selectopp1.add(new SelectOption('3 to 4 days','3 to 4 hours')); 
            selectopp1.add(new SelectOption('1 Week','1 week')); 
            selectopp1.add(new SelectOption('2 Weeks','2 weeks')); 
            selectopp1.add(new SelectOption('3 Weeks','3 weeks')); 
            selectopp1.add(new SelectOption('4 Weeks','4 weeks')); 
            selectopp1.add(new SelectOption('5 Weeks','5 weeks')); 
            selectopp1.add(new SelectOption('6 Weeks','6 weeks')); 
            selectopp1.add(new SelectOption('7 to 8 weeks','7 to 8 weeks')); 
            selectopp1.add(new SelectOption('More than 8 weeks','More than 8 weeks'));
            selectopp1.add(new SelectOption('1 Week if Qty<=999, 4 Weeks if Qty>999','1 Week if Qty<=999, 4 Weeks if Qty>999'));  
            selectopp1.add(new SelectOption('1 Week if Qty<=249, 2 Weeks if Qty>249','1 Week if Qty<=249, 2 Weeks if Qty>249')); 
            selectopp1.add(new SelectOption('In Stock','In Stock'));
            selectopp1.add(new SelectOption('other','other'));
        }
        List<Office_Location__c> listofOffices=[Select name,Country_Check__c from Office_Location__c where mycustom2__c=:parentId];
        System.debug('************'+listofOffices);
        for(Office_Location__c lof:listofOffices){
            PickListWrapper plw=new PickListWrapper();
            plw.selectopp=new  List<selectoption>();
            plw.selectopp.addAll(selectopp1);
            //plw.office=new Office_Location__c();
            plw.office=lof;
            listValues.add(plw);
        }
       /*Schema.DescribeFieldResult fieldResult =Office_Location__c.Country__c.getDescribe();
       List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
       ple .clear();
       list<selectoption> opt=new List<selectoption>();
       opt.add(new selectoption('vijay','vijay'));
       selectoption sp=new selectoption('a','a',true);
       ple.clear();
       For(Schema.PicklistEntry f:ple){
           if(f.getValue()=='india'){
               System.debug('==================='+f.getValue());
           }
           
       }*/
    }
    public void addAction(){
         PickListWrapper plw=new PickListWrapper();
            plw.selectopp=new  List<selectoption>();
            plw.selectopp.addAll(selectopp1);
            plw.office=new Office_Location__c();
            listValues.add(plw);    
    }  
    public void delAction(){
        integer listSize=listValues.size() -1;
        if(listSize>=0){
            listValues.remove(listSize);
        }
    }
    public void pickListAction(){
        System.debug('****************************');
    }
    public class PickListWrapper{
        public string selectItem{get;set;}
        public Office_Location__c office{get;set;}
        public List<selectoption> selectopp{get;set;}
    }

}