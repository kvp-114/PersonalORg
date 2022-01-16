public with sharing class sts1 {
    public sts1(){
        
    }
    public void myfacebook(){
        HttpRequest req=new HttpRequest();
        req.setMethod('GET');
        req.setEndpoint('https://graph.facebook.com/oauth/access_token?client_id=667747113284623&redirect_uri=https://vijayavardanreddy-dev-ed.my.salesforce.com/apex/sts1&client_secret=c515e1748779dca66b177e9906b6c4eb&state=SOME555555&code=AQD6kH74xhS5s15Iwy-Lro4T2TokVQ0bY4AXSwjkxr20X-0dPrYxv1sFT4_5GOuxqRuNj4fx6niShG29jPWKBDu1dy_o8_bFCUhPa3YGpf9iMY6wXDxVeI0ufKejTebip1S2oVUMGFvzbjR3bZQt1jdihJPvtPW1Uq3rMIdXG1xillvu5ukaM7nboZGMeJLt4LNYyBUzRWaQkR9FWtZ_Vpa2WcG5NjmhJCvI2WerH8UC7yRksMMgTNRRQOeLNHglOmFMDzmY2vgaxk1DFnUOZEl2VQwKwvUUTnnqs2UDM--jspM91mxOfiiiNF0_zNZBVks#_=_');
    HttpResponse res = null;
      http h= new Http();
    res= h.send(req);
    
    system.debug( 'haiiiiiiiiiiiiiiiii'+res.getbody());

    }
}