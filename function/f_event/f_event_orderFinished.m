function f_event_orderFinished(varargin)
OrderID=varargin{3};% 报单编号
InstrumentID=varargin{4};% 和约编号
IsBuy=varargin{5};% 是否为买,非0为买,否则为卖;
IsOpen=varargin{6};% 是否开仓,非0为开仓,否则为平仓
Volume=varargin{7};% 委托数量
Price=varargin{8};% 委托价格
TradedVolume=varargin{9};%已成交数量
AvgTradePrice=varargin{10};% 成交均价
% OrderStatus=varargin{11};% 报单当前状态
% OrderSysID=varargin{12};% 交易所报单号
% InsertTime=varargin{13};% 委托时间 有问题
StatusMsg=varargin{14};% 状态信息，如果该报单失败，则为失败原因。


end
