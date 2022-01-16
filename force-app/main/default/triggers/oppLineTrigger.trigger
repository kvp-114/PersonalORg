trigger oppLineTrigger on OpportunityLineItem (After insert,After Update,After Delete,After Undelete) {

    Set<id> oppIdSet  =  new set<Id>();
    Set<Id> accIdSet  = new Set<Id>();
    List<opportunityLIneItem>  oppLineItemList  =  new List<opportunityLIneItem>();
    if(trigger.isInsert||trigger.isUpdate||Trigger.isUndelete){
    
        for(OpportunityLineItem oppLtm:Trigger.new){
            oppIdSet.add(oppLtm.opportunityid);
        }
        
    }else if(trigger.isDelete){
    
        for(OpportunityLineItem oppLtm:Trigger.Old){
            oppIdSet.add(oppLtm.opportunityid);
            
        }
        
    }
    
    if(!oppIdSet.isEmpty()){
    
         List<Opportunity> oppList = [SELECT AccountID from opportunity where id in:oppIdSet];
         
         for(Opportunity  opp:oppList){
         
             accIdSet.add(opp.accountid);
         } 
         
         List<Account> acclist= [SELECT  Id,Product_Names__c from account where id in:accidset]; 
         
         oppLineItemList = [Select opportunity.accountid, PricebookEntry.Product2.Name From OpportunityLineItem where opportunityid in:oppIdSet];
         
          
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