trigger acccity on Account (after insert,after update) {
List<account> acclist=[select id,City__c,(select opportunity.id,opportunity.accountid, opportunity.stagename from Account.Opportunities) from account where id in:Trigger.new];
list<opportunity> lopp=new List<opportunity>();
for(account a:acclist){
    if(a.city__c=='banglore'){
        for(opportunity o:a.opportunities){
            if(a.id==o.accountid){
                o.stagename='Qualification';
                lopp.add(o);
            }
        }
   }
}
Database.update(lopp);




    
    
}