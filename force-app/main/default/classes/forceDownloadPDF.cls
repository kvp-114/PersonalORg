public class forceDownloadPDF {

    public string renderAs{get;set;}

    public forceDownloadPDF()
    { 
        //figure out if the user passed in the pdf url variable and if it is set to true.
        if(ApexPages.currentPage().getParameters().get('pdf') != null && ApexPages.currentPage().getParameters().get('pdf') == 'true') 
        {
            //if so, we are rendering this thing as a pdf. If there were other renderas options that were valid we could consider allowing the user to pass
            //in the actual renderAs type in the url, but as it stands the only options are pdf and null so no reason to allow the user to pass that in directly.
            renderAs = 'pdf';

            //figure out if we are forcing download or not.
            if(ApexPages.currentPage().getParameters().get('force_download') != null && ApexPages.currentPage().getParameters().get('force_download') == 'true') 
            {
                //setup a default file name
                string fileName = 'My PDF Report '+date.today()+'.pdf';

                //we can even get more created and allow the user to pass in a filename via the URL so it can be customized further
                if(apexPages.currentPage().getParameters().get('filename') != null)
                {
                    fileName = apexPages.currentPage().getParameters().get('filename') +'.pdf';
                }
                //here is were the magic happens. We have to set the content disposition as attachment.
                Apexpages.currentPage().getHeaders().put('content-disposition', 'attachemnt; filename='+fileName);
            }               
        }        
    }
}