function f_event_orderFinished(varargin)
OrderID=varargin{3};% �������
InstrumentID=varargin{4};% ��Լ���
IsBuy=varargin{5};% �Ƿ�Ϊ��,��0Ϊ��,����Ϊ��;
IsOpen=varargin{6};% �Ƿ񿪲�,��0Ϊ����,����Ϊƽ��
Volume=varargin{7};% ί������
Price=varargin{8};% ί�м۸�
TradedVolume=varargin{9};%�ѳɽ�����
AvgTradePrice=varargin{10};% �ɽ�����
% OrderStatus=varargin{11};% ������ǰ״̬
% OrderSysID=varargin{12};% ������������
% InsertTime=varargin{13};% ί��ʱ�� ������
StatusMsg=varargin{14};% ״̬��Ϣ������ñ���ʧ�ܣ���Ϊʧ��ԭ��


end
