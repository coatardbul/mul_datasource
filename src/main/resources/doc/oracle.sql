DROP TABLE  BEDC_ACCOUNT_QUERY_INFO ;
DROP TABLE  BEDC_BANK ;
DROP TABLE  BEDC_BANKACC ;
DROP TABLE BEDC_BANKBRANCH;
DROP TABLE  BEDC_TRANSFER ;
DROP TABLE  BEDC_DETAIL ;
DROP TABLE  BEDC_HISBAL ;
DROP TABLE  BEDC_HISDETAIL ;
DROP TABLE  BEDC_PAY ;
DROP TABLE  BEDC_SYNCJOB ;
DROP TABLE  BEDC_AREAITEM ;
DROP TABLE  BEDC_BUSISEQNO ;
DROP TABLE  BEDC_FILETASK ;
DROP TABLE  BEDC_AUTORECEIVE ;
DROP TABLE  BEDC_TRANSFER_RECORD ;
DROP TABLE  BEDC_PAY_RECORD ;
DROP TABLE  BEDC_BANKDELMSG ;
DROP TABLE  BEDC_STRATEGY_DETAIL ;
DROP TABLE  BEDC_STRATEGY ;
DROP TABLE  BEDC_CHANNEL_PAY_RECORD ;
--账户查询信息表
CREATE TABLE BEDC_ACCOUNT_QUERY_INFO   (
BANKACCTID      VARCHAR2(22)   NOT  NULL   ,
TRANDATE      VARCHAR2(10)   NOT  NULL  ,
DETAILPAGEINFO      VARCHAR2(1000)   NOT  NULL,
HISDETAILPAGEINFO      VARCHAR2(1000)   NOT  NULL,
HISBALPAGEINFO      VARCHAR2(1000)   NOT  NULL);
alter table BEDC_ACCOUNT_QUERY_INFO add constraint pk_BEDC_ACCOUNT_QUERY_INFO primary key (BANKACCTID,TRANDATE);
comment on column  BEDC_ACCOUNT_QUERY_INFO.BANKACCTID    IS   '银行账户标识';
comment on column  BEDC_ACCOUNT_QUERY_INFO.TRANDATE    IS   '交易日期';
comment on column  BEDC_ACCOUNT_QUERY_INFO.DETAILPAGEINFO    IS   '当日交易明细分页信息';
comment on column  BEDC_ACCOUNT_QUERY_INFO.HISDETAILPAGEINFO    IS   '历史交易明细分页信息';
comment on column  BEDC_ACCOUNT_QUERY_INFO.HISBALPAGEINFO    IS   '历史余额交易分页信息';
--银行行别信息表
CREATE TABLE BEDC_BANK   (
BANKCODE      VARCHAR2(4)   NOT  NULL,
SHORTNAME      VARCHAR2(100) ,
FULLNAME      VARCHAR2(100) ,
CORPCODE      VARCHAR2(40) ,
BRANCHID      VARCHAR2(12) ,
BRANCHNAME      VARCHAR2(200) ,
AREACODE      VARCHAR2(20) ,
TECHPHONE      VARCHAR2(16) ,
BIZPHONE      VARCHAR2(16) ,
POSTCODE      VARCHAR2(8) ,
ADDRESS      VARCHAR2(80) ,
SIGNDATE      CHAR(12) ,
OVERDATE      CHAR(12) ,
COOPSTATUS      VARCHAR2(2) ,
SERVICESTATUS      VARCHAR2(2) ,
OVERSEA_BANKCODE      VARCHAR2(3) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_BANK.BANKCODE    IS   '银行代码';
comment on column  BEDC_BANK.SHORTNAME    IS   '银行简称';
comment on column  BEDC_BANK.FULLNAME    IS   '银行全称';
comment on column  BEDC_BANK.CORPCODE    IS   '企业代码';
comment on column  BEDC_BANK.BRANCHID    IS   '接入网点';
comment on column  BEDC_BANK.BRANCHNAME    IS   '接入网点名称';
comment on column  BEDC_BANK.AREACODE    IS   '长途区位';
comment on column  BEDC_BANK.TECHPHONE    IS   '技术电话';
comment on column  BEDC_BANK.BIZPHONE    IS   '业务电话';
comment on column  BEDC_BANK.POSTCODE    IS   '邮政编码';
comment on column  BEDC_BANK.ADDRESS    IS   '通信地址';
comment on column  BEDC_BANK.SIGNDATE    IS   '签约日期';
comment on column  BEDC_BANK.OVERDATE    IS   '出约日期';
comment on column  BEDC_BANK.COOPSTATUS    IS   '合作状况0-良好1-未开通9-终止合作';
comment on column  BEDC_BANK.SERVICESTATUS    IS   '服务状态 0-良好,1-暂停服务';
comment on column  BEDC_BANK.OVERSEA_BANKCODE    IS   '境外支付行别号';
comment on column  BEDC_BANK.CREATEUSER    IS   '创建用户';
comment on column  BEDC_BANK.CREATETIME    IS   '创建时间';
comment on column  BEDC_BANK.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_BANK.LASTUPDATETIME    IS   '最后修改时间';
create unique index BEDC_BANK_IDX_01 on BEDC_BANK(BANKCODE);
--银行账户管理表
CREATE TABLE BEDC_BANKACC   (
ID      NUMBER(10)   NOT  NULL  primary key,
ACCTNO      VARCHAR2(32)   NOT  NULL ,
BANKCODE      VARCHAR2(4)  NOT  NULL,
CUSTID      VARCHAR2(20)  NOT  NULL,
CUSTNAME      VARCHAR2(200) ,
ACCTNAME      VARCHAR2(70)  NOT  NULL,
CURRCODE      VARCHAR2(3)  NOT  NULL,
BALANCE      NUMBER(16,2) ,
USABLEBAL      NUMBER(16,2) ,
FREEZEBAL      NUMBER(16,2) ,
AREACODE      VARCHAR2(20) ,
BRANCHCODE      VARCHAR2(12) ,
BRANCHNAME      VARCHAR2(60) ,
OPENDATE      VARCHAR2(10)  NOT  NULL,
EXPIREDATE      VARCHAR2(10) ,
PURPOSE      VARCHAR2(20)  NOT  NULL,
BALUPDTIME      VARCHAR2(10) ,
ORGID      VARCHAR2(8)  NOT  NULL,
SEARCHCODE      VARCHAR2(50) ,
EXTINFO      VARCHAR2(512) ,
RECSTATUS      VARCHAR2(20) ,
ACCLEVEL      VARCHAR2(10)  NOT  NULL,
MGNTYPE      VARCHAR2(10) ,
MEMO      VARCHAR2(2000) ,
INNERACC      VARCHAR2(32) ,
COLMGNACCNO      VARCHAR2(32) ,
ALLOCMGNACCNO      VARCHAR2(32) ,
BEDCSTATUS      VARCHAR2(10)  NOT  NULL,
ACCTYPE      VARCHAR2(20) ,
HOLDLIMIT      NUMBER(16,2) ,
AUTHTYPE      VARCHAR2(20) ,
DAYTIMES      INTEGER ,
TMWINDOW      INTEGER ,
LASTBIZDT      CHAR(10) ,
INNERACCNAME      VARCHAR2(100) ,
LASTBIZTM      VARCHAR2(16) ,
CUSTTYPE      VARCHAR2(4)   NOT  NULL ,
ACCOUNTNATURE      CHAR(1)  NOT  NULL,
WFLSTATUS      VARCHAR2(2) ,
INNQSH      VARCHAR2(32) ,
ZHHAOXUH      VARCHAR2(10) );
comment on column  BEDC_BANKACC.ID    IS   '银行账户标识';
comment on column  BEDC_BANKACC.ACCTNO    IS   '银行账号';
comment on column  BEDC_BANKACC.BANKCODE    IS   '银行代码';
comment on column  BEDC_BANKACC.CUSTID    IS   '客户编号';
comment on column  BEDC_BANKACC.CUSTNAME    IS   '客户名称';
comment on column  BEDC_BANKACC.ACCTNAME    IS   '账户名称';
comment on column  BEDC_BANKACC.CURRCODE    IS   '货币代码';
comment on column  BEDC_BANKACC.BALANCE    IS   '账户余额';
comment on column  BEDC_BANKACC.USABLEBAL    IS   '可用余额';
comment on column  BEDC_BANKACC.FREEZEBAL    IS   '冻结余额';
comment on column  BEDC_BANKACC.AREACODE    IS   '账户区域';
comment on column  BEDC_BANKACC.BRANCHCODE    IS   '开户行号';
comment on column  BEDC_BANKACC.BRANCHNAME    IS   '开户行名';
comment on column  BEDC_BANKACC.OPENDATE    IS   '开户日期';
comment on column  BEDC_BANKACC.EXPIREDATE    IS   '销户日期';
comment on column  BEDC_BANKACC.PURPOSE    IS   '账户用途';
comment on column  BEDC_BANKACC.BALUPDTIME    IS   '最后业务日';
comment on column  BEDC_BANKACC.ORGID    IS   '内部机构号';
comment on column  BEDC_BANKACC.SEARCHCODE    IS   '助记码';
comment on column  BEDC_BANKACC.EXTINFO    IS   '扩展信息';
comment on column  BEDC_BANKACC.RECSTATUS    IS   '账户状态0-正常 1-冻结 2-销户';
comment on column  BEDC_BANKACC.ACCLEVEL    IS   '账户层级0-总账户 1-子账户 2-收款户';
comment on column  BEDC_BANKACC.MGNTYPE    IS   '管理类型';
comment on column  BEDC_BANKACC.MEMO    IS   '备注';
comment on column  BEDC_BANKACC.INNERACC    IS   '内部账号';
comment on column  BEDC_BANKACC.COLMGNACCNO    IS   '归集管理账号';
comment on column  BEDC_BANKACC.ALLOCMGNACCNO    IS   '下拨管理账号';
comment on column  BEDC_BANKACC.BEDCSTATUS    IS   '是否开通银企直连';
comment on column  BEDC_BANKACC.ACCTYPE    IS   '账户类型';
comment on column  BEDC_BANKACC.HOLDLIMIT    IS   '留存额度';
comment on column  BEDC_BANKACC.AUTHTYPE    IS   '授权类型01查询 02支付';
comment on column  BEDC_BANKACC.DAYTIMES    IS   '每日次数';
comment on column  BEDC_BANKACC.TMWINDOW    IS   '时间窗口';
comment on column  BEDC_BANKACC.LASTBIZDT    IS   '最后业务日';
comment on column  BEDC_BANKACC.INNERACCNAME    IS   '内部账户名称';
comment on column  BEDC_BANKACC.LASTBIZTM    IS   '最后业务时间';
comment on column  BEDC_BANKACC.CUSTTYPE    IS   '客户类型1：财务公司2：成员单位';
comment on column  BEDC_BANKACC.ACCOUNTNATURE    IS   '账户性质';
comment on column  BEDC_BANKACC.WFLSTATUS    IS   '工作流处理状态1：审批中0：可处理4：删除';
comment on column  BEDC_BANKACC.INNQSH    IS   '';
comment on column  BEDC_BANKACC.ZHHAOXUH    IS   '分户账序号';
create unique index BEDC_BANKACC_IDX_01 on BEDC_BANKACC(ACCTNO);
create  index BEDC_BANKACC_IDX_02 on BEDC_BANKACC(COLMGNACCNO);
--银行分支机构信息表
CREATE TABLE BEDC_BANKBRANCH   (
BANKCODE      VARCHAR2(8)   NOT  NULL PRIMARY KEY,
BRANCHCODE      VARCHAR2(12)   NOT  NULL,
BRANCHNAME      VARCHAR2(80)   NOT  NULL,
BRANCHNO      VARCHAR2(12) ,
SEARCHCODE      VARCHAR2(12) ,
PLATPRONAME      VARCHAR2(50) ,
PLATPROCODE      VARCHAR2(20) ,
PLATAREANAME      VARCHAR2(50) ,
BANKINNERCLEARNO   VARCHAR2(50) ,
PLATAREACODE      VARCHAR2(20) ,
BANKCODEUNIT      VARCHAR2(10) ,
STATUS      VARCHAR2(4) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_BANKBRANCH.BANKCODE    IS   '银行分支机构名称';
comment on column  BEDC_BANKBRANCH.BRANCHCODE    IS   '分支机构在本银行的编码';
comment on column  BEDC_BANKBRANCH.BRANCHNAME    IS   '分支机构在本银行的编码';
comment on column  BEDC_BANKBRANCH.BRANCHNO    IS   '分支机构地址';
comment on column  BEDC_BANKBRANCH.SEARCHCODE    IS   '机构名称助记码';
comment on column  BEDC_BANKBRANCH.PLATPRONAME    IS   '省';
comment on column  BEDC_BANKBRANCH.PLATPROCODE    IS   '代码';
comment on column  BEDC_BANKBRANCH.PLATAREANAME    IS   '市';
comment on column  BEDC_BANKBRANCH.BANKINNERCLEARNO    IS   '银行内部清算号';
comment on column  BEDC_BANKBRANCH.PLATAREACODE    IS   '代码';
comment on column  BEDC_BANKBRANCH.BANKCODEUNIT    IS   '国家统一行别代码';
comment on column  BEDC_BANKBRANCH.STATUS    IS   '状态1-正常展示';
comment on column  BEDC_BANKBRANCH.CREATEUSER    IS   '创建用户';
comment on column  BEDC_BANKBRANCH.CREATETIME    IS   '创建时间';
comment on column  BEDC_BANKBRANCH.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_BANKBRANCH.LASTUPDATETIME    IS   '最后修改时间';
 --划拨信息表
CREATE TABLE BEDC_TRANSFER   (
ORISEQNO      VARCHAR2(22)   NOT  NULL  PRIMARY KEY,
HOSTSEQNO      VARCHAR2(22)   NOT  NULL,
MAINACCTID      NUMBER(10)   NOT  NULL,
SUBACCTID       NUMBER(10)   NOT  NULL,
AMOUNT      NUMBER(16,2) ,
RETENTIONBAL      NUMBER(16,2) ,
LIMITAMT      NUMBER(16,2) ,
SUBACCBAL      NUMBER(16,2) ,
RECSTATUS      VARCHAR2(4)   NOT  NULL,
RECSTATUSDETAILS      VARCHAR2(200) ,
BANKCODE      VARCHAR2(4)   NOT  NULL,
PROCMODE      CHAR(20) ,
VER      VARCHAR2(32) ,
TRANSFERTYPE      CHAR(1) NOT  NULL,
POSTSCRIPT      VARCHAR2(2000)   ,
MEMO      VARCHAR2(2000) ,
RECBANKACCNO      VARCHAR2(70) ,
BANKRESPMSG   VARCHAR2(500) ,
RECBANKNAME      VARCHAR2(100) ,
OPERATOR      VARCHAR2(20) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_TRANSFER.ORISEQNO    IS   '核心流水号主键';
comment on column  BEDC_TRANSFER.HOSTSEQNO    IS   '主机流水号（银企流水号）';
comment on column  BEDC_TRANSFER.MAINACCTID    IS   '主账号';
comment on column  BEDC_TRANSFER.SUBACCTID    IS   '子账号';
comment on column  BEDC_TRANSFER.AMOUNT    IS   '业务金额';
comment on column  BEDC_TRANSFER.RETENTIONBAL    IS   '保留余额';
comment on column  BEDC_TRANSFER.LIMITAMT    IS   '限制金额';
comment on column  BEDC_TRANSFER.SUBACCBAL    IS   '子账户余额';
 comment on column  BEDC_TRANSFER.RECSTATUS    IS   '结算状态1:支付成功 2:支付失败 3待直联处理 4:平台处理中 5:银行处理中 6:退回企业 7:取消支付 8:线下支付 0 其他';
comment on column  BEDC_TRANSFER.RECSTATUSDETAILS    IS   '交易内部描述信息';
comment on column  BEDC_TRANSFER.BANKCODE    IS   '银行代码';
comment on column  BEDC_TRANSFER.PROCMODE    IS   '执行模式上划时必输0：指定金额 1：按余额';
comment on column  BEDC_TRANSFER.VER    IS   '版本号';
comment on column  BEDC_TRANSFER.TRANSFERTYPE    IS   '划拨方式0:上划 1：下拨';
comment on column  BEDC_TRANSFER.POSTSCRIPT    IS   '附言';
comment on column  BEDC_TRANSFER.MEMO    IS   '备注';
comment on column  BEDC_TRANSFER.RECBANKACCNO    IS   '收款方账号';
comment on column  BEDC_TRANSFER.RECBANKNAME    IS   '收款方账号名称';
comment on column  BEDC_TRANSFER.BANKRESPMSG    IS   '银行响应信息';
comment on column  BEDC_TRANSFER.OPERATOR    IS   '操作员';
comment on column  BEDC_TRANSFER.CREATEUSER    IS   '创建用户';
comment on column  BEDC_TRANSFER.CREATETIME    IS   '创建时间';
comment on column  BEDC_TRANSFER.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_TRANSFER.LASTUPDATETIME    IS   '最后修改时间';
create unique index BEDC_TRANSFER_IDX_01 on BEDC_TRANSFER(HOSTSEQNO);
 --当日交易明细表
CREATE TABLE BEDC_DETAIL   (
BIZID      VARCHAR2(64)   NOT  NULL  PRIMARY KEY,
HOSTSEQNO      VARCHAR2(22)  ,
BANKSEQNO      VARCHAR2(32)   NOT  NULL,
BANKACCTID       NUMBER(10)   NOT  NULL,
ACCTNO		VARCHAR2(22)		NOT  NULL,
BIZDATE      VARCHAR2(10)   NOT  NULL,
BIZTIME      VARCHAR2(8) ,
DECRFLAG      VARCHAR2(2)   NOT  NULL,
AMOUNT      NUMBER(16,2)   NOT  NULL,
BALANCE      NUMBER(16,2) ,
OPPBRANCH      VARCHAR2(12) ,
OPPACCNO      VARCHAR2(32) ,
OPPNAME      VARCHAR2(70) ,
PURPOSE      VARCHAR2(200) ,
SUMMARY      VARCHAR2(120) ,
POSTSCRIPT      VARCHAR2(128) ,
VERCHERNO      VARCHAR2(20) ,
VERCTYPE      VARCHAR2(20) ,
OCCTIME      VARCHAR2(60) ,
BANKCODE      VARCHAR2(10) ,
ACCOUNTINGSTATUS      CHAR(1) ,
CHARGERSTATUS      VARCHAR2(10) ,
CHARGETIME      TIMESTAMP(6) ,
BUSITYPE      VARCHAR2(2) ,
RECSTATUS      VARCHAR2(20) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_DETAIL.BIZID    IS   '交易标识BIZID';
comment on column  BEDC_DETAIL.HOSTSEQNO    IS   '主机交易流水号';
comment on column  BEDC_DETAIL.BANKSEQNO    IS   '银行交易流水号';
comment on column  BEDC_DETAIL.BANKACCTID    IS   '银行账户标识BEDC_BANKACC主键';
comment on column  BEDC_DETAIL.ACCTNO    IS   '银行账号';
comment on column  BEDC_DETAIL.BIZDATE    IS   '业务日期';
comment on column  BEDC_DETAIL.BIZTIME    IS   '业务时间';
comment on column  BEDC_DETAIL.DECRFLAG    IS   '借贷标志';
comment on column  BEDC_DETAIL.AMOUNT    IS   '业务金额';
comment on column  BEDC_DETAIL.BALANCE    IS   '账户余额';
comment on column  BEDC_DETAIL.OPPBRANCH    IS   '对方行号';
comment on column  BEDC_DETAIL.OPPACCNO    IS   '对方账号';
comment on column  BEDC_DETAIL.OPPNAME    IS   '对方户名';
comment on column  BEDC_DETAIL.PURPOSE    IS   '业务用途';
comment on column  BEDC_DETAIL.SUMMARY    IS   '业务摘要';
comment on column  BEDC_DETAIL.POSTSCRIPT    IS   '附言';
comment on column  BEDC_DETAIL.VERCHERNO    IS   '凭证号码';
comment on column  BEDC_DETAIL.VERCTYPE    IS   '凭证类型';
comment on column  BEDC_DETAIL.OCCTIME    IS   '发生时间';
comment on column  BEDC_DETAIL.BANKCODE    IS   '银行代码';
 comment on column  BEDC_DETAIL.ACCOUNTINGSTATUS    IS   '账务状态1-成功
2-退汇
3-抹账
4-冲正
   9-其他';
comment on column  BEDC_DETAIL.CHARGERSTATUS    IS   '自动结账状态';
comment on column  BEDC_DETAIL.CHARGETIME    IS   '自动记账时间';
 comment on column  BEDC_DETAIL.BUSITYPE    IS   '业务类型0 代理收款
1 上划下拨
';
comment on column  BEDC_DETAIL.RECSTATUS    IS   '处理状态1：已自动记账';
comment on column  BEDC_DETAIL.CREATEUSER    IS   '创建用户';
comment on column  BEDC_DETAIL.CREATETIME    IS   '创建时间';
comment on column  BEDC_DETAIL.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_DETAIL.LASTUPDATETIME    IS   '最后修改时间';
create unique index BEDC_DETAIL_IDX_01 on BEDC_DETAIL(HOSTSEQNO);
 --历史余额信息表
CREATE TABLE BEDC_HISBAL   (
BALDATE      VARCHAR2(10)   NOT  NULL,
BANKACCTID       NUMBER(10)   NOT  NULL,
BALANCE      NUMBER(16,2)   NOT  NULL,
USABLEBAL      NUMBER(16,2)   NOT  NULL,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_HISBAL.BALDATE    IS   '余额日期';
comment on column  BEDC_HISBAL.BANKACCTID    IS   '银行账户标识';
comment on column  BEDC_HISBAL.BALANCE    IS   '期初余额';
comment on column  BEDC_HISBAL.USABLEBAL    IS   '可用余额';
comment on column  BEDC_HISBAL.CREATEUSER    IS   '创建用户';
comment on column  BEDC_HISBAL.CREATETIME    IS   '创建时间';
comment on column  BEDC_HISBAL.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_HISBAL.LASTUPDATETIME    IS   '最后修改时间';
create unique index BEDC_HISBAL_IDX_01 on BEDC_HISBAL(BALDATE,BANKACCTID);
 --历史交易明细表
CREATE TABLE BEDC_HISDETAIL   (
BIZID      VARCHAR2(64)   NOT  NULL  PRIMARY KEY,
HOSTSEQNO      VARCHAR2(22)  ,
BANKSEQNO      VARCHAR2(32)   NOT  NULL,
BANKACCTID       NUMBER(10)   NOT  NULL,
ACCTNO		VARCHAR2(22)		NOT  NULL,
BIZDATE      VARCHAR2(10)   NOT  NULL,
BIZTIME      VARCHAR2(10) ,
DECRFLAG      VARCHAR2(2)   NOT  NULL,
AMOUNT      NUMBER(16,2)   NOT  NULL,
BALANCE      NUMBER(16,2) ,
OPPBRANCH      VARCHAR2(12) ,
OPPACCNO      VARCHAR2(32)  ,
OPPNAME      VARCHAR2(70) ,
PURPOSE      VARCHAR2(200) ,
SUMMARY      VARCHAR2(120) ,
POSTSCRIPT      VARCHAR2(128) ,
VERCHERNO      VARCHAR2(20) ,
VERCTYPE      VARCHAR2(20) ,
OCCTIME      VARCHAR2(60) ,
RECSTATUS      VARCHAR2(20) ,
BANKCODE      VARCHAR2(10) ,
ACCOUNTINGSTATUS      CHAR(1) ,
CHARGESTATUS      VARCHAR2(10) ,
CHARGETIME      TIMESTAMP(6) ,
INSERTTIMESTAMP      TIMESTAMP(6)   NOT  NULL,
BUSITYPE      VARCHAR2(2) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_HISDETAIL.BIZID    IS   '交易标识BIZID';
comment on column  BEDC_HISDETAIL.HOSTSEQNO    IS   '主机交易流水号';
comment on column  BEDC_HISDETAIL.BANKSEQNO    IS   '银行交易流水号';
comment on column  BEDC_HISDETAIL.BANKACCTID    IS   '银行账户标识BEDC_BANKACC主键';
comment on column  BEDC_HISDETAIL.ACCTNO    IS   '银行账号';
comment on column  BEDC_HISDETAIL.BIZDATE    IS   '业务日期';
comment on column  BEDC_HISDETAIL.BIZTIME    IS   '业务时间';
comment on column  BEDC_HISDETAIL.DECRFLAG    IS   '借贷标志';
comment on column  BEDC_HISDETAIL.AMOUNT    IS   '业务金额';
comment on column  BEDC_HISDETAIL.BALANCE    IS   '账户余额';
comment on column  BEDC_HISDETAIL.OPPBRANCH    IS   '对方行号';
comment on column  BEDC_HISDETAIL.OPPACCNO    IS   '对方账号';
comment on column  BEDC_HISDETAIL.OPPNAME    IS   '对方户名';
comment on column  BEDC_HISDETAIL.PURPOSE    IS   '业务用途';
comment on column  BEDC_HISDETAIL.SUMMARY    IS   '业务摘要';
comment on column  BEDC_HISDETAIL.POSTSCRIPT    IS   '附言';
comment on column  BEDC_HISDETAIL.VERCHERNO    IS   '凭证号码';
comment on column  BEDC_HISDETAIL.VERCTYPE    IS   '凭证类型';
comment on column  BEDC_HISDETAIL.OCCTIME    IS   '发生时间';
comment on column  BEDC_HISDETAIL.RECSTATUS    IS   '处理状态';
comment on column  BEDC_HISDETAIL.BANKCODE    IS   '银行代码';
 comment on column  BEDC_HISDETAIL.ACCOUNTINGSTATUS    IS   '账务状态5-成功
6-退汇
7-抹账
8-冲正
   9-其他';
comment on column  BEDC_HISDETAIL.CHARGESTATUS    IS   '自动记账状态:1：记账成功、2：归集、3、下拨';
comment on column  BEDC_HISDETAIL.CHARGETIME    IS   '自动记账时间';
comment on column  BEDC_HISDETAIL.INSERTTIMESTAMP    IS   '新增时间戳';
 comment on column  BEDC_HISDETAIL.BUSITYPE    IS   '业务类型0 代理收款
1 上划下拨';
comment on column  BEDC_HISDETAIL.CREATEUSER    IS   '创建用户';
comment on column  BEDC_HISDETAIL.CREATETIME    IS   '创建时间';
comment on column  BEDC_HISDETAIL.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_HISDETAIL.LASTUPDATETIME    IS   '最后修改时间';
create unique index BEDC_HISDETAIL_IDX_01 on BEDC_HISDETAIL(HOSTSEQNO);
 --银行支付信息表
CREATE TABLE BEDC_PAY   (
ORISEQNO      VARCHAR2(22)   NOT  NULL PRIMARY KEY,
HOSTSEQNO      VARCHAR2(22)   NOT  NULL,
CREATEDATE      VARCHAR2(10)   NOT  NULL,
CREATETIME      VARCHAR2(8)   NOT  NULL,
PAYACCTID       NUMBER(10)   NOT  NULL,
PUB_PRI_FLAG	CHAR(1)		NOT NULL,
REALACCNO      VARCHAR2(64) ,
REALACCNAME      VARCHAR2(72) ,
OCCDATE      VARCHAR2(10) ,
OCCTIME      VARCHAR2(8) ,
PAYMODE      VARCHAR2(2)   NOT  NULL,
PAYBANKCODE      VARCHAR2(8)   NOT  NULL,
OPPBANKCODE      VARCHAR2(8)   ,
OPPBRANCHCODE      VARCHAR2(12)   NOT  NULL,
OPPBRANCHNAME      VARCHAR2(150)   NOT  NULL,
OPPACCNO      VARCHAR2(32)   NOT  NULL,
OPPACCNAME      VARCHAR2(72)   NOT  NULL,
OPPACCCLASS      VARCHAR2(2)   ,
AREA_FLAG      VARCHAR2(2)   NOT  NULL,
BANK_FLAG      VARCHAR2(2)   NOT  NULL,
PAYAMT      NUMBER(16,2)   NOT  NULL,
URGFLAG      VARCHAR2(2)   NOT  NULL,
PURPOS      VARCHAR2(2000)   ,
SUMMARY      VARCHAR2(2000)  ,
POSTSCRIPT      VARCHAR2(64)   ,
FEE      NUMBER(16,2) ,
RECSTATUS      VARCHAR2(4)   NOT  NULL,
RECSTATUSDETAILS      VARCHAR2(200) ,
BANKRESPMSG   VARCHAR2(500) ,
OPPACCID      NUMBER(10) ,
BUSISEQNO      VARCHAR2(32) ,
PROCID      VARCHAR2(32) ,
VER      VARCHAR2(22) ,
VIRTUALOPERID      VARCHAR2(50) ,
OPPPROVINCE      VARCHAR2(200) ,
OPPCITY      VARCHAR2(200) ,
CREATEUSER      VARCHAR2(20) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_PAY.ORISEQNO    IS   '核心流水号主键';
comment on column  BEDC_PAY.HOSTSEQNO    IS   '主机流水号（银企流水号）';
comment on column  BEDC_PAY.CREATEDATE    IS   '创建日期';
comment on column  BEDC_PAY.CREATETIME    IS   '创建时间';
comment on column  BEDC_PAY.PAYACCTID    IS   '付款方银行账户标识BEDC_BANKACC主键';
comment on column  BEDC_PAY.REALACCNO    IS   '实际付款账号';
comment on column  BEDC_PAY.REALACCNAME    IS   '实际付款账户名称';
comment on column  BEDC_PAY.OCCDATE    IS   '发生日期';
comment on column  BEDC_PAY.OCCTIME    IS   '发生时间';
 comment on column  BEDC_PAY.PAYMODE    IS   '支付方式0：直接支付
1：代理支付';
comment on column  BEDC_PAY.PAYBANKCODE    IS   '支付银行代码';
comment on column  BEDC_PAY.OPPBANKCODE    IS   '收款方银行代码 ';
comment on column  BEDC_PAY.OPPBRANCHCODE    IS   '收款方银行人行联行号';
comment on column  BEDC_PAY.OPPBRANCHNAME    IS   '收款方银行行名';
comment on column  BEDC_PAY.PUB_PRI_FLAG    IS   '对公对私标志1:对公2:对私';
comment on column  BEDC_PAY.OPPACCNO    IS   '收款账号';
comment on column  BEDC_PAY.OPPACCNAME    IS   '收款户名';
comment on column  BEDC_PAY.OPPACCCLASS    IS   '收款账户类别';
comment on column  BEDC_PAY.AREA_FLAG    IS   '是否同城';
comment on column  BEDC_PAY.BANK_FLAG    IS   '是否同行';
comment on column  BEDC_PAY.PAYAMT    IS   '支付金额';
comment on column  BEDC_PAY.URGFLAG    IS   '加急标志';
comment on column  BEDC_PAY.PURPOS    IS   '账户用途';
comment on column  BEDC_PAY.SUMMARY    IS   '业务摘要';
comment on column  BEDC_PAY.POSTSCRIPT    IS   '附言';
comment on column  BEDC_PAY.FEE    IS   '银行手续费';
 comment on column  BEDC_PAY.RECSTATUS    IS   '支付状态1:支付成功 2:支付失败 3待直联处理 4:平台处理中 5:银行处理中 6:退回企业 7:取消支付 8:线下支付 0 其他';
comment on column  BEDC_PAY.RECSTATUSDETAILS    IS   '交易内部描述信息';
comment on column  BEDC_PAY.OPPACCID    IS   '收款方账号ID';
comment on column  BEDC_PAY.BUSISEQNO    IS   '业务序号';
comment on column  BEDC_PAY.PROCID    IS   '';
comment on column  BEDC_PAY.VER    IS   '版本号默认0';
comment on column  BEDC_PAY.VIRTUALOPERID    IS   '虚拟柜员默认’0000001’';
comment on column  BEDC_PAY.BANKRESPMSG    IS   '银行响应信息';
comment on column  BEDC_PAY.OPPPROVINCE    IS   '对方所在省';
comment on column  BEDC_PAY.OPPCITY    IS   '对方所在市';
comment on column  BEDC_PAY.CREATEUSER    IS   '创建用户';
comment on column  BEDC_PAY.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_PAY.LASTUPDATETIME    IS   '最后修改时间';
create unique index BEDC_PAY_IDX_01 on BEDC_PAY(HOSTSEQNO);
 --定时任务判重表
CREATE TABLE BEDC_SYNCJOB   (
LASTEXECUTETIME      NUMBER(22)   NOT  NULL,
JOBNAME      VARCHAR2(128)   NOT  NULL PRIMARY KEY,
JOBCLASSNAME      VARCHAR2(500)   NOT  NULL,
INSTANCEIP      VARCHAR2(128) ,
INSTANCENAME      VARCHAR2(128) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_SYNCJOB.LASTEXECUTETIME    IS   '最近执行时间';
comment on column  BEDC_SYNCJOB.JOBNAME    IS   '任务名称';
comment on column  BEDC_SYNCJOB.JOBCLASSNAME    IS   '任务路径';
comment on column  BEDC_SYNCJOB.INSTANCEIP    IS   '实例IP';
comment on column  BEDC_SYNCJOB.INSTANCENAME    IS   '实例名称';
comment on column  BEDC_SYNCJOB.CREATEUSER    IS   '创建用户';
comment on column  BEDC_SYNCJOB.CREATETIME    IS   '创建时间';
comment on column  BEDC_SYNCJOB.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_SYNCJOB.LASTUPDATETIME    IS   '最后修改时间';
 --省市基本信息表
CREATE TABLE BEDC_AREAITEM   (
CODE      VARCHAR2(4)   NOT  NULL ,
NAME      VARCHAR2(50)   NOT  NULL,
LEVELNAME      VARCHAR2(50)  ,
CITYCODE      VARCHAR2(6)   ,
CITYNAME      VARCHAR2(50)   ,
PROVINCECODE      VARCHAR2(6)   ,
PROVINCE      VARCHAR2(50)  ,
TYNAME      CHAR(1) ,
CREATEUSER      VARCHAR2(20) );
alter table BEDC_AREAITEM add constraint pk_BEDC_AREAITEM primary key (CODE,NAME);
comment on column  BEDC_AREAITEM.CODE    IS   '地区名称主键';
comment on column  BEDC_AREAITEM.NAME    IS   '地区名称唯一索引';
comment on column  BEDC_AREAITEM.LEVELNAME    IS   '级别';
comment on column  BEDC_AREAITEM.CITYCODE    IS   '市编码';
comment on column  BEDC_AREAITEM.CITYNAME    IS   '所属市名称';
comment on column  BEDC_AREAITEM.PROVINCECODE    IS   '省编码';
comment on column  BEDC_AREAITEM.PROVINCE    IS   '所属省名称';
comment on column  BEDC_AREAITEM.TYNAME    IS   '行别';
comment on column  BEDC_AREAITEM.CREATEUSER    IS   '创建用户';
create unique index BEDC_AREAITEM_IDX_01 on BEDC_AREAITEM(NAME,code);
 --业务流水信息表
CREATE TABLE BEDC_BUSISEQNO   (
HOSTSEQNO      VARCHAR2(22)   NOT  NULL PRIMARY KEY,
ORISEQNO      VARCHAR2(22)   NOT  NULL  ,
BUSITYPE      CHAR(1)   NOT  NULL,
BUSISTATUS      VARCHAR2(4)   NOT  NULL,
RESPSEQNO      VARCHAR2(128) ,
RESPSTATUS      VARCHAR2(500) ,
RESPMSG      VARCHAR2(500) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_BUSISEQNO.HOSTSEQNO    IS   '主机流水号(银企流水号）';
comment on column  BEDC_BUSISEQNO.ORISEQNO    IS   '核心流水号核心系统流水号';
 comment on column  BEDC_BUSISEQNO.BUSITYPE    IS   '业务类型0资金支付
1 资金归集
2资金下拨
3代发工资
 4 资金划拨';
 comment on column  BEDC_BUSISEQNO.BUSISTATUS    IS   '业务状态1:支付成功 2:支付失败 3待直联处理 4:平台处理中 5:银行处理中 6:退回企业 7:取消支付 8:线下支付 0 其他';
comment on column  BEDC_BUSISEQNO.RESPSEQNO    IS   '统一平台流水号';
comment on column  BEDC_BUSISEQNO.RESPSTATUS    IS   '统一平台响应状态';
comment on column  BEDC_BUSISEQNO.RESPMSG    IS   '统一平台响应信息';
comment on column  BEDC_BUSISEQNO.CREATEUSER    IS   '创建用户';
comment on column  BEDC_BUSISEQNO.CREATETIME    IS   '创建时间';
comment on column  BEDC_BUSISEQNO.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_BUSISEQNO.LASTUPDATETIME    IS   '最后修改时间';
 --文件解析任务表
CREATE TABLE BEDC_FILETASK   (
FILENAME      VARCHAR2(50)   NOT  NULL,
HOSTSEQNO      VARCHAR2(22)   NOT  NULL  PRIMARY KEY,
RESPSEQNO      VARCHAR2(22)   NOT  NULL,
FILEPATH      VARCHAR2(500)   NOT  NULL,
ERRORFILENAME      VARCHAR2(500) ,
ERRORFILEPATH      VARCHAR2(500) ,
DEALSTATUS      CHAR(1)   NOT  NULL,
FILENATURE      CHAR(1)   NOT  NULL,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_FILETASK.FILENAME    IS   '文件名称';
comment on column  BEDC_FILETASK.HOSTSEQNO    IS   '主机流水号（BEDC流水号）';
comment on column  BEDC_FILETASK.RESPSEQNO    IS   '响应流水号';
comment on column  BEDC_FILETASK.FILEPATH    IS   '文件路径';
comment on column  BEDC_FILETASK.ERRORFILENAME    IS   '错误文件名称';
comment on column  BEDC_FILETASK.ERRORFILEPATH    IS   '错误文件路径';
 comment on column  BEDC_FILETASK.DEALSTATUS    IS   '状态0待查证
1 待解析
2 解析中
3解析完毕';
 comment on column  BEDC_FILETASK.FILENATURE    IS   '文件属性0历史明细
1 当日明细
2 行号下载';
comment on column  BEDC_FILETASK.CREATEUSER    IS   '创建用户';
comment on column  BEDC_FILETASK.CREATETIME    IS   '创建时间';
comment on column  BEDC_FILETASK.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_FILETASK.LASTUPDATETIME    IS   '最后修改时间';
 --自动收款明细表
CREATE TABLE BEDC_AUTORECEIVE   (
BIZID      VARCHAR2(64)   NOT  NULL PRIMARY KEY,
HOSTSEQNO      VARCHAR2(22)   ,
BANKSEQNO      VARCHAR2(32)   NOT  NULL,
BANKACCTID       NUMBER(10)   NOT  NULL,
ACCTNO		VARCHAR2(22)		NOT  NULL,
BIZDATE      VARCHAR2(10)   NOT  NULL,
BIZTIME      VARCHAR2(8) ,
DECRFLAG      VARCHAR2(2)   NOT  NULL,
AMOUNT      NUMBER(16,2)   NOT  NULL,
BALANCE      NUMBER(16,2) ,
OPPBRANCH      VARCHAR2(12) ,
OPPACCNO      VARCHAR2(32) ,
OPPNAME      VARCHAR2(70) ,
PURPOSE      VARCHAR2(200) ,
SUMMARY      VARCHAR2(120) ,
POSTSCRIPT      VARCHAR2(128) ,
VERCHERNO      VARCHAR2(20) ,
VERCTYPE      VARCHAR2(20) ,
OCCTIME      VARCHAR2(60) ,
BANKCODE      VARCHAR2(10) ,
ACCOUNTINGSTATUS      CHAR(1) ,
CHARGETIME      TIMESTAMP(6) ,
CREATETIMESTAMP      NUMBER(22) ,
RECSTATUS      CHAR(1) ,
SORTSTR      VARCHAR2(200) ,
BUSITYPE      VARCHAR2(2) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_AUTORECEIVE.BIZID    IS   '交易标识BIZID';
comment on column  BEDC_AUTORECEIVE.HOSTSEQNO    IS   '主机交易流水号';
comment on column  BEDC_AUTORECEIVE.BANKSEQNO    IS   '银行交易流水号';
comment on column  BEDC_AUTORECEIVE.BANKACCTID    IS   '银行账户标识BEDC_BANKACC表主键';
comment on column  BEDC_AUTORECEIVE.ACCTNO    IS   '银行账号';
comment on column  BEDC_AUTORECEIVE.BIZDATE    IS   '业务日期';
comment on column  BEDC_AUTORECEIVE.BIZTIME    IS   '业务时间';
comment on column  BEDC_AUTORECEIVE.DECRFLAG    IS   '借贷标志';
comment on column  BEDC_AUTORECEIVE.AMOUNT    IS   '业务金额';
comment on column  BEDC_AUTORECEIVE.BALANCE    IS   '账户余额';
comment on column  BEDC_AUTORECEIVE.OPPBRANCH    IS   '对方行号';
comment on column  BEDC_AUTORECEIVE.OPPACCNO    IS   '对方账号';
comment on column  BEDC_AUTORECEIVE.OPPNAME    IS   '对方户名';
comment on column  BEDC_AUTORECEIVE.PURPOSE    IS   '业务用途';
comment on column  BEDC_AUTORECEIVE.SUMMARY    IS   '业务摘要';
comment on column  BEDC_AUTORECEIVE.POSTSCRIPT    IS   '附言';
comment on column  BEDC_AUTORECEIVE.VERCHERNO    IS   '凭证号码';
comment on column  BEDC_AUTORECEIVE.VERCTYPE    IS   '凭证类型';
comment on column  BEDC_AUTORECEIVE.OCCTIME    IS   '发生时间';
comment on column  BEDC_AUTORECEIVE.BANKCODE    IS   '银行代码';
 comment on column  BEDC_AUTORECEIVE.ACCOUNTINGSTATUS    IS   '账务状态9-成功
10-退汇
11-抹账
12-冲正
   9-其他';
comment on column  BEDC_AUTORECEIVE.CHARGETIME    IS   '自动记账时间';
comment on column  BEDC_AUTORECEIVE.CREATETIMESTAMP    IS   '数据创建时间戳';
comment on column  BEDC_AUTORECEIVE.RECSTATUS    IS   '处理状态0未发送结算1：已发送结算';
comment on column  BEDC_AUTORECEIVE.SORTSTR    IS   '入账状态 0:未入账   1:入账成功   2:入账失败' ;
comment on column  BEDC_AUTORECEIVE.BUSITYPE    IS   '业务类型0 代理收款
1 上划下拨';
comment on column  BEDC_AUTORECEIVE.CREATEUSER    IS   '创建用户';
comment on column  BEDC_AUTORECEIVE.CREATETIME    IS   '创建时间';
comment on column  BEDC_AUTORECEIVE.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_AUTORECEIVE.LASTUPDATETIME    IS   '最后修改时间';
create unique index BEDC_AUTORECEIVE_IDX_01 on BEDC_AUTORECEIVE(HOSTSEQNO);
 --划拨业务记录表
CREATE TABLE BEDC_TRANSFER_RECORD   (
HOSTSEQNO      VARCHAR2(22)   NOT  NULL  PRIMARY KEY,
ORISEQNO      VARCHAR2(22)   NOT  NULL,
MAINACCTID       NUMBER(10)   NOT  NULL,
SUBACCTID       NUMBER(10)   NOT  NULL,
AMOUNT      NUMBER(16,2) ,
RETENTIONBAL      NUMBER(16,2) ,
LIMITAMT      NUMBER(16,2) ,
SUBACCBAL      NUMBER(16,2) ,
RECSTATUS      VARCHAR2(4)   NOT  NULL,
RECSTATUSDETAILS      VARCHAR2(200) ,
BANKCODE      VARCHAR2(4)   NOT  NULL,
PROCMODE      CHAR(1)   ,
VER      VARCHAR2(32) ,
TRANSFERTYPE      CHAR(1)   NOT  NULL,
POSTSCRIPT      VARCHAR2(2000)  ,
MEMO      VARCHAR2(2000) ,
BANKRESPMSG   VARCHAR2(500) ,
RECBANKACCNO      VARCHAR2(70) ,
RECBANKNAME      VARCHAR2(100) ,
OPERATOR      VARCHAR2(20) ,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_TRANSFER_RECORD.HOSTSEQNO    IS   '主机流水号（银企流水号）主键';
comment on column  BEDC_TRANSFER_RECORD.ORISEQNO    IS   '核心流水号';
comment on column  BEDC_TRANSFER_RECORD.MAINACCTID    IS   '主账户标识';
comment on column  BEDC_TRANSFER_RECORD.SUBACCTID    IS   '子账户标识';
comment on column  BEDC_TRANSFER_RECORD.AMOUNT    IS   '业务金额';
comment on column  BEDC_TRANSFER_RECORD.RETENTIONBAL    IS   '保留余额';
comment on column  BEDC_TRANSFER_RECORD.LIMITAMT    IS   '限制金额';
comment on column  BEDC_TRANSFER_RECORD.SUBACCBAL    IS   '子账户余额';
 comment on column  BEDC_TRANSFER_RECORD.RECSTATUS    IS   '结算状态1:支付成功 2:支付失败 3待直联处理 4:平台处理中 5:银行处理中 6:退回企业 7:取消支付 8:线下支付 0 其他';
comment on column  BEDC_TRANSFER_RECORD.RECSTATUSDETAILS    IS   '交易内部描述信息';
comment on column  BEDC_TRANSFER_RECORD.BANKCODE    IS   '银行代码';
 comment on column  BEDC_TRANSFER_RECORD.PROCMODE    IS   '执行模式上划时必输
0：指定金额 1：按余额';
comment on column  BEDC_TRANSFER_RECORD.VER    IS   '版本号';
comment on column  BEDC_TRANSFER_RECORD.TRANSFERTYPE    IS   '划拨方式0:上划 1：下拨';
comment on column  BEDC_TRANSFER_RECORD.POSTSCRIPT    IS   '附言';
comment on column  BEDC_TRANSFER_RECORD.MEMO    IS   '备注';
comment on column  BEDC_TRANSFER_RECORD.RECBANKACCNO    IS   '收款方账号';
comment on column  BEDC_TRANSFER_RECORD.RECBANKNAME    IS   '收款方账号名称';
comment on column  BEDC_TRANSFER_RECORD.BANKRESPMSG    IS   '银行响应信息';
comment on column  BEDC_TRANSFER_RECORD.OPERATOR    IS   '操作员';
comment on column  BEDC_TRANSFER_RECORD.CREATEUSER    IS   '创建用户';
comment on column  BEDC_TRANSFER_RECORD.CREATETIME    IS   '创建时间';
comment on column  BEDC_TRANSFER_RECORD.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_TRANSFER_RECORD.LASTUPDATETIME    IS   '最后修改时间';
 --支付业务记录表
CREATE TABLE BEDC_PAY_RECORD   (
HOSTSEQNO      VARCHAR2(22)   NOT  NULL  PRIMARY KEY,
ORISEQNO      VARCHAR2(22)   NOT  NULL,
CREATEDATE      VARCHAR2(10)   NOT  NULL,
CREATETIME      VARCHAR2(8)   NOT  NULL,
PAYACCTID       NUMBER(10)   NOT  NULL,
PUB_PRI_FLAG	CHAR(1)		NOT NULL,
REALACCNO      VARCHAR2(64) ,
REALACCNAME      VARCHAR2(72) ,
OCCDATE      VARCHAR2(10) ,
OCCTIME      VARCHAR2(8) ,
PAYMODE      VARCHAR2(2)   NOT  NULL,
PAYBANKCODE      VARCHAR2(8)   NOT  NULL,
OPPBANKCODE      VARCHAR2(8)   ,
OPPBRANCHCODE      VARCHAR2(12)   NOT  NULL,
OPPBRANCHNAME      VARCHAR2(150)   NOT  NULL,
OPPACCNO      VARCHAR2(32)   NOT  NULL,
OPPACCNAME      VARCHAR2(72)   NOT  NULL,
OPPACCCLASS      VARCHAR2(2)   ,
AREA_FLAG      VARCHAR2(2)   NOT  NULL,
BANK_FLAG      VARCHAR2(2)   NOT  NULL,
BANKRESPMSG   VARCHAR2(500) ,
PAYAMT      NUMBER(16,2)   NOT  NULL,
URGFLAG      VARCHAR2(2)   NOT  NULL,
PURPOS      VARCHAR2(64)   ,
SUMMARY      VARCHAR2(2000)  ,
POSTSCRIPT      VARCHAR2(2000)   ,
FEE      NUMBER(16,2) ,
RECSTATUS      VARCHAR2(4)   NOT  NULL,
RECSTATUSDETAILS      VARCHAR2(200) ,
OPPACCID      NUMBER(10) ,
BUSISEQNO      VARCHAR2(32) ,
PROCID      VARCHAR2(32) ,
VER      VARCHAR2(22) ,
VIRTUALOPERID      VARCHAR2(50) ,
OPPPROVINCE      VARCHAR2(200) ,
OPPCITY      VARCHAR2(200) ,
CREATEUSER      VARCHAR2(20) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_PAY_RECORD.HOSTSEQNO    IS   '主机流水号（银企流水号）主键';
comment on column  BEDC_PAY_RECORD.ORISEQNO    IS   '核心流水号';
comment on column  BEDC_PAY_RECORD.CREATEDATE    IS   '创建日期';
comment on column  BEDC_PAY_RECORD.CREATETIME    IS   '创建时间';
comment on column  BEDC_PAY_RECORD.PAYACCTID    IS   '付款方银行标识BEDC_BANKACC主键';
comment on column  BEDC_PAY_RECORD.PUB_PRI_FLAG    IS   '对公对私标志1:对公2:对私';
comment on column  BEDC_PAY_RECORD.REALACCNO    IS   '实际付款账号';
comment on column  BEDC_PAY_RECORD.REALACCNAME    IS   '实际付款账户名称';
comment on column  BEDC_PAY_RECORD.OCCDATE    IS   '发生日期';
comment on column  BEDC_PAY_RECORD.OCCTIME    IS   '发生时间';
comment on column  BEDC_PAY_RECORD.PAYMODE    IS   '支付方式0：直接支付1：代理支付';
comment on column  BEDC_PAY_RECORD.PAYBANKCODE    IS   '支付银行代码';
comment on column  BEDC_PAY_RECORD.OPPBANKCODE    IS   '收款方银行代码 ';
comment on column  BEDC_PAY_RECORD.OPPBRANCHCODE    IS   '收款方银行人行联行号';
comment on column  BEDC_PAY_RECORD.OPPBRANCHNAME    IS   '收款方银行行名';
comment on column  BEDC_PAY_RECORD.OPPACCNO    IS   '收款账号';
comment on column  BEDC_PAY_RECORD.OPPACCNAME    IS   '收款户名';
comment on column  BEDC_PAY_RECORD.OPPACCCLASS    IS   '收款账户类别';
comment on column  BEDC_PAY_RECORD.BANKRESPMSG    IS   '银行响应信息';
comment on column  BEDC_PAY_RECORD.AREA_FLAG    IS   '是否同城';
comment on column  BEDC_PAY_RECORD.BANK_FLAG    IS   '是否同行';
comment on column  BEDC_PAY_RECORD.PAYAMT    IS   '支付金额';
comment on column  BEDC_PAY_RECORD.URGFLAG    IS   '加急标志';
comment on column  BEDC_PAY_RECORD.PURPOS    IS   '账户用途';
comment on column  BEDC_PAY_RECORD.SUMMARY    IS   '业务摘要';
comment on column  BEDC_PAY_RECORD.POSTSCRIPT    IS   '附言';
comment on column  BEDC_PAY_RECORD.FEE    IS   '银行手续费';
 comment on column  BEDC_PAY_RECORD.RECSTATUS    IS   '交易状态0001支付成功
0002待查证
0003待直联处理
0004退回企业
0005退回柜面
0006取消支付
0007线下支付
0008支付失败
0009 其他';
comment on column  BEDC_PAY_RECORD.RECSTATUSDETAILS    IS   '交易内部描述信息';
comment on column  BEDC_PAY_RECORD.OPPACCID    IS   '收款方账号ID';
comment on column  BEDC_PAY_RECORD.BUSISEQNO    IS   '业务序号';
comment on column  BEDC_PAY_RECORD.PROCID    IS   '';
comment on column  BEDC_PAY_RECORD.VER    IS   '版本号默认0';
comment on column  BEDC_PAY_RECORD.VIRTUALOPERID    IS   '虚拟柜员默认’0000001’';
comment on column  BEDC_PAY_RECORD.OPPPROVINCE    IS   '对方所在省';
comment on column  BEDC_PAY_RECORD.OPPCITY    IS   '对方所在市';
comment on column  BEDC_PAY_RECORD.CREATEUSER    IS   '创建用户';
comment on column  BEDC_PAY_RECORD.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_PAY_RECORD.LASTUPDATETIME    IS   '最后修改时间';
 --签约银行信息表
CREATE TABLE BEDC_BANKDELMSG   (
ID      NUMBER(10)   NOT  NULL,
BANKCODE      VARCHAR2(4) ,
SHORTNAME      VARCHAR2(20) ,
FULLNAME      VARCHAR2(60) ,
CORPCODE      VARCHAR2(40) ,
BANKACC      VARCHAR2(32) ,
INNERACC      VARCHAR2(32) ,
BRANCHID      VARCHAR2(12) ,
AREACODE      VARCHAR2(8) ,
TECHPHONE      VARCHAR2(16) ,
BIZPHONE      VARCHAR2(16) ,
POSTCODE      VARCHAR2(8) ,
ADDRESS      VARCHAR2(80) ,
SIGNDATE      CHAR(12) ,
OVERDATE      CHAR(12) ,
COOPSTATUS      VARCHAR2(20) ,
SIGNFLAG      VARCHAR2(20) ,
CREATEDATE      CHAR(12) ,
CREATETIME      CHAR(10) ,
UPDATEDATE      CHAR(12) ,
UPDATETIME      CHAR(10) ,
CREATEUSR      CHAR(6) ,
UPDATEUSR      CHAR(6) ,
MGNTYPE      VARCHAR2(20) ,
BANKCUSTID      VARCHAR2(20) ,
PWD      VARCHAR2(40) ,
DEALFUNC      VARCHAR2(2000) ,
MEMO      VARCHAR2(2000) ,
SIGNZUT      VARCHAR2(150) );
comment on column  BEDC_BANKDELMSG.ID    IS   'ID';
comment on column  BEDC_BANKDELMSG.BANKCODE    IS   '银行代码';
comment on column  BEDC_BANKDELMSG.SHORTNAME    IS   '银行简称';
comment on column  BEDC_BANKDELMSG.FULLNAME    IS   '银行全称';
comment on column  BEDC_BANKDELMSG.CORPCODE    IS   '企业代码';
comment on column  BEDC_BANKDELMSG.BANKACC    IS   '银行账号';
comment on column  BEDC_BANKDELMSG.INNERACC    IS   '内部账号';
comment on column  BEDC_BANKDELMSG.BRANCHID    IS   '接入网点';
comment on column  BEDC_BANKDELMSG.AREACODE    IS   '长途区位';
comment on column  BEDC_BANKDELMSG.TECHPHONE    IS   '技术电话';
comment on column  BEDC_BANKDELMSG.BIZPHONE    IS   '业务电话';
comment on column  BEDC_BANKDELMSG.POSTCODE    IS   '邮政编码';
comment on column  BEDC_BANKDELMSG.ADDRESS    IS   '通信地址';
comment on column  BEDC_BANKDELMSG.SIGNDATE    IS   '签约日期';
comment on column  BEDC_BANKDELMSG.OVERDATE    IS   '出约 ';
 comment on column  BEDC_BANKDELMSG.COOPSTATUS    IS   '合作状况1代表已签约
2代表未签约';
comment on column  BEDC_BANKDELMSG.SIGNFLAG    IS   '签名标志';
comment on column  BEDC_BANKDELMSG.CREATEDATE    IS   '创建日期';
comment on column  BEDC_BANKDELMSG.CREATETIME    IS   '创建时间';
comment on column  BEDC_BANKDELMSG.UPDATEDATE    IS   '更新日期';
comment on column  BEDC_BANKDELMSG.UPDATETIME    IS   '更新时间';
comment on column  BEDC_BANKDELMSG.CREATEUSR    IS   '创建用户';
comment on column  BEDC_BANKDELMSG.UPDATEUSR    IS   '更新用户';
comment on column  BEDC_BANKDELMSG.MGNTYPE    IS   '管理类型';
comment on column  BEDC_BANKDELMSG.BANKCUSTID    IS   '财务公司在银行的客户号';
comment on column  BEDC_BANKDELMSG.PWD    IS   '财务公司银企直连密码';
comment on column  BEDC_BANKDELMSG.DEALFUNC    IS   '签约功能';
comment on column  BEDC_BANKDELMSG.MEMO    IS   '备注';
comment on column  BEDC_BANKDELMSG.SIGNZUT    IS   '签约主体';
create unique index BEDC_BANK_BRANCHID on BEDC_BANKDELMSG(BRANCHID);
create  index BEDC_BANK_BANKACC on BEDC_BANKDELMSG(BANKACC);
create  index BEDC_BANK_INNERACC on BEDC_BANKDELMSG(INNERACC);

--策略信息表
CREATE TABLE BEDC_STRATEGY   (
ID      NUMBER(5)   NOT  NULL  primary key,
STRATEGYNAME      VARCHAR2(20)   NOT  NULL,
STATUS      CHAR(1)   NOT  NULL,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
create unique index BEDC_STRATEGY_IDX on BEDC_STRATEGY(STRATEGYNAME);
comment on column  BEDC_STRATEGY.ID    IS   'ID';
comment on column  BEDC_STRATEGY.STRATEGYNAME    IS   '策略名称';
comment on column  BEDC_STRATEGY.STATUS    IS   '策略状态';
comment on column  BEDC_STRATEGY.CREATEUSER    IS   '创建用户';
comment on column  BEDC_STRATEGY.CREATETIME    IS   '创建时间';
comment on column  BEDC_STRATEGY.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_STRATEGY.LASTUPDATETIME    IS   '最后修改时间';

--策略详情表
CREATE TABLE BEDC_STRATEGY_DETAIL   (
ID      NUMBER(5)   NOT  NULL  primary key,
STRATEGYCONTENT      VARCHAR2(500)   NOT  NULL,
STRATEGYID      NUMBER(5)   NOT  NULL,
CREATEUSER      VARCHAR2(20) ,
CREATETIME      TIMESTAMP(6) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
create unique index BEDC_STRATEGY_DETAIL_IDX on BEDC_STRATEGY_DETAIL(STRATEGYCONTENT);
ALTER TABLE BEDC_STRATEGY_DETAIL ADD CONSTRAINT FK_STRATEGYID FOREIGN KEY(STRATEGYID ) REFERENCES BEDC_STRATEGY(ID);
comment on column  BEDC_STRATEGY_DETAIL.ID    IS   'ID';
comment on column  BEDC_STRATEGY_DETAIL.STRATEGYCONTENT    IS   '策略详细内容';
comment on column  BEDC_STRATEGY_DETAIL.STRATEGYID    IS   '策略信息表ID';
comment on column  BEDC_STRATEGY_DETAIL.CREATEUSER    IS   '创建用户';
comment on column  BEDC_STRATEGY_DETAIL.CREATETIME    IS   '创建时间';
comment on column  BEDC_STRATEGY_DETAIL.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_STRATEGY_DETAIL.LASTUPDATETIME    IS   '最后修改时间';



--渠道支付记录表
CREATE TABLE BEDC_CHANNEL_PAY_RECORD   (
ORISEQNO      VARCHAR2(22)   NOT  NULL  PRIMARY KEY,
CREATEDATE      VARCHAR2(10)   NOT  NULL,
CREATETIME      VARCHAR2(8)   NOT  NULL,
PAYACCTNO      VARCHAR2(22)   NOT  NULL,
PAYACCTNAME      VARCHAR2(72)   NOT  NULL,
REALACCNO      VARCHAR2(64) ,
REALACCNAME      VARCHAR2(72) ,
OCCDATE      VARCHAR2(10) ,
OCCTIME      VARCHAR2(8) ,
PAYMODE      VARCHAR2(2)   NOT  NULL,
PAYBANKCODE      VARCHAR2(8)   NOT  NULL,
OPPBANKCODE      VARCHAR2(8)   NOT  NULL,
OPPBRANCHCODE      VARCHAR2(12)   NOT  NULL,
OPPBRANCHNAME      VARCHAR2(150)   NOT  NULL,
OPPACCNO      VARCHAR2(32)   NOT  NULL,
OPPACCNAME      VARCHAR2(72)   NOT  NULL,
OPPACCCLASS      VARCHAR2(2) ,
AREA_FLAG      VARCHAR2(2)   NOT  NULL,
BANK_FLAG      VARCHAR2(2)   NOT  NULL,
PAYAMT      NUMBER(16,2)   NOT  NULL,
URGFLAG      VARCHAR2(2)   NOT  NULL,
PUB_PRI_FLAG      CHAR(1)   NOT  NULL,
PURPOS      VARCHAR2(2000) ,
SUMMARY      VARCHAR2(2000) ,
POSTSCRIPT      VARCHAR2(64) ,
FEE      NUMBER(16,2) ,
RECSTATUS      VARCHAR2(4) ,
RECSTATUSDETAILS      VARCHAR2(200) ,
BANKRESPMSG      VARCHAR2(500)   NOT  NULL,
OPPACCID      NUMBER(10) ,
BUSISEQNO      VARCHAR2(32) ,
PROCID      VARCHAR2(32) ,
VER      VARCHAR2(22) ,
VIRTUALOPERID      VARCHAR2(50) ,
OPPPROVINCE      VARCHAR2(200) ,
OPPCITY      VARCHAR2(200) ,
CREATEUSER      VARCHAR2(20) ,
LASTUPDATEUSER      VARCHAR2(20) ,
LASTUPDATETIME      TIMESTAMP(6) );
comment on column  BEDC_CHANNEL_PAY_RECORD.ORISEQNO    IS   '渠道流水号主键';
comment on column  BEDC_CHANNEL_PAY_RECORD.CREATEDATE    IS   '创建日期';
comment on column  BEDC_CHANNEL_PAY_RECORD.CREATETIME    IS   '创建时间';
comment on column  BEDC_CHANNEL_PAY_RECORD.PAYACCTNO    IS   '付款方银行账号';
comment on column  BEDC_CHANNEL_PAY_RECORD.PAYACCTNAME    IS   '付款方账号名称';
comment on column  BEDC_CHANNEL_PAY_RECORD.REALACCNO    IS   '实际付款账号';
comment on column  BEDC_CHANNEL_PAY_RECORD.REALACCNAME    IS   '实际付款账户名称';
comment on column  BEDC_CHANNEL_PAY_RECORD.OCCDATE    IS   '发生日期';
comment on column  BEDC_CHANNEL_PAY_RECORD.OCCTIME    IS   '发生时间';
comment on column  BEDC_CHANNEL_PAY_RECORD.PAYMODE    IS   '支付方式02:直接支付';
comment on column  BEDC_CHANNEL_PAY_RECORD.PAYBANKCODE    IS   '支付银行代码';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPBANKCODE    IS   '收款方银行代码 ';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPBRANCHCODE    IS   '收款方银行人行联行号';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPBRANCHNAME    IS   '收款方银行行名';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPACCNO    IS   '收款账号';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPACCNAME    IS   '收款户名';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPACCCLASS    IS   '收款账户类别';
comment on column  BEDC_CHANNEL_PAY_RECORD.AREA_FLAG    IS   '是否同城1:同城2:异地';
comment on column  BEDC_CHANNEL_PAY_RECORD.BANK_FLAG    IS   '是否同行0:不跨行1:跨行';
comment on column  BEDC_CHANNEL_PAY_RECORD.PAYAMT    IS   '支付金额';
comment on column  BEDC_CHANNEL_PAY_RECORD.URGFLAG    IS   '加急标志1:加急2:不加急';
comment on column  BEDC_CHANNEL_PAY_RECORD.PUB_PRI_FLAG    IS   '对公对私标志1:对公2:对私';
comment on column  BEDC_CHANNEL_PAY_RECORD.PURPOS    IS   '账户用途';
comment on column  BEDC_CHANNEL_PAY_RECORD.SUMMARY    IS   '业务摘要';
comment on column  BEDC_CHANNEL_PAY_RECORD.POSTSCRIPT    IS   '附言';
comment on column  BEDC_CHANNEL_PAY_RECORD.FEE    IS   '银行手续费';
comment on column  BEDC_CHANNEL_PAY_RECORD.RECSTATUS    IS   '支付状态1:支付成功2:支付失败3待直联处理4:平台处理中5:银行处理中6:退回企业7:取消支付8:线下支付0 其他';
comment on column  BEDC_CHANNEL_PAY_RECORD.RECSTATUSDETAILS    IS   '交易内部描述信息';
comment on column  BEDC_CHANNEL_PAY_RECORD.BANKRESPMSG    IS   '银行响应信息';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPACCID    IS   '收款方账号ID';
comment on column  BEDC_CHANNEL_PAY_RECORD.BUSISEQNO    IS   '业务序号';
comment on column  BEDC_CHANNEL_PAY_RECORD.PROCID    IS   '';
comment on column  BEDC_CHANNEL_PAY_RECORD.VER    IS   '版本号默认0';
comment on column  BEDC_CHANNEL_PAY_RECORD.VIRTUALOPERID    IS   '虚拟柜员默认’0000001’';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPPROVINCE    IS   '对方所在省';
comment on column  BEDC_CHANNEL_PAY_RECORD.OPPCITY    IS   '对方所在市';
comment on column  BEDC_CHANNEL_PAY_RECORD.CREATEUSER    IS   '创建用户';
comment on column  BEDC_CHANNEL_PAY_RECORD.LASTUPDATEUSER    IS   '最后修改用户';
comment on column  BEDC_CHANNEL_PAY_RECORD.LASTUPDATETIME    IS   '最后修改时间';

