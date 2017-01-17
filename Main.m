%% 期货程序化交易CTP-matlab demo 2017-01-13
%%%%% 1.运行程序前请先配置ctp环境，并且确保matlab是32位的，详细配置过程请查看ReadMe.txt
%%%%% 2.增加日志保存功能，20170116
%%%%% 金融创新实验室
%%%%% Version1.0
%%%%% 2017-01-13
%%%%% By: Wayne

% 清除变量
clc
clear
clear global

addpath(genpath(pwd))

eval(['diary logs\log',num2str(year(now)*10000+month(now)*100+day(now)),'.txt'])
diary on

%% 定义全局变量
global main
main = []; %也可以把之前的main文件保存，每次启动load

%% CTP登录
main.account = '043054';%输入Simnow账号，如果没有，请登录www.simnow.com.cn进行注册
main.password = '19880123';%输入密码
main.actctp=f_trade_login('上期技术',main.account,main.password);% 期货ctp账号登陆；

main.instrumentID='au1706';%合约代码
SubscribeMD(main.actctp,main.instrumentID); % 订阅行情
disp(['========',datestr(now,31),'  订阅的期货品种：',main.instrumentID,'========']);
disp('')



%% 定义策略
startStrategy;
disp('========策略生成完毕=========')


%% 注册CTP
main.actctp.registerevent({'OnTrade' 'f_event_onTrade'});% 成交事件注册
main.actctp.registerevent({'OnMarketData' 'f_event_market'});% 行情事件注册

disp('========注册CTP完成=========')

%% 关闭CTP 和timer
% main.actctp.unregisterallevents;  
% closetimer


