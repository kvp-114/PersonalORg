trigger myCustomTrigger on mycustom__c (before update) {

    list<mycustom__c> localList = new list<mycustom__c>();
    for(mycustom__c mc : trigger.new){
        System.debug('********'+mc);
        localList.add(mc);
        if(mc.mycustoname__c != trigger.oldmap.get(mc.id).mycustoname__c){
            System.debug('****before update 2****');
        }
        
    }
    
    for(mycustom__c mc : localList){
        
        System.debug('*****local list***'+mc);
        mc.mycustoname__c = mc.mycustoname__c + '1';
    }
    localList.clear();
    for(mycustom__c mc : trigger.new){
        System.debug('****before opp******'+mc.Opp_Name__c);
        if(mc.mycustoname__c != trigger.oldmap.get(mc.id).mycustoname__c){
            System.debug('****before update 2****='+localList);
        }
        
        mc.Opportunity__c = [select id from opportunity limit 1].id;
        
        System.debug('****Afteropp******'+mc.Opp_Name__c);
    }

}