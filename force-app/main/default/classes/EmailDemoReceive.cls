global class EmailDemoReceive implements Messaging.InboundEmailHandler {
  global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,Messaging.Inboundenvelope envelope) {
  
  Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
                              
   
     
      
      System.debug('*********************'+email.plainTextBody);
      
      if(email.subject.contains('Verify your Salesforce Organization-Wide Address')) {
          result.success = false;
          result.message = email.plainTextBody;
          System.debug('******result***'+result);
          exception e;
          throw e;
          return result;
          
         
      }
      System.debug('**********after the return;');
      List<FeedItem> feedItemList = New List<FeedItem>();
     if(email.binaryAttachments != null) {
         for (Messaging.Inboundemail.BinaryAttachment bAttachment : email.binaryAttachments) {
            FeedItem post = new FeedItem();
                post.ParentId = '500i0000005BoPk'; 
                post.Body = 'Attachment added';
                post.Type = 'ContentPost';
                post.ContentData = bAttachment.body; 
                post.ContentFileName = bAttachment.filename;
                post.Title = bAttachment.filename;
            feedItemList.add(post);
        }
    
        insert feedItemList;
     
     } 
                
    
                            
     return result;
                                                         
 }
                                                         
 }