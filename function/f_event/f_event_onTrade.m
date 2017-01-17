function f_event_onTrade(varargin)
OrderID=varargin{3};% 报单编号
InstrumentID=varargin{4};% 和约编号
IsBuy=varargin{5};% 是否为买,非0为买,否则为卖;
IsOpen=varargin{6};% 是否开仓,非0为开仓,否则为平仓
Volume=varargin{7};% 委托数量
Price=varargin{8};% 成交均价
TradeTime=varargin{9};% 成交时间

global main
    
    if strcmp(InstrumentID,main.instrumentID)
        
        %  开多
        if IsBuy==1 & IsOpen==1
            main.position = 1;
            main.InPrice = Price;
            disp('---策略开多信号已成交---');  
        end
        %  平多
        if IsBuy==0 & IsOpen==0
            main.position = 0;
           main.InPrice = nan;
            disp('---策略平多信号已成交---');        
        end
        % 开空
        if IsBuy==0 & IsOpen==1
        main.position = -1;
           main.InPrice = Price;
            disp('---策略开空信号已成交---');  
        end
        % 平空
        if IsBuy==1 & IsOpen==0
            main.position = 0;
          main.InPrice = nan;
            disp('---策略平空信号已成交---');  
        end
       
    end

end


