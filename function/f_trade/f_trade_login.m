function actctp=f_trade_login(varargin)
% �˺ŵ�½
actctp=actxserver('ctpcom.ICTPClientAPI');
varargin{1}=[varargin{1},'.xml'];
verify=Login(actctp,varargin{1},varargin{2},varargin{3});
if  verify==0
    disp([datestr(now,31),'  ',varargin{1}(1:4),':��¼�ɹ�; �ڻ��˺�:',varargin{2}]);
else
    error([datestr(now,31),'  ',varargin{1}(1:4),':��¼ʧ��;']);
end

end
