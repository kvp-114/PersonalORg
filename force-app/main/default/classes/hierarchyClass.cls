public class hierarchyClass{
    public hierarchyClass(){
    }
    map<id,List<element__c>> elementMap = new map<id,List<element__c>>();
        
    public void hierarchyMethod(){
    
        Map<id,Bucket__c> bucketMap = new map<id,bucket__c>([Select id from Bucket__c]);
        List<element__c> elementList = [Select id, Bucket__c,parent_element__c FROM Element__c where bucket__c IN:bucketMap.keySet()];
        for(element__c ele :elementList) {
            if(ele.Parent_element__c == null) {
                elementMap.put(ele.bucket__c,new List<element__c>{ele});
            } else {
                if(elementMap.containsKey(ele.Parent_element__c) && elementMap.get(ele.Parent_element__c) != null) {
                    elementMap.get(ele.Parent_element__c).add(ele);
                    
                } else {
                    elementMap.put(ele.parent_element__c,new List<element__c>{ele});
                }
            }
            
        }
        
        
        for(bucket__c buc : bucketMap.values()){
            jsonstr = jsonstr +'{ name:'+buc.name;
            if(elementMap.get(buc.id) != null) {
                jsonstr = jsonstr +'items:[';
                prepareJson(elementMap.get(buc.id));
            }
            
        }
        jsonstr = jsonstr +']';  
    }
    String jsonstr = '[';
    private void prepareJson(List<Element__c> elements){
        for(element__c ele : elements){
            jsonstr = jsonstr +'{ name:'+ele.name;
             if(elementMap.get(ele.id) != null) {
                jsonstr = jsonstr +'items:[';
                prepareJson(elementMap.get(ele.id));
            } else{
                jsonstr = jsonstr+'}'; 
            }
        }
        
        jsonstr = jsonstr +']';    
    
    }

}