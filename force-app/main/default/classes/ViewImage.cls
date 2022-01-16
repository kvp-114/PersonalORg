public class ViewImage {
    public Attachment att {
        get {
            if (att == null) {
                
                att = [SELECT Body, ContentType, Name FROM Attachment WHERE ID = :'00Pi0000006JGRA'];
            }
            return att;
        }
        private set;
    }
    public String image {
        get {
            
            System.debug('***********************'+EncodingUtil.Base64Encode(att.body));
            return EncodingUtil.Base64Encode(att.body);
        }
    }
}