function f_event_market(varargin)
InstrumentID=varargin{3};% ��Լ���3
% BidPrice1=varargin{4};% ��һ��4
% BidVolume1=varargin{5};%��һ��5
% AskPrice1=varargin{6};%��һ��6
% AskVolume1=varargin{7};% ��һ��7
% OpenPrice=varargin{8};% ���̼�8
HighestPrice=varargin{9};% ��߼�9
LowestPrice=varargin{10};% ��ͼ�10
LastPrice=varargin{11};% ���¼�11
% OpenInterest=varargin{12};% �ֲ���12
% Volume=varargin{13};% �ɽ���13
UpperLimitPrice=varargin{14};% ��ͣ��14
LowerLimitPrice=varargin{15};% ��ͣ��15
% PreSettlementPrice=varargin{16};% ������16
% AveragePrice=varargin{17};% ����ƽ����17
UpdateTime=varargin{18};%�������ʱ��18
% UpdateMilliSecond=varargin{19};%���º�����Ϊ0��500 19
global main
if strcmp(InstrumentID,main.instrumentID)
    %% �ж�ֹӯֹ��
    if main.position==1 %���ж൥
        if   (LastPrice - main.InPrice) >= main.zhiying && ~isnan(main.InPrice)%ֹӯ
            %%����ֹӯ�൥
            OrderId = Sell(main.actctp,main.instrumentID,main.tradenum,LowerLimitPrice);%��ͣ�۹���ֹӯ�൥����֤�۸��ܹ�����
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---����ֹӯ�൥������ֹͣ'])
            main.position = 0;
            main.actctp.unregisterallevents;
            diary off;
        elseif (LastPrice - main.maxPrice) <= -main.zhisun && ~isnan(main.InPrice)  %ֹ��
            %%����ֹ��൥
            OrderId = Sell(main.actctp,main.instrumentID,main.tradenum,LowerLimitPrice);%��ͣ�۹���ֹ��൥����֤�۸��ܹ�����
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---����ֹ��൥������ֹͣ'])
            main.position = 0;
            main.actctp.unregisterallevents;  
            diary off;
        end
    elseif main.position==-1 %���пյ�
        if (LastPrice - main.InPrice) * -1 >= main.zhiying && ~isnan(main.InPrice)%ֹӯ
            %%����ֹӯ�յ�
            OrderId = Cover(main.actctp,main.instrumentID,main.tradenum,UpperLimitPrice);%��ͣ�۹���ֹӯ�յ�����֤�۸��ܹ�����
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---����ֹӯ�յ�������ֹͣ'])
            main.position = 0;
            main.actctp.unregisterallevents;  
            diary off;
        elseif (LastPrice - main.InPrice) * -1 <= -main.zhisun  && ~isnan(main.InPrice) %ֹ��
            %%����ֹ��յ�
            OrderId = Cover(main.actctp,main.instrumentID,main.tradenum,UpperLimitPrice);%��ͣ�۹���ֹ��൥����֤�۸��ܹ�����
            disp(['---',datestr(now,'yyyy-mm-dd HH:MM:SS'),'---����ֹ��յ�������ֹͣ'])
            main.position = 0;
            main.actctp.unregisterallevents;  
            diary off;
        end
    else
   %% �ж��Ƿ����¿���  
        if LastPrice <= main.buy && isnan(main.InPrice)
            %%���൥
            OrderId=Buy(main.actctp,main.instrumentID,main.tradenum,UpperLimitPrice);%���൥
            main.position = 1;
        elseif LastPrice >= main.sell && isnan(main.InPrice)
            %���յ�
            OrderId = Short(main.actctp,main.instrumentID,main.tradenum,LowerLimitPrice);%���յ�
            main.position = -1;
        end
    end
    %% ��������
    main.timestr = UpdateTime;
    main.price=LastPrice;%�������¼�
    
end
end 
