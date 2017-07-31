//+------------------------------------------------------------------+
//|                                                aeoniumHEADER.mqh |
//|                                       Copyright 2016, RedRhinoFX |
//|                                        http://www.redrhinofx.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, RedRhinoFX"
#property link      "http://www.redrhinofx.com"
#property version   "1.00"
#property description "This is a INCLUDE file:" 
#property description "Install in MQL4/include folder" 
#property description "access by adding <aeoniumHEADER.mqh> to your project " 
#property strict

#import "aeoniumLOT.ex4"
    double _Get_Optimize_LotSize(string sym, double insertLot,int MagicNumber ,bool MM, double SL, double risk, bool DeveloperDebugger, bool MessageBoxConfirmation);
#import    

#import "aeoniumSAFETY.ex4"
    bool _Get_Safety_Stop_Robot(string sym, int MagicN, int atLevel , string Type );
    bool _Get_Safety_Check_Margin_Room(string sym, double nextLot, double robotMarginLimit);
    double _Get_Safety_Margin_Required_Lotsize(string sym, double lot);
    bool _Get_Safety_Check_Used_Margin(double MaxUsedMarginLimit);
    double _Get_Safety_Margin_Used_Percent();
#import 

#import "aeoniumADR.ex4"
    double _Get_ADR(string sym, int lookback);
#import

#import "aeoniumMARKET.ex4"
  double _Get_Market_Condition_Range(string sym, int MyTF);
  bool   _Get_Market_POC_Above(string sym, int lookback);
  
  double _Get_Market_Bid(string sym);
   double _Get_Market_Ask(string sym);
  
#import



#import "aeoniumRENKO.ex4"
   string  _Get_Renko_Pattern_V10(string sym, int MyTF);
   string  _Get_Renko_Pattern_V5(string sym, int MyTF);
   string  _Get_Renko_Pattern_V1(string sym, int MyTF);
   
   string  _Get_Renko_Pattern_Pullback1(string sym, int MyTF);
   string  _Get_Renko_Pattern_Pullback2(string sym, int MyTF);
   string  _Get_Renko_Pattern_Pullback3(string sym, int MyTF);
   string  _Get_Renko_Pattern_Breakout(string sym, int MyTF);
#import

//#include <WinUser32.mqh>
#import "aeoniumOBJECT.ex4"

   void _Get_Object_Draw_Session(string name, string openTime, string closeTime, int NumberOfDays, color sessionColor);
   void _Get_Object_Previous_Session_Range(string session, int NrOfDays,  int OpenHour, int CloseHour, color text_color);
   void _Get_Object_Box(string ObjName, color ChartTextColor,int corner, int x, int y, bool Obj_BACK );
   
   void _Get_Object_Line(string sym, double GetBreakEven,color LineColor, string ObjName, bool Obj_BACK = false );
   
   double _Get_Object_Line_Value(string LineNameOfObject );
   
   
   void _Get_Object_Create(string name,int x,int y,string text="-",int size=42,string font="Arial",color colour=CLR_NONE, bool Front = FALSE);
   
  void _Get_Object_Create_Corner(string name,int x,int y,string text="-",int size=42,string font="Arial",color colour=CLR_NONE,int corner=0, bool Front = FALSE);
   
   
   void _Get_Object_Displayed( string EANAME, int MagicNumber, double spread, double minlot, double lotstep, double stoplevel, double freezelevel);
   void _Get_Object_MyLogo(string logo, color ChartTextColor, bool setBox);
   
   bool _Get_Button_Build_Button(string ButtonName, int ButtonNumber, int WindowOfObj, int xAxis, int yAxis, int buttonWidth, int buttonHeight,
     int ChartCornerOfObj, string label, int labelSize, color lableColor, color backgroundColor, color outlineColor, string accesscode
   );
   
   void _Get_Button_Build_Panel_A(string ButtonName);
   void _Get_Button_Build_Panel_B(string ButtonName);
   void _Get_Button_Set_Panel_1(string name,int sub_window,int x,int y,int width,int height,int corner,color bg_color,color border_clr,int border_width);
   bool _Get_Button_Status_test(string buttonNameToCheck);
   bool _Get_Button_Status_AnyName(string buttonNameToCheck, string messageToYou );
 
   
#import 


#import "aeoniumACCOUNT.ex4"
          void _Get_Account_Mail(string header , string body, bool MAIL, bool FTP, bool CAPTURE, string FTP_path );
          
          bool   _Get_Account_BarTime(string sym, int MyTF);
          double _Get_Account_BreakEven(string sym, int SymDigits);
        //  void   _Get_Account_DashBoard_Room(string sym, int LotDecimal, bool ShowFront);
          int    _Get_Account_Digits(string sym);
          double _Get_Account_Free_Margin_Available(string sym , double USE_MARGIN_PERCENT);
          double _Get_Account_Leverage( string sym );
          int    _Get_Account_LocalTime(); 
          double _Get_Account_Lot_Cost(string sym );
          double _Get_Account_MarginCall(string sym);
          double _Get_Account_Pips_Til_MarginCall(string sym); 
          double _Get_Account_Point(string sym);
          double _Get_Account_Profit_Since_Restart(); 
          double _Get_Account_Spread(string Sym, double MaxSpreadAllowed); 
          void   _Get_Account_Terminal_Shutdown(); 
          int    _Get_Account_Time_Seconds(); 
          bool   _Get_Account_Time_Avoid(int hour, int min );
          bool   _Get_Account_Trading_Allowed(double USE_MARGIN_PERCENT);
          double _Get_Account_Total_Net_Lots(string sym);
          int    _Get_Account_Volume_Bar(string Sym, int MyTF, int selectBar );
                         
#import


#import "aeoniumORDER.ex4"
     double _Get_Order_Volume( string Sym, int MagicNumber, string Type);
     void _Get_Order_SL_By_Price(string Sym, int MagicNumber, double pr, string Type);
     double _Get_Order_Open_Order_Price(string Sym,string Type, int MagicNumber );
     double _Get_Order_Stoploss_Value(string sym, int MagicN, string Type );
     bool _Get_Order_Last_Trade_Timer_Pending_Orders(string sym, int Magic, int SlowEntryBySecond, string Type , bool DeveloperDebugger);
     int _Get_Order_HistoryCount_Trades_At_Loss( string Sym, int MagicNumber, string Type, int MinutesAfterOpen );
     int _Get_Order_HistoryCount_Trades_At_Gain( string Sym, int MagicNumber, string Type, int MinutesAfterOpen );
     bool _Get_Order_Time_Open_Close(string Sym, int MagicNumber, int SecondsDelayed, string Type);
     bool _Get_Order_Open_Time_NoMagic(string Sym, int SecondsDelayed, string Type);
     bool _Get_Order_Close_Time_NoMagic(string Sym, int SecondsDelayed, string Type);
     int _Get_Order_Count_NoMagic(string sym, string Type );
     double _Get_Order_At_Pip_Gain_or_Loss( string Sym, int MagicNumber, string Type, string gainorloss ); 
     double _Get_Order_At_Profit( string Sym, int MagicNumber, string Type );
     void TrailingByFractals(int ticket,int tmfrm,int frktl_bars,int indent,bool trlinloss);
     string _Get_Order_Trailing_Broken(string sym, int Magic, int TrailingStop, double TrailingStep, string TypeOrder);
     
     
     bool _Get_Order_Last_Trade_Time(string sym, int Magic, int SlowEntryBySecond, string Type , bool DeveloperDebugger);
     double _Get_Order_Trades_Volume( string Sym, int MagicNumber, string Type );
     
     double _Get_Order_At_Loss( string Sym, int MagicNumber, string Type );
     
     
     double _Get_Order_Volume( string Sym, int MagicNumber, string Type);
     
    
     double _Get_Order_History_Trades_At_Loss( string Sym, int MagicNumber, string Type, int MinutesAfterOpen );
     double _Get_Order_At_Profit_History( string Sym, int MagicNumber, string Type, int MinutesAfterOpen );
     void _Get_Order_Hedge_Symbol(string mySym);
     void _Get_Order_Hedge_Symbol(string mySym);
     void _Get_Order_Hedge_Symbol_ALL();
     void _Get_Order_Modify(string Sym, int MagicNumber, string type, double TakeProfit, double StopLoss);
     int _Get_Order_Count_Sell(string Sym, int MagicNumber );
     int _Get_Order_Count_Buy(string Sym, int MagicNumber );
     int _Get_Order_Count(string Sym, int MagicNumber );
     bool _Get_Order_Close_Time(string Sym, int MagicNumber, int SecondsDelayed, string Type);
     void _Get_Order_Status(string value);
     
     int _Get_Order_EnterShort( string FinalSymbol, double FinalLots, string OrderCommentName , int MagicNumber, int MaxSell, double OrderSpacing, double OrderSpacingBuild, int WaitSeconds, bool DeBug, double MartingaleMultiplier, int MartingaleStartLevel, int TypeOfGrid );
     int _Get_Order_EnterLong( string FinalSymbol, double FinalLots, string OrderCommentName , int MagicNumber, int MaxBuy, double OrderSpacing ,double OrderSpacingBuild, int WaitSeconds, bool DeBug, double MartingaleMultiplier, int MartingaleStartLevel, int TypeOfGrid );

    
     string _Get_Order_Print_Broker_Data(string Sym);
     bool _Get_Order_Last_Trade_At_Loss( string Sym, int MagicNumber, string Type );
     
     //============
     int _Get_Order_Lot_Multiplier( int loss );
     int _Get_Order_Loss_Count_sell(string Sym, int MagicNumber);
     int _Get_Order_Loss_Count_buy( string Sym, int MagicNumber);
     
  //   bool _Get_Order_Last_Trade_Sell(string anySym, int MagicNumber, double GridStepReady);
     double _Get_Order_Point(string sym);
     int    _Get_Order_Digit(string sym);
     double _Get_Order_MinLot_Size(string sym);
     int    _Get_Order_MinLot_Decimal(string sym);
     
     
     int    _Get_Order_CloseAll(string sym, int MagicNumber , int Slippage, bool DeveloperDebugger, string TypeOrder);
     
     
     
     int    _Get_Order_Close(string sym, int MagicNumber ,double MinPipGain, int Slippage, string Type, bool DeveloperDebugger, double partial_Lots );
     string _Get_Order_Error();
     int _Get_Order_Count(string sym, int MagicN, string Type );
     
     bool   _Get_Order_Time(string sym, int Magic, int SlowEntryBySecond, bool DeveloperDebugger);
     
     // CHECK SPREAD
     double _Get_Order_Spread_Value(string sym, int SymDigits);
     bool _Get_Order_Spread_Result(string Sym, double bPoint, int SymDigits, double MaxSpread);
     
     // Get Average Price to Breakeve the Entire Basket
     void _Get_Order_Breakeven(string sym, int MagicNumber, double Greed, string Type, bool DeveloperDebugger);
     
     double  sBreakEven(string sym, int MagicNumber, double Greed);
     double bBreakEven(string sym, int MagicNumber, double Greed);
     
     // MAIN ORDER FUNCTIONS 
     void _Get_Order_SL(string Sym, int MagicNumber, double sl, string Type);
     void _Get_Order_TP(string Sym, int MagicNumber, double tp, string Type);
     
     void _Get_Order_SL_Once(string Sym, int MagicNumber, double sl, string Type);
     void _Get_Order_TP_Once(string Sym, int MagicNumber, double tp, string Type);
     
     void _Get_Order_Lockn_BE(string Sym, int MagicNumber, double sl, string Type, double TrailingPipetteBy );
     void _Get_Order_TrailProfits(string sym, double TrailFrom, double TrailStop, int MagicF, string Type , bool DeveloperDebugger);
     
     // CHECK ORDER DISTANCE
     bool   _Get_Order_Spacing(string anySym, int MagicNumber, double GridStepReady, string Type, double PB_OrderSpacing, int TypeOfGrid);
     
     int _Get_Order_EnterLong_Pending( string FinalSymbol, double FinalLots, string EA_Comment, int MagicNumber, double pGap, bool LimitOrder,bool DeveloperDebugger, int MaxTradePend , int MaxTrade);
     int _Get_Order_EnterShrt_Pending( string FinalSymbol, double FinalLots, string EA_Comment, int MagicNumber, double pGap, bool LimitOrder, bool DeveloperDebugger, int MaxTradePend , int MaxTrade);
     
  
     int _Get_Order_Count_Buy_Pending(string Sym, int MagicNumber,string Label );
     int _Get_Order_Count_Sell_Pending(string Sym, int MagicNumber ,string Label );
     string _Get_Order_Delete_Pending(string sym, int Magic, string Type, bool debug);
     
#import

#import "aeoniumLOGIC.ex4"

    double _Get_Logic_EMA_Price(string Sym, int MyTF, int maPeriod, int maShift);

    double _Get_Logic_MACD_Logic_Divergence(string Sym, int MyTF,int x,int y,int z );

    double _Get_Logic_MACD_Distance(string Sym, int MyTF,int x,int y,int z );
    double _Get_Logic_POC_POC(string sym);// Range Detector

    double _Get_Logic_Bar_High(string sym, int tf, int b);
    double _Get_Logic_Bar_Low(string sym, int tf, int b);


   double _Get_Logic_Bar_Price(string sym, int MyTF, int MyShift);// Newest June 3rd
   string _Get_Logic_Bands(string Sym, int MyTF, int ChannelWidthPeriod, double ChannelDevi,int selectBar);
    
   // CCOMPLETE STRATEGY LOGIC
   string _Get_Logic_ATS1(string Sym, int MyTF, int ChannelWidthPeriod, double ChannelDevi, double MaxBar);
   void   _Get_Logic_Send_Alert(string emailHeader, string mess, bool Push, bool Email, bool PopUp, string sym, int MyTF);
   void   _Get_Logic_Send_Alert_Fibo(double fibprice, string name, int fiblevel, bool Push, bool Email, bool PopUp, string sym, int MyTF);
   double _Get_Logic_iCustom(string sym, int MyTimeFrame, string nameofINDICATOR, int bufferNumber , int shift);
   
   string _Get_Logic_OBOS(string sym, int MyTF, int pATR, int MAfast, int MAslow, bool UseComplexityMA, int minATR, int maxATR, double bPoint , double cciSellLevel , double cciBuyLevel, int wSellLevel, int wBuyLevel );

   //POC - or ANY GLOBALS
   double _Get_Logic_Global_Any( string sym , string marketName);

   //==== VWAP 
   double _Get_Logic_VWAP_BandWidth_1(string sym);
   double _Get_Logic_VWAP_BandWidth_2(string sym);
   double _Get_Logic_VWAP_BandWidth_3(string sym);
   double _Get_Logic_VWAP_DistanceFromVWAP(string sym);
   double _Get_Logic_VWAP_VWAP(string sym);
   
   
   double _Get_Logic_VWAP_POC(string sym);
   
   
   bool   _Get_Logic_VWAP_BullTrend(string sym, int myTF);
   
   double _Get_Logic_VWAP_BandWidth_1_Top(string sym);
   double _Get_Logic_VWAP_BandWidth_2_Top(string sym);
   double _Get_Logic_VWAP_BandWidth_3_Top(string sym);
   
   double _Get_Logic_VWAP_BandWidth_1_Bot(string sym);
   double _Get_Logic_VWAP_BandWidth_2_Bot(string sym);
   double _Get_Logic_VWAP_BandWidth_3_Bot(string sym);
   
   //== STOCH
   double _Get_Logic_Stoch_SignalLine(string sym, int tf, int k, int d, int slowing, int selectBar);
   double _Get_Logic_Stoch_MainLine(string sym, int tf, int k, int d, int slowing, int selectBar);
   
   
   bool _Get_Logic_TimeFilter(int StartTime, int EndTime  );
   bool _Get_Logic_TimeBar(string sym,int MyTF);
   
   // Scanners , can be M1, anyTF, Last Five Days?
   string  _Get_Logic_Bar_5_HiLo_Signal(string sym, int tf);// Breakout Signal returns bull bear
   
   string _Get_Logic_Bar_5_HiLo_Data(string sym, int tf);
   string _Get_Logic_Bar_X(string sym,int pos, int MyTF, int lastxbars, int adxperiod , double adxlevel);
   
   // REAL SCANNER
   void _Get_Logic_SCAN_5Bar(string sym, int myTF);
   
   // BARS DATA - returns bull or bear
   string _Get_Logic_Bar_MTF(string sym, int MyTF1, int MyTF2, int MyTF3 ); // returns bull bear
   double _Get_Logic_Bar_Size(string sym, int MyTF, int MyShift, double MaxBar);
   string _Get_Logic_Bar_Engulfing(string sym, int MyTF, int MyShift);// output :"bull" or " bear" or "none"
   string _Get_Logic_Bar_Direction(string sym, int MyTF, int MyShift);  // returns bull bear
   string _Get_Logic_Bar_MA(string sym, int MyTF, int maPeriod, int maShift, int selectBar); // returns bull bear
   
   // INDICATORS 
   
   // Stragety Filters 
   
   // TREND
   string _Get_Logic_MA_Direction(string Sym, int MyTF, int maPeriod, int maShift);                            // returns bull bear
   double _Get_Logic_Envelope_Angle(string Sym, int MyTF, int period , double deviation, int loobackRange);    // returns angle
   string _Get_Logic_EMA(string symbol, int tf, int lookback, int period);                                     // returns bull bear
   
   // RANGE
   string _Get_Logic_Envelope(string Sym, int MyTF, int period , double deviation);                            // returns bull bear
   string _Get_Logic_Squeeze(string Sym, int MyTF, int period , double BandDeviation ,double EnvDeviation );   // returns bull bear
   string _Get_Logic_RSI(string sym, int MyTF ,int period , bool lert , int BuyLevel, int SellLevel );         // returns bull bear
   string _Get_Logic_MACD_RSI(string Sym, int MyTF );   
   string _Get_Logic_MACD(string Sym, int MyTF,int x,int y,int z );                                                        // returns bull bear
   
#import

