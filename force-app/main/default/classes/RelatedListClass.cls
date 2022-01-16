public class RelatedListClass {

    
    public RelatedListClass() {
        
        attach       =    new Attachment();
        acc          =    [SELECT id from account where id=:'001i000000QiyBc'];
    }
    

  

  public PageReference upload() {

    
    attach.ParentId = '001i000000QiyBc'; 
    System.debug('*******'+attach.body);

    try {
      insert attach;
     
    } catch (DMLException e) {
    
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error uploading attachment'));
      return null;
    } finally {
        attach.body   =   null;
    }

    ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'Attachment uploaded successfully'));
    return null;
  }


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
   public attachment attach{get;set;}
    
    public Account acc{get;set;}
    public void AttachmentBodyCheck() {
        
    
    }
    
}