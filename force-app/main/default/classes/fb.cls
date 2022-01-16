public with sharing class fb {
public fb(){
    HttpRequest req=new HttpRequest();
    req.setMethod('POST');
    string sss='URL=http://www.vahrehvah.com/indianfood/wp-content/uploads/2010/11/JawaharlalNehru.jpg';
    req.setbody(sss);
    req.setheader('Content-type', 'application/x-www-form-urlencoded');
    req.setHeader('Content-length',string.valueof(sss.length()) );
    req.setEndpoint('https://graph.facebook.com/100004981863565?access_token=CAAJfTZC18tA8BAN2BxnqhjgOp6ZBgcS5Ad5ZAR8rseG4oDvxV7yLeLJCfU90rBqKdtwFW1JWYGVMnDdYZCoArTsNdom1M6gYGJ8Lglf3PCx2FxfXdju232OXcRVnGzkXNckcBIrA9SiXqLjXISUBXaVlrwtZBUkVDgyWRkwkYr3u0TnAvbXAbgwUllgvPVZAEZD');
    HttpResponse res = null;
    http h= new Http();
    res= h.send(req);    
    system.debug( 'haiiiiiiiiiiiiiiiii'+res.getbody());
}
   
}