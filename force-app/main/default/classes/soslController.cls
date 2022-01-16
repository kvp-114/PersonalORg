public with sharing class soslController {
    public string global23{get;set;}
    public soslController(){
        List<list<SObject>> globalList=[FIND 'vijay' IN ALL FIELDS RETURNING Account (Id, Name), Contact, Opportunity, Lead];
        System.debug('****************globalList*********************'+globalList);
    }
}