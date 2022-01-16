trigger accnumoflocationsforcontacts on Account (after insert) {
map<id,account>  m=trigger.newmap;
public list<contact> c=new list<contact>();
for(Id i:m.keyset()){
    
    for(integer j=0;j<m.get(i).NumberofLocations__c;j++){
        contact con=new contact(Accountid=i,lastname='contact'+m.get(i).name);
        c.add(con);
    }
    
}
insert c;

}