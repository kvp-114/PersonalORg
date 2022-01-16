public with sharing class WebServices {
    public WebServices(){
    
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        //req.setEndpoint('http://www.cheenath.com/tutorial/sample1/build.xml');
        req.setEndpoint('https://vijayavardanreddy-developer-edition.na15.force.com/services/data/v20.0/sobjects/Account/ -H \"Authorization: Bearer token\"');
        req.setMethod('GET');
        HttpResponse res = http.send(req);
    
        // Log the XML content 
        
        System.debug('******body*********'+res.getBody());
        System.debug('*******status*******'+res.getStatusCode());
        
    }
}