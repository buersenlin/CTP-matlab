function f_event_orderCanceled(varargin)
%%当收盘后出现撤单，将该OrderID的平仓单标示为-1，重新开盘后标示为-1的单子按照价格方向重新下
OrderID=varargin{3};% 报单编号

end

