public class pictureApex {
    public List<string> urlList{get;set;}
    public string S{get;set;}
    public integer listSize{get;set;}
    public ID accountRecId{get;set;}
    public Id chatterFID{get;set;}
    public Integer row{get;set;}
    public pictureApex(ApexPages.StandardController controller) {
        accountRecId=controller.getId(); 
        chatterFID  = accountRecId;
        urlList=new List<String>();
        urlList.add('jsor-jcarousel-60e2338/examples/_shared/img/img1.jpg');
        urlList.add('jsor-jcarousel-60e2338/examples/_shared/img/img2.jpg');
        urlList.add('jsor-jcarousel-60e2338/examples/_shared/img/img3.jpg');
        urlList.add('jsor-jcarousel-60e2338/examples/_shared/img/img4.jpg');
        urlList.add('jsor-jcarousel-60e2338/examples/_shared/img/img5.jpg');
        
        listSize=urlList.size();
        
    }
    
    public void chatterChange() {
       List<Account> AccList = [SELECT ID FROM Account LIMIT 6];
       chatterFID  = AccList[row].id;
    }
    
}