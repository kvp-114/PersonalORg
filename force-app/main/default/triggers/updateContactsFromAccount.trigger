trigger updateContactsFromAccount on Account (after update) {
 list  <Contact> con = new List<Contact>();
  List<account> Acc =new List<Account>();
  for(account a:Trigger.new) {
    if(
       a.billingstreet != trigger.oldmap.get(a.id).billingstreet || 
       a.billingcity != trigger.oldmap.get(a.id).billingcity ||
       a.billingstate != trigger.oldmap.get(a.id).billingstate || 
       a.billingpostalcode != trigger.oldmap.get(a.id).billingpostalcode ||
       a.billingcountry != trigger.oldmap.get(a.id).billingcountry) {
      Acc.add(a);
    }
  }
  for(Contact c:[select id,accountid,phone,mailingstreet,mailingcity,mailingpostalcode,mailingcountry,mailingstate from contact where accountid in :Acc]) {
    account a = trigger.newmap.get(c.accountid);
    c.mailingstreet = a.billingstreet;
    c.mailingcity = a.billingcity;
    c.mailingstate = a.billingstate;
    c.mailingpostalcode = a.billingpostalcode;
    c.mailingcountry = a.billingcountry;
    con.add(c);
    
  }
  update con;
}