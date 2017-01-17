function f_event_market(varargin)
InstrumentID=varargin{3};% 合约编号3
% BidPrice1=varargin{4};% 买一价4
% BidVolume1=varargin{5};%买一量5
% AskPrice1=varargin{6};%卖一价6
% AskVolume1=varargin{7};% 卖一量7
% OpenPrice=varargin{8};% 开盘价8
HighestPrice=varargin{9};% 最高价9
LowestPrice=varargin{10};% 最低价10
LastPrice=varargin{11};% 最新价11
% OpenInterest=varargin{12};% 持仓量12
% Volume=varargin{13};% 成交量13
UpperLimitPrice=varargin{14};% 涨停价14
LowerLimitPrice=varargin{15};% 跌停价15
% PreSettlementPrice=varargin{16};% 昨结算价16
% AveragePrice=varargin{17};% 今日平均价17
UpdateTime=varargin{18};%行情更新时间18
% UpdateMilliSecond=varargin{19};%更新毫秒数为0或500 19
global main
if strcmp(InstrumentID,main.instrumentID)
    %% 判断止盈止损
    if main.position==1 %持有多单
        if   (LastPrice - main.InPrice) >= main.zhiying && ~isnan(main.InPrice)%止盈
            %%挂入止盈多单
            OrderId = Sell(main.actctp,main.instrumentID,main.tradenum,LowerLimitPrice);%跌停价挂入止盈多单，保证价格能够出场
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---挂入止盈多单，程序停止'])
            main.position = 0;
            main.actctp.unregisterallevents;
            diary off;
        elseif (LastPrice - main.maxPrice) <= -main.zhisun && ~isnan(main.InPrice)  %止损
            %%挂入止损多单
            OrderId = Sell(main.actctp,main.instrumentID,main.tradenum,LowerLimitPrice);%跌停价挂入止损多单，保证价格能够出场
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---挂入止损多单，程序停止'])
            main.position = 0;
            main.actctp.unregisterallevents;  
            diary off;
        end
    elseif main.position==-1 %持有空单
        if (LastPrice - main.InPrice) * -1 >= main.zhiying && ~isnan(main.InPrice)%止盈
            %%挂入止盈空单
            OrderId = Cover(main.actctp,main.instrumentID,main.tradenum,UpperLimitPrice);%涨停价挂入止盈空单，保证价格能够出场
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---挂入止盈空单，程序停止'])
            main.position = 0;
            main.actctp.unregisterallevents;  
            diary off;
        elseif (LastPrice - main.InPrice) * -1 <= -main.zhisun  && ~isnan(main.InPrice) %止损
            %%挂入止损空单
            OrderId = Cover(main.actctp,main.instrumentID,main.tradenum,UpperLimitPrice);%跌停价挂入止损多单，保证价格能够出场
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---挂入止损空单，程序停止'])
            main.position = 0;
            main.actctp.unregisterallevents;  
            diary off;
        end
    else
   %% 判断是否有新开仓  
        if LastPrice <= main.buy && isnan(main.InPrice)
            %%进多单
            OrderId=Buy(main.actctp,main.instrumentID,main.tradenum,UpperLimitPrice);%开多单
            main.position = 1;
        elseif LastPrice >= main.sell && isnan(main.InPrice)
            %进空单
            OrderId = Short(main.actctp,main.instrumentID,main.tradenum,LowerLimitPrice);%开空单
            main.position = -1;
        end
    end
    %% 更新数据
    main.timestr = UpdateTime;
    main.price=LastPrice;%更新最新价
    
end
end 
