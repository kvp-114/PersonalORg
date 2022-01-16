public with sharing class FetchAccount {
    
       //Login Domain May be test, prerellogin.pre
       String LOGIN_DOMAIN = 'www';
       public String pwd{get;set;}
       public String userName{get;set;}
       public List<Account> acc{get;set;}
       public String errMsg{get;set;}
       public String displayError{get;set;}
   
      public FetchAccount()
     {
          displayError = 'none';
          userName='allwin@datab.com';
          pwd='Cloud@786';
      }
  
      public void fetch()
     {
          errMsg  = 'Some error occurred, please try again';
          try
          {
         //-----------------------------------
          // Login via SOAP/XML web service api
          //-----------------------------------
          HttpRequest request = new HttpRequest();
          request.setEndpoint('https://login.database.com/services/Soap/u/25.0');
          request.setMethod('POST');
          request.setHeader('Content-Type', 'text/xml;charset=UTF-8');
          request.setHeader('SOAPAction', '""');
          //not escaping username and password because we're setting those variables above
          //in other words, this line "trusts" the lines above
          //if username and password were sourced elsewhere, they'd need to be escaped below
          request.setBody('<env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/"><env:Body><n1:login xmlns:n1="urn:partner.soap.sforce.com"><n1:username>your_username</n1:username><n1:password>your_password</n1:password></n1:login></env:Body></env:Envelope>');
          Dom.XmlNode resultElmt = (new Http()).send(request).getBodyDocument().getRootElement()
            .getChildElement('Body', 'http://schemas.xmlsoap.org/soap/envelope/')
            .getChildElement('loginResponse', 'urn:partner.soap.sforce.com')
            .getChildElement('result', 'urn:partner.soap.sforce.com');
   
              	System.debug('Responseeeee'+resultElmt);
          //-------------------------------
          // Grab session id and server url
          //--------------------------------
          /*final String SERVER_URL = resultElmt.getChildElement('serverUrl', 'urn:partner.soap.sforce.com') .getText().split('/services')[0];
          final String SESSION_ID = resultElmt.getChildElement('sessionId', 'urn:partner.soap.sforce.com') .getText();
  
          //----------------------------------
         // Load first 10 accounts via REST API
          //---------------------------------
          final PageReference theUrl = new PageReference(SERVER_URL + '/services/data/v22.0/query/');
          theUrl.getParameters().put('q','Select a.Phone, a.Name, a.CreatedBy.FirstName, a.CreatedById From Account a limit 10');
          request = new HttpRequest();
          request.setEndpoint(theUrl.getUrl());
          request.setMethod('GET');
          request.setHeader('Authorization', 'OAuth ' + SESSION_ID);
   
          String body = (new Http()).send(request).getBody();
   
          JSONParser parser = JSON.createParser(body);
  
          do{
              parser.nextToken();
          }while(parser.hasCurrentToken() && !'records'.equals(parser.getCurrentName()));
   
          parser.nextToken();
   
          acc = (List<Account>) parser.readValueAs(List<Account>.class);*/
          }
          catch(Exception e)
          {
              displayError = 'block';
          }
   
      }
  }