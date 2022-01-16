public with sharing class sampleExtension {

    public List<String> selectedItem { get; set; }

    public boolean displayboolean{get;set;}
    public string inputtext{get;set;}
    public List<SelectOption> options{get;set;}
     
    
    public sampleExtension(){
        System.debug('********constructor************');
        inputtext = '';    
        displayboolean =false;
    }
    public void actionMethod(){
        System.debug('********action******');
        options = new List<SelectOption>();
        options.add(new SelectOption('US','US'));
        options.add(new SelectOption('CANADA','Canada'));
        options.add(new SelectOption('MEXICO','Mexico'));
            
    }
    public void displayAction() {
    
        displayboolean=true;
        System.debug('********************'+displayboolean);
        
    }
    public void displayPick(){
    
        System.debug('*************'+selectedItem );
        
        for(string str:selectedItem ){
            System.debug('****inside for******'+str);
            inputtext = inputtext + str;
        }
        
       //inputtext= selectedItem ;
        
    }
    
    
}