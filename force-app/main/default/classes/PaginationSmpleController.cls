public with sharing class PaginationSmpleController {
    
    public ApexPages.StandardSetController setCon{get;set;}
    public Integer size{get;set;}
    public Integer noOfRecords{get;set;}
    public List<Account> accList{get;set;} 
    public List<accWrapper> accWrapperList{get;set;}
    public PaginationSmpleController(){
        accWrapperList  =  new List<accWrapper>();
        String queryStr =  'SELECT Id,Name, (Select id, name FROM account.Contacts) FROM Account';
    
        if(setCon == null) {
           size          =  10;
           setCon        =  new ApexPages.StandardSetController(DataBase.getQueryLocator(queryStr));
           noOfRecords   =  setCon.getResultSize();
           setCon.setPageSize(size);
        }
        
    }
    
   
    
    Public List<Account> getAccounts(){
        accList = new List<Account>();
        for(Account a : (List<Account>)setCon.getRecords())
            accList.add(a);
        return accList;
    }
    
    public pageReference refresh() {
        setCon = null;
        getAccounts();
        setCon.setPageNumber(1);
        return null;
    }
     
    public Boolean hasNext {
        get {
            return setCon.getHasNext();
        }
        set;
    }
    public Boolean hasPrevious {
        get {
            return setCon.getHasPrevious();
        }
        set;
    }
  
    public Integer pageNumber {
        get {
            return setCon.getPageNumber();
        }
        set;
    }
  
    public void first() {
        setCon.first();
    }
  
    public void last() {
        setCon.last();
    }
  
    public void previous() {
        setCon.previous();
    }
  
    public void next() {
        setCon.next();
    }
    
    public class accWrapper{
        public account accWrap{get;set;}
        public list<contact> conWrap{get;set;}
    
    }
    
}