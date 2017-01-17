%% 策略demo
%%手动设置多空进场价，并填写止盈止损点
main.tradenum = 2;%每单手数
main.buy = 272.2;%买入价
main.sell = 274;%卖出价
main.zhiying = 3;%止盈点数
main.zhisun = 2;%止损点数
main.position =0;%持仓方向，0表示无持仓，1表示多单，-1表示空单
main.InPrice = nan;%进场价格