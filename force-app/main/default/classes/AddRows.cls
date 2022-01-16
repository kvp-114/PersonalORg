public class AddRows {
    public List<wrapperToAddRows> wrapperList{get;set;}
    public Boolean dispBoolean{get;set;}
    public AddRows() {
        wrapperList = new list<wrapperToAddRows>();
        dispBoolean  = false;
    }    
    
    public void addingRow() {
        wrapperList.add(new wrapperToAddRows());
    }
    
    public void delRow() {        
        integer count = wrapperList.size();
        if(count>0) {
             wrapperList.remove(count-1);   
        }
    }
  
    public void toDisplay() {
    
        dispBoolean = true;
    } 
    public class wrapperToAddRows {
        public String field1{get;set;}
        public string field2{get;set;}
            public wrapperToAddRows() {
                
            }
    }
    
}