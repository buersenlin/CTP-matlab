function f_event_onTrade(varargin)
OrderID=varargin{3};% �������
InstrumentID=varargin{4};% ��Լ���
IsBuy=varargin{5};% �Ƿ�Ϊ��,��0Ϊ��,����Ϊ��;
IsOpen=varargin{6};% �Ƿ񿪲�,��0Ϊ����,����Ϊƽ��
Volume=varargin{7};% ί������
Price=varargin{8};% �ɽ�����
TradeTime=varargin{9};% �ɽ�ʱ��

global main
    
    if strcmp(InstrumentID,main.instrumentID)
        
        %  ����
        if IsBuy==1 & IsOpen==1
            main.position = 1;
            main.InPrice = Price;
            disp('---���Կ����ź��ѳɽ�---');  
        end
        %  ƽ��
        if IsBuy==0 & IsOpen==0
            main.position = 0;
           main.InPrice = nan;
            disp('---����ƽ���ź��ѳɽ�---');        
        end
        % ����
        if IsBuy==0 & IsOpen==1
        main.position = -1;
           main.InPrice = Price;
            disp('---���Կ����ź��ѳɽ�---');  
        end
        % ƽ��
        if IsBuy==1 & IsOpen==0
            main.position = 0;
          main.InPrice = nan;
            disp('---����ƽ���ź��ѳɽ�---');  
        end
       
    end

end


