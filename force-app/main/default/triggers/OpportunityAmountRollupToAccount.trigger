trigger OpportunityAmountRollupToAccount on Opportunity (after insert , after update , after delete , after undelete) {
    
    
  
      If(Recursive.isTriggerFiredAlready==False) 
      {   
            Set<Id> AccIds = new Set<id>();
            if((Trigger.isInsert || Trigger.isupdate || Trigger.isdelete || Trigger.isUndelete) && Trigger.isAfter)
                
            {
                if(Trigger.isDelete==False)
                {
                   
                    For(Opportunity opp:Trigger.new)
                    {
                        if(opp.AccountId!=null)
                        {
                            AccIds.add(opp.AccountId);
                        }
                    }
                 
                }
                Else
                {
                    For(Opportunity opp:Trigger.old)
                    {
                        if(opp.AccountId!=null)
                        {
                            AccIds.add(opp.AccountId);
                        }
                    } 
                }
            }
            
           
            
            if(AccIds.size()>0)
            {
                   Recursive.isTriggerFiredAlready=True;
                     map<id,double> oppAmount = new map<id,double>();
                     map<id,Integer> opptCount = new map<id,Integer>();
              
                      for(AggregateResult aggr : [select COUNT(Id)cnt,AccountId,sum(Amount)sa FROM  Opportunity  where AccountId IN :AccIds group by AccountId])
                      {
                          oppAmount.put((Id)aggr.get('AccountId'),(Double)aggr.get('sa'));
                          opptCount.put((Id)aggr.get('AccountId'),(Integer)aggr.get('cnt'));
                      }
                 
                    List<account> AccountsToUpdate = new List<account>();
             
             
                      for(Account acc : [Select Id, Total_Opportunity_Amount__c FROM Account where Id IN :AccIds])
                      {
                        Double PaymentSum = oppAmount.get(acc.Id)!=null?oppAmount.get(acc.Id):0;
                        acc.Total_Opportunity_Amount__c = PaymentSum;
                        AccountsToUpdate.add(acc);
                      }
             
                        If(AccountsToUpdate.size()>0)
                        {
                             update AccountsToUpdate;
                        }
                         map<id,Double> avgAmount = new map<id,Double>();
                         For(Account acc:AccountsToUpdate)
                         {
                             if(opptCount.get(acc.id)!=null&&opptCount.get(acc.id)!=0){
                                 double d=acc.Total_Opportunity_Amount__c/opptCount.get(acc.id);
                                 avgAmount.put(acc.id, d);
                             }else{
                                  avgAmount.put(acc.id, 0);   
                             }
                         }
                    
                        List<Opportunity> opps=[SELECT Id,Amount,Accountid FROM Opportunity WHERE AccountId IN:avgAmount.keyset()];
                        List<Opportunity> oppstoupdate = new List<Opportunity>();
                    If(opps.size()>0)
                    {  
                        For(Opportunity opp:opps)
                        {
                            opp.Amount=(avgAmount.get(opp.accountid)!=null)?avgAmount.get(opp.accountid):0;
                            oppstoupdate.add(opp);
                        }
                            If(oppstoupdate.size()>0)
                            {
                               
                                update oppstoupdate;
                            }
                    }   
             
            }
            
            
     }
}