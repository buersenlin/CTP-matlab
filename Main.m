%% �ڻ����򻯽���CTP-matlab demo 2017-01-13
%%%%% 1.���г���ǰ��������ctp����������ȷ��matlab��32λ�ģ���ϸ���ù�����鿴ReadMe.txt
%%%%% 2.������־���湦�ܣ�20170116
%%%%% ���ڴ���ʵ����
%%%%% Version1.0
%%%%% 2017-01-13
%%%%% By: Wayne

% �������
clc
clear
clear global

addpath(genpath(pwd))

eval(['diary logs\log',num2str(year(now)*10000+month(now)*100+day(now)),'.txt'])
diary on

%% ����ȫ�ֱ���
global main
main = []; %Ҳ���԰�֮ǰ��main�ļ����棬ÿ������load

%% CTP��¼
main.account = '043054';%����Simnow�˺ţ����û�У����¼www.simnow.com.cn����ע��
main.password = '19880123';%��������
main.actctp=f_trade_login('���ڼ���',main.account,main.password);% �ڻ�ctp�˺ŵ�½��

main.instrumentID='au1706';%��Լ����
SubscribeMD(main.actctp,main.instrumentID); % ��������
disp(['========',datestr(now,31),'  ���ĵ��ڻ�Ʒ�֣�',main.instrumentID,'========']);
disp('')



%% �������
startStrategy;
disp('========�����������=========')


%% ע��CTP
main.actctp.registerevent({'OnTrade' 'f_event_onTrade'});% �ɽ��¼�ע��
main.actctp.registerevent({'OnMarketData' 'f_event_market'});% �����¼�ע��

disp('========ע��CTP���=========')

%% �ر�CTP ��timer
% main.actctp.unregisterallevents;  
% closetimer


