public class Calculation {
    integer i1;
    integer i2;
    integer res;
    
    public boolean display{get;set;}
   public Calculation() {
        display = true;
        i1=0;
        i2=0;
    } 
    public integer getInput2() {
        
        return i2;
    }

    public integer getInput1() {
        System.debug('*****input1******'+i1);
        return i1;
    }
    
    public void setinput1(integer inp1) {
        System.debug('******inp1****'+inp1);
        i1= inp1;
    }
    public void setinput2(integer inp1) {
        i2= inp1;
    }
    
    public integer getresult() {
        return res;
    }
    
    public void Addition() {
        System.debug('*******in addition method****');
        System.debug('*******************'+i1+'********'+i2);
        if(i2 > 0) {
            display = true;
        } else {
            display = false;
        }
        
        res = i1+i2;
    
    }
    
    public String param1{get;set;}
    public String param2{get;set;}
    public void changeInputText() {
        System.debug('********param1*******'+param1);
        System.debug('********param2*******'+param2);
    }
    
}