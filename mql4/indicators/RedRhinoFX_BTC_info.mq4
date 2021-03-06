
#property copyright "Copyright © 2017, RedRhinoFX"
#property link      "http://www.RedRhinoFX.com/simplefx"
#property description " Indicator"
#property version     "1.0"
#property strict

#property indicator_separate_window
#property indicator_buffers   3
#property indicator_color1    MediumSeaGreen
#property indicator_width1    3
#property indicator_color2    Teal
#property indicator_width2    3
#property indicator_color3    DeepSkyBlue
#property indicator_minimum 0


string short_name = "";

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit(){
//---- indicators
  
   
   IndicatorDigits(2);
   
   short_name="BITtoUSD";
   
   IndicatorShortName(short_name);

   return(INIT_SUCCEEDED);
}

void OnDeinit(const int reason)
{
  
     //https://www.mql5.com/en/docs/objects/objectdeleteall
       ObjectsDeleteAll(-1);// all windows including main and sub windows
        
}



int OnCalculate (const int rates_total,
                 const int prev_calculated,
                 const datetime& time[],
                 const double& open[],
                 const double& high[],
                 const double& low[],
                 const double& close[],
                 const long& tick_volume[],
                 const long& volume[],
                 const int& spread[])
  {
  
  MyLogo();
 
      return(rates_total);
}


double getDD(){

   double price = MarketInfo("BTCUSD",MODE_ASK);
   // 2000 btc price is USD 
   double acc = (AccountBalance()-AccountEquity() )*0.000001 ;// 1million == 1 btc 
   double usdValue = NormalizeDouble(price * acc,2);
   // 0.10 (balance) *
   // 1,000,000
   return(usdValue);

}

double getData(){
   double price = MarketInfo("BTCUSD",MODE_ASK);
   // 2000 btc price is USD 
   double acc = AccountBalance()*0.000001 ;// 1million == 1 btc 
   double usdValue = price * acc;
   // 0.10 (balance) *
   // 1,000,000
   return(usdValue);
}

double getEQ(){

   double price = MarketInfo("BTCUSD",MODE_ASK);
   // 2000 btc price is USD 
   double acc = AccountEquity()*0.000001 ;// 1million == 1 btc 
   double usdValue = price * acc;
   // 0.10 (balance) *
   // 1,000,000
   return(usdValue);

}

double getM(){

   double price = MarketInfo("BTCUSD",MODE_ASK);
   // 2000 btc price is USD 
   double acc = AccountFreeMargin()*0.000001 ;// 1million == 1 btc 
   double usdValue = NormalizeDouble(price * acc,2);
   // 0.10 (balance) *
   // 1,000,000
   return(usdValue);

}
//= get tick
double getTick(){
   
   // tick value, contract size 
   // loop positions, add OrderLots() 
   /// what is smallest lotsize and value of 
   return(0);

}

extern color      LineColor           = Silver;

void MyLogo()
{ 
  
  
  double usdValue =  getData();
  double usdEQ =  getEQ();
  double usdMargin =  getM();
  double usdValueDD =  getDD();
  
  double usdTickValue =  getTick();
  

   int winIndex = WindowFind(short_name);
 //  Print(" Sub WIndow FInd " , winIndex);
   string name_2 = "bal" + "2";
 
   if (ObjectFind(name_2) == -1) {
      ObjectCreate(NULL,name_2, OBJ_LABEL, winIndex, 0, 0);// Sub Window == 1
      //ObjectCreate( string name, int type, int window, datetime time1, double price1, datetime time2=0, double price2=0, datetime time3=0, double price3=0) 
      ObjectSet(name_2, OBJPROP_CORNER, 1);
      ObjectSet(name_2, OBJPROP_HIDDEN, TRUE);
      ObjectSet(name_2, OBJPROP_XDISTANCE, 0);
      ObjectSet(name_2, OBJPROP_YDISTANCE, 0);
      ObjectSetText(name_2, "Bal $"+DoubleToStr(usdValue,2)+" DD $"
      + DoubleToStr(usdValueDD,2) , 20, "Courier New", LineColor);
   }else{
      // update the price
     //
      ObjectSetText(name_2, "Bal $"+DoubleToStr(usdValue,2)+" DD $"
      +DoubleToStr(usdValueDD,2) , 20, "Courier New", LineColor);
   }
   //=========== STRING TWO ============================
    name_2 = "eq" + "2";
   if (ObjectFind(name_2) == -1) {
      ObjectCreate(NULL,name_2, OBJ_LABEL, winIndex, 0, 0);// Sub Window == 1
      //ObjectCreate( string name, int type, int window, datetime time1, double price1, datetime time2=0, double price2=0, datetime time3=0, double price3=0) 
      ObjectSet(name_2, OBJPROP_CORNER, 1);
      ObjectSet(name_2, OBJPROP_HIDDEN, TRUE);
      ObjectSet(name_2, OBJPROP_XDISTANCE, 0);
      ObjectSet(name_2, OBJPROP_YDISTANCE, 30);
      ObjectSetText(name_2, "EQ $"+DoubleToStr(usdEQ,2)+" FM $"+
      DoubleToStr(usdMargin,2)
       , 20, "Courier New", LineColor);
   }else{
      // update the price
     //
     ObjectSetText(name_2, "EQ $"+DoubleToStr(usdEQ,2)+" FM $"+
      DoubleToStr(usdMargin,2) , 20, "Courier New", LineColor);
   }
   // Get Stoploss 
   // Get Risk Per Trade 
     name_2 = "rpt" + "2";
   if (ObjectFind(name_2) == -1) {
      ObjectCreate(NULL,name_2, OBJ_LABEL, winIndex, 0, 0);// Sub Window == 1
      //ObjectCreate( string name, int type, int window, datetime time1, double price1, datetime time2=0, double price2=0, datetime time3=0, double price3=0) 
      ObjectSet(name_2, OBJPROP_CORNER, 1);
      ObjectSet(name_2, OBJPROP_HIDDEN, TRUE);
      ObjectSet(name_2, OBJPROP_XDISTANCE, 0);
      ObjectSet(name_2, OBJPROP_YDISTANCE, 60);
      ObjectSetText(name_2, "EQ $"+DoubleToStr(usdEQ,2)+" FM $"+
      DoubleToStr(usdMargin,2)
       , 20, "Courier New", LineColor);
   }else{
      // update the price
     //
     ObjectSetText(name_2, "RPT $"+DoubleToStr(usdValue*0.01,2)+" SL $"+
      DoubleToStr(usdMargin,2) , 20, "Courier New", LineColor);
   }
 
  
   
}//-----





