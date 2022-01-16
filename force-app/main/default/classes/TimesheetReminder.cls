global class TimesheetReminder implements Schedulable  {
   global void execute(SchedulableContext SC) {
       sendMail();
   }
   
   public static void sendMail(){
       list<string> toAddreses = new list<string>();
       for(string toAdd:system.label.TimeSheet_Alert_Emails.split(';')){
           toAddreses.add(toAdd);
       }
   
        DateTime dt = Datetime.now().addMonths(-1);
        list<Messaging.SingleEmailMessage> msgList= new list<Messaging.SingleEmailMessage>();
       Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
            OrgWideEmailAddress[] owg = [select Id,Address from OrgWideEmailAddress where Address =:'vijayavardan.nandyala@ap.sony.com'];
            message.setOrgWideEmailAddressId(owg[0].id);
            message.setPlainTextBody(System.label.Timesheet_Message);
            message.setSubject('Timesheet and Shift Allowance Reminder for ' +dt.format('MMMM')+'-'+dt.year());
            message.setUseSignature(false);  
            message.setToAddresses(toAddreses);
            msgList.add(message);
            Messaging.sendEmail(msgList);
   }
}