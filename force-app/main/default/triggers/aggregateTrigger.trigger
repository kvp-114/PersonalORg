trigger aggregateTrigger on Quote (After Insert) {
    set<id> accIdSet = new set<id>();
    for(quote qt :trigger.new){
        accIdSet.add(qt.accountid);
    }
    list<account> accList = new list<account>();
    for(AggregateResult agr : [SELECT accountid acCnt from quote WHERE accountid IN: accIdset group by accountid]){
        accList.add(new account());
    }
    
    
}