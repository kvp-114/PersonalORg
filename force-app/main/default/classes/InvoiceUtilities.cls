public class InvoiceUtilities {

public static String renumberLineItems(String invoiceName) {

    Invoice__c invoice = [Select i.Name, (Select Name From Line_Items__r ORDER BY Name)From Invoice__c i Where i.Name = :invoiceName LIMIT 1];

    Integer i = 1;
for (Line_Item__c item : invoice.Line_Items__r) {
item.Name = String.valueOf(i);
System.debug(item.Name);
i++;
}
// Update the Line Items in one transaction, rollback if any problems
    try {
Database.update(invoice.Line_Items__r);
}
catch (DmlException e) {
return e.getMessage();
}
    
// and return error messages to the calling environment.
// On success, return a message to the calling program.
    return 'Line items renumbered successfully.';
}
}