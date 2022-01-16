trigger oppTriigerToUpdateAccProductname on Opportunity (After Delete,After UnDelete) {
    
    
    Set<Id> accidset  = new Set<Id>();
    
    List<OpportunityLineItem> oppLineItemList  =  new List<OpportunityLineItem>();
    if(trigger.isUndelete){
        for(Opportunity opp:trigger.new){
            accidset.add(opp.Accountid);    
        }
    }else {
        for(Opportunity opp:trigger.old){
            accidset.add(opp.Accountid);    
        }
    }
     if(!accidset.isEmpty()){
        
         List<Account> acclist= [SELECT  Id,Product_Names__c from account where id in:accidset]; 
         
         oppLineItemList = [Select opportunity.accountid, PricebookEntry.Product2.Name From OpportunityLineItem where opportunity.accountid in:accidset];
         
         
          map<id,String>  accProductnameMap = new Map<id,String>();  
          
          for(OpportunityLineItem  oppLineItem:oppLineItemList){
          
              String tempString = oppLineItem.PricebookEntry.Product2.Name;
              
              if(!accProductnameMap.isEmpty() && accProductnameMap.containsKey(oppLineItem.opportunity.accountid) && accProductnameMap.get(oppLineItem.opportunity.accountid)!=null){
                  tempString =  accProductnameMap.get(oppLineItem.opportunity.accountid)+','+oppLineItem.PricebookEntry.Product2.Name;
              }
              
              accProductnameMap.put(oppLineItem.opportunity.accountid,tempString);
          }
          
          for(Account acc:accList){
              if(!accProductnameMap.isEmpty() && accProductnameMap.containsKey(acc.id) && accProductnameMap.get(acc.id)!=null){
                  acc.Product_Names__c = accProductnameMap.get(acc.id);
              }else{
                  acc.Product_Names__c='';
              }
          }
          
          if(!accList.isEmpty()){
              update accList;
          }
          
      }
}