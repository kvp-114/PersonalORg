public class clone{
    List<contact> clonerec;
    List<contact> rec1;
    public set<id> i;
    public list<case> cs;
    public list<case> savecase;
    public list<case> savecase1;
    public map<Contact, list<case>> cmap= new map<Contact, list<case>>();
    public list<contact> clist;
     public list<contact> clist1;
     public list<contact> clist2;
    public list<case> cslist;
    public list<case> caslist;
      Contact ct;
      
    ApexPages.StandardSetController setCon;
    public clone(ApexPages.StandardSetController controller){
        clonerec=new List<contact>();
        i=new set<id>();
        rec1=new List<contact>();
        clist=new List<contact>();
        cslist=new List<case>();
        
        clist2= new list<contact>();
        setCon = controller;
        for(contact con :(contact[])setCon.getSelected()){
            i.add(con.id);
         }
       rec1=[Select name,lastname,Accountid,(select case.status,case.origin,case.id  from contact.cases) from contact where id in:i];  
       
       for(contact c:rec1){
           Contact cn=new contact();
           cn=c.clone(false,true,false,false);
           clist2.add(cn);
           System.debug('*******original record values******'+c);
           caslist=new  List<case>();
           for(case cas:c.cases){
               case cs1=new case();
               
               cs1=cas.clone(false,true,false,false);
             caslist.add(cs1);  
           
           }
           System.Debug('--------- original record childs-----'+caslist);
           cmap.put(cn,caslist);
       }
       for(Contact c:cmap.keyset()){
           system.debug('****keys******'+c);
           for(case cas:cmap.get(c)){
               System.debug('++++++++ values +++++++'+cas);
           }
       }
       
       for(contact c:rec1){   
           
           cs=new list<case>();   
            //ct=c.clone(false,true,false,false);
            clonerec.add(c);
          /* For(case c2:ct.cases){
               System.debug('<===========>'+c2);
               cs.add(c2.clone(false,true,false,false));
               System.debug('<cscscscscscscscs>'+cs);
           } */
           
                     
       } 
       }
      public map<Contact, list<case>> getcmap(){ return cmap; }
      public void setcmap(){}
    public list<contact> getclist(){
        return clonerec;
    } 
    public void save1(){
    for(Contact c:cmap.keyset()){
           system.debug('**** after clicking save keys******'+c);
          for(case cas123:cmap.get(c)){
               System.debug('++++++++ after clicking save values +++++++'+cas123);
           }
       }
      
     /*  savecase=new list<case>();
       savecase1=new list<case>();
      ct=new contact();  
     clist1=new list<contact>(); 
    for(contact c3:clonerec){
         ct=c3.clone(false,true,false,false); 
         clist1.add(ct); 
       }
       Database.insert(clist1);
       For(contact cont:clist1){
           for(case cse:cont.cases){
               cse.contactid=cont.id;
               savecase.add(cse.clone(false,true,false,false));
               
           }
       }
       Database.upsert(savecase);*/
       
        
   }
    
}