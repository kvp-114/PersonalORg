public class cloneperfectexample{
}


/* public with sharing class Quotelineitem_clone{
    Set<Id> ids=new Set<Id>();   
   // List<Quote_Line_Item__c> l{get;set;}
   // List<Quote_Line_Item__c> l2{get;set;}
    Quote_Line_Item__c ql;
    public List<Batch__c> childdata2=new List<Batch__c>();
    Map<Quote_Line_Item__c,List<Batch__c>> batchmap = new Map<Quote_Line_Item__c,List<Batch__c>>();
    ApexPages.StandardSetController setCon;
    
    public Quotelineitem_clone(ApexPages.StandardSetController controller){
        l2=new List<Quote_Line_Item__c>();
        setCon = controller;
        for(Quote_Line_Item__c qli:(Quote_Line_Item__c[])setCon.getSelected()){
            ids.add(qli.id);
        }
        /* query and then clone it */
       /* String allfields= getCreatableFieldsSOQL('Quote_Line_Item__c');
       /* String batchfields= getCreatableFieldsSOQL('Batch__c');
        if(!ids.isEmpty()){
           // String batchquery='SELECT '+batchfields+' from Batch__c WHERE Quote_Line_Item__c in :ids';
            String batchquery=',(SELECT '+batchfields+' from Batch__r)';
            String query='SELECT '+allfields+''+batchquery+' from Quote_Line_Item__c WHERE Id in :ids';
            System.Debug('************'+query);
            l=Database.query(query);
            for(Quote_Line_Item__c qq:l){
                ql=new Quote_Line_Item__c();
                ql = qq.clone(false, true ,false, false);
                l2.add(ql);
                batchmap.put(ql,qq.Batch__r.deepClone(false,false,false));
            }
            
        }
    }
    public void insrec(){
        try{
            Database.insert(l2);
            for(Quote_Line_Item__c qli :batchmap.keySet()){
                for(Batch__c bb: batchmap.get(qli)){
                    bb.Quote_Line_Item__c = qli.Id;
                    childdata2.add(bb);
                }
            }
            Database.insert(childdata2);
            //System.Debug('************=================='+childdata2);
       }
        Catch(Exception e){}
    }
    public List<Quote_Line_Item__c> getqlirecord(){
        return l2;
    }
    public List<Batch__c> getbatchrecords(){
        return childdata2;
    }
    // Returns a dynamic SOQL statement for the whole object, includes only creatable fields since we will be inserting a cloned result of this query
    public static string getCreatableFieldsSOQL(String objectName){
        String selects = '';
        
        // Get a map of field name and field token
        Map<String, Schema.SObjectField> fMap = Schema.getGlobalDescribe().get(objectName.toLowerCase()).getDescribe().Fields.getMap();
        list<string> selectFields = new list<string>();
        if (fMap != null){
            for (Schema.SObjectField ft : fMap.values()){ // loop through all field tokens (ft)
                Schema.DescribeFieldResult fd = ft.getDescribe(); // describe each field (fd)
                if (fd.isCreateable()){ // field is creatable
                    selectFields.add(fd.getName());
                }
            }
        }
        if (!selectFields.isEmpty()){
            for (string s:selectFields){
                selects += s + ',';
            }
            if (selects.endsWith(',')){selects = selects.substring(0,selects.lastIndexOf(','));}
        }
        return selects;
    }    
}  */