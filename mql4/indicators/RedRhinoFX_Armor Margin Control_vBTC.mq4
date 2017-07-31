//+------------------------------------------------------------------+
//|                                         Armor Margin Control.mq4 |
//|                                       Copyright 2015, RedrhinoFX |
//|                                            http://redrhinofx.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2015, RedrhinoFX"
#property link      "http://redrhinofx.com/simplefx"
#property description "This is Indicator with Timer: UpdateInterval in Seconds  "
#property version   "1.00"
#property strict
#property indicator_chart_window


extern color  LineColor      = Gray;
extern int    UpdateInterval = 15;

//--- GLOBALS
string Sym = Symbol();
int SymDigits =0;
double min=0.01;
int LotDecimal=2;
double SymPoints=0.0001;
double TenthPoint=0.00001;
int dPoint = 4;
int bPoint = 10000;
int xPoint = 1000;

int stopLevelMinPoint = 0;


//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
    CurrencyDetails(Sym);
    
    Label();
 
     EventSetTimer(UpdateInterval);
      
//---
   return(INIT_SUCCEEDED);
    

  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---
   
//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
    Label();
  }
//+------------------------------------------------------------------+



void CurrencyDetails(string anySym){
   // FEB 2015
	double  wack = MarketInfo(anySym,MODE_DIGITS);
	   SymDigits = MathRound(wack);
	   min = MarketInfo(anySym,MODE_MINLOT);
	   // ECN 0.0 , MarketMaker > 0; 
	   // Value in Points , therefore 40 points = 4 pips 40 pippet
	   stopLevelMinPoint = MarketInfo(anySym,MODE_STOPLEVEL);
	  // if(DeveloperDebugger)  Print(" Min StopLevel " + DoubleToStr(stopLevelMinPoint,0) );
   	if ( min == 0.01)
   	{
   		LotDecimal = 2;
   	} else{
   		LotDecimal = 1;
   	}
 
    if (SymDigits == 3) {
         SymPoints = 0.01; // Fix for 3/5 Digits
         TenthPoint = 0.001;
         dPoint = 2;
         bPoint = 100;
         xPoint = 1;
    } 
	
    if (SymDigits == 5) {
         SymPoints  = 0.0001; // Fix for 3/5 Digits
         TenthPoint = 0.00001;
         dPoint = 4;
         bPoint = 10000;
         xPoint = 1000;
    } 
    
    if (SymDigits == 2){
         SymPoints = 0.01;
         dPoint = 2;
         bPoint = 10;// Gold is  2 digits 
    }
	
    if (SymDigits == 4){
       SymPoints = 0.0001;
       dPoint = 4;
       bPoint = 1000;// Gold is  2 digits
       xPoint = 1000; 
    }
    //== 

}



//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void Label(){
//===
     double  p = 0.0;
     double ab = NormalizeDouble(AccountBalance(),2);
     double eq = NormalizeDouble(AccountEquity(),2); 
     double fm = NormalizeDouble(AccountFreeMargin(),2);
     if( AccountMargin() > 0 ){
      p = NormalizeDouble((eq/AccountMargin())*100,2);// percent of margin called MARGIN LEVEL inside platform
     }else{
      p = 200;
     }
     
     double  so = AccountStopoutLevel();
     double  mtmc = p - so;// margin percentage til margincall 
     double  mr =   MarketInfo(Sym, MODE_MARGINREQUIRED);// for 1.0 lotsize * minlot
     double  mrValue = mr * min;// margin required for the smallest lotsize
     double  ml = NormalizeDouble(fm/mr,LotDecimal);// max lot
   //  double  mc = NormalizeDouble(eq / (ml),1);
     double  pv = NormalizeDouble(ml*10,1);
     
     double totallotsOnAcc = ReturnAllLotsize(Sym);
     if( totallotsOnAcc == 0.0){
         totallotsOnAcc = 0.01;
     }
     
     // get the tick value 
     double usedMargin = (totallotsOnAcc*100) * mrValue;// margin required for smallest lot (1100) times 0.07 lots
    // what is the tick value? 
    
    // btc 2000 usd
    // cost $2.00 to open position ( 1,000,000 = 1.0btc 
    // 1000 bits - 0.001 btc = $2
    //0.01 lotsize is what tick value = 1000 units of eurusd buy ( 1000 units of euro or ) 1000USD
    //0.01 lot , times 100,000
    double xUnits = min * 100000;// == 1000 units of symbol
    string getSym = Symbol();///StringSubstr( Symbol(),0,3);// EUR
    double price = MarketInfo(getSym,MODE_BID); 
    
    double btc = MarketInfo("BTCUSD",MODE_BID);
    
    double x = (xUnits * price) - (xUnits * (price -SymPoints) );//TICK VALUE 
    
    double z = (x/btc) * 1000000;// TIck value in BTC 
    // 1000 usd at eurusd.price 1.1465 = 
    // 1.1464 = 
    // 1.1450 = 
    
     double MarginCall = fm/ ((totallotsOnAcc*100)*z);
     
      objectCreate("zchn_1txt",5,287,DoubleToStr(mtmc,1)+"%",16,"Arial Bold",Yellow); 
      objectCreate("zchnl_00txt",5,277,"btc "+DoubleToStr(ab,2),8,"Arial Bold",SkyBlue); 
      objectCreate("zchnl_0txt",5,267,"eq "+DoubleToStr(eq,2),8,"Arial Bold",White); 
      objectCreate("zchnl_1txt",5,257,"Cost: BTC"+DoubleToStr(mrValue,1),8,"Arial Bold",Orange); 
      objectCreate("zchnl_2txt",5,247,"MaxLotSize "+DoubleToStr(ml,LotDecimal),8,"Arial Bold",Orange); 
      objectCreate("zchnl_3txt",5,237,"Free: BTC"+DoubleToStr(fm,2),8,"Arial Bold",Orange); 
      objectCreate("zchnl_4txt",5,227,"Used: BTC"+DoubleToStr(usedMargin,1),8,"Arial Bold",Orange); 
      
      objectCreate("Mar_1t",5,216,"Room to Move",10,"Arial Narrow",LineColor); 
      objectCreate("Mar_1p",5,201,DoubleToStr(MarginCall,1)+" pips",13,"Arial Narrow",Yellow); 
   //   objectCreate("Lots_1t",5,187,"Exposure",10,"Arial Narrow",LineColor); 
   //   objectCreate("Lots_1p",5,167,DoubleToStr(totallotsOnAcc,LotDecimal),16,"Arial Narrow",LineColor); 
      
        
        
        
}
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
      
  }



double ReturnAllLotsize(string sym)
{
   // Feb 2015
    double Bcount = 0.0; double Scount = 0.0;
    for (int i = OrdersTotal() - 1; i >= 0; i--)
    {
       if( OrderSelect(i, SELECT_BY_POS, MODE_TRADES)){
          if ( OrderSymbol() == sym ){
           
                if(OrderType()==OP_BUY){
                   Bcount+= OrderLots(); 
                }
                
                if(OrderType()==OP_SELL){
                   Scount+= OrderLots(); 
                }
                
            
          }
       }
     }
     double total =0.0;
     if( Bcount > Scount ) {
         total = Bcount - Scount; 
     }else{
       total = Scount - Bcount;
     }
     
    //----
    return(total);
}//--

//+------------------------------------------------------------------+
//| Function..: Create Labels                                        |
//+------------------------------------------------------------------+
void objectCreate(string name,int x,int y,string text="-",int size=42,string font="Arial",color colour=CLR_NONE)
  {
   ObjectCreate(name,OBJ_LABEL,0,0,0);
   ObjectSet(name,OBJPROP_CORNER,3);
   ObjectSet(name,OBJPROP_COLOR,colour);
   ObjectSet(name,OBJPROP_XDISTANCE,x);
   ObjectSet(name,OBJPROP_YDISTANCE,y);
   ObjectSetText(name,text,size,font,colour);
  }
  
  
  
  
 










