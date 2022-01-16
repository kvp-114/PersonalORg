public with sharing class myclone {
    public boolean disableopt{get;set;}
    public string texttoclone{get;set;}
    public myclone(){
    disableopt=false;
    texttoclone='Add To Clone';
    }
   public void addtoclone() {
       texttoclone='Removed';
        disableopt=true;
    }
}