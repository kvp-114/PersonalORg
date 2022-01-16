public class mycontroller123 {
    public string x{get;set;}
    public mycontroller123 (){
        
    }
    public void abcd(){
    String ab=apexpages.currentpage().getparameters().get('x1');
    System.debug('++++++++++++++++'+ab);
        System.debug('*********'+x);
    }
    
}