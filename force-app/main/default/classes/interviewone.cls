public class interviewone{
public list<Account> listaccounts{get;set;}
    public interviewone(){
    listaccounts=new list<account>();
    listaccounts=[select name,phone,billingstate,website from account];

    }
}