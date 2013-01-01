prompt PL/SQL Developer import file
prompt Created on 2012年12月12日 by Administrator
set feedback off
set define off
prompt Dropping HRD_EMP...
drop table HRD_EMP cascade constraints;
prompt Dropping HRD_EMP_CONTRACT...
drop table HRD_EMP_CONTRACT cascade constraints;
prompt Dropping HRD_EMP_DOC...
drop table HRD_EMP_DOC cascade constraints;
prompt Dropping HRD_EMP_FAMILY...
drop table HRD_EMP_FAMILY cascade constraints;
prompt Dropping HRD_EMP_INSU...
drop table HRD_EMP_INSU cascade constraints;
prompt Dropping HRD_EMP_PROF...
drop table HRD_EMP_PROF cascade constraints;
prompt Dropping HRD_EMP_REG...
drop table HRD_EMP_REG cascade constraints;
prompt Dropping HRD_EMP_REWARD...
drop table HRD_EMP_REWARD cascade constraints;
prompt Dropping HRD_EMP_TRAIN...
drop table HRD_EMP_TRAIN cascade constraints;
prompt Dropping HRD_EMP_TRANSFER...
drop table HRD_EMP_TRANSFER cascade constraints;
prompt Dropping HRD_EMP_WORK...
drop table HRD_EMP_WORK cascade constraints;
prompt Dropping ORDERS...
drop table ORDERS cascade constraints;
prompt Dropping T_TEST_PENGXF...
drop table T_TEST_PENGXF cascade constraints;
prompt Creating HRD_EMP...
create table HRD_EMP
(
  id           NUMBER(20) not null,
  emp_id       VARCHAR2(20) not null,
  emp_name     VARCHAR2(20) not null,
  nation       VARCHAR2(3),
  birth        DATE not null,
  age          NUMBER(3),
  education    VARCHAR2(20),
  marriage     VARCHAR2(3),
  gender       VARCHAR2(3) not null,
  politic      VARCHAR2(3),
  idcard       VARCHAR2(18) not null,
  native       VARCHAR2(200),
  workdate     DATE,
  workage      NUMBER(3),
  emptype      VARCHAR2(3) not null,
  joindate     DATE,
  joinage      NUMBER(3),
  dept_id      VARCHAR2(20) not null,
  rolename     VARCHAR2(3),
  title_id     VARCHAR2(3),
  titlename    VARCHAR2(200),
  titlework    VARCHAR2(200),
  titleno      VARCHAR2(100),
  provincereg  VARCHAR2(100),
  provincesafe VARCHAR2(100),
  cityreg      VARCHAR2(100),
  fairreg      VARCHAR2(100),
  judgereg     VARCHAR2(100),
  insustatus   VARCHAR2(3),
  tel          VARCHAR2(20),
  telehome     VARCHAR2(20),
  emergency    VARCHAR2(20),
  graduate     VARCHAR2(100),
  master       VARCHAR2(100),
  graddate     DATE,
  location1    VARCHAR2(20),
  reglocation  VARCHAR2(200),
  winterloc    VARCHAR2(200),
  picture      VARCHAR2(200),
  memo         VARCHAR2(500),
  valid        VARCHAR2(3) not null,
  location2    VARCHAR2(200),
  location3    VARCHAR2(200),
  location4    VARCHAR2(2000)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP
  is '员工信息';
comment on column HRD_EMP.emp_id
  is '员工编号';
comment on column HRD_EMP.emp_name
  is '姓名';
comment on column HRD_EMP.nation
  is '民族';
comment on column HRD_EMP.birth
  is '出生日期';
comment on column HRD_EMP.age
  is '年龄';
comment on column HRD_EMP.education
  is '文化程度';
comment on column HRD_EMP.marriage
  is '婚姻状况';
comment on column HRD_EMP.gender
  is '性别';
comment on column HRD_EMP.politic
  is '政治面貌';
comment on column HRD_EMP.idcard
  is '身份证号码';
comment on column HRD_EMP.native
  is '籍贯';
comment on column HRD_EMP.workdate
  is '参加工作日期';
comment on column HRD_EMP.workage
  is '工龄(derive)';
comment on column HRD_EMP.emptype
  is '员工类型';
comment on column HRD_EMP.joindate
  is '进入本单位时间';
comment on column HRD_EMP.joinage
  is '本单位工龄(derive)';
comment on column HRD_EMP.dept_id
  is '部门编号';
comment on column HRD_EMP.rolename
  is '岗位';
comment on column HRD_EMP.title_id
  is '职称';
comment on column HRD_EMP.titlename
  is '职称专业';
comment on column HRD_EMP.titlework
  is '从事专业';
comment on column HRD_EMP.titleno
  is '职称证书编号';
comment on column HRD_EMP.provincereg
  is '省级注册证书编号';
comment on column HRD_EMP.provincesafe
  is '省级安全证书编号';
comment on column HRD_EMP.cityreg
  is '市级监理员证书编号';
comment on column HRD_EMP.fairreg
  is '见证人证书编号 ';
comment on column HRD_EMP.judgereg
  is '评价员证书编号';
comment on column HRD_EMP.insustatus
  is '保险状态';
comment on column HRD_EMP.tel
  is '联系电话';
comment on column HRD_EMP.telehome
  is '家庭电话';
comment on column HRD_EMP.emergency
  is '紧急联系人电话';
comment on column HRD_EMP.graduate
  is '毕业院校';
comment on column HRD_EMP.master
  is '主修专业';
comment on column HRD_EMP.graddate
  is '毕业时间';
comment on column HRD_EMP.location1
  is '居住地址(省)';
comment on column HRD_EMP.reglocation
  is '户口所在地';
comment on column HRD_EMP.winterloc
  is '冬休所在地';
comment on column HRD_EMP.picture
  is '照片路径';
comment on column HRD_EMP.memo
  is '备注';
comment on column HRD_EMP.valid
  is '有效标记，1有效0无效';
comment on column HRD_EMP.location2
  is '居住地址(市)';
comment on column HRD_EMP.location3
  is '居住地址(县/区)';
comment on column HRD_EMP.location4
  is '居住地址(街道)';

prompt Creating HRD_EMP_CONTRACT...
create table HRD_EMP_CONTRACT
(
  id            NUMBER(20) not null,
  emp_id        VARCHAR2(20) not null,
  contract_id   VARCHAR2(20) not null,
  contract_name VARCHAR2(200),
  contracttype  VARCHAR2(3),
  contractprop  VARCHAR2(3),
  begindate     DATE,
  enddate       DATE,
  addition      VARCHAR2(500),
  memo          VARCHAR2(500),
  valid         VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_CONTRACT
  is '员工合同信息';
comment on column HRD_EMP_CONTRACT.emp_id
  is '员工编号';
comment on column HRD_EMP_CONTRACT.contract_id
  is '合同编号';
comment on column HRD_EMP_CONTRACT.contract_name
  is '合同名称';
comment on column HRD_EMP_CONTRACT.contracttype
  is '合同类型';
comment on column HRD_EMP_CONTRACT.contractprop
  is '合同性质';
comment on column HRD_EMP_CONTRACT.begindate
  is '开始日期';
comment on column HRD_EMP_CONTRACT.enddate
  is '终止日期';
comment on column HRD_EMP_CONTRACT.addition
  is '附加条款';
comment on column HRD_EMP_CONTRACT.memo
  is '备注';
comment on column HRD_EMP_CONTRACT.valid
  is '有效标志';

prompt Creating HRD_EMP_DOC...
create table HRD_EMP_DOC
(
  id        NUMBER(20) not null,
  emp_id    VARCHAR2(20) not null,
  doc_id    VARCHAR2(20),
  document  VARCHAR2(500),
  doc_date  DATE,
  feestatus VARCHAR2(3),
  prevdoc   VARCHAR2(200),
  newdoc    VARCHAR2(500),
  memo      VARCHAR2(500),
  valid     VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_DOC
  is '员工档案信息';
comment on column HRD_EMP_DOC.emp_id
  is '员工编号';
comment on column HRD_EMP_DOC.doc_id
  is '档案编号';
comment on column HRD_EMP_DOC.document
  is '档案内容';
comment on column HRD_EMP_DOC.doc_date
  is '存入时间';
comment on column HRD_EMP_DOC.feestatus
  is '缴费情况';
comment on column HRD_EMP_DOC.prevdoc
  is '原档案机构';
comment on column HRD_EMP_DOC.newdoc
  is '新增档案内容';
comment on column HRD_EMP_DOC.memo
  is '备注';
comment on column HRD_EMP_DOC.valid
  is '有效标志';

prompt Creating HRD_EMP_FAMILY...
create table HRD_EMP_FAMILY
(
  id            NUMBER(20) not null,
  emp_id        VARCHAR2(20) not null,
  relation_name VARCHAR2(20),
  relation_type VARCHAR2(3),
  relation_tel  VARCHAR2(20),
  workdept      VARCHAR2(200),
  workrole      VARCHAR2(100),
  memo          VARCHAR2(500),
  valid         VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_FAMILY
  is '员工家庭关系';
comment on column HRD_EMP_FAMILY.emp_id
  is '员工编号';
comment on column HRD_EMP_FAMILY.relation_name
  is '关系人姓名';
comment on column HRD_EMP_FAMILY.relation_type
  is '与本人关系';
comment on column HRD_EMP_FAMILY.relation_tel
  is '联系电话';
comment on column HRD_EMP_FAMILY.workdept
  is '工作单位';
comment on column HRD_EMP_FAMILY.workrole
  is '职务';
comment on column HRD_EMP_FAMILY.memo
  is '备注';
comment on column HRD_EMP_FAMILY.valid
  is '有效标记，1有效0无效';

prompt Creating HRD_EMP_INSU...
create table HRD_EMP_INSU
(
  id        NUMBER(20) not null,
  emp_id    VARCHAR2(20) not null,
  insutype  VARCHAR2(3) not null,
  begindate DATE,
  enddate   DATE,
  memo      VARCHAR2(500),
  valid     VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_INSU
  is '员工福利信息';
comment on column HRD_EMP_INSU.emp_id
  is '员工编号';
comment on column HRD_EMP_INSU.insutype
  is '福利类型(养老保险/医疗保险等)';
comment on column HRD_EMP_INSU.begindate
  is '开始时间';
comment on column HRD_EMP_INSU.enddate
  is '终止时间';
comment on column HRD_EMP_INSU.memo
  is '备注';
comment on column HRD_EMP_INSU.valid
  is '有效标志';

prompt Creating HRD_EMP_PROF...
create table HRD_EMP_PROF
(
  id         NUMBER(20) not null,
  emp_id     VARCHAR2(20) not null,
  proftype   VARCHAR2(3) not null,
  obtaintype VARCHAR2(3) not null,
  obtaindate DATE,
  obtaindept VARCHAR2(200),
  prof_num   VARCHAR2(100),
  enddate    DATE,
  memo       VARCHAR2(500),
  valid      VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_PROF
  is '员工职称信息';
comment on column HRD_EMP_PROF.emp_id
  is '员工编号';
comment on column HRD_EMP_PROF.proftype
  is '职称类别';
comment on column HRD_EMP_PROF.obtaintype
  is '获得方式';
comment on column HRD_EMP_PROF.obtaindate
  is '获得日期';
comment on column HRD_EMP_PROF.obtaindept
  is '发证部门';
comment on column HRD_EMP_PROF.prof_num
  is '职称证书编号';
comment on column HRD_EMP_PROF.enddate
  is '有效截至日期';
comment on column HRD_EMP_PROF.memo
  is '备注';
comment on column HRD_EMP_PROF.valid
  is '有效标志';

prompt Creating HRD_EMP_REG...
create table HRD_EMP_REG
(
  id            NUMBER(20) not null,
  emp_id        VARCHAR2(20) not null,
  regtype       VARCHAR2(3),
  reglevel      VARCHAR2(3),
  regmajor1     VARCHAR2(200),
  regmajor2     VARCHAR2(200),
  regmajor3     VARCHAR2(200),
  regno         VARCHAR2(20),
  certificate   VARCHAR2(20),
  validdate     DATE,
  issuedate     DATE,
  certnumber    VARCHAR2(20),
  certdate      DATE,
  certvaliddate DATE,
  memo          VARCHAR2(500),
  valid         VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_REG
  is '员工专业资质注册信息';
comment on column HRD_EMP_REG.emp_id
  is '员工编号';
comment on column HRD_EMP_REG.regtype
  is '注册类别';
comment on column HRD_EMP_REG.reglevel
  is '注册级别';
comment on column HRD_EMP_REG.regmajor1
  is '注册专业1';
comment on column HRD_EMP_REG.regmajor2
  is '注册专业2';
comment on column HRD_EMP_REG.regmajor3
  is '注册专业3';
comment on column HRD_EMP_REG.regno
  is '注册号';
comment on column HRD_EMP_REG.certificate
  is '证书编号';
comment on column HRD_EMP_REG.validdate
  is '有效期';
comment on column HRD_EMP_REG.issuedate
  is '发证日期';
comment on column HRD_EMP_REG.certnumber
  is '资格证号';
comment on column HRD_EMP_REG.certdate
  is '资格证发证日期';
comment on column HRD_EMP_REG.certvaliddate
  is '资格证有效期';
comment on column HRD_EMP_REG.memo
  is '备注';
comment on column HRD_EMP_REG.valid
  is '有效标志';

prompt Creating HRD_EMP_REWARD...
create table HRD_EMP_REWARD
(
  id         NUMBER(20) not null,
  emp_id     VARCHAR2(20) not null,
  rewardtype VARCHAR2(3) not null,
  rewarddate DATE,
  rewarddept VARCHAR2(200),
  reward     VARCHAR2(500),
  memo       VARCHAR2(500),
  valid      VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_REWARD
  is '员工奖惩信息';
comment on column HRD_EMP_REWARD.emp_id
  is '员工编号';
comment on column HRD_EMP_REWARD.rewardtype
  is '奖惩种类';
comment on column HRD_EMP_REWARD.rewarddate
  is '奖惩日期';
comment on column HRD_EMP_REWARD.rewarddept
  is '奖惩单位';
comment on column HRD_EMP_REWARD.reward
  is '奖惩内容';
comment on column HRD_EMP_REWARD.memo
  is '备注';
comment on column HRD_EMP_REWARD.valid
  is '有效标志';

prompt Creating HRD_EMP_TRAIN...
create table HRD_EMP_TRAIN
(
  id            NUMBER(20) not null,
  emp_id        VARCHAR2(20) not null,
  trainingdate  DATE not null,
  training      VARCHAR2(500),
  knowledge     VARCHAR2(200),
  trainingdept  VARCHAR2(100),
  fee           NUMBER(10,2),
  intertraining VARCHAR2(20),
  result        VARCHAR2(100),
  work          VARCHAR2(100),
  professional  VARCHAR2(100),
  memo          VARCHAR2(500),
  valid         VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_TRAIN
  is '员工培训信息';
comment on column HRD_EMP_TRAIN.emp_id
  is '员工编号';
comment on column HRD_EMP_TRAIN.trainingdate
  is '培训时间';
comment on column HRD_EMP_TRAIN.training
  is '培训内容';
comment on column HRD_EMP_TRAIN.knowledge
  is '培训专业';
comment on column HRD_EMP_TRAIN.trainingdept
  is '培训单位';
comment on column HRD_EMP_TRAIN.fee
  is '培训经费';
comment on column HRD_EMP_TRAIN.intertraining
  is '是否内部培训';
comment on column HRD_EMP_TRAIN.result
  is '综合评价';
comment on column HRD_EMP_TRAIN.work
  is '工作能力';
comment on column HRD_EMP_TRAIN.professional
  is '专业能力';
comment on column HRD_EMP_TRAIN.memo
  is '备注';
comment on column HRD_EMP_TRAIN.valid
  is '有效标志 ';

prompt Creating HRD_EMP_TRANSFER...
create table HRD_EMP_TRANSFER
(
  id             NUMBER(20) not null,
  emp_id         VARCHAR2(20) not null,
  transferdate   DATE not null,
  transfertype   VARCHAR2(3) not null,
  transferreason VARCHAR2(200),
  prevdept_id    VARCHAR2(3),
  dept_id        VARCHAR2(3),
  memo           VARCHAR2(500),
  valid          VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_TRANSFER
  is '员工调转信息';
comment on column HRD_EMP_TRANSFER.emp_id
  is '员工编号';
comment on column HRD_EMP_TRANSFER.transferdate
  is '调转日期';
comment on column HRD_EMP_TRANSFER.transfertype
  is '调转类型';
comment on column HRD_EMP_TRANSFER.transferreason
  is '调转原因';
comment on column HRD_EMP_TRANSFER.prevdept_id
  is '原部门';
comment on column HRD_EMP_TRANSFER.dept_id
  is '现部门（内部调转）';
comment on column HRD_EMP_TRANSFER.memo
  is '备注';
comment on column HRD_EMP_TRANSFER.valid
  is '有效标志';

prompt Creating HRD_EMP_WORK...
create table HRD_EMP_WORK
(
  id      NUMBER(20) not null,
  emp_id  VARCHAR2(20) not null,
  begin   DATE,
  end     DATE,
  unit    VARCHAR2(200),
  dept    VARCHAR2(200),
  jobrole VARCHAR2(100),
  memo    VARCHAR2(500),
  valid   VARCHAR2(3) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table HRD_EMP_WORK
  is '员工工作经历';
comment on column HRD_EMP_WORK.emp_id
  is '员工编号';
comment on column HRD_EMP_WORK.begin
  is '开始时间';
comment on column HRD_EMP_WORK.end
  is '终止时间';
comment on column HRD_EMP_WORK.unit
  is '工作单位';
comment on column HRD_EMP_WORK.dept
  is '工作部门';
comment on column HRD_EMP_WORK.jobrole
  is '担任职务';
comment on column HRD_EMP_WORK.memo
  is '备注';
comment on column HRD_EMP_WORK.valid
  is '有效标记1有效，0无效';

prompt Creating ORDERS...
create table ORDERS
(
  order_no      NUMBER(10) not null,
  employee      VARCHAR2(31 CHAR) not null,
  country       VARCHAR2(2 CHAR) not null,
  customer      VARCHAR2(31 CHAR) not null,
  order2005     FLOAT not null,
  order2006     FLOAT not null,
  order2007     FLOAT not null,
  order2008     FLOAT not null,
  delivery_date DATE not null
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

prompt Creating T_TEST_PENGXF...
create table T_TEST_PENGXF
(
  id          NUMBER(24) not null,
  name        VARCHAR2(20 CHAR) not null,
  resource_id NUMBER(24) not null,
  type        NUMBER(24) not null,
  remark      VARCHAR2(255 CHAR),
  add_time    VARCHAR2(20 CHAR),
  modify_time VARCHAR2(20 CHAR)
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

prompt Disabling triggers for HRD_EMP...
alter table HRD_EMP disable all triggers;
prompt Disabling triggers for HRD_EMP_CONTRACT...
alter table HRD_EMP_CONTRACT disable all triggers;
prompt Disabling triggers for HRD_EMP_DOC...
alter table HRD_EMP_DOC disable all triggers;
prompt Disabling triggers for HRD_EMP_FAMILY...
alter table HRD_EMP_FAMILY disable all triggers;
prompt Disabling triggers for HRD_EMP_INSU...
alter table HRD_EMP_INSU disable all triggers;
prompt Disabling triggers for HRD_EMP_PROF...
alter table HRD_EMP_PROF disable all triggers;
prompt Disabling triggers for HRD_EMP_REG...
alter table HRD_EMP_REG disable all triggers;
prompt Disabling triggers for HRD_EMP_REWARD...
alter table HRD_EMP_REWARD disable all triggers;
prompt Disabling triggers for HRD_EMP_TRAIN...
alter table HRD_EMP_TRAIN disable all triggers;
prompt Disabling triggers for HRD_EMP_TRANSFER...
alter table HRD_EMP_TRANSFER disable all triggers;
prompt Disabling triggers for HRD_EMP_WORK...
alter table HRD_EMP_WORK disable all triggers;
prompt Disabling triggers for ORDERS...
alter table ORDERS disable all triggers;
prompt Disabling triggers for T_TEST_PENGXF...
alter table T_TEST_PENGXF disable all triggers;
prompt Loading HRD_EMP...
prompt Table is empty
prompt Loading HRD_EMP_CONTRACT...
prompt Table is empty
prompt Loading HRD_EMP_DOC...
prompt Table is empty
prompt Loading HRD_EMP_FAMILY...
prompt Table is empty
prompt Loading HRD_EMP_INSU...
prompt Table is empty
prompt Loading HRD_EMP_PROF...
prompt Table is empty
prompt Loading HRD_EMP_REG...
prompt Table is empty
prompt Loading HRD_EMP_REWARD...
prompt Table is empty
prompt Loading HRD_EMP_TRAIN...
prompt Table is empty
prompt Loading HRD_EMP_TRANSFER...
prompt Table is empty
prompt Loading HRD_EMP_WORK...
prompt Table is empty
prompt Loading ORDERS...
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (1, 'Dent Carry', 'US', 'Sigmasoft L', 33.9, 56.9, 453.9, 120.7, to_date('24-06-2008 14:10:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (5, 'RA', 'Ed', 'Sidney', 61, 31, 80, 47, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (6, 'CA', 'Pa', 'Solomon', 82, 70, 33, 38, to_date('21-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (7, 'MA', 'Le', 'Glendon', 90, 77, 98, 36, to_date('07-08-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (8, 'SP', 'Te', 'Edwin', 64, 47, 84, 41, to_date('04-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (9, 'SP', 'Br', 'Mike', 35, 73, 97, 83, to_date('02-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (10, 'MA', 'Je', 'Keith', 50, 57, 80, 46, to_date('02-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (11, 'CA', 'Ev', 'Chris', 66, 76, 43, 63, to_date('04-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (12, 'IN', 'Ro', 'Samuel', 63, 49, 85, 68, to_date('11-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (13, 'MA', 'Gl', 'Oscar', 94, 96, 62, 33, to_date('16-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (14, 'MA', 'Co', 'Peter', 76, 86, 77, 67, to_date('12-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (15, 'MA', 'Ja', 'Benson', 88, 96, 56, 33, to_date('16-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (16, 'UK', 'Fr', 'Lance', 87, 85, 47, 66, to_date('21-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (17, 'MA', 'Bi', 'Donald', 64, 70, 76, 87, to_date('06-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (18, 'CA', 'Se', 'Hunk', 50, 45, 46, 72, to_date('18-09-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (19, 'IN', 'Ke', 'Bob', 62, 64, 61, 61, to_date('19-01-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (20, 'US', 'Ja', 'Coli', 72, 92, 56, 41, to_date('20-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (21, 'IN', 'Br', 'Ivan', 68, 62, 66, 78, to_date('13-02-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (22, 'SP', 'Sa', 'Vern', 93, 66, 85, 71, to_date('18-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (23, 'US', 'Br', 'Leopold', 45, 70, 52, 39, to_date('07-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (24, 'CA', 'Le', 'Caspar', 62, 94, 53, 88, to_date('18-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (25, 'SP', 'Ju', 'Joe', 38, 97, 35, 74, to_date('31-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (26, 'UK', 'Co', 'Thomas', 55, 58, 62, 46, to_date('19-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (27, 'MA', 'Gi', 'Andrew', 33, 52, 68, 67, to_date('11-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (28, 'SP', 'Br', 'Gary', 61, 54, 62, 42, to_date('16-08-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (29, 'RA', 'Ry', 'Bob', 83, 50, 34, 46, to_date('01-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (30, 'US', 'Ga', 'Johnny', 45, 56, 36, 79, to_date('23-02-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (31, 'CA', 'Ra', 'Carl', 59, 42, 65, 47, to_date('20-09-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (42, 'MA', 'Je', 'Keith', 50, 57, 80, 46, to_date('02-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (43, 'SP', 'Ch', 'Marks', 79, 37, 40, 90, to_date('24-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (45, 'RA', 'Ed', 'Sidney', 61, 31, 80, 47, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (1, 'Dent Carry', 'US', 'Sigmasoft L', 33.9, 56.9, 453.9, 120.7, to_date('24-06-2008 14:10:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (5, 'RA', 'Ed', 'Sidney', 61, 31, 80, 47, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (6, 'CA', 'Pa', 'Solomon', 82, 70, 33, 38, to_date('21-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (7, 'MA', 'Le', 'Glendon', 90, 77, 98, 36, to_date('07-08-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (8, 'SP', 'Te', 'Edwin', 64, 47, 84, 41, to_date('04-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (9, 'SP', 'Br', 'Mike', 35, 73, 97, 83, to_date('02-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (10, 'MA', 'Je', 'Keith', 50, 57, 80, 46, to_date('02-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (11, 'CA', 'Ev', 'Chris', 66, 76, 43, 63, to_date('04-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (12, 'IN', 'Ro', 'Samuel', 63, 49, 85, 68, to_date('11-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (13, 'MA', 'Gl', 'Oscar', 94, 96, 62, 33, to_date('16-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (14, 'MA', 'Co', 'Peter', 76, 86, 77, 67, to_date('12-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (15, 'MA', 'Ja', 'Benson', 88, 96, 56, 33, to_date('16-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (16, 'UK', 'Fr', 'Lance', 87, 85, 47, 66, to_date('21-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (17, 'MA', 'Bi', 'Donald', 64, 70, 76, 87, to_date('06-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (18, 'CA', 'Se', 'Hunk', 50, 45, 46, 72, to_date('18-09-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (19, 'IN', 'Ke', 'Bob', 62, 64, 61, 61, to_date('19-01-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (20, 'US', 'Ja', 'Coli', 72, 92, 56, 41, to_date('20-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (21, 'IN', 'Br', 'Ivan', 68, 62, 66, 78, to_date('13-02-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (22, 'SP', 'Sa', 'Vern', 93, 66, 85, 71, to_date('18-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (23, 'US', 'Br', 'Leopold', 45, 70, 52, 39, to_date('07-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (24, 'CA', 'Le', 'Caspar', 62, 94, 53, 88, to_date('18-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (25, 'SP', 'Ju', 'Joe', 38, 97, 35, 74, to_date('31-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (26, 'UK', 'Co', 'Thomas', 55, 58, 62, 46, to_date('19-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (27, 'MA', 'Gi', 'Andrew', 33, 52, 68, 67, to_date('11-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (28, 'SP', 'Br', 'Gary', 61, 54, 62, 42, to_date('16-08-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (29, 'RA', 'Ry', 'Bob', 83, 50, 34, 46, to_date('01-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (30, 'US', 'Ga', 'Johnny', 45, 56, 36, 79, to_date('23-02-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (31, 'CA', 'Ra', 'Carl', 59, 42, 65, 47, to_date('20-09-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (42, 'MA', 'Je', 'Keith', 50, 57, 80, 46, to_date('02-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (43, 'SP', 'Ch', 'Marks', 79, 37, 40, 90, to_date('24-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (45, 'RA', 'Ed', 'Sidney', 61, 31, 80, 47, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (1, 'Dent Carry', 'US', 'Sigmasoft L', 33.9, 56.9, 453.9, 120.7, to_date('24-06-2008 14:10:46', 'dd-mm-yyyy hh24:mi:ss'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (5, 'RA', 'Ed', 'Sidney', 61, 31, 80, 47, to_date('16-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (6, 'CA', 'Pa', 'Solomon', 82, 70, 33, 38, to_date('21-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (7, 'MA', 'Le', 'Glendon', 90, 77, 98, 36, to_date('07-08-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (8, 'SP', 'Te', 'Edwin', 64, 47, 84, 41, to_date('04-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (9, 'SP', 'Br', 'Mike', 35, 73, 97, 83, to_date('02-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (10, 'MA', 'Je', 'Keith', 50, 57, 80, 46, to_date('02-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (11, 'CA', 'Ev', 'Chris', 66, 76, 43, 63, to_date('04-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (12, 'IN', 'Ro', 'Samuel', 63, 49, 85, 68, to_date('11-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (13, 'MA', 'Gl', 'Oscar', 94, 96, 62, 33, to_date('16-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (14, 'MA', 'Co', 'Peter', 76, 86, 77, 67, to_date('12-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (15, 'MA', 'Ja', 'Benson', 88, 96, 56, 33, to_date('16-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (16, 'UK', 'Fr', 'Lance', 87, 85, 47, 66, to_date('21-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (17, 'MA', 'Bi', 'Donald', 64, 70, 76, 87, to_date('06-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (18, 'CA', 'Se', 'Hunk', 50, 45, 46, 72, to_date('18-09-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (19, 'IN', 'Ke', 'Bob', 62, 64, 61, 61, to_date('19-01-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (20, 'US', 'Ja', 'Coli', 72, 92, 56, 41, to_date('20-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (21, 'IN', 'Br', 'Ivan', 68, 62, 66, 78, to_date('13-02-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (22, 'SP', 'Sa', 'Vern', 93, 66, 85, 71, to_date('18-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (23, 'US', 'Br', 'Leopold', 45, 70, 52, 39, to_date('07-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (24, 'CA', 'Le', 'Caspar', 62, 94, 53, 88, to_date('18-03-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (25, 'SP', 'Ju', 'Joe', 38, 97, 35, 74, to_date('31-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (26, 'UK', 'Co', 'Thomas', 55, 58, 62, 46, to_date('19-07-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (27, 'MA', 'Gi', 'Andrew', 33, 52, 68, 67, to_date('11-11-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (28, 'SP', 'Br', 'Gary', 61, 54, 62, 42, to_date('16-08-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (29, 'RA', 'Ry', 'Bob', 83, 50, 34, 46, to_date('01-12-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (30, 'US', 'Ga', 'Johnny', 45, 56, 36, 79, to_date('23-02-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (31, 'CA', 'Ra', 'Carl', 59, 42, 65, 47, to_date('20-09-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (42, 'MA', 'Je', 'Keith', 50, 57, 80, 46, to_date('02-10-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (43, 'SP', 'Ch', 'Marks', 79, 37, 40, 90, to_date('24-04-2008', 'dd-mm-yyyy'));
insert into ORDERS (order_no, employee, country, customer, order2005, order2006, order2007, order2008, delivery_date)
values (45, 'RA', 'Ed', 'Sidney', 61, 31, 80, 47, to_date('16-10-2008', 'dd-mm-yyyy'));
commit;
prompt 93 records loaded
prompt Loading T_TEST_PENGXF...
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (280, '访问添加角色页', 96, 42, ' ', '2012-06-10 01:20:37', '2012-06-10 01:20:37');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (281, '为角色分配菜单', 97, 40, ' ', '2012-06-10 01:20:54', '2012-06-10 01:20:54');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (282, '删除角色已分配的菜单', 98, 40, ' ', '2012-06-10 01:21:15', '2012-06-10 01:21:15');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (283, '查询角色', 99, 42, ' ', '2012-06-10 01:21:26', '2012-06-10 01:21:26');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (284, '获取角色JSON数据', 100, 42, ' ', '2012-06-10 01:21:42', '2012-06-10 01:21:42');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (285, '删除某角色', 101, 42, ' ', '2012-06-10 01:21:53', '2012-06-10 01:21:53');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (286, '更新某角色', 102, 42, ' ', '2012-06-10 01:22:06', '2012-06-10 01:22:06');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (287, '编辑某角色', 103, 42, ' ', '2012-06-10 01:22:17', '2012-06-10 01:22:17');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (288, '获取某角色已分配的菜单', 104, 42, ' ', '2012-06-10 01:22:42', '2012-06-10 01:22:42');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (289, '获取某角色已分配的权限', 105, 42, ' ', '2012-06-10 01:23:00', '2012-06-10 01:23:00');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (183, '访问后台主页', 5, 37, ' ', '2012-03-06 23:24:08', '2012-03-08 07:43:42');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (185, '添加代码信息', 7, 35, ' ', '2012-03-08 07:13:54', '2012-03-08 07:13:54');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (186, '批量删除代码', 8, 35, ' ', '2012-03-08 07:14:05', '2012-03-08 07:14:05');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (187, '查看代码列表', 9, 35, ' ', '2012-03-08 07:14:23', '2012-03-08 07:14:23');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (188, '访问添加代码页面', 10, 35, ' ', '2012-03-08 07:14:44', '2012-03-08 07:14:44');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (189, '查询代码', 11, 35, ' ', '2012-03-08 07:14:57', '2012-03-08 07:14:57');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (190, '获取代码类型Json格式数据', 12, 35, ' ', '2012-03-08 07:15:27', '2012-03-08 07:15:27');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (191, '删除某项代码', 13, 35, ' ', '2012-03-08 07:15:45', '2012-03-08 07:15:45');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (192, '编辑某项代码', 14, 35, ' ', '2012-03-08 07:16:01', '2012-03-08 07:16:01');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (193, '获取某类型父代码', 15, 35, ' ', '2012-03-08 07:16:17', '2012-03-08 07:16:17');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (194, '更新某代码', 16, 35, ' ', '2012-03-08 07:16:34', '2012-03-08 07:16:34');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (195, '添加部门', 17, 36, ' ', '2012-03-08 07:16:43', '2012-03-08 07:25:22');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (196, '批量删除部门', 18, 36, '' || chr(10) || '', '2012-03-08 07:25:53', '2012-03-08 07:25:53');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (197, '查看部门列表', 19, 36, ' ', '2012-03-08 07:26:35', '2012-03-08 07:26:35');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (198, '访问添加部门页面', 20, 36, ' ', '2012-03-08 07:26:50', '2012-03-08 07:26:50');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (199, '更新某部门', 21, 36, ' ', '2012-03-08 07:27:02', '2012-03-08 07:27:02');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (200, '删除某部门', 21, 36, ' ', '2012-03-08 07:27:38', '2012-03-08 07:27:38');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (201, '编辑某部门', 22, 36, ' ', '2012-03-08 07:42:12', '2012-03-08 07:42:12');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (202, '关于我们', 23, 37, ' ', '2012-03-08 07:43:59', '2012-03-08 07:43:59');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (203, '切换左边树形菜单', 24, 37, ' ', '2012-03-08 07:44:17', '2012-03-08 07:44:17');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (204, '切换左边显示html页面', 25, 37, ' ', '2012-03-08 07:44:39', '2012-03-08 07:44:39');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (205, '切换左边显示JSP页面', 26, 37, ' ', '2012-03-08 07:44:53', '2012-03-08 07:44:53');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (206, '添加导航菜单', 27, 38, ' ', '2012-03-08 07:45:48', '2012-03-08 07:45:48');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (207, '批量删除导航菜单', 28, 38, ' ', '2012-03-08 07:46:01', '2012-03-08 07:46:01');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (208, '查看导航菜单列表', 29, 38, ' ', '2012-03-08 08:22:50', '2012-03-08 08:22:50');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (209, '查找带回导航菜单', 30, 38, ' ', '2012-03-08 08:23:09', '2012-03-08 08:23:09');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (210, '查找搜索带回导航菜单', 31, 38, ' ', '2012-03-08 08:23:29', '2012-03-08 08:23:29');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (211, '访问添加导航菜单页面', 32, 38, ' ', '2012-03-08 08:23:44', '2012-03-08 08:23:44');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (212, '查询导航菜单', 33, 38, ' ', '2012-03-08 08:23:56', '2012-03-08 08:23:56');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (213, '下拉获取导航菜单Json格式信息', 34, 38, ' ', '2012-03-08 08:24:37', '2012-03-08 08:24:37');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (214, '删除某导航菜单', 35, 38, ' ', '2012-03-08 08:24:57', '2012-03-08 08:24:57');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (215, '编辑某导航菜单', 36, 38, ' ', '2012-03-08 08:25:11', '2012-03-08 08:25:11');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (216, '更新某导航菜单', 37, 38, ' ', '2012-03-08 08:25:25', '2012-03-08 08:25:25');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (217, '查看用户日志', 38, 23, ' ', '2012-03-08 08:33:00', '2012-03-08 08:33:00');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (218, '获取某用户的角色', 39, 23, ' ', '2012-03-08 08:34:02', '2012-03-08 08:34:02');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (219, '批量删除权限', 40, 40, ' ', '2012-03-08 08:34:26', '2012-03-08 08:34:26');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (220, '添加权限', 41, 40, ' ', '2012-03-08 08:34:38', '2012-03-08 08:34:38');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (221, '查看权限列表', 42, 40, ' ', '2012-03-08 08:34:52', '2012-03-08 08:34:52');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (222, '访问添加权限页面', 43, 40, ' ', '2012-03-08 08:35:09', '2012-03-08 08:35:09');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (223, '删除某权限', 44, 40, ' ', '2012-03-08 08:35:25', '2012-03-08 08:35:25');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (224, '更新某权限', 44, 40, ' ', '2012-03-08 08:35:36', '2012-03-08 08:35:36');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (225, '编辑某权限', 45, 40, ' ', '2012-03-08 08:35:49', '2012-03-08 08:35:49');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (226, '更新系统参数', 46, 41, ' ', '2012-03-08 08:36:19', '2012-03-08 08:36:19');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (227, '查看系统参数列表', 47, 41, ' ', '2012-03-08 08:36:32', '2012-03-08 08:36:32');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (228, '编辑某系统参数', 48, 41, ' ', '2012-03-08 08:36:43', '2012-03-08 08:36:43');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (229, '添加资源', 49, 43, ' ', '2012-03-08 08:36:53', '2012-03-08 08:36:53');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (230, '批量删除资源', 50, 43, ' ', '2012-03-08 08:37:32', '2012-03-08 08:37:32');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (231, '查看资源列表', 51, 43, ' ', '2012-03-08 08:37:48', '2012-03-08 08:37:48');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (232, '添加角色', 52, 42, ' ', '2012-03-08 08:38:01', '2012-03-08 08:38:01');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (233, '访问分配权限页面', 53, 40, ' ', '2012-03-08 08:38:18', '2012-03-08 08:39:07');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (234, '查看角色列表', 54, 42, ' ', '2012-03-08 08:38:35', '2012-03-08 08:38:35');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (235, '分配权限', 55, 40, ' ', '2012-03-08 08:39:25', '2012-03-08 08:39:25');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (236, '删除角色权限', 56, 40, ' ', '2012-03-08 08:39:51', '2012-03-08 08:39:51');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (237, '添加树形菜单', 57, 39, ' ', '2012-03-08 08:40:09', '2012-03-08 08:40:09');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (238, '添加用户', 58, 23, ' ', '2012-03-08 08:40:26', '2012-03-08 08:40:26');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (239, '查看用户列表', 59, 23, ' ', '2012-03-08 08:40:42', '2012-03-08 08:40:42');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (240, '批量删除树形菜单', 61, 39, ' ', '2012-06-09 23:31:29', '2012-06-09 23:31:29');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (241, '查看树形菜单列表', 62, 39, ' ', '2012-06-09 23:32:48', '2012-06-09 23:32:48');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (242, '访问添加树形菜单页面', 63, 39, ' ', '2012-06-09 23:33:10', '2012-06-09 23:33:10');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (243, '查询树形菜单', 64, 39, ' ', '2012-06-09 23:33:29', '2012-06-09 23:33:29');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (244, '删除某树形菜单', 65, 39, ' ', '2012-06-09 23:33:50', '2012-06-09 23:33:50');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (245, '编辑某树形菜单', 66, 39, ' ', '2012-06-09 23:34:53', '2012-06-09 23:34:53');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (246, '查找带回某导航菜单下的树形菜单', 67, 39, ' ', '2012-06-09 23:35:28', '2012-06-09 23:35:28');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (247, '在查找带回中查询树形菜单', 68, 39, ' ', '2012-06-09 23:37:10', '2012-06-09 23:37:10');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (248, '获取某导航菜单下的树形菜单JSON数据', 69, 39, ' ', '2012-06-09 23:37:41', '2012-06-09 23:37:41');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (249, '更新某树形菜单', 70, 39, ' ', '2012-06-09 23:37:56', '2012-06-09 23:37:56');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (250, '查看我的资料', 71, 23, ' ', '2012-06-09 23:42:10', '2012-06-09 23:42:10');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (251, '更新某用户', 72, 23, ' ', '2012-06-09 23:42:32', '2012-06-09 23:42:32');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (254, '退出后台', 74, 23, ' ', '2012-06-10 00:35:03', '2012-06-10 00:35:03');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (257, '锁定用户', 76, 23, ' ', '2012-06-10 00:35:55', '2012-06-10 00:35:55');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (258, '解锁用户', 77, 23, ' ', '2012-06-10 00:36:14', '2012-06-10 00:36:14');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (259, '批量锁定用户', 78, 23, ' ', '2012-06-10 00:36:35', '2012-06-10 00:36:35');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (260, '批量解锁用户', 79, 23, ' ', '2012-06-10 00:36:48', '2012-06-10 00:36:48');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (261, '批量删除用户', 80, 23, ' ', '2012-06-10 00:37:03', '2012-06-10 00:37:03');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (262, '分配部门', 81, 23, ' ', '2012-06-10 00:37:16', '2012-06-10 00:37:16');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (263, '分配角色', 82, 23, ' ', '2012-06-10 00:37:28', '2012-06-10 00:37:28');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (264, '访问添加用户页', 83, 23, ' ', '2012-06-10 00:38:22', '2012-06-10 01:34:03');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (265, '查询用户', 84, 23, ' ', '2012-06-10 00:38:32', '2012-06-10 00:38:32');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (266, '为用户分配部门', 85, 23, ' ', '2012-06-10 00:38:59', '2012-06-10 00:38:59');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (267, '删除用户分配的部门', 86, 23, ' ', '2012-06-10 00:39:23', '2012-06-10 00:39:23');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (268, '为用户分配角色', 87, 23, ' ', '2012-06-10 00:39:38', '2012-06-10 00:39:38');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (269, '删除用户分配的角色', 88, 23, ' ', '2012-06-10 00:39:54', '2012-06-10 00:39:54');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (270, '编辑某用户', 89, 23, ' ', '2012-06-10 00:41:00', '2012-06-10 00:41:00');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (271, '获取为某用户已分配的部门', 90, 23, ' ', '2012-06-10 00:41:32', '2012-06-10 00:41:32');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (272, '删除某用户', 72, 23, ' ', '2012-06-10 01:15:17', '2012-06-10 01:15:17');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (273, '获取URI资源JSON格式', 91, 43, ' ', '2012-06-10 01:15:54', '2012-06-10 01:15:54');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (274, '访问添加URI资源页', 92, 43, ' ', '2012-06-10 01:16:10', '2012-06-10 01:16:10');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (275, '删除某URI资源', 60, 43, ' ', '2012-06-10 01:16:26', '2012-06-10 01:16:26');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (276, '更新某URI资源', 60, 43, ' ', '2012-06-10 01:17:03', '2012-06-10 01:17:03');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (277, '编辑某URI资源', 93, 43, ' ', '2012-06-10 01:17:18', '2012-06-10 01:17:18');
commit;
prompt 100 records committed...
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (278, '分配菜单', 94, 40, ' ', '2012-06-10 01:20:11', '2012-06-10 01:20:11');
insert into T_TEST_PENGXF (id, name, resource_id, type, remark, add_time, modify_time)
values (279, '批量删除角色', 95, 42, ' ', '2012-06-10 01:20:24', '2012-06-10 01:20:24');
commit;
prompt 102 records loaded
prompt Enabling triggers for HRD_EMP...
alter table HRD_EMP enable all triggers;
prompt Enabling triggers for HRD_EMP_CONTRACT...
alter table HRD_EMP_CONTRACT enable all triggers;
prompt Enabling triggers for HRD_EMP_DOC...
alter table HRD_EMP_DOC enable all triggers;
prompt Enabling triggers for HRD_EMP_FAMILY...
alter table HRD_EMP_FAMILY enable all triggers;
prompt Enabling triggers for HRD_EMP_INSU...
alter table HRD_EMP_INSU enable all triggers;
prompt Enabling triggers for HRD_EMP_PROF...
alter table HRD_EMP_PROF enable all triggers;
prompt Enabling triggers for HRD_EMP_REG...
alter table HRD_EMP_REG enable all triggers;
prompt Enabling triggers for HRD_EMP_REWARD...
alter table HRD_EMP_REWARD enable all triggers;
prompt Enabling triggers for HRD_EMP_TRAIN...
alter table HRD_EMP_TRAIN enable all triggers;
prompt Enabling triggers for HRD_EMP_TRANSFER...
alter table HRD_EMP_TRANSFER enable all triggers;
prompt Enabling triggers for HRD_EMP_WORK...
alter table HRD_EMP_WORK enable all triggers;
prompt Enabling triggers for ORDERS...
alter table ORDERS enable all triggers;
prompt Enabling triggers for T_TEST_PENGXF...
alter table T_TEST_PENGXF enable all triggers;
set feedback on
set define on
prompt Done.
