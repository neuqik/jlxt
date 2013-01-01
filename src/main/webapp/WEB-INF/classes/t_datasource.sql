prompt PL/SQL Developer import file
prompt Created on 2012年12月12日 by Administrator
set feedback off
set define off
prompt Dropping T_DATASOURCE...
drop table T_DATASOURCE cascade constraints;
prompt Creating T_DATASOURCE...
create table T_DATASOURCE
(
  dsid         VARCHAR2(11) not null,
  poolprovider VARCHAR2(16) not null,
  dsname       VARCHAR2(60) not null,
  dsdescribe   VARCHAR2(512),
  drivername   VARCHAR2(60),
  dbtype       VARCHAR2(25),
  dburl        VARCHAR2(256),
  username     VARCHAR2(20) not null,
  password     VARCHAR2(20),
  servername   VARCHAR2(64),
  validstatus  VARCHAR2(1),
  dstype       VARCHAR2(1)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table T_DATASOURCE
  is '业务数据库连接信息';
comment on column T_DATASOURCE.dbtype
  is '数据库类型';
comment on column T_DATASOURCE.dburl
  is 'JDBC连接串';
comment on column T_DATASOURCE.username
  is '用户名';
comment on column T_DATASOURCE.password
  is '密码';
comment on column T_DATASOURCE.servername
  is '服务名';
alter table T_DATASOURCE
  add constraint PK_DS primary key (DSID, POOLPROVIDER)
  using index 
  tablespace USERS
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt Disabling triggers for T_DATASOURCE...
alter table T_DATASOURCE disable all triggers;
prompt Loading T_DATASOURCE...
insert into T_DATASOURCE (dsid, poolprovider, dsname, dsdescribe, drivername, dbtype, dburl, username, password, servername, validstatus, dstype)
values ('YWXT', 'UDOLINK', 'YWXT', 'YWXT', 'oracle.jdbc.driver.OracleDriver', 'Oracle', 'jdbc:oracle:thin:@127.0.0.1:1521:orcl', 'jlxt', 'jlxt', 'orcl', '0', '1');
commit;
prompt 1 records loaded
prompt Enabling triggers for T_DATASOURCE...
alter table T_DATASOURCE enable all triggers;
set feedback on
set define on
prompt Done.
