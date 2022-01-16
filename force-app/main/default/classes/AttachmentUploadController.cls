public with sharing class AttachmentUploadController 
{
    public String parentId {get;set;}
    Public string vijay{get;set;}
    public Attachment attach {get;set;}
   
    public AttachmentUploadController()
    {
        attach = new Attachment();
        vijay='nvvr';
    }
   
    //When user clicks upload button on Visualforce Page, perform upload/insert
    //Redirect user to newly inserted document
    public ApexPages.Pagereference upload()
    {
        
        //This shows how to insert an Attachment
        attach.ParentId = parentId;
        insert attach;
        
        return new ApexPages.Standardcontroller(attach).view();   
    }
}