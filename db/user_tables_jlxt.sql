prompt PL/SQL Developer import file
prompt Created on 2013年5月26日 by kuqi
set feedback off
set define off
prompt Creating HRD_EMP...
create table HRD_EMP
(
  id          NUMBER(20) not null,
  emp_id      VARCHAR2(20) not null,
  emp_name    VARCHAR2(20) not null,
  nation      VARCHAR2(3),
  birth       DATE not null,
  age         NUMBER(3),
  education   VARCHAR2(20),
  marriage    VARCHAR2(3),
  gender      VARCHAR2(3) not null,
  politic     VARCHAR2(3),
  idcard      VARCHAR2(18) not null,
  native      VARCHAR2(200),
  workdate    DATE,
  workage     NUMBER(3),
  emptype     VARCHAR2(3),
  joindate    DATE,
  joinage     NUMBER(3),
  dept_id     VARCHAR2(20) not null,
  rolename    VARCHAR2(3),
  title_id    VARCHAR2(3),
  titlename   VARCHAR2(200),
  titlework   VARCHAR2(200),
  insustatus  VARCHAR2(3),
  tel         VARCHAR2(20),
  telehome    VARCHAR2(20),
  emergency   VARCHAR2(100),
  graduate    VARCHAR2(100),
  master      VARCHAR2(100),
  graddate    DATE,
  location1   VARCHAR2(20),
  reglocation VARCHAR2(200),
  winterloc   VARCHAR2(200),
  picture     VARCHAR2(200),
  memo        VARCHAR2(500),
  valid       VARCHAR2(3) not null,
  location2   VARCHAR2(200),
  location3   VARCHAR2(200),
  location4   VARCHAR2(2000),
  archivekeep VARCHAR2(3),
  pension_no  VARCHAR2(20),
  medica_no   VARCHAR2(20)
)
;
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
comment on column HRD_EMP.insustatus
  is '保险状态';
comment on column HRD_EMP.tel
  is '联系电话';
comment on column HRD_EMP.telehome
  is '家庭电话';
comment on column HRD_EMP.emergency
  is '紧急/其他联系人电话';
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
comment on column HRD_EMP.archivekeep
  is '档案保管机构';
comment on column HRD_EMP.pension_no
  is '养老保险编号';
comment on column HRD_EMP.medica_no
  is '医疗保险编号';

prompt Creating HRD_EMP_CERT...
create table HRD_EMP_CERT
(
  id        NUMBER(20) not null,
  emp_id    VARCHAR2(20) not null,
  cert      VARCHAR2(500),
  certno    VARCHAR2(200),
  obtdate   DATE,
  closedate DATE,
  certdept  VARCHAR2(100),
  memo      VARCHAR2(500),
  valid     VARCHAR2(3) not null
)
;
comment on table HRD_EMP_CERT
  is '员工其他证书信息';
comment on column HRD_EMP_CERT.emp_id
  is '员工编号';
comment on column HRD_EMP_CERT.cert
  is '证书名称';
comment on column HRD_EMP_CERT.certno
  is '证书编号';
comment on column HRD_EMP_CERT.obtdate
  is '证书取得日期';
comment on column HRD_EMP_CERT.closedate
  is '证书截至日期';
comment on column HRD_EMP_CERT.certdept
  is '发证部门';
comment on column HRD_EMP_CERT.memo
  is '备注';
comment on column HRD_EMP_CERT.valid
  is '有效标记1有效，0无效';

prompt Creating HRD_EMP_CONTRACT...
create table HRD_EMP_CONTRACT
(
  id             NUMBER(20) not null,
  emp_id         VARCHAR2(20) not null,
  contract_id    VARCHAR2(20) not null,
  contract_name  VARCHAR2(200),
  contracttype   VARCHAR2(3),
  contractprop   VARCHAR2(3),
  begindate      DATE,
  enddate        DATE,
  addition       VARCHAR2(500),
  memo           VARCHAR2(500),
  valid          VARCHAR2(3) not null,
  accident_start DATE,
  accident_end   DATE,
  insu           VARCHAR2(3)
)
;
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
comment on column HRD_EMP_CONTRACT.accident_start
  is '意外险开始日期';
comment on column HRD_EMP_CONTRACT.accident_end
  is '意外险终止日期';
comment on column HRD_EMP_CONTRACT.insu
  is '意外险参加标志';

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
;
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

prompt Creating HRD_EMP_EDU...
create table HRD_EMP_EDU
(
  id           NUMBER(20) not null,
  emp_id       VARCHAR2(20) not null,
  graduation   VARCHAR2(200),
  graduatedate DATE,
  major        VARCHAR2(200),
  graduateno   VARCHAR2(200),
  memo         VARCHAR2(500),
  valid        VARCHAR2(3)
)
;
comment on table HRD_EMP_EDU
  is '员工毕业证信息';
comment on column HRD_EMP_EDU.emp_id
  is '员工编号';
comment on column HRD_EMP_EDU.graduation
  is '毕业院校';
comment on column HRD_EMP_EDU.graduatedate
  is '毕业时间';
comment on column HRD_EMP_EDU.major
  is '所学专业';
comment on column HRD_EMP_EDU.graduateno
  is '毕业证号';
comment on column HRD_EMP_EDU.memo
  is '备注';

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
;
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
;
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

prompt Creating HRD_EMP_JOB...
create table HRD_EMP_JOB
(
  id             NUMBER(20),
  emp_id         VARCHAR2(20),
  job_start      DATE,
  job_end        DATE,
  accident_start DATE,
  accident_end   DATE,
  memo           VARCHAR2(500),
  valid          VARCHAR2(3),
  pension        VARCHAR2(3),
  medica         VARCHAR2(3),
  bear           VARCHAR2(3),
  unemp          VARCHAR2(3),
  insu           VARCHAR2(3)
)
;
comment on table HRD_EMP_JOB
  is '员工工作记录';
comment on column HRD_EMP_JOB.emp_id
  is '员工编号';
comment on column HRD_EMP_JOB.job_start
  is '劳动合同起始日期';
comment on column HRD_EMP_JOB.job_end
  is '劳动合同终止日期';
comment on column HRD_EMP_JOB.accident_start
  is '意外险开始日期';
comment on column HRD_EMP_JOB.accident_end
  is '意外险终止日期';
comment on column HRD_EMP_JOB.memo
  is '备注';
comment on column HRD_EMP_JOB.valid
  is '有效标记';
comment on column HRD_EMP_JOB.pension
  is '养老参加标志';
comment on column HRD_EMP_JOB.medica
  is '医疗参加标志';
comment on column HRD_EMP_JOB.bear
  is '生育参加标志';
comment on column HRD_EMP_JOB.unemp
  is '失业参加标志';
comment on column HRD_EMP_JOB.insu
  is '意外险参加标志';

prompt Creating HRD_EMP_PERF...
create table HRD_EMP_PERF
(
  id          NUMBER(20) not null,
  period      VARCHAR2(10) not null,
  performance VARCHAR2(3) not null,
  prof_perf   VARCHAR2(3),
  work_perf   VARCHAR2(3),
  manage_perf VARCHAR2(3),
  memo        VARCHAR2(500),
  emp_id      VARCHAR2(20),
  valid       VARCHAR2(3) default 1 not null
)
;
comment on table HRD_EMP_PERF
  is '员工绩效管理';
comment on column HRD_EMP_PERF.period
  is '考评周期，如果是年填写2012';
comment on column HRD_EMP_PERF.performance
  is '综合评价';
comment on column HRD_EMP_PERF.prof_perf
  is '专业水平评价';
comment on column HRD_EMP_PERF.work_perf
  is '工作态度评价';
comment on column HRD_EMP_PERF.manage_perf
  is '管理能力评价';
comment on column HRD_EMP_PERF.memo
  is '备注';
comment on column HRD_EMP_PERF.emp_id
  is '员工编号';
comment on column HRD_EMP_PERF.valid
  is '有效标志,1有效0无效';

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
;
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
  regno         VARCHAR2(50),
  certificate   VARCHAR2(50),
  validdate     DATE,
  issuedate     DATE,
  certnumber    VARCHAR2(50),
  certdate      DATE,
  certvaliddate DATE,
  memo          VARCHAR2(500),
  valid         VARCHAR2(3) not null,
  perf_study    VARCHAR2(500),
  continue_edu  VARCHAR2(200),
  continue_no   VARCHAR2(200),
  continue_date DATE
)
;
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
comment on column HRD_EMP_REG.perf_study
  is '所学专业(注册)';
comment on column HRD_EMP_REG.continue_edu
  is '继续教育专业';
comment on column HRD_EMP_REG.continue_no
  is '继续培训证编号';
comment on column HRD_EMP_REG.continue_date
  is '继续教育时间';

prompt Creating HRD_EMP_REWARD...
create table HRD_EMP_REWARD
(
  id            NUMBER(20) not null,
  emp_id        VARCHAR2(20) not null,
  rewardtype    VARCHAR2(3) not null,
  rewarddate    DATE,
  rewarddept    VARCHAR2(200),
  reward        VARCHAR2(500),
  memo          VARCHAR2(500),
  valid         VARCHAR2(3) not null,
  reward_person VARCHAR2(3)
)
;
comment on table HRD_EMP_REWARD
  is '员工奖惩信息';
comment on column HRD_EMP_REWARD.emp_id
  is '员工编号';
comment on column HRD_EMP_REWARD.rewardtype
  is '奖项';
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
comment on column HRD_EMP_REWARD.reward_person
  is '个人获奖证书';

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
;
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
  newdept_id     VARCHAR2(3),
  memo           VARCHAR2(500),
  valid          VARCHAR2(3) not null
)
;
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
comment on column HRD_EMP_TRANSFER.newdept_id
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
;
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
;

prompt Creating PRJ_BUILDING...
create table PRJ_BUILDING
(
  id              NUMBER(20) not null,
  prj_id          NUMBER(20) not null,
  building_id     VARCHAR2(20),
  underfloor      VARCHAR2(10),
  abovefloor      VARCHAR2(10),
  height          VARCHAR2(10),
  building_area   VARCHAR2(20),
  act_begin       DATE,
  act_end         DATE,
  act_time        VARCHAR2(10),
  progress        VARCHAR2(200),
  image_progress  VARCHAR2(3),
  memo            VARCHAR2(500),
  valid           VARCHAR2(3) not null,
  building_type   VARCHAR2(3),
  builder_license VARCHAR2(200),
  license_date    DATE,
  security_level  VARCHAR2(3),
  construct_type  VARCHAR2(3)
)
;
comment on table PRJ_BUILDING
  is '项目工程信息';
comment on column PRJ_BUILDING.prj_id
  is '项目ID';
comment on column PRJ_BUILDING.building_id
  is '单体编号/楼号';
comment on column PRJ_BUILDING.underfloor
  is '地下层数';
comment on column PRJ_BUILDING.abovefloor
  is '地上层数';
comment on column PRJ_BUILDING.height
  is '建筑高度';
comment on column PRJ_BUILDING.building_area
  is '建筑面积';
comment on column PRJ_BUILDING.act_begin
  is '实际开工日期';
comment on column PRJ_BUILDING.act_end
  is '实际竣工日期';
comment on column PRJ_BUILDING.act_time
  is '实际工期';
comment on column PRJ_BUILDING.progress
  is '进度情况';
comment on column PRJ_BUILDING.image_progress
  is '形象进度';
comment on column PRJ_BUILDING.memo
  is '备注';
comment on column PRJ_BUILDING.building_type
  is '工程分类';
comment on column PRJ_BUILDING.builder_license
  is '施工许可证';
comment on column PRJ_BUILDING.license_date
  is '施工许可证日期';
comment on column PRJ_BUILDING.security_level
  is '安全等级';
comment on column PRJ_BUILDING.construct_type
  is '结构类型';
create index IDX_PRJ_BUILDING on PRJ_BUILDING (PRJ_ID, BUILDING_ID);
alter table PRJ_BUILDING
  add constraint PK_PRJ_BUILDING primary key (ID);

prompt Creating PRJ_CHECK...
create table PRJ_CHECK
(
  id             NUMBER(20) not null,
  prj_id         NUMBER(20) not null,
  checkitem      VARCHAR2(20),
  checkdate      DATE,
  act_score      NUMBER(10,2),
  dept_id        VARCHAR2(20) not null,
  jsdw_id        NUMBER(20),
  sgdw_id        NUMBER(20),
  prj_progress   VARCHAR2(1000),
  construct_type VARCHAR2(3),
  emp_id         VARCHAR2(20),
  begindate      DATE,
  enddate        DATE,
  memo           VARCHAR2(500),
  valid          VARCHAR2(3) not null,
  checkgroup_no  VARCHAR2(20)
)
;
comment on table PRJ_CHECK
  is '项目安全监理检查评分';
comment on column PRJ_CHECK.prj_id
  is '项目ID';
comment on column PRJ_CHECK.checkitem
  is '检查项目';
comment on column PRJ_CHECK.checkdate
  is '检查时间';
comment on column PRJ_CHECK.act_score
  is '扣分';
comment on column PRJ_CHECK.dept_id
  is '分公司';
comment on column PRJ_CHECK.jsdw_id
  is '建设单位ID';
comment on column PRJ_CHECK.sgdw_id
  is '施工单位ID';
comment on column PRJ_CHECK.prj_progress
  is '项目进展情况';
comment on column PRJ_CHECK.construct_type
  is '结构类型';
comment on column PRJ_CHECK.emp_id
  is '项目总监员工编号';
comment on column PRJ_CHECK.begindate
  is '开工时间';
comment on column PRJ_CHECK.enddate
  is '竣工日期';
comment on column PRJ_CHECK.memo
  is '备注';
comment on column PRJ_CHECK.checkgroup_no
  is '评分单编号';
create index IDX_PRJ_CHECK_1 on PRJ_CHECK (PRJ_ID);
create index IDX_PRJ_CHECK_2 on PRJ_CHECK (CHECKGROUP_NO, CHECKITEM);
alter table PRJ_CHECK
  add constraint PK_PRJ_CHECK primary key (ID);

prompt Creating PRJ_INFO...
create table PRJ_INFO
(
  id              NUMBER(20) not null,
  prjno           VARCHAR2(20),
  contractno      VARCHAR2(20),
  prj_name        VARCHAR2(200),
  prj_area        VARCHAR2(20),
  quality_target  VARCHAR2(3),
  prj_starttime   DATE not null,
  prj_endtime     DATE,
  prj_time        VARCHAR2(20),
  prj_pic         VARCHAR2(200),
  prj_progress    VARCHAR2(1000),
  memo            VARCHAR2(500),
  valid           VARCHAR2(3) not null,
  location1       VARCHAR2(20),
  location2       VARCHAR2(200),
  location3       VARCHAR2(200),
  location4       VARCHAR2(2000),
  buildingcount   NUMBER(5),
  contractarea    VARCHAR2(20),
  prj_level       VARCHAR2(3),
  prj_type        VARCHAR2(3),
  prj_invest      VARCHAR2(20),
  weekmeeting     VARCHAR2(3),
  prj_map         VARCHAR2(200),
  prj_region      VARCHAR2(20),
  prj_archive     VARCHAR2(3),
  weekmeetingtime VARCHAR2(3),
  prj_archivetime DATE
)
;
comment on table PRJ_INFO
  is '项目基本信息';
comment on column PRJ_INFO.prjno
  is '项目编号';
comment on column PRJ_INFO.contractno
  is '合同编号';
comment on column PRJ_INFO.prj_name
  is '项目名称';
comment on column PRJ_INFO.prj_area
  is '项目面积(平方米)';
comment on column PRJ_INFO.quality_target
  is '质量目标';
comment on column PRJ_INFO.prj_starttime
  is '项目开工时间';
comment on column PRJ_INFO.prj_endtime
  is '项目结束时间';
comment on column PRJ_INFO.prj_time
  is '项目工期';
comment on column PRJ_INFO.prj_pic
  is '项目图片';
comment on column PRJ_INFO.prj_progress
  is '项目进展情况';
comment on column PRJ_INFO.memo
  is '备注';
comment on column PRJ_INFO.location1
  is '项目地址(省)';
comment on column PRJ_INFO.location2
  is '项目地址(市)';
comment on column PRJ_INFO.location3
  is '项目地址(县/区)';
comment on column PRJ_INFO.location4
  is '项目地址(街道)';
comment on column PRJ_INFO.buildingcount
  is '单体数量';
comment on column PRJ_INFO.contractarea
  is '合同面积';
comment on column PRJ_INFO.prj_level
  is '项目等级';
comment on column PRJ_INFO.prj_type
  is '项目类别';
comment on column PRJ_INFO.prj_invest
  is '项目总投资';
comment on column PRJ_INFO.weekmeeting
  is '周例会星期';
comment on column PRJ_INFO.prj_map
  is '项目地图';
comment on column PRJ_INFO.prj_region
  is '施工区域';
comment on column PRJ_INFO.prj_archive
  is '档案归档标志';
comment on column PRJ_INFO.weekmeetingtime
  is '周例会时间';
comment on column PRJ_INFO.prj_archivetime
  is '档案归档时间';
create unique index IDX_PRJ_INFO on PRJ_INFO (PRJNO);
alter table PRJ_INFO
  add constraint PK_PRJ_INFO primary key (ID);

prompt Creating PRJ_MAJORCHECK...
create table PRJ_MAJORCHECK
(
  id              NUMBER(20) not null,
  prj_id          NUMBER(20),
  building_id     VARCHAR2(20),
  build_part      VARCHAR2(500),
  checkdate       DATE,
  begindate       DATE,
  enddate         DATE,
  discussion      VARCHAR2(1000),
  problem         VARCHAR2(500),
  resolved        VARCHAR2(100),
  resolved_result VARCHAR2(500),
  supervision     VARCHAR2(500),
  memo            VARCHAR2(500),
  valid           VARCHAR2(3) not null
)
;
comment on table PRJ_MAJORCHECK
  is '重点危险性较大工程检查';
comment on column PRJ_MAJORCHECK.prj_id
  is '项目ID';
comment on column PRJ_MAJORCHECK.building_id
  is '建筑编号';
comment on column PRJ_MAJORCHECK.build_part
  is '施工部位';
comment on column PRJ_MAJORCHECK.checkdate
  is '检查时间';
comment on column PRJ_MAJORCHECK.begindate
  is '开始时间';
comment on column PRJ_MAJORCHECK.enddate
  is '结束时间';
comment on column PRJ_MAJORCHECK.discussion
  is '专家论证';
comment on column PRJ_MAJORCHECK.problem
  is '存在问题';
comment on column PRJ_MAJORCHECK.resolved
  is '整改时间';
comment on column PRJ_MAJORCHECK.resolved_result
  is '整改结果';
comment on column PRJ_MAJORCHECK.supervision
  is '督办';
comment on column PRJ_MAJORCHECK.memo
  is '备注';
alter table PRJ_MAJORCHECK
  add constraint PK_PRJ_MAJORCHECK primary key (ID);

prompt Creating PRJ_ORG...
create table PRJ_ORG
(
  id            NUMBER(20) not null,
  emp_id        VARCHAR2(20),
  prj_role      VARCHAR2(3),
  prj_id        NUMBER(20),
  entertime     DATE,
  leavetime     DATE,
  responsbility VARCHAR2(200),
  memo          VARCHAR2(500),
  valid         VARCHAR2(3)
)
;
comment on table PRJ_ORG
  is '项目组织信息';
comment on column PRJ_ORG.emp_id
  is '员工编号';
comment on column PRJ_ORG.prj_role
  is '项目中角色';
comment on column PRJ_ORG.prj_id
  is '项目ID';
comment on column PRJ_ORG.entertime
  is '进场时间';
comment on column PRJ_ORG.leavetime
  is '离场时间';
comment on column PRJ_ORG.responsbility
  is '项目责任';
comment on column PRJ_ORG.memo
  is '备注';
create unique index IDX_PRJ_ORG on PRJ_ORG (EMP_ID, PRJ_ROLE, PRJ_ID, ENTERTIME);
create index IDX_PRJ_ORG_PRJID on PRJ_ORG (PRJ_ID);
alter table PRJ_ORG
  add constraint PK_PRJ_ORG primary key (ID);

prompt Creating PRJ_UNIT...
create table PRJ_UNIT
(
  id           NUMBER(20) not null,
  prj_id       NUMBER(20),
  unit_name    VARCHAR2(200),
  group_name   VARCHAR2(200),
  unit_type    VARCHAR2(3),
  quali_level  VARCHAR2(3),
  unit_address VARCHAR2(200),
  contractor   VARCHAR2(20),
  title        VARCHAR2(50),
  contract_tel VARCHAR2(20),
  memo         VARCHAR2(500),
  valid        VARCHAR2(3) not null
)
;
comment on table PRJ_UNIT
  is '项目参建单位';
comment on column PRJ_UNIT.prj_id
  is '项目ID';
comment on column PRJ_UNIT.unit_name
  is '参建单位名称';
comment on column PRJ_UNIT.group_name
  is '参建集团名称';
comment on column PRJ_UNIT.unit_type
  is '项目角色';
comment on column PRJ_UNIT.quali_level
  is '资质等级';
comment on column PRJ_UNIT.unit_address
  is '单位地址';
comment on column PRJ_UNIT.contractor
  is '联系人';
comment on column PRJ_UNIT.title
  is '职务';
comment on column PRJ_UNIT.contract_tel
  is '电话';
comment on column PRJ_UNIT.memo
  is '备注';
create index IDX_PRJ_UNIT on PRJ_UNIT (PRJ_ID);
alter table PRJ_UNIT
  add constraint PK_PRJ_UNIT primary key (ID);

prompt Creating PRJ_UNIT_RELATE...
create table PRJ_UNIT_RELATE
(
  id      NUMBER(20),
  prj_id  NUMBER(20),
  dept_id VARCHAR2(20),
  memo    VARCHAR2(2000),
  valid   VARCHAR2(3)
)
;
comment on table PRJ_UNIT_RELATE
  is '项目和监理单位关系';
comment on column PRJ_UNIT_RELATE.prj_id
  is '项目ID';
comment on column PRJ_UNIT_RELATE.dept_id
  is '部门/分公司';
comment on column PRJ_UNIT_RELATE.memo
  is '备注';
create unique index IDX_PRJ_UNIT_RELATE on PRJ_UNIT_RELATE (PRJ_ID, DEPT_ID, VALID);
create unique index PK_PRJ_UNIT_RELATE on PRJ_UNIT_RELATE (ID);

prompt Creating TMP_EMP_IMP...
create table TMP_EMP_IMP
(
  col1  VARCHAR2(100),
  col2  VARCHAR2(100),
  col3  VARCHAR2(100),
  col4  VARCHAR2(100),
  col5  VARCHAR2(100),
  col6  VARCHAR2(100),
  col7  VARCHAR2(100),
  col8  VARCHAR2(100),
  col9  VARCHAR2(100),
  col10 VARCHAR2(100),
  col11 VARCHAR2(100),
  col12 VARCHAR2(100),
  col13 VARCHAR2(100),
  col14 VARCHAR2(100),
  col15 VARCHAR2(100),
  col16 VARCHAR2(100),
  col17 VARCHAR2(100),
  col18 VARCHAR2(100),
  col19 VARCHAR2(100),
  col20 VARCHAR2(100),
  col21 VARCHAR2(100),
  col22 VARCHAR2(100),
  col23 VARCHAR2(100),
  col24 VARCHAR2(100),
  col25 VARCHAR2(100),
  col26 VARCHAR2(100),
  col27 VARCHAR2(100),
  col28 VARCHAR2(100),
  col29 VARCHAR2(100),
  col30 VARCHAR2(100),
  col31 VARCHAR2(100),
  col32 VARCHAR2(100),
  col33 VARCHAR2(100),
  col34 VARCHAR2(100),
  col35 VARCHAR2(100),
  col36 VARCHAR2(100),
  col37 VARCHAR2(100),
  col38 VARCHAR2(100),
  col39 VARCHAR2(100),
  col40 VARCHAR2(100),
  col41 VARCHAR2(100),
  col42 VARCHAR2(100),
  col43 VARCHAR2(100),
  col44 VARCHAR2(100),
  col45 VARCHAR2(100)
)
;
comment on table TMP_EMP_IMP
  is '用于导入数据的临时员工表';

prompt Creating T_CHECKLIST_PRJ...
create table T_CHECKLIST_PRJ
(
  id           NUMBER(16),
  check_code   VARCHAR2(20) not null,
  upper_code   VARCHAR2(20),
  member       VARCHAR2(3) not null,
  memo         VARCHAR2(500),
  checkcontent VARCHAR2(500)
)
;

prompt Creating T_CODELIST...
create table T_CODELIST
(
  id             NUMBER not null,
  code_type      VARCHAR2(20),
  code_value     VARCHAR2(30),
  code_type_desc VARCHAR2(50),
  code_desc      VARCHAR2(100),
  valid          VARCHAR2(3),
  memo           VARCHAR2(500)
)
;
comment on table T_CODELIST
  is '下拉列表';
comment on column T_CODELIST.id
  is 'ID';
comment on column T_CODELIST.code_type
  is '代码大类';
comment on column T_CODELIST.code_value
  is '代码值';
comment on column T_CODELIST.code_type_desc
  is '代码大类中文';
comment on column T_CODELIST.code_desc
  is '代码中文';
comment on column T_CODELIST.valid
  is '有效标志';
comment on column T_CODELIST.memo
  is '备注';
alter table T_CODELIST
  add constraint PK_CODELIST primary key (ID);
alter table T_CODELIST
  add constraint IDX_CODELIST unique (CODE_TYPE, CODE_VALUE);

prompt Creating T_LOC...
create table T_LOC
(
  id          NUMBER(16),
  region_code VARCHAR2(20) not null,
  upper_code  VARCHAR2(20),
  location    VARCHAR2(100),
  member      VARCHAR2(3) not null,
  memo        VARCHAR2(500)
)
;
comment on table T_LOC
  is '全国地理行政区划代码';
comment on column T_LOC.id
  is '记录编号';
comment on column T_LOC.region_code
  is '所属行政区代码';
comment on column T_LOC.upper_code
  is '上级编号';
comment on column T_LOC.location
  is '名称';
comment on column T_LOC.member
  is '隶属关系';
comment on column T_LOC.memo
  is '备注';
alter table T_LOC
  add constraint PK_AB51 primary key (REGION_CODE);

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
;

prompt Loading HRD_EMP...
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1021, 'A10011', 'yyyy1', '01', to_date('09-09-1976', 'dd-mm-yyyy'), 37, '小学', '02', '1', null, '110111760909931', null, null, null, '11', to_date('01-01-2004', 'dd-mm-yyyy'), null, 'B01', '104', '12', '101', '101', '1', '227411', null, null, null, null, null, '130000000000', null, null, null, '去了甲方', '1', '130100000000', '130124000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1006, 'A10008', '测试人员1', '01', to_date('12-01-1977', 'dd-mm-yyyy'), 36, null, '01', '2', '1', '110831770112002', null, to_date('06-12-2001', 'dd-mm-yyyy'), null, '11', to_date('15-12-2009', 'dd-mm-yyyy'), 3, 'A00', '111', '12', '106', '106', '5', '123551231', null, null, null, null, null, '120000000000', null, null, null, null, '1', '120100000000', '120112000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1053, 'B10018', '某人4', '01', to_date('01-09-1999', 'dd-mm-yyyy'), 14, null, '02', '1', null, '878900990999111', null, null, null, '11', to_date('01-01-2010', 'dd-mm-yyyy'), 3, 'B02', '107', '12', '103', '102', '4', '52134', null, null, null, null, null, '150000000000', null, null, null, null, '1', '150100000000', '150101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1054, 'B10019', '某人6', '02', to_date('09-09-1929', 'dd-mm-yyyy'), 84, null, '02', '2', null, '029101290909998', null, null, null, '99', to_date('01-01-1982', 'dd-mm-yyyy'), 31, 'B10', '101', '11', '102', '102', '3', '123123', null, null, null, null, null, '230000000000', null, null, null, null, '0', '230100000000', '230101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1056, 'B10021', '买卖买卖', '01', to_date('09-09-1976', 'dd-mm-yyyy'), 37, null, '02', '2', null, '123123760909996', null, null, null, '11', to_date('28-12-1981', 'dd-mm-yyyy'), 32, 'B05', '103', '11', '103', '107', '1', '884222', null, null, null, null, null, '220000000000', null, null, null, null, '1', '220100000000', '220101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1057, 'B10022', 'who', '01', to_date('05-05-1966', 'dd-mm-yyyy'), 47, null, '02', '1', '2', '900878660505555', null, null, null, '11', to_date('01-01-2004', 'dd-mm-yyyy'), 9, 'B08', '104', '12', '102', '101', '6', '5234234', null, null, null, null, null, '330000000000', null, null, null, null, '1', '330100000000', '330101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1, 'A10001', '张三', '11', to_date('01-12-1981', 'dd-mm-yyyy'), 31, '11', '01', '1', '1', '211201198101011118', '辽宁省沈阳市浑南', to_date('01-07-2001', 'dd-mm-yyyy'), 11, '11', to_date('01-01-2010', 'dd-mm-yyyy'), 2, 'A00', '105', '11', '100', '100', '2', '13000010001', '23730000', '13101010101', '沈阳建筑大学', null, to_date('01-07-2001', 'dd-mm-yyyy'), '210000000000', '辽宁省沈阳市沈河区', '辽宁省沈阳市浑南', '/pic/A10001.jpg', '备注', '1', '210100000000', '210104000000', '集贤街道', '1', '123', '123455123');
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1003, 'A10005', '李四', '01', to_date('09-09-1977', 'dd-mm-yyyy'), 35, null, '01', '1', null, '111111770909999', null, null, null, '11', to_date('14-12-1998', 'dd-mm-yyyy'), 14, 'A00', '104', '13', '102', '102', '2', '234234234324', null, null, null, null, null, '210000000000', null, null, null, '该员工很好', '1', '210100000000', '210101000000', null, null, '123123123', '12312313');
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1004, 'B10006', '王五', '02', to_date('09-09-1978', 'dd-mm-yyyy'), 34, null, '01', '1', null, '111111197809099918', null, null, null, '11', to_date('05-12-2006', 'dd-mm-yyyy'), 6, 'B01', '108', '12', '102', '102', '3', '44121123', null, null, null, null, null, '130000000000', null, null, null, null, '1', '130100000000', '130101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1005, 'A10007', '赵四', '01', to_date('09-09-1989', 'dd-mm-yyyy'), 23, null, '01', '1', null, '110920890909991', null, null, null, '99', to_date('01-12-2011', 'dd-mm-yyyy'), 1, 'A00', '108', '12', '102', '102', '1', '62324', null, null, null, null, null, '120000000000', null, null, null, null, '0', '120100000000', '120101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1055, 'B10020', '某某', '02', to_date('09-09-1945', 'dd-mm-yyyy'), 68, null, '02', '2', null, '209811450909998', null, null, null, '11', to_date('01-01-1969', 'dd-mm-yyyy'), 44, 'B06', '106', '12', '105', '101', '3', '123123123', null, null, null, null, null, '310000000000', null, null, null, null, '1', '310100000000', '310101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1065, 'A10030', '21号', '01', to_date('08-08-1978', 'dd-mm-yyyy'), 35, null, '02', '1', null, '110098780808899', null, null, null, '11', to_date('13-01-2000', 'dd-mm-yyyy'), 13, 'A00', '100', '10', '100', '100', '1', '01002029031', null, null, null, null, null, '110000000000', null, null, null, null, '1', '110100000000', '110101000000', null, null, '221', null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10052, '1', '李学志', '99', to_date('05-07-1963', 'dd-mm-yyyy'), 50, '硕士', '02', '1', '1', '210104196307055258', null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, '11', to_date('01-07-1993', 'dd-mm-yyyy'), 20, 'A00', '100', '11', '999', '100', null, '13904041007', null, null, '沈阳建筑工程学院', null, to_date('15-01-1997', 'dd-mm-yyyy'), '210000000000', '沈阳市皇姑区宁山中路66-1号532', '沈阳', null, null, '1', '210100000000', '210105000000', '宁山中路66-1号532', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10053, '2', '刘德良', '99', to_date('22-02-1957', 'dd-mm-yyyy'), 55, '本科', '02', '1', '3', '210105195702224316', null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, 'A00', '102', '11', '999', '100', null, '13700053017', null, null, '沈阳建筑工程学院', '工业与民用建筑', to_date('09-01-1982', 'dd-mm-yyyy'), null, '沈阳市东陵区文萃路54-1号231', '沈阳', null, null, '1', null, null, null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10054, '3', '张驰', '99', to_date('31-03-1972', 'dd-mm-yyyy'), 40, '硕士', '02', '1', '1', '210102197203312514', null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, 'A00', null, '11', '999', '100', null, '13840099555', null, null, '沈阳建筑大学', '工程管理', to_date('13-03-2008', 'dd-mm-yyyy'), null, '沈阳市铁西区沈辽东路75-6号182', '沈阳', null, null, '1', null, null, null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10055, '4', '李晓林', '99', to_date('19-11-1972', 'dd-mm-yyyy'), 40, '硕士', '02', '1', '1', '222302197211191315', null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, 'A00', null, '11', '999', '100', null, '13898831765', '024-81892388', null, '沈阳建筑大学', '工程管理', to_date('13-03-2008', 'dd-mm-yyyy'), null, '沈阳市大东区北海街20-1号431', '沈阳', null, null, '1', null, null, null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10056, '5', '殷鸿彬', '99', to_date('15-07-1974', 'dd-mm-yyyy'), 36, '本科', '02', '1', '1', '230103197407150617', null, to_date('12-05-1994', 'dd-mm-yyyy'), 19, null, to_date('12-05-1994', 'dd-mm-yyyy'), 19, 'A00', null, '11', '999', '100', null, '13332408448', '024-88135778', null, '哈建工学院', '建筑工程', to_date('30-07-1996', 'dd-mm-yyyy'), null, '沈阳市大东区辽沈二街6号151', '沈阳', null, null, '1', null, null, null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10057, '6', '邱曜辉', '99', to_date('04-05-1968', 'dd-mm-yyyy'), 44, '本科', '02', '1', '1', '210112196805040614', null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, null, to_date('01-07-1993', 'dd-mm-yyyy'), 20, 'A00', null, '99', '999', '999', null, '13940000487', '024-24222992', '13998290446（爱人）', '吉林大学(成人)', '会计学', to_date('01-06-2004', 'dd-mm-yyyy'), null, '沈河区丰乐二街5-4号162', '沈阳', null, null, '1', null, null, '沈河区丰乐二街5-4号162', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10058, '7', '王志荣', '99', to_date('10-12-1963', 'dd-mm-yyyy'), 50, '本科', '02', '1', '3', '210104196312101458', null, to_date('11-03-2012', 'dd-mm-yyyy'), 0, null, to_date('11-03-2012', 'dd-mm-yyyy'), 0, 'A00', '103', '11', '999', '100', null, '13940310351', null, '15640576289（爱人）', '青岛建筑工程学院', '工民建', to_date('06-07-1987', 'dd-mm-yyyy'), null, '沈阳市沈河区翰林路13-2号243', '沈阳', null, null, '1', null, null, '万柳塘路18-8号243', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10059, '8', '武雪丽', '99', to_date('09-10-1978', 'dd-mm-yyyy'), 34, '本科', '02', '0', '1', '210121197810096146', null, to_date('23-03-2002', 'dd-mm-yyyy'), 11, null, to_date('23-03-2002', 'dd-mm-yyyy'), 11, 'A00', null, '11', '999', '100', null, '13840000843', '024-24826162', '81990333（爱人）', '沈阳建筑大学（成人）', '工程管理', to_date('15-03-2010', 'dd-mm-yyyy'), null, '东陵区泉源三路77号241', '沈阳', null, null, '1', null, null, '东陵区泉源三路', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10060, '9', '佟立夫', '99', to_date('17-09-1948', 'dd-mm-yyyy'), 64, '大专', '02', '1', '1', '210106480917151', null, to_date('10-04-2005', 'dd-mm-yyyy'), 8, null, to_date('10-04-2005', 'dd-mm-yyyy'), 8, 'A00', '110', '12', '999', '107', null, '13322432609', '024-25896142', '81986142（儿子）', '辽宁广播电视大学', '机械', to_date('15-07-1983', 'dd-mm-yyyy'), null, '滑翔五小区5号楼2-2-3', '沈阳', null, null, '1', null, null, '滑翔五小区5号楼2-2-3', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10061, '10', '董骄', '99', to_date('09-09-1954', 'dd-mm-yyyy'), 56, '大专', '02', '1', '1', '210104195409095213', null, to_date('20-05-1994', 'dd-mm-yyyy'), 19, null, to_date('20-05-1994', 'dd-mm-yyyy'), 19, 'A00', '110', '11', '999', '101', null, '13998205673', '024-88137804', '18940141565（爱人）', '东机工大', '机械', to_date('30-07-1983', 'dd-mm-yyyy'), null, '大东区劳动路4-2栋151', '沈阳', null, null, '1', null, null, '大东区北海街4-2号6栋2-14-2', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10062, '11', '闫维新', '99', to_date('29-09-1960', 'dd-mm-yyyy'), 52, '本科', '02', '1', '1', '210105600929433', null, to_date('20-03-2002', 'dd-mm-yyyy'), 11, null, to_date('20-03-2002', 'dd-mm-yyyy'), 11, 'A00', '110', '11', '999', '102', null, '13940064298', '024-88268459', '13998324517（闫帅均）', '辽宁省委党校', '电气', to_date('15-07-1981', 'dd-mm-yyyy'), null, '大东区劳动路2栋3—2—3', '沈阳', null, null, '1', null, null, '大东区劳动路2栋3—2—3', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10063, '12', '刘克明', '99', to_date('02-05-1955', 'dd-mm-yyyy'), 57, '大专', '02', '1', '1', '210103195505020311', null, to_date('11-04-2008', 'dd-mm-yyyy'), 5, null, to_date('11-04-2008', 'dd-mm-yyyy'), 5, 'A00', '110', '12', '999', '107', null, '13998299637', null, '13840534139（爱人）', '沈阳广播电视大学', '机械', to_date('10-07-1982', 'dd-mm-yyyy'), null, '沈河区文萃路', '沈阳', null, null, '1', null, null, '沈河区文萃路', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10064, '13', '李海涛', '99', to_date('17-05-1978', 'dd-mm-yyyy'), 34, '本科', '02', '0', '1', '210724197805170024', null, to_date('01-07-2003', 'dd-mm-yyyy'), 10, null, to_date('01-07-2003', 'dd-mm-yyyy'), 10, 'A00', null, '12', '999', '100', null, '13514286846', '024-28635149', '13889340130（爱人）', '东北大学', '土木工程', to_date('15-07-2003', 'dd-mm-yyyy'), null, '皇姑区昆山西路152-8-351', '沈阳', null, null, '1', null, null, '皇姑区昆山西路152-8-351', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10065, '14', '孟艳', '99', to_date('31-01-1979', 'dd-mm-yyyy'), 33, '本科', '02', '0', '1', '210106197901310327', null, to_date('01-04-2000', 'dd-mm-yyyy'), 13, null, to_date('01-04-2000', 'dd-mm-yyyy'), 13, 'A00', '115', '99', '999', '999', null, '13840152195', '024-22920229', '13840445695（爱人）', '中央广播电视大学（开放教育）', '会计学', to_date('01-07-2005', 'dd-mm-yyyy'), null, '沈河区热闹路23-1号352', '沈阳', null, null, '1', null, null, '沈河区热闹路23-1号352', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10066, '16', '孙静', '99', to_date('29-01-1984', 'dd-mm-yyyy'), 28, '本科', '01', '0', '3', '210106198401291865', null, to_date('23-03-2006', 'dd-mm-yyyy'), 7, null, to_date('23-03-2006', 'dd-mm-yyyy'), 7, 'A00', '116', '13', '999', '999', null, '13591677509', '024-25825689', '13840136545（爱人）', '沈阳广播电视大学（开放教育）', '工程管理', to_date('12-05-2009', 'dd-mm-yyyy'), null, '铁西区重工街北四路12号122', '沈阳', null, null, '1', null, null, '铁西区重工街北四路12号122', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10067, '17', '宋扬', '99', to_date('06-05-1979', 'dd-mm-yyyy'), 33, '本科', '01', '0', '3', '210102197905066928', null, to_date('08-07-2006', 'dd-mm-yyyy'), 7, null, to_date('08-07-2006', 'dd-mm-yyyy'), 7, 'A00', null, '99', '999', '999', null, '13604010165', '024-24563265', '13840147206（母亲）', '沈阳建筑大学（成人）', '助理工程师', to_date('30-12-2003', 'dd-mm-yyyy'), null, '东陵区文萃路171-461', '沈阳', null, null, '1', null, null, '东陵区文萃路171-461', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10068, '18', '罗佳', '99', to_date('14-04-1980', 'dd-mm-yyyy'), 32, '本科', '02', '0', '3', '210423198004142228', null, to_date('05-04-2007', 'dd-mm-yyyy'), 6, null, to_date('05-04-2007', 'dd-mm-yyyy'), 6, 'A00', null, '99', '999', '999', null, '15998237922', null, '13314008887（爱人）', '辽宁大学', '汉语言文学', to_date('10-07-2002', 'dd-mm-yyyy'), null, '皇姑区昆山中路189号', '沈阳', null, null, '1', null, null, '皇姑区昆山中路189号', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10069, '19', '刘杨', '99', to_date('08-06-1985', 'dd-mm-yyyy'), 27, '本科', '01', '0', '3', '210105198506084364', null, to_date('01-06-2011', 'dd-mm-yyyy'), 2, null, to_date('01-06-2011', 'dd-mm-yyyy'), 2, 'A00', null, '13', '999', '999', null, '18204024200', '024-86112095', '13840142200(母亲)', '辽宁工程技术大学', '建筑环境与设备工程', to_date('01-07-2008', 'dd-mm-yyyy'), null, '皇姑区陵东街21号142', '沈阳', null, null, '1', null, null, '皇姑区陵东街21号142', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10070, '20', '李建平', '99', to_date('06-06-1987', 'dd-mm-yyyy'), 25, '本科', '01', '0', '1', '210421198706062449', null, to_date('01-06-2011', 'dd-mm-yyyy'), 2, null, to_date('01-06-2011', 'dd-mm-yyyy'), 2, 'A00', null, '99', '999', '999', null, '18240065121', '0413-4188061', '15140043387（对象）', '辽宁工业大学', '环境科学', to_date('01-07-2010', 'dd-mm-yyyy'), null, '抚顺县上马乡温道村11组367', '抚顺', null, null, '1', null, null, '沈河区铁岭路21号', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10071, '21', '商会', '99', to_date('10-10-1989', 'dd-mm-yyyy'), 23, '大专', '01', '0', '1', '210782198910101627', null, to_date('01-05-2011', 'dd-mm-yyyy'), 2, null, to_date('01-05-2011', 'dd-mm-yyyy'), 2, 'A00', null, '99', '999', '999', null, '13998154620', '024-88325852', '13238877598（母亲）', '抚顺职业技术学院', '建筑工程技术', to_date('01-07-2011', 'dd-mm-yyyy'), null, '大东区北大营街1甲242', '沈阳', null, null, '1', null, null, '大东区北大营街1甲242', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10072, '22', '赵研', '99', to_date('04-12-1986', 'dd-mm-yyyy'), 26, '本科', '01', '0', '3', '210902198612042568', null, to_date('18-10-2011', 'dd-mm-yyyy'), 2, null, to_date('18-10-2011', 'dd-mm-yyyy'), 2, 'A00', null, '99', '999', '999', null, '15040381844', null, '13470335953（母亲）', '沈阳大学', '给水排水工程', to_date('01-07-2010', 'dd-mm-yyyy'), null, '阜新市海州区中华路109-8号109', '阜新', null, null, '1', null, null, '沈阳市浑南新区金卡路10号471', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10073, '23', '王文海', '99', to_date('10-11-1974', 'dd-mm-yyyy'), 38, '大专', '02', '1', '3', '21010619741110431x', null, to_date('01-09-2010', 'dd-mm-yyyy'), 3, null, to_date('01-09-2010', 'dd-mm-yyyy'), 3, 'A00', '117', '99', '999', '999', null, '13840461949', '024-25770787', '13940389488（爱人）', '沈阳市交通技校', '汽车驾驶', to_date('01-09-2003', 'dd-mm-yyyy'), null, '铁西区重工街12路19-1号361', '沈阳', null, null, '1', null, null, '铁西区重工街12路19-1号361', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10074, '24', '扈曙光', '99', to_date('27-06-1989', 'dd-mm-yyyy'), 23, '高中', '01', '1', '1', '150430198906274016', null, to_date('01-03-2012', 'dd-mm-yyyy'), 1, null, to_date('01-03-2012', 'dd-mm-yyyy'), 1, 'A00', '117', '99', '999', '999', null, '13998365000', '024-86165132', null, '沈阳市第十一中学', null, to_date('01-07-2008', 'dd-mm-yyyy'), null, '沈阳市皇姑区长江北街60-11', '沈阳', null, null, '1', null, null, '沈阳市皇姑区长江北街60-11', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10075, '25', '马一', '99', to_date('16-07-1979', 'dd-mm-yyyy'), 33, '本科', '02', '0', '1', '211322197907160026', null, to_date('01-04-2004', 'dd-mm-yyyy'), 9, null, to_date('01-04-2004', 'dd-mm-yyyy'), 9, 'A00', null, '11', '999', '999', null, '13940216543', null, '18602420860（爱人）', '沈阳建筑大学', '土木工程', to_date('01-07-2004', 'dd-mm-yyyy'), null, '沈阳市铁西区赞工街八巷3好242', '沈阳', null, null, '1', null, null, '沈阳市大东区北海街22号', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10076, '26', '孙彤', '99', to_date('02-09-1989', 'dd-mm-yyyy'), 23, '本科', '01', '0', '3', '210113198909020023', null, to_date('01-03-2011', 'dd-mm-yyyy'), 2, null, to_date('01-03-2011', 'dd-mm-yyyy'), 2, 'A00', null, '99', '999', '999', null, '15998366919', null, '13998840397（对象）', '吉林大学(成人)', '农林经济管理', to_date('01-07-2013', 'dd-mm-yyyy'), null, '沈阳市沈北新区新城子街62-463', '沈阳', null, null, '1', null, null, '沈阳市大东区联合路99-4号', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1051, 'B10016', '某人1', '01', to_date('09-09-1979', 'dd-mm-yyyy'), 34, null, '01', '1', null, '110111790909999', null, null, null, '11', to_date('02-01-1995', 'dd-mm-yyyy'), 18, 'B08', '102', '11', '100', '101', '2', '1114343', null, null, null, null, null, '130000000000', null, null, null, null, '1', '130100000000', '130101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1052, 'B10017', '某人2', '03', to_date('09-09-1977', 'dd-mm-yyyy'), 36, null, '02', '2', null, '220222770909998', null, null, null, '11', to_date('30-12-2012', 'dd-mm-yyyy'), 1, 'B04', '105', '13', '102', '103', '3', '4231', null, null, null, null, null, '320000000000', null, null, null, null, '1', '320100000000', '320101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1058, 'B10023', '密麻麻', '05', to_date('09-09-1956', 'dd-mm-yyyy'), 57, null, '02', '2', null, '777777560909996', null, null, null, '21', to_date('02-01-2006', 'dd-mm-yyyy'), 7, 'A01', '103', '11', '106', '106', '3', '5512131', null, null, null, null, null, '650000000000', null, null, null, null, '1', '650100000000', '650101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1059, 'B10024', '密码', '02', to_date('07-07-1967', 'dd-mm-yyyy'), 46, null, '02', '1', null, '999040670707999', null, null, null, '99', to_date('01-01-2003', 'dd-mm-yyyy'), 10, 'B07', '101', '10', '104', '104', '2', '765443', null, null, null, null, null, '140000000000', null, null, null, null, '0', '140100000000', '140101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1060, 'B10025', '品牌', '01', to_date('09-09-1989', 'dd-mm-yyyy'), 24, null, '02', '1', null, '202112198909099978', null, null, null, '11', to_date('08-01-2002', 'dd-mm-yyyy'), 11, 'B02', '101', '11', '101', '101', '2', '44622', null, null, null, null, null, '230000000000', null, null, null, null, '1', '230100000000', '230101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1061, 'B10026', 'pp', '01', to_date('09-09-1969', 'dd-mm-yyyy'), 44, null, '02', '1', null, '909909690909999', null, null, null, '11', to_date('09-01-1996', 'dd-mm-yyyy'), 17, 'A01', '102', '11', '101', '103', '1', '79893332', null, null, null, null, null, '450000000000', null, null, null, null, '1', '450100000000', '450101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1062, 'B10027', '朋友', '02', to_date('08-08-1978', 'dd-mm-yyyy'), 35, null, '02', '2', null, '909898780808888', null, null, null, '11', to_date('01-01-2004', 'dd-mm-yyyy'), 9, 'B01', '108', '11', '101', '105', '1', '00976t5', null, null, null, null, null, '130000000000', null, null, null, null, '1', '130100000000', '130101000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1063, 'A10028', '底123', '01', to_date('06-07-1976', 'dd-mm-yyyy'), 37, null, '02', '2', '1', '767676760706076', null, null, null, '11', to_date('01-01-2006', 'dd-mm-yyyy'), 7, 'A01', '106', '11', '101', '101', null, '4252234', null, null, null, null, null, '120000000000', null, null, null, null, '1', '120100000000', '120107000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (1064, 'A10029', '651234', '01', to_date('09-09-1938', 'dd-mm-yyyy'), 75, null, '02', '2', '1', '990909380909098', null, null, null, '21', to_date('01-01-1955', 'dd-mm-yyyy'), 58, 'A00', '101', '10', '108', '108', null, '6534532452', null, null, null, null, null, '110000000000', null, null, null, null, '1', '110100000000', '110102000000', null, null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10077, '27', '李可义', '99', to_date('16-02-1989', 'dd-mm-yyyy'), 23, '本科', '01', '1', '4', '210104198902161417', null, to_date('04-07-2012', 'dd-mm-yyyy'), 1, null, to_date('04-07-2012', 'dd-mm-yyyy'), 1, 'A00', '109', '99', '999', '107', null, '13941864757', null, '13840198019（父亲）', '辽宁工程技术大学', '安全工程', to_date('01-07-2012', 'dd-mm-yyyy'), null, '大东区新光路20—1号2—3—2', '沈阳', null, null, '1', null, null, '大东区善邻路', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10078, '28', '史福娟', '99', to_date('25-11-1989', 'dd-mm-yyyy'), 23, '本科', '01', '0', '2', '210114198911253922', null, to_date('04-07-2012', 'dd-mm-yyyy'), 1, null, to_date('04-07-2012', 'dd-mm-yyyy'), 1, 'A00', '109', '99', '999', '107', null, '15141834746', '024-89286512', '13591649637（对象）', '辽宁工程技术大学', '安全工程', to_date('01-07-2012', 'dd-mm-yyyy'), null, '于洪区平罗镇青堆子村6组314', '沈阳', null, null, '1', null, null, '沈阳北站', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10079, '29', '李晓威', '99', to_date('13-04-1983', 'dd-mm-yyyy'), 29, '本科', '02', '0', '1', '210102198304136626', null, to_date('01-09-2008', 'dd-mm-yyyy'), 5, null, to_date('01-09-2008', 'dd-mm-yyyy'), 5, 'A00', null, '99', '999', '999', null, '18640548329', '024-23502328', '13190088988（母亲）', '巴黎索邦一大', '经济', to_date('01-07-2007', 'dd-mm-yyyy'), null, '和平区南五马路234-2', '沈阳', null, null, '1', null, null, '沈阳市和平区同泽南街154号', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10080, '30', '孙宁', '99', to_date('06-06-1982', 'dd-mm-yyyy'), 30, '本科', '01', '1', '1', '210103198206063315', null, null, null, null, null, null, 'A00', null, '13', '104', '100', null, '13504946566', null, '13700042356（父亲）', '辽宁工程技术大学', '土木工程（交通土建）', to_date('01-07-2007', 'dd-mm-yyyy'), null, '沈阳市沈河区八纬路75-2号421', '沈阳', null, null, '1', null, null, '沈阳市沈河区八纬路75-2号421', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10081, '31', '支慧新', '99', to_date('31-12-1963', 'dd-mm-yyyy'), 48, null, '02', '0', '3', '210105196312310210', null, to_date('01-12-2012', 'dd-mm-yyyy'), 0, null, to_date('01-12-2012', 'dd-mm-yyyy'), 0, 'A00', null, '99', '999', '999', null, '15242446161', null, '13940016232（爱人）', null, null, null, null, '沈阳市大东区', '沈阳', null, null, '1', null, null, '沈阳市和平区', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10082, '32', '吴丹', '99', to_date('15-12-1983', 'dd-mm-yyyy'), 30, '硕士', '02', '0', '3', '130303198312150923', null, to_date('01-02-2013', 'dd-mm-yyyy'), 0, null, to_date('01-02-2013', 'dd-mm-yyyy'), 0, 'A00', null, '99', '999', '999', null, '13516034033', null, '13903335170（父亲）', '日本中京大学（私立）', '经营学', to_date('01-03-2009', 'dd-mm-yyyy'), null, '秦皇岛市山海关区关城南路6-3-6', '沈阳', null, null, '1', null, null, '沈阳市沈河区南塔东街31-4号152', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10083, '33', '王加权', '99', to_date('04-06-1983', 'dd-mm-yyyy'), 29, '大专', '02', '1', '3', '210381198306041914', null, to_date('27-05-2004', 'dd-mm-yyyy'), 8, null, to_date('27-05-2004', 'dd-mm-yyyy'), 8, 'A00', null, '12', '999', '100', null, '15904071196', null, '13840474732（爱人）', '辽宁经济职业技术学院', '工程项目管理', to_date('10-07-2004', 'dd-mm-yyyy'), null, '沈阳市皇姑区嫩江街4号', '沈阳', null, null, '1', null, null, '于洪区黄海路36—3', null, null, null);
insert into HRD_EMP (id, emp_id, emp_name, nation, birth, age, education, marriage, gender, politic, idcard, native, workdate, workage, emptype, joindate, joinage, dept_id, rolename, title_id, titlename, titlework, insustatus, tel, telehome, emergency, graduate, master, graddate, location1, reglocation, winterloc, picture, memo, valid, location2, location3, location4, archivekeep, pension_no, medica_no)
values (10084, '15', '胡莹', '99', to_date('19-01-1982', 'dd-mm-yyyy'), 30, '本科', '02', '0', '1', '211282198201190827', null, to_date('10-02-2005', 'dd-mm-yyyy'), 8, null, to_date('10-02-2005', 'dd-mm-yyyy'), 8, 'A00', null, '99', '999', '999', null, '13889258363', null, '13998802669（爱人）', '东北大学（成人脱产）', '会计学', to_date('15-07-2004', 'dd-mm-yyyy'), null, '于洪区紫郡城三期54号542', '沈阳', null, null, '1', null, null, '于洪区紫郡城三期54号542', null, null, null);
commit;
prompt 54 records loaded
prompt Loading HRD_EMP_CERT...
insert into HRD_EMP_CERT (id, emp_id, cert, certno, obtdate, closedate, certdept, memo, valid)
values (1092, 'A10011', '01', '13213213', to_date('03-01-2012', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), 'asfdsafd', 'asdfasfdasfd', '1');
insert into HRD_EMP_CERT (id, emp_id, cert, certno, obtdate, closedate, certdept, memo, valid)
values (1087, 'A10011', '03', '132213', to_date('01-01-2013', 'dd-mm-yyyy'), to_date('09-01-2012', 'dd-mm-yyyy'), 'asdfasdf', 'asdfasdf', '1');
insert into HRD_EMP_CERT (id, emp_id, cert, certno, obtdate, closedate, certdept, memo, valid)
values (1048, 'A10008', '第一个整数12', '03981093', to_date('01-01-2013', 'dd-mm-yyyy'), null, '无单位', '无备注', '1');
commit;
prompt 3 records loaded
prompt Loading HRD_EMP_CONTRACT...
insert into HRD_EMP_CONTRACT (id, emp_id, contract_id, contract_name, contracttype, contractprop, begindate, enddate, addition, memo, valid, accident_start, accident_end, insu)
values (1113, 'A10001', '2123', '正式合同', '01', '1', to_date('04-02-2013', 'dd-mm-yyyy'), to_date('22-02-2013', 'dd-mm-yyyy'), '保密协定', '无', '1', to_date('20-02-2013', 'dd-mm-yyyy'), to_date('20-02-2014', 'dd-mm-yyyy'), '1');
insert into HRD_EMP_CONTRACT (id, emp_id, contract_id, contract_name, contracttype, contractprop, begindate, enddate, addition, memo, valid, accident_start, accident_end, insu)
values (1116, 'A10005', 'HT11123', '劳动合同', '1', '1', to_date('04-03-2013', 'dd-mm-yyyy'), to_date('04-03-2014', 'dd-mm-yyyy'), '1', null, '1', to_date('04-03-2013', 'dd-mm-yyyy'), to_date('04-03-2014', 'dd-mm-yyyy'), '1');
commit;
prompt 2 records loaded
prompt Loading HRD_EMP_DOC...
prompt Table is empty
prompt Loading HRD_EMP_EDU...
insert into HRD_EMP_EDU (id, emp_id, graduation, graduatedate, major, graduateno, memo, valid)
values (1107, 'A10011', '中国科技大学', to_date('05-02-2013', 'dd-mm-yyyy'), '地质', '244123NO.1', '无1', '1');
commit;
prompt 1 records loaded
prompt Loading HRD_EMP_FAMILY...
insert into HRD_EMP_FAMILY (id, emp_id, relation_name, relation_type, relation_tel, workdept, workrole, memo, valid)
values (1026, 'A10008', '张三', '1', '0291029', '无', '无', '无', '1');
insert into HRD_EMP_FAMILY (id, emp_id, relation_name, relation_type, relation_tel, workdept, workrole, memo, valid)
values (1027, 'A10008', '李四', '2', '0291831', '公安局', '局长', '无', '1');
insert into HRD_EMP_FAMILY (id, emp_id, relation_name, relation_type, relation_tel, workdept, workrole, memo, valid)
values (1082, 'A10011', '不知道', '2', '40182', 'a', '123', 'asdfasfd', '1');
commit;
prompt 3 records loaded
prompt Loading HRD_EMP_INSU...
prompt Table is empty
prompt Loading HRD_EMP_JOB...
insert into HRD_EMP_JOB (id, emp_id, job_start, job_end, accident_start, accident_end, memo, valid, pension, medica, bear, unemp, insu)
values (1083, 'A10011', to_date('14-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), to_date('03-01-2012', 'dd-mm-yyyy'), null, '1', null, null, null, null, null);
insert into HRD_EMP_JOB (id, emp_id, job_start, job_end, accident_start, accident_end, memo, valid, pension, medica, bear, unemp, insu)
values (1091, 'A10008', to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2014', 'dd-mm-yyyy'), to_date('01-01-2013', 'dd-mm-yyyy'), to_date('01-01-2014', 'dd-mm-yyyy'), '接续劳动合同', '1', null, null, null, null, null);
insert into HRD_EMP_JOB (id, emp_id, job_start, job_end, accident_start, accident_end, memo, valid, pension, medica, bear, unemp, insu)
values (1034, 'A10008', to_date('03-02-2012', 'dd-mm-yyyy'), to_date('01-06-2012', 'dd-mm-yyyy'), to_date('03-01-2013', 'dd-mm-yyyy'), to_date('03-01-2014', 'dd-mm-yyyy'), '无', '1', null, null, null, null, null);
commit;
prompt 3 records loaded
prompt Loading HRD_EMP_PERF...
insert into HRD_EMP_PERF (id, period, performance, prof_perf, work_perf, manage_perf, memo, emp_id, valid)
values (1018, '2012', 'A', 'A', 'A', 'A', '测试信息', 'B10006', '1');
insert into HRD_EMP_PERF (id, period, performance, prof_perf, work_perf, manage_perf, memo, emp_id, valid)
values (1022, '2012', 'C', 'B', 'B', 'B', '备注', 'A10011', '1');
insert into HRD_EMP_PERF (id, period, performance, prof_perf, work_perf, manage_perf, memo, emp_id, valid)
values (11111111012, '2012', 'B', 'A', 'A', 'A', '2012年考评1', 'A10008', '1');
insert into HRD_EMP_PERF (id, period, performance, prof_perf, work_perf, manage_perf, memo, emp_id, valid)
values (1013, '2011', 'B', 'B', 'B', 'B', '2011年考评', 'A10008', '0');
commit;
prompt 4 records loaded
prompt Loading HRD_EMP_PROF...
insert into HRD_EMP_PROF (id, emp_id, proftype, obtaintype, obtaindate, obtaindept, prof_num, enddate, memo, valid)
values (1047, 'A10008', '10', '1', to_date('01-01-2013', 'dd-mm-yyyy'), '未知单位', '1129018注册', to_date('04-02-2013', 'dd-mm-yyyy'), '无备注1', '1');
insert into HRD_EMP_PROF (id, emp_id, proftype, obtaintype, obtaindate, obtaindept, prof_num, enddate, memo, valid)
values (1086, 'A10011', '10', '1', to_date('14-01-2013', 'dd-mm-yyyy'), null, null, to_date('16-01-2013', 'dd-mm-yyyy'), null, '1');
commit;
prompt 2 records loaded
prompt Loading HRD_EMP_REG...
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1045, 'A10008', '02', '02', '102', '101', '104', null, null, null, null, null, null, null, null, '0', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1088, 'A10011', '03', '01', '101', null, null, '123', '123213', null, null, null, null, null, '真的', '1', null, null, '123123', null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1044, 'A10008', '02', '02', '103', '101', '104', '注册编号', null, null, null, null, null, null, null, '0', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1084, 'A10011', '01', '02', '102', null, '102', null, null, null, null, null, null, null, null, '1', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1085, 'A10011', '02', '02', '103', '103', '103', null, null, null, null, null, null, null, null, '1', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1117, 'B10018', '01', '02', '102', '101', '103', null, null, null, null, null, null, null, null, '1', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1038, 'A10008', '01', '02', '101', '103', '105', null, null, null, to_date('01-01-2009', 'dd-mm-yyyy'), null, null, null, '无备注', '0', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1039, 'A10008', '02', '02', '102', null, null, '注9201928', null, null, null, null, null, null, null, '0', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1040, 'A10008', '03', '01', '102', '104', null, null, null, null, null, null, null, null, null, '0', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1042, 'A10008', '02', '01', '103', null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1046, 'A10008', '01', '02', '101', '103', '102', null, null, null, null, null, null, null, null, '1', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1121, 'A10011', '01', '02', '101', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null);
insert into HRD_EMP_REG (id, emp_id, regtype, reglevel, regmajor1, regmajor2, regmajor3, regno, certificate, validdate, issuedate, certnumber, certdate, certvaliddate, memo, valid, perf_study, continue_edu, continue_no, continue_date)
values (1043, 'A10008', '02', '02', '105', '103', '104', '注册0391872', '93012322a', null, null, null, null, null, null, '0', null, null, null, null);
commit;
prompt 13 records loaded
prompt Loading HRD_EMP_REWARD...
insert into HRD_EMP_REWARD (id, emp_id, rewardtype, rewarddate, rewarddept, reward, memo, valid, reward_person)
values (1101, 'A10011', '08', to_date('22-01-2013', 'dd-mm-yyyy'), null, null, null, '1', '01');
insert into HRD_EMP_REWARD (id, emp_id, rewardtype, rewarddate, rewarddept, reward, memo, valid, reward_person)
values (1036, 'A10008', '02', to_date('01-01-2013', 'dd-mm-yyyy'), '总公司', '鲁班奖', '这是备注', '1', '03');
commit;
prompt 2 records loaded
prompt Loading HRD_EMP_TRAIN...
insert into HRD_EMP_TRAIN (id, emp_id, trainingdate, training, knowledge, trainingdept, fee, intertraining, result, work, professional, memo, valid)
values (1017, 'A10008', to_date('28-12-2011', 'dd-mm-yyyy'), '普通培训', '专业培训', '外地北京', 999999.12, '0', null, null, null, '无备注', '1');
insert into HRD_EMP_TRAIN (id, emp_id, trainingdate, training, knowledge, trainingdept, fee, intertraining, result, work, professional, memo, valid)
values (1019, 'B10006', to_date('28-12-2012', 'dd-mm-yyyy'), null, null, null, .01, null, null, null, null, null, '1');
insert into HRD_EMP_TRAIN (id, emp_id, trainingdate, training, knowledge, trainingdept, fee, intertraining, result, work, professional, memo, valid)
values (1023, 'A10011', to_date('01-01-2010', 'dd-mm-yyyy'), '测试培训经历', '测试', '测试', 90.21, '0', null, null, null, '培训的挺好', '1');
insert into HRD_EMP_TRAIN (id, emp_id, trainingdate, training, knowledge, trainingdept, fee, intertraining, result, work, professional, memo, valid)
values (1033, 'A10008', to_date('01-01-2013', 'dd-mm-yyyy'), '普通培训', '专业培训', null, 10291, '0', null, null, null, null, '1');
insert into HRD_EMP_TRAIN (id, emp_id, trainingdate, training, knowledge, trainingdept, fee, intertraining, result, work, professional, memo, valid)
values (1081, 'A10011', to_date('01-01-2013', 'dd-mm-yyyy'), '测试培训', '土木', '北京', 1290, '1', null, null, null, '多多培训', '1');
commit;
prompt 5 records loaded
prompt Loading HRD_EMP_TRANSFER...
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1066, 'A10011', to_date('07-01-2013', 'dd-mm-yyyy'), '02', '测试变动', 'A00', 'A01', '测试调转', '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1067, 'A10011', to_date('07-01-2013', 'dd-mm-yyyy'), '02', '测试变动', 'A01', 'A00', '测试备注', '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1070, 'A10011', to_date('01-01-2013', 'dd-mm-yyyy'), '02', '变动', 'A00', 'A01', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1093, 'A10007', to_date('01-01-2013', 'dd-mm-yyyy'), '03', '辞退', 'A00', null, null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1096, 'A10011', to_date('21-01-2013', 'dd-mm-yyyy'), '02', '0', 'A00', 'B01', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1068, 'A10011', to_date('03-01-2013', 'dd-mm-yyyy'), '02', '变动', 'A00', 'A01', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1072, 'A10011', to_date('07-01-2013', 'dd-mm-yyyy'), '01', '主动离职', 'A00', null, null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1076, 'B10017', to_date('10-01-2013', 'dd-mm-yyyy'), '03', '被辞退', 'B04', null, null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1077, 'B10026', to_date('10-01-2013', 'dd-mm-yyyy'), '02', '测试idiaozhuan', 'B02', 'A01', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1078, 'B10016', to_date('01-01-2011', 'dd-mm-yyyy'), '02', '不知道', 'B03', 'B08', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1080, 'B10024', to_date('10-01-2013', 'dd-mm-yyyy'), '01', '该员工主动离职', 'B07', null, '员工离职', '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1089, 'B10023', to_date('14-01-2013', 'dd-mm-yyyy'), '02', '内部', 'B09', 'A01', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1069, 'A10011', to_date('07-01-2013', 'dd-mm-yyyy'), '02', '变动', 'A01', 'A00', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1071, 'A10011', to_date('01-01-2013', 'dd-mm-yyyy'), '02', '变动', 'A01', 'A00', null, '1');
insert into HRD_EMP_TRANSFER (id, emp_id, transferdate, transfertype, transferreason, prevdept_id, newdept_id, memo, valid)
values (1079, 'B10019', to_date('10-01-2013', 'dd-mm-yyyy'), '03', '已经辞退', 'B10', null, '已经辞退', '1');
commit;
prompt 15 records loaded
prompt Loading HRD_EMP_WORK...
insert into HRD_EMP_WORK (id, emp_id, begin, end, unit, dept, jobrole, memo, valid)
values (1037, 'A10008', to_date('03-01-2012', 'dd-mm-yyyy'), null, '当前公司', '当前部门', '未知植物', '无备注', '1');
insert into HRD_EMP_WORK (id, emp_id, begin, end, unit, dept, jobrole, memo, valid)
values (1111, 'A10011', to_date('04-02-2013', 'dd-mm-yyyy'), to_date('27-02-2013', 'dd-mm-yyyy'), 'ABC', null, null, null, '1');
commit;
prompt 2 records loaded
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
prompt Loading PRJ_BUILDING...
insert into PRJ_BUILDING (id, prj_id, building_id, underfloor, abovefloor, height, building_area, act_begin, act_end, act_time, progress, image_progress, memo, valid, building_type, builder_license, license_date, security_level, construct_type)
values (1137, 1136, '1#', '-3', '12', '120', '1250.2', to_date('07-05-2013', 'dd-mm-yyyy'), to_date('23-05-2013', 'dd-mm-yyyy'), '120天', '凑活看吧', '02', '没啥说的', '1', '3', 'L(1230)', null, '01', '16');
insert into PRJ_BUILDING (id, prj_id, building_id, underfloor, abovefloor, height, building_area, act_begin, act_end, act_time, progress, image_progress, memo, valid, building_type, builder_license, license_date, security_level, construct_type)
values (1187, 1171, '2号楼', '-4', '10', '192', '1293', to_date('26-05-2013', 'dd-mm-yyyy'), to_date('30-05-2013', 'dd-mm-yyyy'), null, null, null, null, '1', '3', null, null, '02', '13');
insert into PRJ_BUILDING (id, prj_id, building_id, underfloor, abovefloor, height, building_area, act_begin, act_end, act_time, progress, image_progress, memo, valid, building_type, builder_license, license_date, security_level, construct_type)
values (1186, 1171, '1号楼', '-4', '12', '113', '229', to_date('27-05-2013', 'dd-mm-yyyy'), to_date('30-05-2013', 'dd-mm-yyyy'), null, null, null, null, '1', '3', null, null, '01', '13');
insert into PRJ_BUILDING (id, prj_id, building_id, underfloor, abovefloor, height, building_area, act_begin, act_end, act_time, progress, image_progress, memo, valid, building_type, builder_license, license_date, security_level, construct_type)
values (1166, 1135, '13', '-2', '32', '12.3', '1239', to_date('12-05-2013', 'dd-mm-yyyy'), to_date('04-10-2013', 'dd-mm-yyyy'), '1213', null, null, null, '1', '1', null, null, '03', '11');
insert into PRJ_BUILDING (id, prj_id, building_id, underfloor, abovefloor, height, building_area, act_begin, act_end, act_time, progress, image_progress, memo, valid, building_type, builder_license, license_date, security_level, construct_type)
values (1206, 1205, '1号楼', '-2', '10', '120.4', '1029', to_date('26-05-2013', 'dd-mm-yyyy'), null, null, null, null, null, '1', '1', null, null, '02', '12');
commit;
prompt 5 records loaded
prompt Loading PRJ_CHECK...
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1196, 1136, '1001', to_date('28-05-2013', 'dd-mm-yyyy'), 10, 'A00', 1147, 1147, null, '16', '1', to_date('05-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), null, '1', '20130525080824');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1197, 1136, '1005', to_date('28-05-2013', 'dd-mm-yyyy'), 10, 'A01', 1147, 1147, null, '16', '1', to_date('05-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), null, '1', '20130525080824');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1201, 1135, '1004', to_date('06-05-2013', 'dd-mm-yyyy'), 10, 'A00', 1170, 1148, null, '11', '12', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('07-05-2013', 'dd-mm-yyyy'), null, '1', '20130526000213');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1202, 1135, '1002', to_date('06-05-2013', 'dd-mm-yyyy'), 1, 'B09', 1170, 1148, null, '11', '12', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('07-05-2013', 'dd-mm-yyyy'), null, '1', '20130526000213');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1190, 1171, '1000', to_date('22-05-2013', 'dd-mm-yyyy'), 90, 'A01', 1181, 1181, null, '13', '23', to_date('21-05-2013', 'dd-mm-yyyy'), to_date('26-05-2013', 'dd-mm-yyyy'), null, '1', '20130525080244');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1200, 1171, '4006', to_date('22-05-2013', 'dd-mm-yyyy'), 10.2, 'A01', 1199, 1181, null, '11', '23', to_date('21-05-2013', 'dd-mm-yyyy'), to_date('26-05-2013', 'dd-mm-yyyy'), null, '1', '20130525080244');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1203, 1135, '3000', to_date('07-05-2013', 'dd-mm-yyyy'), 3, 'A00', 1170, 1148, null, '11', '12', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('07-05-2013', 'dd-mm-yyyy'), null, '1', '20130526000213');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1204, 1135, '3000', to_date('07-05-2013', 'dd-mm-yyyy'), 3, 'B09', 1170, 1148, null, '11', '12', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('07-05-2013', 'dd-mm-yyyy'), null, '1', '20130526000213');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1214, 1205, '4006', to_date('27-05-2013', 'dd-mm-yyyy'), 4, 'A00', 1212, 1213, null, '12', 'B10006', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), null, '1', '20130526001325');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1215, 1205, '4006', to_date('27-05-2013', 'dd-mm-yyyy'), 4, 'B05', 1212, 1213, null, '12', 'B10006', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), null, '1', '20130526001325');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1191, 1136, '2001', to_date('16-05-2013', 'dd-mm-yyyy'), 8.9, 'A00', 1146, 1147, null, '16', '1', to_date('05-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), null, '1', '20130525080824');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1192, 1136, '2006', to_date('16-05-2013', 'dd-mm-yyyy'), 89, 'B01', 1147, 1146, '正在施工中', '16', '4', to_date('05-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), '这是备注吗？', '1', '20130525080824');
insert into PRJ_CHECK (id, prj_id, checkitem, checkdate, act_score, dept_id, jsdw_id, sgdw_id, prj_progress, construct_type, emp_id, begindate, enddate, memo, valid, checkgroup_no)
values (1198, 1171, '3013', to_date('22-05-2013', 'dd-mm-yyyy'), 9, 'A01', 1181, 1181, '项目进展似乎正常', '13', '23', to_date('21-05-2013', 'dd-mm-yyyy'), to_date('26-05-2013', 'dd-mm-yyyy'), '没有啥备注可写', '1', '20130525080244');
commit;
prompt 13 records loaded
prompt Loading PRJ_INFO...
insert into PRJ_INFO (id, prjno, contractno, prj_name, prj_area, quality_target, prj_starttime, prj_endtime, prj_time, prj_pic, prj_progress, memo, valid, location1, location2, location3, location4, buildingcount, contractarea, prj_level, prj_type, prj_invest, weekmeeting, prj_map, prj_region, prj_archive, weekmeetingtime, prj_archivetime)
values (1171, 'P2013-002', 'HT120ASDFL', '铁西体育场', '123213', '2', to_date('21-05-2013', 'dd-mm-yyyy'), to_date('26-05-2013', 'dd-mm-yyyy'), '5', null, null, null, '1', '110000000000', '110100000000', '110101000000', '不知道是什么街道', null, '12321', '3', '02', '123213', '01', '123.414501,41.790738', null, '0', '16', null);
insert into PRJ_INFO (id, prjno, contractno, prj_name, prj_area, quality_target, prj_starttime, prj_endtime, prj_time, prj_pic, prj_progress, memo, valid, location1, location2, location3, location4, buildingcount, contractarea, prj_level, prj_type, prj_invest, weekmeeting, prj_map, prj_region, prj_archive, weekmeetingtime, prj_archivetime)
values (1205, 'P2013-003', 'HT039182', '沈阳市安居工程', null, '2', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), null, null, null, null, '1', '210000000000', '210100000000', '210101000000', null, null, '1029', '2', '01', '123', '01', '123.435163,41.794448', null, null, '10', null);
insert into PRJ_INFO (id, prjno, contractno, prj_name, prj_area, quality_target, prj_starttime, prj_endtime, prj_time, prj_pic, prj_progress, memo, valid, location1, location2, location3, location4, buildingcount, contractarea, prj_level, prj_type, prj_invest, weekmeeting, prj_map, prj_region, prj_archive, weekmeetingtime, prj_archivetime)
values (1136, 'P2013-001', 'HT123123', '奥体中心', '123123', '2', to_date('05-05-2013', 'dd-mm-yyyy'), to_date('31-05-2013', 'dd-mm-yyyy'), null, null, '正在进行外墙施工', null, '1', '210000000000', '210100000000', '210101000000', 'wu ', null, '12312', '2', '01', '123213', '01', '123.377024,41.793158', null, null, '38', null);
insert into PRJ_INFO (id, prjno, contractno, prj_name, prj_area, quality_target, prj_starttime, prj_endtime, prj_time, prj_pic, prj_progress, memo, valid, location1, location2, location3, location4, buildingcount, contractarea, prj_level, prj_type, prj_invest, weekmeeting, prj_map, prj_region, prj_archive, weekmeetingtime, prj_archivetime)
values (1135, 'P2013-004', 'HT13202193', '2013暖房工程—青年宫保安寺', '12312', '2', to_date('01-05-2013', 'dd-mm-yyyy'), to_date('07-05-2013', 'dd-mm-yyyy'), null, null, '刚开始地基', '无备注', '1', '210000000000', '210100000000', '210104000000', '哪个接到', null, '1233', '2', '03', 'ASDFASF', '02', '123.411016,41.761096', 'ASDF', '0', '17', null);
commit;
prompt 4 records loaded
prompt Loading PRJ_MAJORCHECK...
prompt Table is empty
prompt Loading PRJ_ORG...
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1161, '1', '1', 1136, to_date('06-05-2013', 'dd-mm-yyyy'), null, null, null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1162, '4', '2', 1136, to_date('14-05-2013', 'dd-mm-yyyy'), to_date('24-05-2013', 'dd-mm-yyyy'), 'asdf', null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1168, 'A10008', '1', 1135, to_date('12-05-2013', 'dd-mm-yyyy'), null, null, null, '0');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1169, '30', '2', 1135, to_date('18-05-2013', 'dd-mm-yyyy'), null, null, null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1156, '1', '1', 1135, to_date('12-05-2013', 'dd-mm-yyyy'), null, '总监理', '无', '0');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1160, '26', '2', 1136, to_date('20-05-2013', 'dd-mm-yyyy'), null, null, null, '0');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1163, '1', '3', 1136, to_date('12-05-2013', 'dd-mm-yyyy'), null, null, null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1176, '12', '1', 1135, to_date('12-05-2013', 'dd-mm-yyyy'), to_date('25-05-2013', 'dd-mm-yyyy'), null, null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1209, 'B10006', '1', 1205, to_date('26-05-2013', 'dd-mm-yyyy'), null, null, null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1159, '7', '1', 1136, to_date('13-05-2013', 'dd-mm-yyyy'), null, null, null, '0');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1188, '23', '1', 1171, to_date('20-05-2013', 'dd-mm-yyyy'), null, null, null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1157, '1', '2', 1135, to_date('12-05-2013', 'dd-mm-yyyy'), null, null, null, '0');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1158, '2', '1', 1135, to_date('15-05-2013', 'dd-mm-yyyy'), null, null, null, '0');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1210, 'B10006', '2', 1205, to_date('26-05-2013', 'dd-mm-yyyy'), null, null, null, '1');
insert into PRJ_ORG (id, emp_id, prj_role, prj_id, entertime, leavetime, responsbility, memo, valid)
values (1211, '11', '3', 1205, to_date('19-05-2013', 'dd-mm-yyyy'), null, null, null, '1');
commit;
prompt 15 records loaded
prompt Loading PRJ_UNIT...
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1147, 1136, '不知道1', '不知道集团', '01', '22', 'asdfaf', '不认识', null, null, null, '1');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1149, 1136, '不知道3', 'asdfa', '02', null, null, '3243', null, null, null, '0');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1199, 1171, '江苏第八工程集团第四分公司', '江苏第八工程集团', '06', '33', null, '不知道', null, null, null, '1');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1146, 1136, '不知道', '不知道集团', '05', '12', '在哪呢？', '张三', '老板', '谁知道', '无备注', '1');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1151, 1135, null, null, null, null, null, null, null, null, null, '0');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1170, 1135, '中建五局', '中建', '01', '31', null, '局长', null, null, null, '1');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1212, 1205, '沈阳市第一建设工程公司', '参建集团', '01', null, null, 'a', null, null, null, '1');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1148, 1135, '不知道3', '鬼知道是那么集团', '10', '22', '3a', 'what?', null, null, null, '1');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1181, 1171, '南通四建集团有限公司沈阳分公司第一工程队', '南通四建集团有限公司', '01', '11', null, '234', null, null, null, '1');
insert into PRJ_UNIT (id, prj_id, unit_name, group_name, unit_type, quali_level, unit_address, contractor, title, contract_tel, memo, valid)
values (1213, 1205, '沈阳市第二建设工程公司', '参建集团', '13', '34', null, 'b', null, null, null, '1');
commit;
prompt 10 records loaded
prompt Loading PRJ_UNIT_RELATE...
insert into PRJ_UNIT_RELATE (id, prj_id, dept_id, memo, valid)
values (1145, 1136, 'A01', '负责第3、4、5栋楼', '1');
insert into PRJ_UNIT_RELATE (id, prj_id, dept_id, memo, valid)
values (1167, 1135, 'A00', '负责所有的工作', '1');
insert into PRJ_UNIT_RELATE (id, prj_id, dept_id, memo, valid)
values (1189, 1171, 'A01', '负责总体工作', '1');
insert into PRJ_UNIT_RELATE (id, prj_id, dept_id, memo, valid)
values (1141, 1136, 'A00', '负责这个项目', '1');
insert into PRJ_UNIT_RELATE (id, prj_id, dept_id, memo, valid)
values (1177, 1135, 'B09', '辅助工作', '1');
insert into PRJ_UNIT_RELATE (id, prj_id, dept_id, memo, valid)
values (1207, 1205, 'A00', '总体负责', '1');
insert into PRJ_UNIT_RELATE (id, prj_id, dept_id, memo, valid)
values (1208, 1205, 'B05', '监理负责', '1');
commit;
prompt 7 records loaded
prompt Loading TMP_EMP_IMP...
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('1', '李学志', '49', '男', '210104196307055258', '已婚', '党员', '汉', '13904041007', null, null, null, '沈阳市皇姑区宁山中路66-1号532', '沈阳', '1993/7/1', '20', '硕士', '沈阳建筑工程学院', '97-1-15', '建筑工程', '土建', '所长', '高级工程师', '建筑施工', '2002.12.7', '0044584', '辽宁省人事厅', '评定', '21000495', '00249138', '97033', '无', '01130', '无', '201101321', null, null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('2', '刘德良', '55', '男', '210105195702224316', '已婚', '群众', '汉', '13700053017', null, null, null, '沈阳市东陵区文萃路54-1号231', '沈阳', '1993/7/1', '20', '本科', '沈阳建筑工程学院', '1982/1/9', '工业与民用建筑', '土建', '总工程师', '高级工程师', '建筑结构', '1996.10.25', '60103711', '辽宁省人事厅', '评定', '无', '无', '无', '无', '01131', '无', '201101322', null, null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('3', '张  驰', '40', '男', '210102197203312514', '已婚', '党员', '汉', '13840099555', null, null, null, '沈阳市铁西区沈辽东路75-6号182', '沈阳', '1993/7/1', '20', '硕士', '沈阳建筑大学', '2008/3/13', '工程管理', '土建', '书记', '高级工程师', '建筑结构', '2005.11.30', '0169786', '辽宁省人事厅', '评定', '21001642', '00174679', '0019824', '无', '01132', '无', '201101323', '11-0080', null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('4', '李晓林', '40', '男', '222302197211191315', '已婚', '党员', '汉', '13898831765', '024-81892388', null, null, '沈阳市大东区北海街20-1号431', '沈阳', '1993/7/1', '20', '硕士', '沈阳建筑大学', '2008/3/13', '工程管理', '土建', '副所长', '高级工程师', '建筑结构', '2005.11.30', '0169599', '辽宁省人事厅', '评定', '21001637', '00174673', '0019820', '无', '01133', '无', '201101324', '11-0086', null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('5', '殷鸿彬', '36', '男', '230103197407150617', '已婚', '党员', '汉', '13332408448', '024-88135778', null, null, '沈阳市大东区辽沈二街6号151', '沈阳', '1994/5/12', '19', '本科', '哈建工学院', '1996/7/30', '建筑工程', '土建', '副所长', '高级工程师', '建筑施工', '2006.12.19', '0185301', '辽宁省人事厅', '评定', '21001641', '00174678', '0019819', '无', '01134', '无', '201101325', '11-0079', null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('6', '邱曜辉', '44', '男', '210112196805040614', '已婚', '党员', '汉', '13940000487', '024-24222992', '13998290446（爱人）', '沈河区丰乐二街5-4号162', '沈河区丰乐二街5-4号162', '沈阳', '1993/7/1', '20', '本科', '吉林大学(成人)', '2004/6/1', '会计学', '财务', '财务总监', '助理会计师', '会计', '1993.9.30', '47005730', '辽宁省人事厅', '评定', '无', '无', '无', '无', '无', '无', '无', null, null, '会计从业资格证', null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('7', '王志荣', '50', '男', '210104196312101458', '已婚', '群众', '汉', '13940310351', '无', '15640576289（爱人）', '万柳塘路18-8号243', '沈阳市沈河区翰林路13-2号243', '沈阳', '2012/3/11', '0', '本科', '青岛建筑工程学院', '1987-7-6', '工民建', '土建', '副总工程师', '高级工程师', '建筑结构', '1997-6', '710-03465', '辽宁省人事厅', '评定', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('8', '武雪丽', '34', '女', '210121197810096146', '已婚', '党员', '汉', '13840000843', '024-24826162', '81990333（爱人）', '东陵区泉源三路', '东陵区泉源三路77号241', '沈阳', '2002/3/23', '11', '本科', '沈阳建筑大学（成人）', '2010/3/15', '工程管理', '土建', '主任', '高级工程师', '风景园林', '2011.10.28', '00113067', '辽宁省人事厅', '评定', '无', '无', '无', '无', '无', '00842', '无', null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('9', '佟立夫', '64', '男', '210106480917151', '已婚', '党员', '汉', '13322432609', '024-25896142', '81986142（儿子）', '滑翔五小区5号楼2-2-3', '滑翔五小区5号楼2-2-3', '沈阳', '2005/4/10', '8', '大专', '辽宁广播电视大学', '1983/7/15', '机械', '安全', '部长', '工程师', '建筑机械', '1992.12.26', '34912363', '辽宁省人事厅', '评定', '无', '无', '无', '无', '01154', '无', '201101345', null, null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('10', '董  骄', '56', '男', '210104195409095213', '已婚', '党员', '汉', '13998205673', '024-88137804', '18940141565（爱人）', '大东区北海街4-2号6栋2-14-2', '大东区劳动路4-2栋151', '沈阳', '1994/5/20', '19', '大专', '东机工大', '1983/7/30', '机械', '水暖', '部长', '高级工程师', '无', '2003.9.30', '0142198', '辽宁省人事厅', '评定', '21002960', '00210401', '97060', '无', '01135', '无', '201101326', null, '3006', null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('11', '闫维新', '52', '男', '210105519609294336', '已婚', '党员', '满', '13940064298', '024-88268459', '13998324517（闫帅均）', '大东区劳动路2栋3—2—3', '大东区劳动路2栋3—2—3', '沈阳', '2002/3/20', '11', '本科', '辽宁省委党校', '1981/7/15', '电气', '电气', '部长', '高级工程师', '建筑施工', '2008.6', '00255541', '辽宁省人事厅', '评定', '21002578', '00210405', '0010954', '无', '01136', '无', '201101327', '11-129', null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('12', '刘克明', '57', '男', '210103195505020311', '已婚', '党员', '汉', '13998299637', '无', '13840534139（爱人）', '沈河区文萃路', '沈河区文萃路', '沈阳', '2008/4/11', '5', '大专', '沈阳广播电视大学', '1982/7/10', '机械', '安全', '部长', '工程师', '机械', '1993.2.5', '0048186', '辽宁省人事厅', '评定', '无', '无', '无', '无', '01155', '无', '201101346', null, null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('13', '李海涛', '34', '女', '210724197805170024', '已婚', '党员', '满', '13514286846', '024-28635149', '13889340130（爱人）', '皇姑区昆山西路152-8-351', '皇姑区昆山西路152-8-351', '沈阳', '2003/7/1', '10', '本科', '东北大学', '2003/7/15', '土木工程', '土建', '主任', ' 工程师', '土建施工', '2008.6', '0070846', '辽宁省人力资源和社会保证厅', '评定', '无', '无', '无', '无', '无', '00843', '无', null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('14', '孟  艳', '33', '女', '210106197901310327', '已婚', '党员', '汉', '13840152195', '024-22920229', '13840445695（爱人）', '沈河区热闹路23-1号352', '沈河区热闹路23-1号352', '沈阳', '2000/4/1', '13', '本科', '中央广播电视大学（开放教育）', '2005/7/1', '会计学', '后勤', '会计', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, '会计从业资格证', null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('15', '胡  莹', '30', '女', '211282198201190827', '已婚', '党员', '汉', '13889258363', '无', '13998802669（爱人）', '于洪区紫郡城三期54号542', '于洪区紫郡城三期54号542', '沈阳', '2005/2/10', '8', '本科', '东北大学（成人脱产）', '2004/7/15', '会计学', '财务', '副主任', '会计师', '会计', '2010.5', '10019329', '人力资源和社会保障部', '评定', '无', '无', '无', '无', '无', '无', '无', null, null, '会计从业资格证', null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('16', '孙  静', '28', '女', '210106198401291865', '未婚', '群众', '汉', '13591677509', '024-25825689', '13840136545（爱人）', '铁西区重工街北四路12号122', '铁西区重工街北四路12号122', '沈阳', '2006/3/23', '7', '本科', '沈阳广播电视大学（开放教育）', '2009/5/12', '工程管理', '财务', '出纳', '助理工程师', '电算化会计', '2010.9', '00100329', '人力资源和社会保障厅', '评定', '无', '无', '无', '无', '无', '无', '无', null, null, '会计从业资格证', null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('17', '宋  扬', '33', '女', '210102197905066928', '未婚', '群众', '汉', '13604010165', '024-24563265', '13840147206（母亲）', '东陵区文萃路171-461', '东陵区文萃路171-461', '沈阳', '2006/7/8', '7', '本科', '沈阳建筑大学（成人）', '2003/12/30', '助理工程师', '建筑施工', '2012.12.15', '00118385', '人力资源和社会保障厅', '评定', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, '会计从业资格证', null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('18', '罗  佳', '32', '女', '210423198004142228', '已婚', '群众', '满', '15998237922', '无', '13314008887（爱人）', '皇姑区昆山中路189号', '皇姑区昆山中路189号', '沈阳', '2007/4/5', '6', '本科', '辽宁大学', '2002/7/10', '汉语言文学', '后勤', '文员', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('19', '刘  杨', '27', '女', '210105198506084364', '未婚', '群众', '汉', '18204024200', '024-86112095', '13840142200(母亲)', '皇姑区陵东街21号142', '皇姑区陵东街21号142', '沈阳', '2011/6/1', '2', '本科', '辽宁工程技术大学', '2008/7/1', '建筑环境与设备工程', '后勤', '文员', '助理工程师', '建筑环境与设备工程', '2009.7', '20090203114', '辽宁省人事厅', '评定', '无', '无', '无', '无', '无', '无', '无', null, null, '0903071（省培训）', null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('20', '李建平', '25', '女', '210421198706062449', '未婚', '党员', '汉', '18240065121', '0413-4188061', '15140043387（对象）', '沈河区铁岭路21号', '抚顺县上马乡温道村11组367', '抚顺', '2011/6/1', '2', '本科', '辽宁工业大学', '2010/7/1', '环境科学', '后勤', '文员', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('21', '商  会', '23', '女', '210782198910101627', '未婚', '党员', '满', '13998154620', '024-88325852', '13238877598（母亲）', '大东区北大营街1甲242', '大东区北大营街1甲242', '沈阳', '2011/5/1', '2', '大专', '抚顺职业技术学院', '2011/7/1', '建筑工程技术', '后勤', '文员', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('22', '赵  研', '26', '女', '210902198612042568', '未婚', '群众', '汉', '15040381844', '无', '13470335953（母亲）', '沈阳市浑南新区金卡路10号471', '阜新市海州区中华路109-8号109', '阜新', '2011/10/18', '2', '本科', '沈阳大学', '2010/7/1', '给水排水工程', '后勤', '文员', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('23', '王文海', '38', '男', '21010619741110431x', '已婚', '群众', '汉', '13840461949', '024-25770787', '13940389488（爱人）', '铁西区重工街12路19-1号361', '铁西区重工街12路19-1号361', '沈阳', '2010/9/1', '3', '大专', '沈阳市交通技校', '2003/9/1', '汽车驾驶', '后勤', '司机', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('24', '扈曙光', '23', '男', '150430198906274016', '未婚', '党员', '汉', '13998365000', '024-86165132', null, '沈阳市皇姑区长江北街60-11', '沈阳市皇姑区长江北街60-11', '沈阳', '2012/3/1', '1', '高中', '沈阳市第十一中学', '2008/7/1', '无', '后勤', '司机', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, null, null, '否', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('25', '马  一', '33', '女', '211322197907160026', '已婚', '党员', '汉', '13940216543', '无', '18602420860（爱人）', '沈阳市大东区北海街22号', '沈阳市铁西区赞工街八巷3好242', '沈阳', '2004.04.01', '9', '本科', '沈阳建筑大学', '2004/7/1', '土木工程', '后勤', '副主任', '高级工程师', '无', '2011.9', '00123281', '人力资源和社会保障厅', '评定', '21004308', '00311857', '04057766', '无', '01137', '无', '无', null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('26', '孙  彤', '23', '女', '210113198909020023', '未婚', '群众', '汉', '15998366919', '无', '13998840397（对象）', '沈阳市大东区联合路99-4号', '沈阳市沈北新区新城子街62-463', '沈阳', '2011/3/1', '2', '本科', '吉林大学(成人)', '2013/7/1', '农林经济管理', '财务', '文员', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('27', '李可义', '23', '男', '210104198902161417', '未婚', '预备党员', '汉', '13941864757', '无', '13840198019（父亲）', '大东区善邻路', '大东区新光路20—1号2—3—2', '沈阳', '2012/7/4', '1', '本科', '辽宁工程技术大学', '2012/7/1', '安全工程', '安全', '监理员', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('28', '史福娟', '23', '女', '210114198911253922', '未婚', '团员', '汉', '15141834746', '024-89286512', '13591649637（对象）', '沈阳北站', '于洪区平罗镇青堆子村6组314', '沈阳', '2012/7/4', '1', '本科', '辽宁工程技术大学', '2012/7/1', '安全工程', '安全', '监理员', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('29', '李晓威', '29', '女', '210102198304136626', '已婚', '党员', '汉', '18640548329', '024-23502328', '13190088988（母亲）', '沈阳市和平区同泽南街154号', '和平区南五马路234-2', '沈阳', '2008.09.01', '5', '本科', '巴黎索邦一大', '2007.07.01', '经济', '后勤', '文员', '助理政工师', '政工师', '2012.05.01', '2012340', null, null, null, null, null, null, null, null, null, null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('30', '孙  宁', '30', '男', '210103198206063315', '未婚', '党员', '汉', '13504946566', '无', '13700042356（父亲）', '沈阳市沈河区八纬路75-2号421', '沈阳市沈河区八纬路75-2号421', '沈阳', null, null, '本科', '辽宁工程技术大学', '2007/7/1', '土木工程（交通土建）', '土建', '主任助理', '助理工程师', '道桥', '2008', '0202214', '辽宁省人事厅', '评定', null, null, null, null, null, '20110409', null, null, null, null, null, '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('31', '支慧新', '48', '女', '210105196312310210', '已婚', '群众', '汉', '15242446161', '无', '13940016232（爱人）', '沈阳市和平区', '沈阳市大东区', '沈阳', '2012-12-01', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('32', '吴丹', '30', '女', '130303198312150923', '已婚', '群众', '汉', '13516034033', '无', '13903335170（父亲）', '沈阳市沈河区南塔东街31-4号152', '秦皇岛市山海关区关城南路6-3-6', '沈阳', '2013-02-01', '0', '硕士', '日本中京大学（私立）', '2009/3/1', '经营学', '后勤', '文员', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '无', '是', null, null, '在职', null, null);
insert into TMP_EMP_IMP (col1, col2, col3, col4, col5, col6, col7, col8, col9, col10, col11, col12, col13, col14, col15, col16, col17, col18, col19, col20, col21, col22, col23, col24, col25, col26, col27, col28, col29, col30, col31, col32, col33, col34, col35, col36, col37, col38, col39, col40, col41, col42, col43, col44, col45)
values ('33', '王加权', '29', '男', '210381198306041914', '已婚', '群众', '汉', '15904071196', '无', '13840474732（爱人）', '于洪区黄海路36—3', '沈阳市皇姑区嫩江街4号', '沈阳', '2004-5-27', '8', '大专', '辽宁经济职业技术学院', '2004/7/10', '工程项目管理', '土建', '总代', '工程师', '工程管理', '2010.11.29', '00245517', '辽宁省人力资源和社会保障厅', '评定', null, null, null, '000492', 'A01144', 'SY00252', '201101335', '2444', null, null, null, '是', null, null, '在职', null, null);
commit;
prompt 33 records loaded
prompt Loading T_CHECKLIST_PRJ...
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (1, '1000', '1000', '0', null, '监理单位安全管理');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (2, '1001', '1000', '1', null, '未建立监理安全生产责任制扣2分；无针对性扣1分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (3, '1002', '1000', '1', null, '未建立安全监理管理机构扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (4, '1003', '1000', '1', null, '未制定安全监理规划扣4分；无针对性扣2分；编审批程序不符合规定扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (5, '1004', '1000', '1', null, '未制定安全监理实施细则扣4分；无针对本现场危险性较大的分部分项工程内容编制的扣2分；编审批程序不符合规定扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (6, '1005', '1000', '1', null, '未制定监理安全事故应急救预案扣4分；编审批程序不符合规定扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (7, '2000', '2000', '0', null, '审查施工单位安全资料');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (8, '2001', '2000', '1', null, '未按规定审查施工单位资质和安全生产许可证，各扣2分；资质证书及安全生产许可证超过有效期未发现，扣1分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (9, '2002', '2000', '1', null, '未见脚手架钢管、扣件检测报告扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (10, '2003', '2000', '1', null, '未见施工单位与建设单位、总包单位和分包单位安全生产协议书，各扣1分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (11, '2004', '2000', '1', null, '未按规定审查特种作业人员的特种作业操作证，扣2分；特种作业操作证已过有效期限未发现，每发现一项扣0.5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (12, '2005', '2000', '1', null, '未审查安全帽、安全带、安全网的合格证及厂家生产许可证每发现一项扣0.5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (13, '2006', '2000', '1', null, '开工前、停工后未履行开工、复工、停工报告各扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (14, '2007', '2000', '1', null, '无分包单位资格报审表扣2分，分包单位资料不全每发现一项0.5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (15, '2008', '2000', '1', null, '未审查施工单位专项施工安全设施验收单扣5分、每缺一项扣1分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (16, '2009', '2000', '1', null, '未审查施工单位三级安全教育情况，扣2分；审查不全面扣1分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (17, '2010', '2000', '1', null, '未按规定审核安全防护、文明施工措施费用使用计划，扣1分；未检查安全防护、文明施工措施费用使用情况，扣0.5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (18, '2011', '2000', '1', null, '未按规定审查项目经理和专职安全生产管理人员资格证书，各扣2分，B、C证超过有效期未发现，每项扣0.5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (19, '3000', '3000', '0', null, '危险性较大的分部分项工程专项施工方案');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (20, '3001', '3000', '1', null, '未审查地下管线安全保护措施扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (21, '3002', '3000', '1', null, '未审查基坑支护、土方开挖、降水施工方案扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (22, '3003', '3000', '1', null, '未审查临电施工组织设计扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (23, '3004', '3000', '1', null, '未审查脚手架安、拆方案扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (24, '3005', '3000', '1', null, '未审查模板工程安全施工方案扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (25, '3006', '3000', '1', null, '未审查垂直运输设备安、拆施工方案扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (26, '3007', '3000', '1', null, '未审查起重吊装方案扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (27, '3008', '3000', '1', null, '未审查高处作业安全施工方案扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (28, '3009', '3000', '1', null, '未审查冬、雨季安全施工措施扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (29, '3010', '3000', '1', null, '未审查施工现场应急救援预案，扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (30, '3011', '3000', '1', null, '未见安全防火措施的扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (31, '3012', '3000', '1', null, '施工组织设计或专项施工方案不符合工程建设强制性标准之处未发现，每处扣1分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (32, '3013', '3000', '1', null, '未按规定审查核验与危险性较大工程有关的安全管理资料（如塔机、施工电梯、门式架、基坑监测），每项扣2分；未经检测合格且无通知单和暂停令及向甲方报告的每台扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (33, '3014', '3000', '1', null, '专项施工方案编审批程序不符合规定每处扣1分；应经专家组论证审查的未见论证审查报告或专家组人员组成和人数不符合有关规定未发现，扣5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (34, '4000', '4000', '0', null, '现场安全管理');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (35, '4001', '4000', '1', null, '监理日记未记载安全监理情况扣2分；不全面没缺一项扣0.5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (36, '4002', '4000', '1', null, '监理月报未记载安全监理情况扣2分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (37, '4003', '4000', '1', null, '未按规定要求进行巡查，每周无安全检查记录或每周未召开监理例会扣4分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (38, '4004', '4000', '1', null, '监理通知单无回复，未能形成闭合管理的每次扣1分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (39, '4005', '4000', '1', null, '危险性较大的分部分项工程施工前未按规定审查施工单位安全技术交底，扣2分；审查不全面每发现一项扣0.5分');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (40, '4006', '4000', '1', null, '对下列情况未及时下达安全隐患通知单的每项扣5分;1、现场存在比较严重的安全隐患；2、对危险性较大的分部分项工程无方案施工的或未经监理审查认可施工单位擅自施工的；3、对危险性较大的分部分项工程不按已审批的专项施工方案施工的或对已审批的专项施工方案作重大改动未重新履行编审批程序的');
insert into T_CHECKLIST_PRJ (id, check_code, upper_code, member, memo, checkcontent)
values (41, '4007', '4000', '1', null, '危险性较大的分部分项工程施工前未对各专业监理工程师进行安全监理交底的扣5分；');
commit;
prompt 41 records loaded
prompt Loading T_CODELIST...
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (231, 'PROFTYPE', '10', '职称类别', '教授级高级工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (232, 'PROFTYPE', '11', '职称类别', '高级工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (233, 'PROFTYPE', '12', '职称类别', '工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (234, 'PROFTYPE', '13', '职称类别', '助理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (235, 'PROFTYPE', '14', '职称类别', '技工', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (241, 'TRANSFERTYPE', '01', '调转类型', '离职', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (242, 'TRANSFERTYPE', '02', '调转类型', '内部调转', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (243, 'TRANSFERTYPE', '03', '调转类型', '辞退', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (244, 'EMPTYPE', '99', '员工类型', '终止', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (290, 'PROFTYPE', '16', '职称类别', '工程师(*)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (280, 'TITLE_ID', '16', '职称', '工程师(*)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (46, 'NATION', '46', '民族', '德昂族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (47, 'NATION', '47', '民族', '保安族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (48, 'NATION', '48', '民族', '裕固族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (49, 'NATION', '49', '民族', '京族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (50, 'NATION', '50', '民族', '塔塔尔族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (51, 'NATION', '51', '民族', '独龙族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (52, 'NATION', '52', '民族', '鄂伦春族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (53, 'NATION', '53', '民族', '赫哲族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (54, 'NATION', '54', '民族', '门巴族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (55, 'NATION', '55', '民族', '珞巴族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (56, 'NATION', '56', '民族', '基诺族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (57, 'NATION', '99', '民族', '其他', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (5, 'NATION', '05', '民族', '维吾尔族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (6, 'NATION', '06', '民族', '苗族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (7, 'NATION', '07', '民族', '彝族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (8, 'NATION', '08', '民族', '壮族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (9, 'NATION', '09', '民族', '布依族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (10, 'NATION', '10', '民族', '朝鲜族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (11, 'NATION', '11', '民族', '满族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (12, 'NATION', '12', '民族', '侗族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (13, 'NATION', '13', '民族', '瑶族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (14, 'NATION', '14', '民族', '白族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (15, 'NATION', '15', '民族', '土家族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (16, 'NATION', '16', '民族', '哈尼族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (17, 'NATION', '17', '民族', '哈萨克族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (18, 'NATION', '18', '民族', '傣族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (19, 'NATION', '19', '民族', '黎族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (20, 'NATION', '20', '民族', '傈傈族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (21, 'NATION', '21', '民族', '佤族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (22, 'NATION', '22', '民族', '畲族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (23, 'NATION', '23', '民族', '高山族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (24, 'NATION', '24', '民族', '拉祜族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (25, 'NATION', '25', '民族', '水族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (26, 'NATION', '26', '民族', '东乡族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (27, 'NATION', '27', '民族', '纳西族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (28, 'NATION', '28', '民族', '景颇族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (29, 'NATION', '29', '民族', '柯尔克孜族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (30, 'NATION', '30', '民族', '土族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (31, 'NATION', '31', '民族', '达翰尔族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (32, 'NATION', '32', '民族', '仫佬族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (33, 'NATION', '33', '民族', '羌族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (34, 'NATION', '34', '民族', '布朗族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (35, 'NATION', '35', '民族', '撒拉族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (36, 'NATION', '36', '民族', '毛南族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (37, 'NATION', '37', '民族', '仡佬族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (38, 'NATION', '38', '民族', '锡伯族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (39, 'NATION', '39', '民族', '阿昌族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (40, 'NATION', '40', '民族', '普米族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (41, 'NATION', '41', '民族', '塔吉克族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (42, 'NATION', '42', '民族', '怒族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (43, 'NATION', '43', '民族', '乌孜别克族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (44, 'NATION', '44', '民族', '俄罗斯族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (45, 'NATION', '45', '民族', '鄂温克族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1, 'NATION', '01', '民族', '汉族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (2, 'NATION', '02', '民族', '蒙古族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (3, 'NATION', '03', '民族', '回族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (4, 'NATION', '04', '民族', '藏族', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (100, 'MARRIAGE', '01', '婚姻状况', '未婚', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (101, 'MARRIAGE', '02', '婚姻状况', '已婚', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (102, 'MARRIAGE', '99', '婚姻状况', '未知', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (103, 'GENDER', '1', '性别', '男', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (104, 'GENDER', '2', '性别', '女', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (105, 'POLITIC', '1', '政治面貌', '党员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (106, 'POLITIC', '2', '政治面貌', '团员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (107, 'POLITIC', '3', '政治面貌', '群众', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (108, 'POLITIC', '9', '政治面貌', '其他', '1', '含民主党派和无党派人士');
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (109, 'DEPT_ID', 'B01', '部门/分公司', '第一分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (110, 'DEPT_ID', 'B02', '部门/分公司', '第二分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (111, 'DEPT_ID', 'B03', '部门/分公司', '第三分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (112, 'DEPT_ID', 'B04', '部门/分公司', '第四分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (113, 'DEPT_ID', 'B05', '部门/分公司', '第五分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (114, 'DEPT_ID', 'B06', '部门/分公司', '第六分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (115, 'DEPT_ID', 'B07', '部门/分公司', '第七分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (116, 'DEPT_ID', 'B08', '部门/分公司', '第八分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (117, 'DEPT_ID', 'B09', '部门/分公司', '第九分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (118, 'DEPT_ID', 'B10', '部门/分公司', '第十分公司', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (119, 'DEPT_ID', 'A00', '部门/分公司', '总部', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (120, 'DEPT_ID', 'A01', '部门/分公司', '直属部', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (121, 'ROLENAME', '100', '岗位', '总经理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (122, 'ROLENAME', '101', '岗位', '副总经理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (123, 'ROLENAME', '102', '岗位', '总工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (124, 'ROLENAME', '103', '岗位', '副总工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (125, 'ROLENAME', '104', '岗位', '分公司经理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (126, 'ROLENAME', '105', '岗位', '分公司副经理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (127, 'ROLENAME', '106', '岗位', '总监理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (128, 'ROLENAME', '107', '岗位', '总监代表', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (129, 'ROLENAME', '108', '岗位', '工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (130, 'ROLENAME', '109', '岗位', '监理员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (131, 'ROLENAME', '110', '岗位', '部长', '1', null);
commit;
prompt 100 records committed...
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (132, 'ROLENAME', '111', '岗位', '办公室文员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (133, 'ROLENAME', '112', '岗位', '总工办文员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (134, 'ROLENAME', '113', '岗位', '工程部文员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (135, 'ROLENAME', '114', '岗位', '财务部文员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (136, 'ROLENAME', '115', '岗位', '会计', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (137, 'ROLENAME', '116', '岗位', '出纳', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (138, 'ROLENAME', '117', '岗位', '司机', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (139, 'ROLENAME', '118', '岗位', '保洁人员', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (140, 'TITLE_ID', '10', '职称', '教授级高级工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (141, 'TITLE_ID', '11', '职称', '高级工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (142, 'TITLE_ID', '12', '职称', '工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (143, 'TITLE_ID', '13', '职称', '助理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (144, 'TITLE_ID', '14', '职称', '技工', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (145, 'TITLE_ID', '99', '职称', '其他', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (146, 'TITLENAME', '100', '职称专业', '土建', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (147, 'TITLENAME', '101', '职称专业', '水暖', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (148, 'TITLENAME', '102', '职称专业', '电气', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (149, 'TITLENAME', '103', '职称专业', '园林', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (150, 'TITLENAME', '104', '职称专业', '道桥', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (151, 'TITLENAME', '105', '职称专业', '市政', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (152, 'TITLENAME', '106', '职称专业', '装修', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (153, 'TITLENAME', '107', '职称专业', '安全', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (154, 'TITLENAME', '108', '职称专业', '文档', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (155, 'TITLENAME', '999', '职称专业', '其他', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (156, 'TITLEWORK', '100', '从事专业', '土建', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (157, 'TITLEWORK', '101', '从事专业', '水暖', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (158, 'TITLEWORK', '102', '从事专业', '电气', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (159, 'TITLEWORK', '103', '从事专业', '园林', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (160, 'TITLEWORK', '104', '从事专业', '道桥', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (161, 'TITLEWORK', '105', '从事专业', '市政', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (162, 'TITLEWORK', '106', '从事专业', '装修', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (163, 'TITLEWORK', '107', '从事专业', '安全', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (164, 'TITLEWORK', '108', '从事专业', '文档', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (165, 'TITLEWORK', '999', '从事专业', '其他', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (166, 'MASTER', '100', '主修专业', '土建', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (167, 'MASTER', '101', '主修专业', '水暖', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (168, 'MASTER', '102', '主修专业', '电气', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (169, 'MASTER', '103', '主修专业', '园林', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (170, 'MASTER', '104', '主修专业', '道桥', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (171, 'MASTER', '105', '主修专业', '市政', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (172, 'MASTER', '106', '主修专业', '装修', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (173, 'MASTER', '107', '主修专业', '安全', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (174, 'MASTER', '108', '主修专业', '文档', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (175, 'MASTER', '999', '主修专业', '其他', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (176, 'ARCHIVEKEEP', '1', '档案保管机构', '劳动局集体户', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (177, 'ARCHIVEKEEP', '2', '档案保管机构', '管理中心集体户', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (178, 'ARCHIVEKEEP', '3', '档案保管机构', '原单位', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (179, 'ARCHIVEKEEP', '9', '档案保管机构', '其他', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (180, 'INSUSTATUS', '1', '保险状态', '本单位参保', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (181, 'INSUSTATUS', '2', '保险状态', '检测中心参保', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (182, 'INSUSTATUS', '3', '保险状态', '非本单位参保', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (183, 'INSUSTATUS', '4', '保险状态', '停保', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (184, 'INSUSTATUS', '5', '保险状态', '未参保', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (185, 'INSUSTATUS', '6', '保险状态', '本单位退休', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (186, 'INSUSTATUS', '7', '保险状态', '非本单位退休', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (187, 'RELATION_TYPE', '1', '与本人关系', '父亲', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (188, 'RELATION_TYPE', '2', '与本人关系', '母亲', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (189, 'RELATION_TYPE', '3', '与本人关系', '亲属', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (190, 'RELATION_TYPE', '4', '与本人关系', '好友', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (191, 'RELATION_TYPE', '9', '与本人关系', '其他', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (199, 'EMPTYPE', '11', '员工类型', '在职', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (200, 'EMPTYPE', '21', '员工类型', '退休', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (221, 'REGTYPE', '01', '注册类别', '注册监理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (222, 'REGTYPE', '02', '注册类别', '注册建造师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (223, 'REGTYPE', '03', '注册类别', '注册造价工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (224, 'REGLEVEL', '01', '注册级别', '一级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (225, 'REGLEVEL', '02', '注册级别', '二级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (226, 'REGMAJOR', '101', '注册专业', '房屋建筑工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (227, 'REGMAJOR', '102', '注册专业', '市政公用工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (228, 'REGMAJOR', '103', '注册专业', '机电安装工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (229, 'REGMAJOR', '104', '注册专业', '公路工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (230, 'REGMAJOR', '105', '注册专业', '通信工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (916, 'CONSTRUCT_TYPE', '11', '结构类型', '砖混', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (917, 'CONSTRUCT_TYPE', '12', '结构类型', '框架', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (918, 'CONSTRUCT_TYPE', '13', '结构类型', '排架', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (919, 'CONSTRUCT_TYPE', '14', '结构类型', '剪力墙', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (920, 'CONSTRUCT_TYPE', '15', '结构类型', '框剪', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (900, 'PERFORMANCE', 'A', '综合评价', '优秀', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (901, 'PERFORMANCE', 'B', '综合评价', '良好', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (902, 'PERFORMANCE', 'C', '综合评价', '合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (903, 'PERFORMANCE', 'D', '综合评价', '不合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (904, 'PROF_PERF', 'A', '专业水平', '优秀', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (905, 'PROF_PERF', 'B', '专业水平', '良好', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (906, 'PROF_PERF', 'C', '专业水平', '合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (907, 'PROF_PERF', 'D', '专业水平', '不合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (908, 'WORK_PERF', 'A', '工作态度', '优秀', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (909, 'WORK_PERF', 'B', '工作态度', '良好', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (910, 'WORK_PERF', 'C', '工作态度', '合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (911, 'WORK_PERF', 'D', '工作态度', '不合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (912, 'MANAGE_PERF', 'A', '管理能力', '优秀', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (913, 'MANAGE_PERF', 'B', '管理能力', '良好', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (914, 'MANAGE_PERF', 'C', '管理能力', '合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (915, 'MANAGE_PERF', 'D', '管理能力', '不合格', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (245, 'REGLEVEL', '09', '注册级别', '无', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (457, 'CERT', '01', '证书名称', '省监理工程师证书', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (462, 'CERT', '06', '证书名称', '评价员证书', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (461, 'CERT', '05', '证书名称', '市政工程见证人证书', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (460, 'CERT', '04', '证书名称', '房屋建筑见证人证书', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (459, 'CERT', '03', '证书名称', '监理员证书', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (458, 'CERT', '02', '证书名称', '安全生产培训证书', '1', null);
commit;
prompt 200 records committed...
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (256, 'REWARD_PERSON', '01', '个人获奖证书', '国家优总理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (257, 'REWARD_PERSON', '02', '个人获奖证书', '国家优理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (258, 'REWARD_PERSON', '03', '个人获奖证书', '省优总监理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (259, 'REWARD_PERSON', '04', '个人获奖证书', '省优监理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (260, 'REWARD_PERSON', '05', '个人获奖证书', '市优总监理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (261, 'REWARD_PERSON', '06', '个人获奖证书', '市优监理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (262, 'REWARDTYPE', '03', '奖项', '世纪杯', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (263, 'REWARDTYPE', '04', '奖项', '三省观摩', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (264, 'REWARDTYPE', '05', '奖项', '优质主体', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (265, 'REWARDTYPE', '06', '奖项', '玫瑰杯', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (266, 'REWARDTYPE', '07', '奖项', '新貌杯', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (267, 'REWARDTYPE', '08', '奖项', '重点工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (921, 'CONSTRUCT_TYPE', '16', '结构类型', '框筒', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (922, 'CONSTRUCT_TYPE', '17', '结构类型', '筒体', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (923, 'CONSTRUCT_TYPE', '18', '结构类型', '钢结构', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (924, 'CONSTRUCT_TYPE', '19', '结构类型', '装配式', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (925, 'QUALITY_TARGET', '1', '质量目标', '鲁班奖', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (926, 'QUALITY_TARGET', '2', '质量目标', '世纪杯', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (927, 'QUALITY_TARGET', '3', '质量目标', '三市观摩', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (928, 'QUALITY_TARGET', '4', '质量目标', '玫瑰杯', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (929, 'SECURITY_LEVEL', '01', '安全等级', 'A级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (930, 'SECURITY_LEVEL', '02', '安全等级', 'B级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (931, 'SECURITY_LEVEL', '03', '安全等级', 'C级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (944, 'PRJ_TYPE', '13', '项目类型', '人防', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (943, 'PRJ_TYPE', '12', '项目类型', '机电', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (942, 'PRJ_TYPE', '11', '项目类型', '管道(市政)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (941, 'PRJ_TYPE', '10', '项目类型', '桥梁(市政)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (940, 'PRJ_TYPE', '09', '项目类型', '绿化(市政)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (939, 'PRJ_TYPE', '08', '项目类型', '道路(市政)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (938, 'PRJ_TYPE', '07', '项目类型', '厂房(房建)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (937, 'PRJ_TYPE', '06', '项目类型', '教学楼(房建)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (936, 'PRJ_TYPE', '05', '项目类型', '办公楼(房建)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (935, 'PRJ_TYPE', '04', '项目类型', '商业楼(房建)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (934, 'PRJ_TYPE', '03', '项目类型', '医院(房建)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (933, 'PRJ_TYPE', '02', '项目类型', '别墅(房建)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (932, 'PRJ_TYPE', '01', '项目类型', '住宅(房建)', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (945, 'PRJ_LEVEL', '1', '项目等级', '一级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (946, 'PRJ_LEVEL', '2', '项目等级', '二级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (947, 'PRJ_LEVEL', '3', '项目等级', '三级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (951, 'BUILDING_TYPE', '4', '工程分类', '超高层', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (950, 'BUILDING_TYPE', '3', '工程分类', '高层', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (949, 'BUILDING_TYPE', '2', '工程分类', '小高层', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (948, 'BUILDING_TYPE', '1', '工程分类', '多层', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (962, 'IMAGE_PROGRESS', '07', '形象进度', '竣工', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (961, 'IMAGE_PROGRESS', '06', '形象进度', '收尾', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (960, 'IMAGE_PROGRESS', '05', '形象进度', '配套', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (959, 'IMAGE_PROGRESS', '04', '形象进度', '初验', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (954, 'IMAGE_PROGRESS', '03', '形象进度', '装饰', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (953, 'IMAGE_PROGRESS', '02', '形象进度', '主体', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (952, 'IMAGE_PROGRESS', '01', '形象进度', '±0以下', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (964, 'PRJ_ARCHIVE', '0', '档案归档标志', '未归档', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (963, 'PRJ_ARCHIVE', '1', '档案归档标志', '已归档', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (965, 'PRJ_ROLE', '6', '项目中角色', '文档监理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (966, 'PRJ_ROLE', '5', '项目中角色', '电气监理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (967, 'PRJ_ROLE', '4', '项目中角色', '水暖监理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (968, 'PRJ_ROLE', '3', '项目中角色', '土建监理', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (969, 'PRJ_ROLE', '2', '项目中角色', '总代', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (970, 'PRJ_ROLE', '1', '项目中角色', '总监', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (988, 'UNIT_TYPE', '18', '项目角色', '机电设备安装', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (987, 'UNIT_TYPE', '17', '项目角色', '起重设备安装', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (986, 'UNIT_TYPE', '16', '项目角色', '建筑智能化', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (985, 'UNIT_TYPE', '15', '项目角色', '建筑防水', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (984, 'UNIT_TYPE', '14', '项目角色', '消防设施', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (983, 'UNIT_TYPE', '13', '项目角色', '电梯安装', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (982, 'UNIT_TYPE', '12', '项目角色', '钢结构', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (981, 'UNIT_TYPE', '11', '项目角色', '混凝土预制构件', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (980, 'UNIT_TYPE', '10', '项目角色', '商品混凝土', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (979, 'UNIT_TYPE', '09', '项目角色', '幕墙工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (978, 'UNIT_TYPE', '08', '项目角色', '装饰装修', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (977, 'UNIT_TYPE', '07', '项目角色', '土石方', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (976, 'UNIT_TYPE', '06', '项目角色', '基坑支护', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (975, 'UNIT_TYPE', '05', '项目角色', '总承包', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (974, 'UNIT_TYPE', '04', '项目角色', '设计单位', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (973, 'UNIT_TYPE', '03', '项目角色', '勘察单位', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (972, 'UNIT_TYPE', '02', '项目角色', '管理单位', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (971, 'UNIT_TYPE', '01', '项目角色', '建设单位', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (989, 'UNIT_TYPE', '19', '项目角色', '特种专业', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (997, 'QUALI_LEVEL', '33', '资质等级', '施工二级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (996, 'QUALI_LEVEL', '32', '资质等级', '施工一级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (995, 'QUALI_LEVEL', '31', '资质等级', '施工特级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (994, 'QUALI_LEVEL', '23', '资质等级', '设计丙级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (993, 'QUALI_LEVEL', '22', '资质等级', '设计乙级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (992, 'QUALI_LEVEL', '21', '资质等级', '设计甲级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (991, 'QUALI_LEVEL', '12', '资质等级', '勘察乙级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (990, 'QUALI_LEVEL', '11', '资质等级', '勘察甲级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (998, 'QUALI_LEVEL', '34', '资质等级', '施工三级', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (999, 'VALID', '1', '有效标志', '有效', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1000, 'VALID', '0', '有效标志', '无效', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1002, 'WEEKMEETING', '01', '周例会星期', '周一', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1003, 'WEEKMEETING', '02', '周例会星期', '周二', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1004, 'WEEKMEETING', '03', '周例会星期', '周三', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1005, 'WEEKMEETING', '04', '周例会星期', '周四', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1006, 'WEEKMEETING', '05', '周例会星期', '周五', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1007, 'WEEKMEETING', '06', '周例会星期', '周六', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1008, 'WEEKMEETING', '07', '周例会星期', '周日', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1009, 'WEEKMEETINGTIME', '01', '周例会时间', '0:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1010, 'WEEKMEETINGTIME', '02', '周例会时间', '0:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1011, 'WEEKMEETINGTIME', '03', '周例会时间', '1:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1012, 'WEEKMEETINGTIME', '04', '周例会时间', '1:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1013, 'WEEKMEETINGTIME', '05', '周例会时间', '2:00', '1', null);
commit;
prompt 300 records committed...
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1014, 'WEEKMEETINGTIME', '06', '周例会时间', '2:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1015, 'WEEKMEETINGTIME', '07', '周例会时间', '3:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1016, 'WEEKMEETINGTIME', '08', '周例会时间', '3:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1017, 'WEEKMEETINGTIME', '09', '周例会时间', '4:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1018, 'WEEKMEETINGTIME', '10', '周例会时间', '4:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1019, 'WEEKMEETINGTIME', '11', '周例会时间', '5:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1020, 'WEEKMEETINGTIME', '12', '周例会时间', '5:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1021, 'WEEKMEETINGTIME', '13', '周例会时间', '6:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1022, 'WEEKMEETINGTIME', '14', '周例会时间', '6:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1023, 'WEEKMEETINGTIME', '15', '周例会时间', '7:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1024, 'WEEKMEETINGTIME', '16', '周例会时间', '7:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1025, 'WEEKMEETINGTIME', '17', '周例会时间', '8:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1026, 'WEEKMEETINGTIME', '18', '周例会时间', '8:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1027, 'WEEKMEETINGTIME', '19', '周例会时间', '9:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1028, 'WEEKMEETINGTIME', '20', '周例会时间', '9:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1029, 'WEEKMEETINGTIME', '21', '周例会时间', '10:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1030, 'WEEKMEETINGTIME', '22', '周例会时间', '10:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1031, 'WEEKMEETINGTIME', '23', '周例会时间', '11:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1032, 'WEEKMEETINGTIME', '24', '周例会时间', '11:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1033, 'WEEKMEETINGTIME', '25', '周例会时间', '12:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1034, 'WEEKMEETINGTIME', '26', '周例会时间', '12:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1035, 'WEEKMEETINGTIME', '27', '周例会时间', '13:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (193, 'RELATION_TYPE', '5', '与本人关系', '配偶', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (246, 'OBTAINTYPE', '1', '获得类别', '评定', '1', '临时');
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (247, 'REWARDTYPE', '01', '奖项', '国家级重点奖项', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (248, 'REWARDTYPE', '02', '奖项', '鲁班奖', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1036, 'WEEKMEETINGTIME', '28', '周例会时间', '13:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1037, 'WEEKMEETINGTIME', '29', '周例会时间', '14:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1038, 'WEEKMEETINGTIME', '30', '周例会时间', '14:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1039, 'WEEKMEETINGTIME', '31', '周例会时间', '15:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1040, 'WEEKMEETINGTIME', '32', '周例会时间', '15:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1041, 'WEEKMEETINGTIME', '33', '周例会时间', '16:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1042, 'WEEKMEETINGTIME', '34', '周例会时间', '16:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1043, 'WEEKMEETINGTIME', '35', '周例会时间', '17:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1044, 'WEEKMEETINGTIME', '36', '周例会时间', '17:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1045, 'WEEKMEETINGTIME', '37', '周例会时间', '18:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1046, 'WEEKMEETINGTIME', '38', '周例会时间', '18:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1047, 'WEEKMEETINGTIME', '39', '周例会时间', '19:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1048, 'WEEKMEETINGTIME', '40', '周例会时间', '19:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1049, 'WEEKMEETINGTIME', '41', '周例会时间', '20:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1050, 'WEEKMEETINGTIME', '42', '周例会时间', '20:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1051, 'WEEKMEETINGTIME', '43', '周例会时间', '21:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1052, 'WEEKMEETINGTIME', '44', '周例会时间', '21:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1053, 'WEEKMEETINGTIME', '45', '周例会时间', '22:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1054, 'WEEKMEETINGTIME', '46', '周例会时间', '22:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1055, 'WEEKMEETINGTIME', '47', '周例会时间', '23:00', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1056, 'WEEKMEETINGTIME', '48', '周例会时间', '23:30', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1057, 'REGTYPE', '04', '注册类别', '注册安全监理工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1058, 'REGTYPE', '05', '注册类别', '注册勘察工程师', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1059, 'REGMAJOR', '106', '注册专业', '冶炼工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1060, 'REGMAJOR', '107', '注册专业', '矿山工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1061, 'REGMAJOR', '108', '注册专业', '化工石油工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1062, 'REGMAJOR', '109', '注册专业', '水利水电工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1063, 'REGMAJOR', '110', '注册专业', '电力工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1064, 'REGMAJOR', '111', '注册专业', '农林工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1065, 'REGMAJOR', '112', '注册专业', '铁路工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1066, 'REGMAJOR', '113', '注册专业', '港口与航道工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1067, 'REGMAJOR', '114', '注册专业', '航天航空工程', '1', null);
insert into T_CODELIST (id, code_type, code_value, code_type_desc, code_desc, valid, memo)
values (1068, 'REGMAJOR', '115', '注册专业', '供配电', '1', null);
commit;
prompt 359 records loaded
prompt Loading T_LOC...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370113000000', '370100000000', '山东省济南市长清区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370124000000', '370100000000', '山东省平阴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370181000000', '370100000000', '山东省章丘市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370200000000', '370000000000', '山东省青岛市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370201000000', '370200000000', '山东省青岛市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370202000000', '370200000000', '山东省青岛市市南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370203000000', '370200000000', '山东省青岛市市北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370211000000', '370200000000', '山东省青岛市黄岛区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370213000000', '370200000000', '山东省青岛市李沧区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370214000000', '370200000000', '山东省青岛市城阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370281000000', '370200000000', '山东省胶州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370283000000', '370200000000', '山东省平度市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370284000000', '370200000000', '山东省胶南市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370285000000', '370200000000', '山东省莱西市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370301000000', '370300000000', '山东省淄博市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370304000000', '370300000000', '山东省淄博市博山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370305000000', '370300000000', '山东省淄博市临淄区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370321000000', '370300000000', '山东省桓台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370322000000', '370300000000', '山东省高青县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370400000000', '370000000000', '山东省枣庄市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370401000000', '370400000000', '山东省枣庄市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370402000000', '370400000000', '山东省枣庄市市中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370406000000', '370400000000', '山东省枣庄市山亭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370481000000', '370400000000', '山东省滕州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370500000000', '370000000000', '山东省东营市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370501000000', '370500000000', '山东省东营市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370503000000', '370500000000', '山东省东营市河口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370521000000', '370500000000', '山东省垦利县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370522000000', '370500000000', '山东省利津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370601000000', '370600000000', '山东省烟台市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370602000000', '370600000000', '山东省烟台市芝罘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370611000000', '370600000000', '山东省烟台市福山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370612000000', '370600000000', '山东省烟台市牟平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370634000000', '370600000000', '山东省长岛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370681000000', '370600000000', '山东省龙口市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370683000000', '370600000000', '山东省莱州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370684000000', '370600000000', '山东省蓬莱市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370686000000', '370600000000', '山东省栖霞市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370687000000', '370600000000', '山东省海阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370701000000', '370700000000', '山东省潍坊市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370704000000', '370700000000', '山东省潍坊市坊子区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370705000000', '370700000000', '山东省潍坊市奎文区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370724000000', '370700000000', '山东省临朐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370725000000', '370700000000', '山东省昌乐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370781000000', '370700000000', '山东省青州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370783000000', '370700000000', '山东省寿光市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370784000000', '370700000000', '山东省安丘市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370786000000', '370700000000', '山东省昌邑市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370800000000', '370000000000', '山东省济宁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370802000000', '370800000000', '山东省济宁市市中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370811000000', '370800000000', '山东省济宁市任城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370826000000', '370800000000', '山东省微山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321203000000', '321200000000', '江苏省泰州市高港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321284000000', '321200000000', '江苏省姜堰市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321301000000', '321300000000', '江苏省宿迁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321311000000', '321300000000', '江苏省宿迁市宿豫区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321322000000', '321300000000', '江苏省沭阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321324000000', '321300000000', '江苏省泗洪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330000000000', null, '浙江省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330101000000', '330100000000', '浙江省杭州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330103000000', '330100000000', '浙江省杭州市下城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330105000000', '330100000000', '浙江省杭州市拱墅区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330106000000', '330100000000', '浙江省杭州市西湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330108000000', '330100000000', '浙江省杭州市滨江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330110000000', '330100000000', '浙江省杭州市余杭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330127000000', '330100000000', '浙江省淳安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330183000000', '330100000000', '浙江省富阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330200000000', '330000000000', '浙江省宁波市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330201000000', '330200000000', '浙江省宁波市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330203000000', '330200000000', '浙江省宁波市海曙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330204000000', '330200000000', '浙江省宁波市江东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330212000000', '330200000000', '浙江省宁波市鄞州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330225000000', '330200000000', '浙江省象山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330226000000', '330200000000', '浙江省宁海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330282000000', '330200000000', '浙江省慈溪市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330283000000', '330200000000', '浙江省奉化市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330301000000', '330300000000', '浙江省温州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330302000000', '330300000000', '浙江省温州市鹿城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330304000000', '330300000000', '浙江省温州市瓯海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330322000000', '330300000000', '浙江省洞头县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330324000000', '330300000000', '浙江省永嘉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330326000000', '330300000000', '浙江省平阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330329000000', '330300000000', '浙江省泰顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330381000000', '330300000000', '浙江省瑞安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330382000000', '330300000000', '浙江省乐清市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330401000000', '330400000000', '浙江省嘉兴市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330411000000', '330400000000', '浙江省嘉兴市秀洲区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330421000000', '330400000000', '浙江省嘉善县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330481000000', '330400000000', '浙江省海宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330482000000', '330400000000', '浙江省平湖市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330500000000', '330000000000', '浙江省湖州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330501000000', '330500000000', '浙江省湖州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330502000000', '330500000000', '浙江省湖州市吴兴区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330503000000', '330500000000', '浙江省湖州市南浔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330523000000', '330500000000', '浙江省安吉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330600000000', '330000000000', '浙江省绍兴市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330601000000', '330600000000', '浙江省绍兴市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330602000000', '330600000000', '浙江省绍兴市越城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330681000000', '330600000000', '浙江省诸暨市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330682000000', '330600000000', '浙江省上虞市', '2', null);
commit;
prompt 100 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330701000000', '330700000000', '浙江省金华市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330703000000', '330700000000', '浙江省金华市金东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330723000000', '330700000000', '浙江省武义县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330726000000', '330700000000', '浙江省浦江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330781000000', '330700000000', '浙江省兰溪市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330782000000', '330700000000', '浙江省义乌市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330800000000', '330000000000', '浙江省衢州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330802000000', '330800000000', '浙江省衢州市柯城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330803000000', '330800000000', '浙江省衢州市衢江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131125000000', '131100000000', '河北省安平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131126000000', '131100000000', '河北省故城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131128000000', '131100000000', '河北省阜城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131181000000', '131100000000', '河北省冀州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131182000000', '131100000000', '河北省深州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140000000000', null, '山西省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140100000000', '140000000000', '山西省太原市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140101000000', '140100000000', '山西省太原市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140105000000', '140100000000', '山西省太原市小店区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140108000000', '140100000000', '山西省太原市尖草坪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140109000000', '140100000000', '山西省太原市万柏林区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140110000000', '140100000000', '山西省太原市晋源区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140121000000', '140100000000', '山西省清徐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140123000000', '140100000000', '山西省娄烦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140181000000', '140100000000', '山西省古交市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140201000000', '140200000000', '山西省大同市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140211000000', '140200000000', '山西省大同市南郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140212000000', '140200000000', '山西省大同市新荣区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140221000000', '140200000000', '山西省阳高县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140222000000', '140200000000', '山西省天镇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140224000000', '140200000000', '山西省灵丘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140225000000', '140200000000', '山西省浑源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140226000000', '140200000000', '山西省左云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140300000000', '140000000000', '山西省阳泉市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140302000000', '140300000000', '山西省阳泉市城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140303000000', '140300000000', '山西省阳泉市矿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140311000000', '140300000000', '山西省阳泉市郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140321000000', '140300000000', '山西省平定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140400000000', '140000000000', '山西省长治市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140402000000', '140400000000', '山西省长治市城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140411000000', '140400000000', '山西省长治市郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140421000000', '140400000000', '山西省长治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140423000000', '140400000000', '山西省襄垣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140424000000', '140400000000', '山西省屯留县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140427000000', '140400000000', '山西省壶关县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140428000000', '140400000000', '山西省长子县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140430000000', '140400000000', '山西省沁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140431000000', '140400000000', '山西省沁源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140481000000', '140400000000', '山西省潞城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140500000000', '140000000000', '山西省晋城市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140521000000', '140500000000', '山西省沁水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140522000000', '140500000000', '山西省阳城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140524000000', '140500000000', '山西省陵川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140525000000', '140500000000', '山西省泽州县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140581000000', '140500000000', '山西省高平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140600000000', '140000000000', '山西省朔州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140602000000', '140600000000', '山西省朔州市朔城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140621000000', '140600000000', '山西省山阴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140622000000', '140600000000', '山西省应县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140623000000', '140600000000', '山西省右玉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140701000000', '140700000000', '山西省晋中市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140702000000', '140700000000', '山西省晋中市榆次区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140721000000', '140700000000', '山西省榆社县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140724000000', '140700000000', '山西省昔阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140725000000', '140700000000', '山西省寿阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140726000000', '140700000000', '山西省太谷县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140728000000', '140700000000', '山西省平遥县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140729000000', '140700000000', '山西省灵石县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140781000000', '140700000000', '山西省介休市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140801000000', '140800000000', '山西省运城市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140821000000', '140800000000', '山西省临猗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140822000000', '140800000000', '山西省万荣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140823000000', '140800000000', '山西省闻喜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340702000000', '340700000000', '安徽省铜陵市铜官山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340825000000', '340800000000', '安徽省太湖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341021000000', '341000000000', '安徽省歙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341122000000', '341100000000', '安徽省来安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341222000000', '341200000000', '安徽省太和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341324000000', '341300000000', '安徽省泗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341500000000', '340000000000', '安徽省六安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341600000000', '340000000000', '安徽省亳州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341701000000', '341700000000', '安徽省池州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341824000000', '341800000000', '安徽省绩溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350105000000', '350100000000', '福建省福州市马尾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350200000000', '350000000000', '福建省厦门市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350300000000', '350000000000', '福建省莆田市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350403000000', '350400000000', '福建省三明市三元区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350481000000', '350400000000', '福建省永安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350526000000', '350500000000', '福建省德化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350603000000', '350600000000', '福建省漳州市龙文区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350700000000', '350000000000', '福建省南平市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350782000000', '350700000000', '福建省武夷山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350824000000', '350800000000', '福建省武平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350924000000', '350900000000', '福建省寿宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360103000000', '360100000000', '江西省南昌市西湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360201000000', '360200000000', '江西省景德镇市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360402000000', '360400000000', '江西省九江市庐山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360430000000', '360400000000', '江西省彭泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360700000000', '360000000000', '江西省赣州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360727000000', '360700000000', '江西省龙南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360801000000', '360800000000', '江西省吉安市市辖区', '2', null);
commit;
prompt 200 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360826000000', '360800000000', '江西省泰和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360922000000', '360900000000', '江西省万载县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361001000000', '361000000000', '江西省抚州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361029000000', '361000000000', '江西省东乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361124000000', '361100000000', '江西省铅山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370101000000', '370100000000', '山东省济南市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370125000000', '370100000000', '山东省济阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370212000000', '370200000000', '山东省青岛市崂山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370303000000', '370300000000', '山东省淄博市张店区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370404000000', '370400000000', '山东省枣庄市峄城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370600000000', '370000000000', '山东省烟台市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370682000000', '370600000000', '山东省莱阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370702000000', '370700000000', '山东省潍坊市潍城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370785000000', '370700000000', '山东省高密市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370828000000', '370800000000', '山东省金乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370901000000', '370900000000', '山东省泰安市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371081000000', '371000000000', '山东省文登市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371201000000', '371200000000', '山东省莱芜市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371322000000', '371300000000', '山东省郯城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371402000000', '371400000000', '山东省德州市德城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371502000000', '371500000000', '山东省聊城市东昌府区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371622000000', '371600000000', '山东省阳信县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371725000000', '371700000000', '山东省郓城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410103000000', '410100000000', '河南省郑州市二七区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410185000000', '410100000000', '河南省登封市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410221000000', '410200000000', '河南省杞县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410304000000', '410300000000', '河南省洛阳市廛河回族区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410328000000', '410300000000', '河南省洛宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410411000000', '410400000000', '河南省平顶山市湛河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410505000000', '410500000000', '河南省安阳市殷都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410603000000', '410600000000', '河南省鹤壁市山城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410711000000', '410700000000', '河南省新乡市牧野区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410803000000', '410800000000', '河南省焦作市中站区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410900000000', '410000000000', '河南省濮阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411002000000', '411000000000', '河南省许昌市魏都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411122000000', '411100000000', '河南省临颍县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411281000000', '411200000000', '河南省义马市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411325000000', '411300000000', '河南省内乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411401000000', '411400000000', '河南省商丘市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411481000000', '411400000000', '河南省永城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411524000000', '411500000000', '河南省商城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411624000000', '411600000000', '河南省沈丘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411722000000', '411700000000', '河南省上蔡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420104000000', '420100000000', '湖北省武汉市乔口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420114000000', '420100000000', '湖北省武汉市蔡甸区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420222000000', '420200000000', '湖北省阳新县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420323000000', '420300000000', '湖北省竹山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420505000000', '420500000000', '湖北省宜昌市虎亭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150205000000', '150200000000', '内蒙古包头市石拐区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150221000000', '150200000000', '内蒙古土默特右旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150222000000', '150200000000', '内蒙古固阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321283000000', '321200000000', '江苏省泰兴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321323000000', '321300000000', '江苏省泗阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330104000000', '330100000000', '浙江省杭州市江干区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330182000000', '330100000000', '浙江省建德市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330205000000', '330200000000', '浙江省宁波市江北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330300000000', '330000000000', '浙江省温州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141030000000', '141000000000', '山西省大宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141101000000', '141100000000', '山西省吕梁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141128000000', '141100000000', '山西省方山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150102000000', '150100000000', '内蒙古呼和浩特市新城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150125000000', '150100000000', '内蒙古武川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150206000000', '150200000000', '内蒙古包头市白云矿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210801000000', '210800000000', '辽宁省营口市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210901000000', '210900000000', '辽宁省阜新市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211000000000', '210000000000', '辽宁省辽阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211021000000', '211000000000', '辽宁省辽阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211121000000', '211100000000', '辽宁省大洼县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230505000000', '230500000000', '黑龙江省双鸭山市四方台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230603000000', '230600000000', '黑龙江省大庆市龙凤区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230701000000', '230700000000', '黑龙江省伊春市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230709000000', '230700000000', '黑龙江省伊春市金山屯区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520381000000', '520300000000', '贵州省赤水市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520423000000', '520400000000', '贵州省镇宁布依族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522228000000', '522200000000', '贵州省沿河土家族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522326000000', '522300000000', '贵州省望谟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522425000000', '522400000000', '贵州省织金县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522622000000', '522600000000', '贵州省黄平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340800000000', '340000000000', '安徽省安庆市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340823000000', '340800000000', '安徽省枞阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341000000000', '340000000000', '安徽省黄山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341023000000', '341000000000', '安徽省黟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341125000000', '341100000000', '安徽省定远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341202000000', '341200000000', '安徽省阜阳市颍州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360300000000', '360000000000', '江西省萍乡市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360323000000', '360300000000', '江西省芦溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360425000000', '360400000000', '江西省永修县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360500000000', '360000000000', '江西省新余市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360622000000', '360600000000', '江西省余江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360724000000', '360700000000', '江西省上犹县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360731000000', '360700000000', '江西省于都县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371302000000', '371300000000', '山东省临沂市兰山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371326000000', '371300000000', '山东省平邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371422000000', '371400000000', '山东省宁津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371428000000', '371400000000', '山东省武城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371522000000', '371500000000', '山东省莘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371601000000', '371600000000', '山东省滨州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411527000000', '411500000000', '河南省淮滨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411622000000', '411600000000', '河南省西华县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411681000000', '411600000000', '河南省项城市', '2', null);
commit;
prompt 300 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411724000000', '411700000000', '河南省正阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420102000000', '420100000000', '湖北省武汉市江岸区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420113000000', '420100000000', '湖北省武汉市汉南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430600000000', '430000000000', '湖南省岳阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430626000000', '430600000000', '湖南省平江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430721000000', '430700000000', '湖南省安乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430781000000', '430700000000', '湖南省津市市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430901000000', '430900000000', '湖南省益阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130827000000', '130800000000', '河北省宽城满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130927000000', '130900000000', '河北省南皮县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131001000000', '131000000000', '河北省廊坊市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131100000000', '130000000000', '河北省衡水市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310120000000', '310100000000', '上海市奉贤区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320106000000', '320100000000', '江苏省南京市鼓楼区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320200000000', '320000000000', '江苏省无锡市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320281000000', '320200000000', '江苏省江阴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320322000000', '320300000000', '江苏省沛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320402000000', '320400000000', '江苏省常州市天宁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320503000000', '320500000000', '江苏省苏州市平江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320585000000', '320500000000', '江苏省太仓市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320683000000', '320600000000', '江苏省通州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320722000000', '320700000000', '江苏省东海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320811000000', '320800000000', '江苏省淮安市清浦区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320922000000', '320900000000', '江苏省滨海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321002000000', '321000000000', '江苏省扬州市广陵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321111000000', '321100000000', '江苏省镇江市润州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321282000000', '321200000000', '江苏省靖江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330100000000', '330000000000', '浙江省杭州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330122000000', '330100000000', '浙江省桐庐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330211000000', '330200000000', '浙江省宁波市镇海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330327000000', '330300000000', '浙江省苍南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330424000000', '330400000000', '浙江省海盐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330521000000', '330500000000', '浙江省德清县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330683000000', '330600000000', '浙江省嵊州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330784000000', '330700000000', '浙江省永康市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131127000000', '131100000000', '河北省景县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140107000000', '140100000000', '山西省太原市杏花岭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140202000000', '140200000000', '山西省大同市城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140227000000', '140200000000', '山西省大同县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140322000000', '140300000000', '山西省盂县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140426000000', '140400000000', '山西省黎城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140501000000', '140500000000', '山西省晋城市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140603000000', '140600000000', '山西省朔州市平鲁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140723000000', '140700000000', '山西省和顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140800000000', '140000000000', '山西省运城市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140827000000', '140800000000', '山西省垣曲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140902000000', '140900000000', '山西省忻州市忻府区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140930000000', '140900000000', '山西省河曲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141023000000', '141000000000', '山西省襄汾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141032000000', '141000000000', '山西省永和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141123000000', '141100000000', '山西省兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150101000000', '150100000000', '内蒙古呼和浩特市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150202000000', '150200000000', '内蒙古包头市东河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150304000000', '150300000000', '内蒙古乌海市乌达区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150424000000', '150400000000', '内蒙古林西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150502000000', '150500000000', '内蒙古通辽市科尔沁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150621000000', '150600000000', '内蒙古达拉特旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150723000000', '150700000000', '内蒙古鄂伦春自治旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150800000000', '150000000000', '内蒙古巴彦淖尔市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150826000000', '150800000000', '内蒙古杭锦后旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150928000000', '150900000000', '内蒙古察哈尔右翼后旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152500000000', '150000000000', '内蒙古锡林郭勒盟', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152527000000', '152500000000', '内蒙古太仆寺旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210100000000', '210000000000', '辽宁省沈阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210112000000', '210100000000', '辽宁省沈阳市东陵区(浑南新区)', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210204000000', '210200000000', '辽宁省大连市沙河口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210302000000', '210300000000', '辽宁省鞍山市铁东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210402000000', '210400000000', '辽宁省抚顺市新抚区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210502000000', '210500000000', '辽宁省本溪市平山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210604000000', '210600000000', '辽宁省丹东市振安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210727000000', '210700000000', '辽宁省义县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210881000000', '210800000000', '辽宁省盖州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210921000000', '210900000000', '辽宁省阜新蒙古族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211101000000', '211100000000', '辽宁省盘锦市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211224000000', '211200000000', '辽宁省昌图县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211322000000', '211300000000', '辽宁省建平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211421000000', '211400000000', '辽宁省绥中县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220104000000', '220100000000', '吉林省长春市朝阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220201000000', '220200000000', '吉林省吉林市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220301000000', '220300000000', '吉林省四平市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220422000000', '220400000000', '吉林省东辽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220581000000', '220500000000', '吉林省梅河口市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220625000000', '220600000000', '吉林省江源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220800000000', '220000000000', '吉林省白城市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222402000000', '222400000000', '吉林省图们市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230100000000', '230000000000', '黑龙江省哈尔滨市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230123000000', '230100000000', '黑龙江省依兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230182000000', '230100000000', '黑龙江省双城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230205000000', '230200000000', '黑龙江省齐齐哈尔市昂昂溪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230231000000', '230200000000', '黑龙江省拜泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230321000000', '230300000000', '黑龙江省鸡东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230406000000', '230400000000', '黑龙江省鹤岗市东山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230521000000', '230500000000', '黑龙江省集贤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230606000000', '230600000000', '黑龙江省大庆市大同区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230705000000', '230700000000', '黑龙江省伊春市西林区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230801000000', '230800000000', '黑龙江省佳木斯市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230882000000', '230800000000', '黑龙江省富锦市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231001000000', '231000000000', '黑龙江省牡丹江市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231085000000', '231000000000', '黑龙江省穆棱市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231200000000', '230000000000', '黑龙江省绥化市', '1', null);
commit;
prompt 400 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231281000000', '231200000000', '黑龙江省安达市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310103000000', '310100000000', '上海市卢湾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310114000000', '310100000000', '上海市嘉定区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '512021000000', '512000000000', '四川省安岳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513224000000', '513200000000', '四川省松潘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513233000000', '513200000000', '四川省红原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513329000000', '513300000000', '四川省新龙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513337000000', '513300000000', '四川省稻城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513427000000', '513400000000', '四川省宁南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513436000000', '513400000000', '四川省美姑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520112000000', '520100000000', '贵州省贵阳市乌当区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520221000000', '520200000000', '贵州省水城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520323000000', '520300000000', '贵州省绥阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520382000000', '520300000000', '贵州省仁怀市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522222000000', '522200000000', '贵州省江口县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522300000000', '520000000000', '贵州省黔西南布依族苗族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522424000000', '522400000000', '贵州省金沙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522629000000', '522600000000', '贵州省剑河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522701000000', '522700000000', '贵州省都匀市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522730000000', '522700000000', '贵州省龙里县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530112000000', '530100000000', '云南省昆明市西山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530181000000', '530100000000', '云南省安宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530325000000', '530300000000', '云南省富源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530423000000', '530400000000', '云南省通海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530521000000', '530500000000', '云南省施甸县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530624000000', '530600000000', '云南省大关县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530722000000', '530700000000', '云南省永胜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330903000000', '330900000000', '浙江省舟山市普陀区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331022000000', '331000000000', '浙江省三门县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331121000000', '331100000000', '浙江省青田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340101000000', '340100000000', '安徽省合肥市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340203000000', '340200000000', '安徽省芜湖市马塘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340303000000', '340300000000', '安徽省蚌埠市蚌山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340404000000', '340400000000', '安徽省淮南市谢家集区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340521000000', '340500000000', '安徽省当涂县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131122000000', '131100000000', '河北省武邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130823000000', '130800000000', '河北省平泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130824000000', '130800000000', '河北省滦平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130826000000', '130800000000', '河北省丰宁满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130828000000', '130800000000', '河北省围场满族蒙古族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130901000000', '130900000000', '河北省沧州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130903000000', '130900000000', '河北省沧州市运河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130921000000', '130900000000', '河北省沧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130922000000', '130900000000', '河北省青县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130923000000', '130900000000', '河北省东光县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130924000000', '130900000000', '河北省海兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130928000000', '130900000000', '河北省吴桥县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130929000000', '130900000000', '河北省献县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130981000000', '130900000000', '河北省泊头市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130983000000', '130900000000', '河北省黄骅市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130984000000', '130900000000', '河北省河间市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131000000000', '130000000000', '河北省廊坊市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131002000000', '131000000000', '河北省廊坊市安次区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131023000000', '131000000000', '河北省永清县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131024000000', '131000000000', '河北省香河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131025000000', '131000000000', '河北省大城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131028000000', '131000000000', '河北省大厂回族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131082000000', '131000000000', '河北省三河市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131101000000', '131100000000', '河北省衡水市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131102000000', '131100000000', '河北省衡水市桃城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310116000000', '310100000000', '上海市金山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310117000000', '310100000000', '上海市松江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310118000000', '310100000000', '上海市青浦区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310119000000', '310100000000', '上海市南汇区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310200000000', '310000000000', '上海市县', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320000000000', null, '江苏省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320100000000', '320000000000', '江苏省南京市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320101000000', '320100000000', '江苏省南京市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320102000000', '320100000000', '江苏省南京市玄武区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320103000000', '320100000000', '江苏省南京市白下区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320104000000', '320100000000', '江苏省南京市秦淮区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320107000000', '320100000000', '江苏省南京市下关区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320111000000', '320100000000', '江苏省南京市浦口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320113000000', '320100000000', '江苏省南京市栖霞区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320114000000', '320100000000', '江苏省南京市雨花台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320116000000', '320100000000', '江苏省南京市六合区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320124000000', '320100000000', '江苏省溧水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320125000000', '320100000000', '江苏省高淳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320201000000', '320200000000', '江苏省无锡市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320202000000', '320200000000', '江苏省无锡市崇安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320204000000', '320200000000', '江苏省无锡市北塘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320205000000', '320200000000', '江苏省无锡市锡山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320206000000', '320200000000', '江苏省无锡市惠山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320211000000', '320200000000', '江苏省无锡市滨湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320301000000', '320300000000', '江苏省徐州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320302000000', '320300000000', '江苏省徐州市鼓楼区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320303000000', '320300000000', '江苏省徐州市云龙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320304000000', '320300000000', '江苏省徐州市九里区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320311000000', '320300000000', '江苏省徐州市泉山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320321000000', '320300000000', '江苏省丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320323000000', '320300000000', '江苏省铜山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320381000000', '320300000000', '江苏省新沂市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320382000000', '320300000000', '江苏省邳州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320400000000', '320000000000', '江苏省常州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320401000000', '320400000000', '江苏省常州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320405000000', '320400000000', '江苏省常州市戚墅堰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320411000000', '320400000000', '江苏省常州市新北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320412000000', '320400000000', '江苏省常州市武进区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320481000000', '320400000000', '江苏省溧阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320482000000', '320400000000', '江苏省金坛市', '2', null);
commit;
prompt 500 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320500000000', '320000000000', '江苏省苏州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320502000000', '320500000000', '江苏省苏州市沧浪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320504000000', '320500000000', '江苏省苏州市金阊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320505000000', '320500000000', '江苏省苏州市虎丘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320506000000', '320500000000', '江苏省苏州市吴中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320581000000', '320500000000', '江苏省常熟市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320582000000', '320500000000', '江苏省张家港市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320583000000', '320500000000', '江苏省昆山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320584000000', '320500000000', '江苏省吴江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320600000000', '320000000000', '江苏省南通市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320602000000', '320600000000', '江苏省南通市崇川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320611000000', '320600000000', '江苏省南通市港闸区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320621000000', '320600000000', '江苏省海安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320623000000', '320600000000', '江苏省如东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320681000000', '320600000000', '江苏省启东市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320684000000', '320600000000', '江苏省海门市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320701000000', '320700000000', '江苏省连云港市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320705000000', '320700000000', '江苏省连云港市新浦区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320706000000', '320700000000', '江苏省连云港市海州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320721000000', '320700000000', '江苏省赣榆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320723000000', '320700000000', '江苏省灌云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320724000000', '320700000000', '江苏省灌南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320800000000', '320000000000', '江苏省淮安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320802000000', '320800000000', '江苏省淮安市清河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320803000000', '320800000000', '江苏省淮安市楚州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320804000000', '320800000000', '江苏省淮安市淮阴区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320829000000', '320800000000', '江苏省洪泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320830000000', '320800000000', '江苏省盱眙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320831000000', '320800000000', '江苏省金湖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320900000000', '320000000000', '江苏省盐城市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320901000000', '320900000000', '江苏省盐城市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320903000000', '320900000000', '江苏省盐城市盐都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320921000000', '320900000000', '江苏省响水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320923000000', '320900000000', '江苏省阜宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320924000000', '320900000000', '江苏省射阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320981000000', '320900000000', '江苏省东台市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320982000000', '320900000000', '江苏省大丰市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321000000000', '320000000000', '江苏省扬州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321001000000', '321000000000', '江苏省扬州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321011000000', '321000000000', '江苏省扬州市郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321023000000', '321000000000', '江苏省宝应县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321081000000', '321000000000', '江苏省仪征市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321084000000', '321000000000', '江苏省高邮市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321088000000', '321000000000', '江苏省江都市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321100000000', '320000000000', '江苏省镇江市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321102000000', '321100000000', '江苏省镇江市京口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321112000000', '321100000000', '江苏省镇江市丹徒区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321181000000', '321100000000', '江苏省丹阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321182000000', '321100000000', '江苏省扬中市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321200000000', '320000000000', '江苏省泰州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321201000000', '321200000000', '江苏省泰州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321202000000', '321200000000', '江苏省泰州市海陵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360423000000', '360400000000', '江西省武宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360424000000', '360400000000', '江西省修水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360426000000', '360400000000', '江西省德安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360428000000', '360400000000', '江西省都昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360429000000', '360400000000', '江西省湖口县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360481000000', '360400000000', '江西省瑞昌市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360502000000', '360500000000', '江西省新余市渝水区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360521000000', '360500000000', '江西省分宜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360600000000', '360000000000', '江西省鹰潭市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360601000000', '360600000000', '江西省鹰潭市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360602000000', '360600000000', '江西省鹰潭市月湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360701000000', '360700000000', '江西省赣州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360702000000', '360700000000', '江西省赣州市章贡区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360721000000', '360700000000', '江西省赣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360722000000', '360700000000', '江西省信丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360725000000', '360700000000', '江西省崇义县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360726000000', '360700000000', '江西省安远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360729000000', '360700000000', '江西省全南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360730000000', '360700000000', '江西省宁都县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360733000000', '360700000000', '江西省会昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360734000000', '360700000000', '江西省寻乌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360735000000', '360700000000', '江西省石城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360781000000', '360700000000', '江西省瑞金市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360800000000', '360000000000', '江西省吉安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360802000000', '360800000000', '江西省吉安市吉州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360803000000', '360800000000', '江西省吉安市青原区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360821000000', '360800000000', '江西省吉安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360823000000', '360800000000', '江西省峡江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360824000000', '360800000000', '江西省新干县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360825000000', '360800000000', '江西省永丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360828000000', '360800000000', '江西省万安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360829000000', '360800000000', '江西省安福县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360830000000', '360800000000', '江西省永新县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360881000000', '360800000000', '江西省井冈山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360902000000', '360900000000', '江西省宜春市袁州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360921000000', '360900000000', '江西省奉新县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360923000000', '360900000000', '江西省上高县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360924000000', '360900000000', '江西省宜丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360926000000', '360900000000', '江西省铜鼓县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360981000000', '360900000000', '江西省丰城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360982000000', '360900000000', '江西省樟树市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361000000000', '360000000000', '江西省抚州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361002000000', '361000000000', '江西省抚州市临川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361021000000', '361000000000', '江西省南城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361022000000', '361000000000', '江西省黎川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361024000000', '361000000000', '江西省崇仁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361025000000', '361000000000', '江西省乐安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361026000000', '361000000000', '江西省宜黄县', '2', null);
commit;
prompt 600 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361027000000', '361000000000', '江西省金溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361030000000', '361000000000', '江西省广昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361100000000', '360000000000', '江西省上饶市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361101000000', '361100000000', '江西省上饶市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361102000000', '361100000000', '江西省上饶市信州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361122000000', '361100000000', '江西省广丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361123000000', '361100000000', '江西省玉山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361125000000', '361100000000', '江西省横峰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361127000000', '361100000000', '江西省余干县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361128000000', '361100000000', '江西省鄱阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361129000000', '361100000000', '江西省万年县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361130000000', '361100000000', '江西省婺源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370000000000', null, '山东省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370100000000', '370000000000', '山东省济南市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370102000000', '370100000000', '山东省济南市历下区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370103000000', '370100000000', '山东省济南市市中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370105000000', '370100000000', '山东省济南市天桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370112000000', '370100000000', '山东省济南市历城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130207000000', '130200000000', '河北省唐山市丰南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130223000000', '130200000000', '河北省滦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130224000000', '130200000000', '河北省滦南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130225000000', '130200000000', '河北省乐亭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130227000000', '130200000000', '河北省迁西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130229000000', '130200000000', '河北省玉田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130281000000', '130200000000', '河北省遵化市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130283000000', '130200000000', '河北省迁安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130300000000', '130000000000', '河北省秦皇岛市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130301000000', '130300000000', '河北省市秦皇岛市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130302000000', '130300000000', '河北省秦皇岛市海港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130304000000', '130300000000', '河北省秦皇岛市北戴河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130321000000', '130300000000', '河北省青龙满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130322000000', '130300000000', '河北省昌黎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130323000000', '130300000000', '河北省抚宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130324000000', '130300000000', '河北省卢龙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130402000000', '130400000000', '河北省邯郸市邯山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130403000000', '130400000000', '河北省邯郸市丛台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130404000000', '130400000000', '河北省邯郸市复兴区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130406000000', '130400000000', '河北省邯郸市峰峰矿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130421000000', '130400000000', '河北省邯郸县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130424000000', '130400000000', '河北省成安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130425000000', '130400000000', '河北省大名县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130426000000', '130400000000', '河北省涉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130427000000', '130400000000', '河北省磁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130429000000', '130400000000', '河北省永年县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130430000000', '130400000000', '河北省邱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130431000000', '130400000000', '河北省鸡泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130433000000', '130400000000', '河北省馆陶县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130434000000', '130400000000', '河北省魏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130435000000', '130400000000', '河北省曲周县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130481000000', '130400000000', '河北省武安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130500000000', '130000000000', '河北省邢台市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130502000000', '130500000000', '河北省邢台市桥东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130503000000', '130500000000', '河北省邢台市桥西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130521000000', '130500000000', '河北省邢台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130522000000', '130500000000', '河北省临城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130523000000', '130500000000', '河北省内丘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130525000000', '130500000000', '河北省隆尧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130526000000', '130500000000', '河北省任县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130527000000', '130500000000', '河北省南和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130528000000', '130500000000', '河北省宁晋县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130530000000', '130500000000', '河北省新河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130531000000', '130500000000', '河北省广宗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130532000000', '130500000000', '河北省平乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130533000000', '130500000000', '河北省威县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130535000000', '130500000000', '河北省临西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130581000000', '130500000000', '河北省南宫市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130582000000', '130500000000', '河北省沙河市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130600000000', '130000000000', '河北省保定市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130601000000', '130600000000', '河北省保定市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130603000000', '130600000000', '河北省保定市北市区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130604000000', '130600000000', '河北省保定市南市区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130621000000', '130600000000', '河北省满城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130622000000', '130600000000', '河北省清苑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130624000000', '130600000000', '河北省阜平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130625000000', '130600000000', '河北省徐水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130626000000', '130600000000', '河北省定兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130627000000', '130600000000', '河北省唐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130629000000', '130600000000', '河北省容城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130630000000', '130600000000', '河北省涞源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130631000000', '130600000000', '河北省望都县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130632000000', '130600000000', '河北省安新县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130634000000', '130600000000', '河北省曲阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130635000000', '130600000000', '河北省蠡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130636000000', '130600000000', '河北省顺平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130637000000', '130600000000', '河北省博野县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130681000000', '130600000000', '河北省涿州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130682000000', '130600000000', '河北省定州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130683000000', '130600000000', '河北省安国市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130700000000', '130000000000', '河北省张家口市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130701000000', '130700000000', '河北省张家口市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130702000000', '130700000000', '河北省张家口市桥东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130703000000', '130700000000', '河北省张家口市桥西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130705000000', '130700000000', '河北省张家口市宣化区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130721000000', '130700000000', '河北省宣化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130722000000', '130700000000', '河北省张北县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130723000000', '130700000000', '河北省康保县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130724000000', '130700000000', '河北省沽源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130725000000', '130700000000', '河北省尚义县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130726000000', '130700000000', '河北省蔚县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130728000000', '130700000000', '河北省怀安县', '2', null);
commit;
prompt 700 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130729000000', '130700000000', '河北省万全县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130730000000', '130700000000', '河北省怀来县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130731000000', '130700000000', '河北省涿鹿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130733000000', '130700000000', '河北省崇礼县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130800000000', '130000000000', '河北省承德市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130801000000', '130800000000', '河北省承德市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130802000000', '130800000000', '河北省承德市双桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130804000000', '130800000000', '河北省承德市鹰手营子矿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130821000000', '130800000000', '河北省承德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130822000000', '130800000000', '河北省兴隆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150223000000', '150200000000', '内蒙古达尔罕茂明安联合旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150300000000', '150000000000', '内蒙古乌海市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150301000000', '150300000000', '内蒙古乌海市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150302000000', '150300000000', '内蒙古乌海市海勃湾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150400000000', '150000000000', '内蒙古赤峰市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150401000000', '150400000000', '内蒙古赤峰市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150402000000', '150400000000', '内蒙古赤峰市红山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150403000000', '150400000000', '内蒙古赤峰市元宝山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150404000000', '150400000000', '内蒙古赤峰市松山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150422000000', '150400000000', '内蒙古巴林左旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150423000000', '150400000000', '内蒙古巴林右旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150425000000', '150400000000', '内蒙古克什克腾旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150428000000', '150400000000', '内蒙古喀喇沁旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150429000000', '150400000000', '内蒙古宁城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150430000000', '150400000000', '内蒙古敖汉旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150500000000', '150000000000', '内蒙古通辽市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150501000000', '150500000000', '内蒙古通辽市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150522000000', '150500000000', '内蒙古科尔沁左翼后旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150523000000', '150500000000', '内蒙古开鲁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150524000000', '150500000000', '内蒙古库伦旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150525000000', '150500000000', '内蒙古奈曼旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150526000000', '150500000000', '内蒙古扎鲁特旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150600000000', '150000000000', '内蒙古鄂尔多斯市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150602000000', '150600000000', '内蒙古东胜区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150622000000', '150600000000', '内蒙古准格尔旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150623000000', '150600000000', '内蒙古鄂托克前旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150626000000', '150600000000', '内蒙古乌审旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150627000000', '150600000000', '内蒙古伊金霍洛旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150701000000', '150700000000', '内蒙古呼伦贝尔市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150721000000', '150700000000', '内蒙古阿荣旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150724000000', '150700000000', '内蒙古鄂温克族自治旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150725000000', '150700000000', '内蒙古陈巴尔虎旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150726000000', '150700000000', '内蒙古新巴尔虎左旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150727000000', '150700000000', '内蒙古新巴尔虎右旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211403000000', '211400000000', '辽宁省葫芦岛市龙港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211422000000', '211400000000', '辽宁省建昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211481000000', '211400000000', '辽宁省兴城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220000000000', null, '吉林省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220100000000', '220000000000', '吉林省长春市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220101000000', '220100000000', '吉林省长春市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220102000000', '220100000000', '吉林省长春市南关区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220105000000', '220100000000', '吉林省长春市二道区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220106000000', '220100000000', '吉林省长春市绿园区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220112000000', '220100000000', '吉林省长春市双阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220122000000', '220100000000', '吉林省农安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220182000000', '220100000000', '吉林省榆树市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220183000000', '220100000000', '吉林省德惠市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220200000000', '220000000000', '吉林省吉林市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220202000000', '220200000000', '吉林省吉林市昌邑区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220204000000', '220200000000', '吉林省吉林市船营区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220211000000', '220200000000', '吉林省吉林市丰满区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220221000000', '220200000000', '吉林省永吉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220281000000', '220200000000', '吉林省蛟河市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220282000000', '220200000000', '吉林省桦甸市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220284000000', '220200000000', '吉林省磐石市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220302000000', '220300000000', '吉林省四平市铁西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220323000000', '220300000000', '吉林省伊通满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220381000000', '220300000000', '吉林省公主岭市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220382000000', '220300000000', '吉林省双辽市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220400000000', '220000000000', '吉林省辽源市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220401000000', '220400000000', '吉林省辽源市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220403000000', '220400000000', '吉林省辽源市西安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220500000000', '220000000000', '吉林省通化市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220501000000', '220500000000', '吉林省通化市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220503000000', '220500000000', '吉林省通化市二道江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220521000000', '220500000000', '吉林省通化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220523000000', '220500000000', '吉林省辉南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220524000000', '220500000000', '吉林省柳河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220582000000', '220500000000', '吉林省集安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220600000000', '220000000000', '吉林省白山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220601000000', '220600000000', '吉林省白山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220602000000', '220600000000', '吉林省白山市八道江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220622000000', '220600000000', '吉林省靖宇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220623000000', '220600000000', '吉林省长白朝鲜族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220681000000', '220600000000', '吉林省临江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220702000000', '220700000000', '吉林省松原市宁江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220721000000', '220700000000', '吉林省前郭尔罗斯蒙古族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220722000000', '220700000000', '吉林省长岭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220723000000', '220700000000', '吉林省乾安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220724000000', '220700000000', '吉林省扶余县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220802000000', '220800000000', '吉林省白城市洮北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220821000000', '220800000000', '吉林省镇赉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220822000000', '220800000000', '吉林省通榆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220881000000', '220800000000', '吉林省洮南市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220882000000', '220800000000', '吉林省大安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222400000000', '220000000000', '吉林省延边朝鲜族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222403000000', '222400000000', '吉林省敦化市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222404000000', '222400000000', '吉林省珲春市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222405000000', '222400000000', '吉林省龙井市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222424000000', '222400000000', '吉林省汪清县', '2', null);
commit;
prompt 800 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222426000000', '222400000000', '吉林省安图县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230000000000', null, '黑龙江省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230101000000', '230100000000', '黑龙江省哈尔滨市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230103000000', '230100000000', '黑龙江省哈尔滨市南岗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230104000000', '230100000000', '黑龙江省哈尔滨市道外区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230106000000', '230100000000', '黑龙江省哈尔滨市香坊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230107000000', '230100000000', '黑龙江省哈尔滨市动力区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230108000000', '230100000000', '黑龙江省哈尔滨市平房区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230109000000', '230100000000', '黑龙江省哈尔滨市松北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230124000000', '230100000000', '黑龙江省方正县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230125000000', '230100000000', '黑龙江省宾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230126000000', '230100000000', '黑龙江省巴彦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230127000000', '230100000000', '黑龙江省木兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230129000000', '230100000000', '黑龙江省延寿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230181000000', '230100000000', '黑龙江省阿城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230183000000', '230100000000', '黑龙江省尚志市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230184000000', '230100000000', '黑龙江省五常市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230200000000', '230000000000', '黑龙江省齐齐哈尔市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230202000000', '230200000000', '黑龙江省齐齐哈尔市龙沙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230203000000', '230200000000', '黑龙江省齐齐哈尔市建华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230204000000', '230200000000', '黑龙江省齐齐哈尔市铁锋区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230206000000', '230200000000', '黑龙江省齐齐哈尔市富拉尔基区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230208000000', '230200000000', '黑龙江省齐齐哈尔市梅里斯达斡尔', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230221000000', '230200000000', '黑龙江省龙江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230223000000', '230200000000', '黑龙江省依安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230224000000', '230200000000', '黑龙江省泰来县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230225000000', '230200000000', '黑龙江省甘南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230227000000', '230200000000', '黑龙江省富裕县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230229000000', '230200000000', '黑龙江省克山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230281000000', '230200000000', '黑龙江省讷河市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230301000000', '230300000000', '黑龙江省鸡西市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230302000000', '230300000000', '黑龙江省鸡西市鸡冠区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230304000000', '230300000000', '黑龙江省鸡西市滴道区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230305000000', '230300000000', '黑龙江省鸡西市梨树区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230306000000', '230300000000', '黑龙江省鸡西市城子河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230307000000', '230300000000', '黑龙江省鸡西市麻山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230382000000', '230300000000', '黑龙江省密山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230400000000', '230000000000', '黑龙江省鹤岗市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230401000000', '230400000000', '黑龙江省鹤岗市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230402000000', '230400000000', '黑龙江省鹤岗市向阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230403000000', '230400000000', '黑龙江省鹤岗市工农区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230405000000', '230400000000', '黑龙江省鹤岗市兴安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230407000000', '230400000000', '黑龙江省鹤岗市兴山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230421000000', '230400000000', '黑龙江省萝北县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230422000000', '230400000000', '黑龙江省绥滨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230500000000', '230000000000', '黑龙江省双鸭山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230502000000', '230500000000', '黑龙江省双鸭山市尖山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230503000000', '230500000000', '黑龙江省双鸭山市岭东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230506000000', '230500000000', '黑龙江省双鸭山市宝山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230522000000', '230500000000', '黑龙江省友谊县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230524000000', '230500000000', '黑龙江省饶河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230600000000', '230000000000', '黑龙江省大庆市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230601000000', '230600000000', '黑龙江省大庆市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230602000000', '230600000000', '黑龙江省大庆市萨尔图区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230605000000', '230600000000', '黑龙江省大庆市红岗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230621000000', '230600000000', '黑龙江省肇州县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230622000000', '230600000000', '黑龙江省肇源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230623000000', '230600000000', '黑龙江省林甸县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230700000000', '230000000000', '黑龙江省伊春市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230702000000', '230700000000', '黑龙江省伊春市伊春区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230703000000', '230700000000', '黑龙江省伊春市南岔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230704000000', '230700000000', '黑龙江省伊春市友好区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230706000000', '230700000000', '黑龙江省伊春市翠峦区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230707000000', '230700000000', '黑龙江省伊春市新青区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230710000000', '230700000000', '黑龙江省伊春市五营区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230711000000', '230700000000', '黑龙江省伊春市乌马河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230712000000', '230700000000', '黑龙江省伊春市汤旺河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230713000000', '230700000000', '黑龙江省伊春市带岭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230715000000', '230700000000', '黑龙江省伊春市红星区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230716000000', '230700000000', '黑龙江省伊春市上甘岭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230722000000', '230700000000', '黑龙江省嘉荫县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230781000000', '230700000000', '黑龙江省铁力市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230802000000', '230800000000', '黑龙江省佳木斯市永红区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230804000000', '230800000000', '黑龙江省佳木斯市前进区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230805000000', '230800000000', '黑龙江省佳木斯市东风区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230811000000', '230800000000', '黑龙江省佳木斯市郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230822000000', '230800000000', '黑龙江省桦南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522636000000', '522600000000', '贵州省丹寨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522700000000', '520000000000', '贵州省黔南布依族苗族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522702000000', '522700000000', '贵州省福泉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522722000000', '522700000000', '贵州省荔波县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522725000000', '522700000000', '贵州省瓮安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522726000000', '522700000000', '贵州省独山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522727000000', '522700000000', '贵州省平塘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522729000000', '522700000000', '贵州省长顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522731000000', '522700000000', '贵州省惠水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522732000000', '522700000000', '贵州省三都水族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530000000000', null, '云南省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530100000000', '530000000000', '云南省昆明市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530102000000', '530100000000', '云南省昆明市五华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530103000000', '530100000000', '云南省昆明市盘龙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530111000000', '530100000000', '云南省昆明市官渡区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530113000000', '530100000000', '云南省昆明市东川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530122000000', '530100000000', '云南省晋宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530124000000', '530100000000', '云南省富民县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530125000000', '530100000000', '云南省宜良县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530126000000', '530100000000', '云南省石林彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530128000000', '530100000000', '云南省禄劝彝族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530129000000', '530100000000', '云南省寻甸回族彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530301000000', '530300000000', '云南省曲靖市市辖区', '2', null);
commit;
prompt 900 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530321000000', '530300000000', '云南省马龙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530322000000', '530300000000', '云南省陆良县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530323000000', '530300000000', '云南省师宗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530324000000', '530300000000', '云南省罗平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530328000000', '530300000000', '云南省沾益县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530381000000', '530300000000', '云南省宣威市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530400000000', '530000000000', '云南省玉溪市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530401000000', '530400000000', '云南省玉溪市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530421000000', '530400000000', '云南省江川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530422000000', '530400000000', '云南省澄江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530424000000', '530400000000', '云南省华宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530425000000', '530400000000', '云南省易门县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530427000000', '530400000000', '云南省新平彝族傣族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530428000000', '530400000000', '云南省元江哈尼族彝族傣族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530500000000', '530000000000', '云南省保山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530502000000', '530500000000', '云南省保山市隆阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530522000000', '530500000000', '云南省腾冲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530524000000', '530500000000', '云南省昌宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530600000000', '530000000000', '云南省昭通市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530602000000', '530600000000', '云南省昭通市昭阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530621000000', '530600000000', '云南省鲁甸县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530622000000', '530600000000', '云南省巧家县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530625000000', '530600000000', '云南省永善县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530626000000', '530600000000', '云南省绥江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530628000000', '530600000000', '云南省彝良县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530630000000', '530600000000', '云南省水富县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530702000000', '530700000000', '云南省丽江市古城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530721000000', '530700000000', '云南省玉龙纳西族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330824000000', '330800000000', '浙江省开化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330825000000', '330800000000', '浙江省龙游县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330881000000', '330800000000', '浙江省江山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330900000000', '330000000000', '浙江省舟山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330901000000', '330900000000', '浙江省舟山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330902000000', '330900000000', '浙江省舟山市定海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330921000000', '330900000000', '浙江省岱山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331000000000', '330000000000', '浙江省台州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331001000000', '331000000000', '浙江省台州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331002000000', '331000000000', '浙江省台州市椒江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331003000000', '331000000000', '浙江省台州市黄岩区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331004000000', '331000000000', '浙江省台州市路桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331023000000', '331000000000', '浙江省天台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331024000000', '331000000000', '浙江省仙居县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331081000000', '331000000000', '浙江省温岭市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331100000000', '330000000000', '浙江省丽水市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331101000000', '331100000000', '浙江省丽水市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331102000000', '331100000000', '浙江省丽水市莲都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331122000000', '331100000000', '浙江省缙云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331124000000', '331100000000', '浙江省松阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331125000000', '331100000000', '浙江省云和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331126000000', '331100000000', '浙江省庆元县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331181000000', '331100000000', '浙江省龙泉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340000000000', null, '安徽省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340100000000', '340000000000', '安徽省合肥市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340102000000', '340100000000', '安徽省合肥市瑶海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340103000000', '340100000000', '安徽省合肥市庐阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340104000000', '340100000000', '安徽省合肥市蜀山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340111000000', '340100000000', '安徽省合肥市包河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340122000000', '340100000000', '安徽省肥东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340123000000', '340100000000', '安徽省肥西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340201000000', '340200000000', '安徽省芜湖市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340204000000', '340200000000', '安徽省芜湖市新芜区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340207000000', '340200000000', '安徽省芜湖市鸠江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340221000000', '340200000000', '安徽省芜湖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340222000000', '340200000000', '安徽省繁昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340300000000', '340000000000', '安徽省蚌埠市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340301000000', '340300000000', '安徽省蚌埠市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340302000000', '340300000000', '安徽省蚌埠市龙子湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340304000000', '340300000000', '安徽省蚌埠市禹会区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340321000000', '340300000000', '安徽省怀远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340322000000', '340300000000', '安徽省五河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340323000000', '340300000000', '安徽省固镇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340400000000', '340000000000', '安徽省淮南市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340401000000', '340400000000', '安徽省淮南市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340402000000', '340400000000', '安徽省淮南市大通区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340405000000', '340400000000', '安徽省淮南市八公山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340406000000', '340400000000', '安徽省淮南市潘集区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340421000000', '340400000000', '安徽省凤台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340500000000', '340000000000', '安徽省马鞍山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340501000000', '340500000000', '安徽省马鞍山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340503000000', '340500000000', '安徽省马鞍山市花山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340504000000', '340500000000', '安徽省马鞍山市雨山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340600000000', '340000000000', '安徽省淮北市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340601000000', '340600000000', '安徽省淮北市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520114000000', '520100000000', '贵州省贵阳市小河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520122000000', '520100000000', '贵州省息烽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520123000000', '520100000000', '贵州省修文县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520181000000', '520100000000', '贵州省清镇市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520200000000', '520000000000', '贵州省六盘水市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520201000000', '520200000000', '贵州省钟山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520222000000', '520200000000', '贵州省盘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520300000000', '520000000000', '贵州省遵义市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520301000000', '520300000000', '贵州省遵义市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520302000000', '520300000000', '贵州省遵义市红花岗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520321000000', '520300000000', '贵州省遵义县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520322000000', '520300000000', '贵州省桐梓县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520324000000', '520300000000', '贵州省正安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520325000000', '520300000000', '贵州省道真仡佬族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520327000000', '520300000000', '贵州省凤冈县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520328000000', '520300000000', '贵州省湄潭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520329000000', '520300000000', '贵州省余庆县', '2', null);
commit;
prompt 1000 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520330000000', '520300000000', '贵州省习水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520400000000', '520000000000', '贵州省安顺市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520402000000', '520400000000', '贵州省安顺市西秀区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520421000000', '520400000000', '贵州省平坝县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520422000000', '520400000000', '贵州省普定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520424000000', '520400000000', '贵州省关岭布依族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522201000000', '522200000000', '贵州省铜仁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522223000000', '522200000000', '贵州省玉屏侗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522224000000', '522200000000', '贵州省石阡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522225000000', '522200000000', '贵州省思南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522226000000', '522200000000', '贵州省印江土家族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522229000000', '522200000000', '贵州省松桃苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522230000000', '522200000000', '贵州省万山特区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522301000000', '522300000000', '贵州省兴义市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522323000000', '522300000000', '贵州省普安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522324000000', '522300000000', '贵州省晴隆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522325000000', '522300000000', '贵州省贞丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522328000000', '522300000000', '贵州省安龙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522400000000', '520000000000', '贵州省毕节地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522401000000', '522400000000', '贵州省毕节市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522422000000', '522400000000', '贵州省大方县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522426000000', '522400000000', '贵州省纳雍县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522427000000', '522400000000', '贵州省威宁彝族回族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522600000000', '520000000000', '贵州省黔东南苗族侗族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522601000000', '522600000000', '贵州省凯里市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522623000000', '522600000000', '贵州省施秉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522624000000', '522600000000', '贵州省三穗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522626000000', '522600000000', '贵州省岑巩县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522627000000', '522600000000', '贵州省天柱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522628000000', '522600000000', '贵州省锦屏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522631000000', '522600000000', '贵州省黎平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522632000000', '522600000000', '贵州省榕江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522633000000', '522600000000', '贵州省从江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522634000000', '522600000000', '贵州省雷山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341322000000', '341300000000', '安徽省萧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341323000000', '341300000000', '安徽省灵璧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341400000000', '340000000000', '安徽省巢湖市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341401000000', '341400000000', '安徽省巢湖市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341421000000', '341400000000', '安徽省庐江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341422000000', '341400000000', '安徽省无为县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341423000000', '341400000000', '安徽省含山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341424000000', '341400000000', '安徽省和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341502000000', '341500000000', '安徽省六安市金安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341503000000', '341500000000', '安徽省六安市裕安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341521000000', '341500000000', '安徽省寿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341522000000', '341500000000', '安徽省霍邱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341523000000', '341500000000', '安徽省舒城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341525000000', '341500000000', '安徽省霍山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341601000000', '341600000000', '安徽省亳州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341602000000', '341600000000', '安徽省亳州市谯城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341621000000', '341600000000', '安徽省涡阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341623000000', '341600000000', '安徽省利辛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341700000000', '340000000000', '安徽省池州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341702000000', '341700000000', '安徽省池州市贵池区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341721000000', '341700000000', '安徽省东至县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341723000000', '341700000000', '安徽省青阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341801000000', '341800000000', '安徽省宣城市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341802000000', '341800000000', '安徽省宣城市宣州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341821000000', '341800000000', '安徽省郎溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341823000000', '341800000000', '安徽省泾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341825000000', '341800000000', '安徽省旌德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341881000000', '341800000000', '安徽省宁国市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350000000000', null, '福建省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350100000000', '350000000000', '福建省福州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350102000000', '350100000000', '福建省福州市鼓楼区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350103000000', '350100000000', '福建省福州市台江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350104000000', '350100000000', '福建省福州市仓山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350121000000', '350100000000', '福建省闽侯县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350122000000', '350100000000', '福建省连江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350123000000', '350100000000', '福建省罗源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350124000000', '350100000000', '福建省闽清县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350125000000', '350100000000', '福建省永泰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350181000000', '350100000000', '福建省福清市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350182000000', '350100000000', '福建省长乐市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350201000000', '350200000000', '福建省厦门市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350203000000', '350200000000', '福建省厦门市思明区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350206000000', '350200000000', '福建省厦门市湖里区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350211000000', '350200000000', '福建省厦门市集美区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350212000000', '350200000000', '福建省厦门市同安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350213000000', '350200000000', '福建省厦门市翔安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350301000000', '350300000000', '福建省莆田市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350303000000', '350300000000', '福建省莆田市涵江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350304000000', '350300000000', '福建省莆田市荔城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350305000000', '350300000000', '福建省莆田市秀屿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350322000000', '350300000000', '福建省仙游县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350401000000', '350400000000', '福建省三明市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350421000000', '350400000000', '福建省明溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350423000000', '350400000000', '福建省清流县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350424000000', '350400000000', '福建省宁化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350426000000', '350400000000', '福建省尤溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350428000000', '350400000000', '福建省将乐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350429000000', '350400000000', '福建省泰宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350500000000', '350000000000', '福建省泉州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350502000000', '350500000000', '福建省泉州市鲤城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350503000000', '350500000000', '福建省泉州市丰泽区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350521000000', '350500000000', '福建省惠安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350524000000', '350500000000', '福建省安溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350525000000', '350500000000', '福建省永春县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350527000000', '350500000000', '福建省金门县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350581000000', '350500000000', '福建省石狮市', '2', null);
commit;
prompt 1100 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350583000000', '350500000000', '福建省南安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350600000000', '350000000000', '福建省漳州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350601000000', '350600000000', '福建省漳州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350602000000', '350600000000', '福建省漳州市芗城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350623000000', '350600000000', '福建省漳浦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350624000000', '350600000000', '福建省诏安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350625000000', '350600000000', '福建省长泰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350626000000', '350600000000', '福建省东山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350628000000', '350600000000', '福建省平和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350629000000', '350600000000', '福建省华安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350681000000', '350600000000', '福建省龙海市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350701000000', '350700000000', '福建省南平市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350721000000', '350700000000', '福建省顺昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350722000000', '350700000000', '福建省浦城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350723000000', '350700000000', '福建省光泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350724000000', '350700000000', '福建省松溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350725000000', '350700000000', '福建省政和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350783000000', '350700000000', '福建省建瓯市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350784000000', '350700000000', '福建省建阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350802000000', '350800000000', '福建省龙岩市新罗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350821000000', '350800000000', '福建省长汀县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350822000000', '350800000000', '福建省永定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350823000000', '350800000000', '福建省上杭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350881000000', '350800000000', '福建省漳平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350900000000', '350000000000', '福建省宁德市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350901000000', '350900000000', '福建省宁德市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350902000000', '350900000000', '福建省宁德市蕉城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350921000000', '350900000000', '福建省霞浦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350923000000', '350900000000', '福建省屏南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350925000000', '350900000000', '福建省周宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350926000000', '350900000000', '福建省柘荣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350982000000', '350900000000', '福建省福鼎市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360000000000', null, '江西省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360100000000', '360000000000', '江西省南昌市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360101000000', '360100000000', '江西省南昌市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360102000000', '360100000000', '江西省南昌市东湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360105000000', '360100000000', '江西省南昌市湾里区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360111000000', '360100000000', '江西省南昌市青山湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360121000000', '360100000000', '江西省南昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360122000000', '360100000000', '江西省新建县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360123000000', '360100000000', '江西省安义县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360200000000', '360000000000', '江西省景德镇市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360202000000', '360200000000', '江西省景德镇市昌江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360203000000', '360200000000', '江西省景德镇市珠山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360222000000', '360200000000', '江西省浮梁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360301000000', '360300000000', '江西省萍乡市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360302000000', '360300000000', '江西省萍乡市安源区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360313000000', '360300000000', '江西省萍乡市湘东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360321000000', '360300000000', '江西省莲花县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360401000000', '360400000000', '江西省九江市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360421000000', '360400000000', '江西省九江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370830000000', '370800000000', '山东省汶上县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370831000000', '370800000000', '山东省泗水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370832000000', '370800000000', '山东省梁山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370882000000', '370800000000', '山东省兖州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370883000000', '370800000000', '山东省邹城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370900000000', '370000000000', '山东省泰安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370902000000', '370900000000', '山东省泰安市泰山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370921000000', '370900000000', '山东省宁阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370923000000', '370900000000', '山东省东平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370982000000', '370900000000', '山东省新泰市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370983000000', '370900000000', '山东省肥城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371000000000', '370000000000', '山东省威海市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371001000000', '371000000000', '山东省威海市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371082000000', '371000000000', '山东省荣成市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371083000000', '371000000000', '山东省乳山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371100000000', '370000000000', '山东省日照市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371101000000', '371100000000', '山东省日照市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371102000000', '371100000000', '山东省日照市东港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371122000000', '371100000000', '山东省莒县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371202000000', '371200000000', '山东省莱芜市莱城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371203000000', '371200000000', '山东省莱芜市钢城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371300000000', '370000000000', '山东省临沂市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371311000000', '371300000000', '山东省临沂市罗庄区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371312000000', '371300000000', '山东省临沂市河东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371321000000', '371300000000', '山东省沂南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371324000000', '371300000000', '山东省苍山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371325000000', '371300000000', '山东省费县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371328000000', '371300000000', '山东省蒙阴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371329000000', '371300000000', '山东省临沭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371400000000', '370000000000', '山东省德州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371401000000', '371400000000', '山东省德州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371423000000', '371400000000', '山东省庆云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371424000000', '371400000000', '山东省临邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371425000000', '371400000000', '山东省齐河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371427000000', '371400000000', '山东省夏津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371481000000', '371400000000', '山东省乐陵市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371482000000', '371400000000', '山东省禹城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371500000000', '370000000000', '山东省聊城市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371521000000', '371500000000', '山东省阳谷县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371523000000', '371500000000', '山东省茌平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371525000000', '371500000000', '山东省冠县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371526000000', '371500000000', '山东省高唐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371581000000', '371500000000', '山东省临清市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371600000000', '370000000000', '山东省滨州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371621000000', '371600000000', '山东省惠民县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371623000000', '371600000000', '山东省无棣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371624000000', '371600000000', '山东省沾化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371625000000', '371600000000', '山东省博兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371701000000', '371700000000', '山东省荷泽市市辖区', '2', null);
commit;
prompt 1200 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371702000000', '371700000000', '山东省荷泽市牡丹区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371721000000', '371700000000', '山东省曹县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371722000000', '371700000000', '山东省单县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371724000000', '371700000000', '山东省巨野县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371726000000', '371700000000', '山东省鄄城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371727000000', '371700000000', '山东省定陶县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410000000000', null, '河南省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410100000000', '410000000000', '河南省郑州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410101000000', '410100000000', '河南省郑州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410102000000', '410100000000', '河南省郑州市中原区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410104000000', '410100000000', '河南省郑州市管城回族区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410106000000', '410100000000', '河南省郑州市上街区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410108000000', '410100000000', '河南省郑州市邙山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410122000000', '410100000000', '河南省中牟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410181000000', '410100000000', '河南省巩义市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410183000000', '410100000000', '河南省新密市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410184000000', '410100000000', '河南省新郑市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410200000000', '410000000000', '河南省开封市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410201000000', '410200000000', '河南省开封市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410203000000', '410200000000', '河南省开封市顺河回族区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410204000000', '410200000000', '河南省开封市鼓楼区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410205000000', '410200000000', '河南省开封市南关区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410211000000', '410200000000', '河南省开封市郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410223000000', '410200000000', '河南省尉氏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410224000000', '410200000000', '河南省开封县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410225000000', '410200000000', '河南省兰考县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410300000000', '410000000000', '河南省洛阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410301000000', '410300000000', '河南省洛阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410303000000', '410300000000', '河南省洛阳市西工区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410305000000', '410300000000', '河南省洛阳市涧西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410306000000', '410300000000', '河南省洛阳市吉利区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410307000000', '410300000000', '河南省洛阳市洛龙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410323000000', '410300000000', '河南省新安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340602000000', '340600000000', '安徽省淮北市杜集区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340603000000', '340600000000', '安徽省淮北市相山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340621000000', '340600000000', '安徽省濉溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340701000000', '340700000000', '安徽省铜陵市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340703000000', '340700000000', '安徽省铜陵市狮子山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340721000000', '340700000000', '安徽省铜陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340801000000', '340800000000', '安徽省安庆市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340802000000', '340800000000', '安徽省安庆市迎江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340803000000', '340800000000', '安徽省安庆市大观区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340811000000', '340800000000', '安徽省安庆市郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340824000000', '340800000000', '安徽省潜山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340826000000', '340800000000', '安徽省宿松县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340828000000', '340800000000', '安徽省岳西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340881000000', '340800000000', '安徽省桐城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341001000000', '341000000000', '安徽省黄山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341002000000', '341000000000', '安徽省黄山市屯溪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341004000000', '341000000000', '安徽省黄山市徽州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341022000000', '341000000000', '安徽省休宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341100000000', '340000000000', '安徽省滁州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341101000000', '341100000000', '安徽省滁州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341102000000', '341100000000', '安徽省滁州市琅琊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341103000000', '341100000000', '安徽省滁州市南谯区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341126000000', '341100000000', '安徽省凤阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341181000000', '341100000000', '安徽省天长市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341182000000', '341100000000', '安徽省明光市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341200000000', '340000000000', '安徽省阜阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341203000000', '341200000000', '安徽省阜阳市颍东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341204000000', '341200000000', '安徽省阜阳市颍泉区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341221000000', '341200000000', '安徽省临泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341226000000', '341200000000', '安徽省颍上县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341282000000', '341200000000', '安徽省界首市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341301000000', '341300000000', '安徽省宿州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341302000000', '341300000000', '安徽省宿州市墉桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230826000000', '230800000000', '黑龙江省桦川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230833000000', '230800000000', '黑龙江省抚远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230881000000', '230800000000', '黑龙江省同江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230900000000', '230000000000', '黑龙江省七台河市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230901000000', '230900000000', '黑龙江省七台河市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230903000000', '230900000000', '黑龙江省七台河市桃山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230904000000', '230900000000', '黑龙江省七台河市茄子河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230921000000', '230900000000', '黑龙江省勃利县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231000000000', '230000000000', '黑龙江省牡丹江市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231002000000', '231000000000', '黑龙江省牡丹江市东安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231003000000', '231000000000', '黑龙江省牡丹江市阳明区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231005000000', '231000000000', '黑龙江省牡丹江市西安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231024000000', '231000000000', '黑龙江省东宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231025000000', '231000000000', '黑龙江省林口县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231081000000', '231000000000', '黑龙江省绥芬河市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231083000000', '231000000000', '黑龙江省海林市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231100000000', '230000000000', '黑龙江省黑河市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231101000000', '231100000000', '黑龙江省黑河市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231102000000', '231100000000', '黑龙江省黑河市爱辉区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231121000000', '231100000000', '黑龙江省嫩江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231124000000', '231100000000', '黑龙江省孙吴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231181000000', '231100000000', '黑龙江省北安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231182000000', '231100000000', '黑龙江省五大连池市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231201000000', '231200000000', '黑龙江省绥化市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231202000000', '231200000000', '黑龙江省绥化市北林区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231222000000', '231200000000', '黑龙江省兰西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231223000000', '231200000000', '黑龙江省青冈县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231224000000', '231200000000', '黑龙江省庆安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231225000000', '231200000000', '黑龙江省明水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231282000000', '231200000000', '黑龙江省肇东市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231283000000', '231200000000', '黑龙江省海伦市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '232700000000', '230000000000', '黑龙江省大兴安岭地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '232721000000', '232700000000', '黑龙江省呼玛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '232723000000', '232700000000', '黑龙江省漠河县', '2', null);
commit;
prompt 1300 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310000000000', null, '上海市', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310101000000', '310100000000', '上海市黄浦区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310104000000', '310100000000', '上海市徐汇区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310106000000', '310100000000', '上海市静安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310107000000', '310100000000', '上海市普陀区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310108000000', '310100000000', '上海市闸北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310109000000', '310100000000', '上海市虹口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310113000000', '310100000000', '上海市宝山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511921000000', '511900000000', '四川省通江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511922000000', '511900000000', '四川省南江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511923000000', '511900000000', '四川省平昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '512000000000', '510000000000', '四川省资阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '512001000000', '512000000000', '四川省资阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '512002000000', '512000000000', '四川省资阳市雁江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '512022000000', '512000000000', '四川省乐至县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '512081000000', '512000000000', '四川省简阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513200000000', '510000000000', '四川省阿坝藏族羌族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513221000000', '513200000000', '四川省汶川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513223000000', '513200000000', '四川省茂县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513225000000', '513200000000', '四川省九寨沟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513226000000', '513200000000', '四川省金川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513228000000', '513200000000', '四川省黑水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513229000000', '513200000000', '四川省马尔康县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513230000000', '513200000000', '四川省壤塘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513232000000', '513200000000', '四川省若尔盖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513321000000', '513300000000', '四川省康定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513322000000', '513300000000', '四川省泸定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513324000000', '513300000000', '四川省九龙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513325000000', '513300000000', '四川省雅江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513326000000', '513300000000', '四川省道孚县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513327000000', '513300000000', '四川省炉霍县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513330000000', '513300000000', '四川省德格县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513331000000', '513300000000', '四川省白玉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513332000000', '513300000000', '四川省石渠县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513334000000', '513300000000', '四川省理塘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513335000000', '513300000000', '四川省巴塘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513336000000', '513300000000', '四川省乡城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513400000000', '510000000000', '四川省凉山彝族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513401000000', '513400000000', '四川省西昌市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513422000000', '513400000000', '四川省木里藏族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513423000000', '513400000000', '四川省盐源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513424000000', '513400000000', '四川省德昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513426000000', '513400000000', '四川省会东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513428000000', '513400000000', '四川省普格县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513430000000', '513400000000', '四川省金阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513431000000', '513400000000', '四川省昭觉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513432000000', '513400000000', '四川省喜德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513433000000', '513400000000', '四川省冕宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513435000000', '513400000000', '四川省甘洛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513437000000', '513400000000', '四川省雷波县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520000000000', null, '贵州省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520100000000', '520000000000', '贵州省贵阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520101000000', '520100000000', '贵州省贵阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520103000000', '520100000000', '贵州省贵阳市云岩区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520111000000', '520100000000', '贵州省贵阳市花溪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520113000000', '520100000000', '贵州省贵阳市白云区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150781000000', '150700000000', '内蒙古满洲里市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150783000000', '150700000000', '内蒙古扎兰屯市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150785000000', '150700000000', '内蒙古根河市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150802000000', '150800000000', '内蒙古巴彦淖尔市临河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150821000000', '150800000000', '内蒙古五原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150822000000', '150800000000', '内蒙古磴口县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150823000000', '150800000000', '内蒙古乌拉特前旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150824000000', '150800000000', '内蒙古乌拉特中旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150825000000', '150800000000', '内蒙古乌拉特后旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150902000000', '150900000000', '内蒙古乌兰察布市集宁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150921000000', '150900000000', '内蒙古卓资县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150922000000', '150900000000', '内蒙古化德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150923000000', '150900000000', '内蒙古商都县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150924000000', '150900000000', '内蒙古兴和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150926000000', '150900000000', '内蒙古察哈尔右翼前旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150927000000', '150900000000', '内蒙古察哈尔右翼中旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150929000000', '150900000000', '内蒙古四子王旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152200000000', '150000000000', '内蒙古兴安盟', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152201000000', '152200000000', '内蒙古乌兰浩特市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152202000000', '152200000000', '内蒙古阿尔山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152221000000', '152200000000', '内蒙古科尔沁右翼前旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152222000000', '152200000000', '内蒙古科尔沁右翼中旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152224000000', '152200000000', '内蒙古突泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152501000000', '152500000000', '内蒙古二连浩特市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152502000000', '152500000000', '内蒙古锡林浩特市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152522000000', '152500000000', '内蒙古阿巴嘎旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152524000000', '152500000000', '内蒙古苏尼特右旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152525000000', '152500000000', '内蒙古东乌珠穆沁旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152526000000', '152500000000', '内蒙古西乌珠穆沁旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152528000000', '152500000000', '内蒙古镶黄旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152530000000', '152500000000', '内蒙古正蓝旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152531000000', '152500000000', '内蒙古多伦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152900000000', '150000000000', '内蒙古阿拉善盟', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152921000000', '152900000000', '内蒙古阿拉善左旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152922000000', '152900000000', '内蒙古阿拉善右旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210000000000', null, '辽宁省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210101000000', '210100000000', '辽宁省沈阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210102000000', '210100000000', '辽宁省沈阳市和平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210103000000', '210100000000', '辽宁省沈阳市沈河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210104000000', '210100000000', '辽宁省沈阳市大东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210106000000', '210100000000', '辽宁省沈阳市铁西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210111000000', '210100000000', '辽宁省沈阳市苏家屯区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210113000000', '210100000000', '辽宁省沈阳市沈北新区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210114000000', '210100000000', '辽宁省沈阳市于洪区', '2', null);
commit;
prompt 1400 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210123000000', '210100000000', '辽宁省康平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210124000000', '210100000000', '辽宁省法库县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210181000000', '210100000000', '辽宁省新民市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210201000000', '210200000000', '辽宁省大连市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210203000000', '210200000000', '辽宁省大连市西岗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210211000000', '210200000000', '辽宁省大连市甘井子区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210212000000', '210200000000', '辽宁省大连市旅顺口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210213000000', '210200000000', '辽宁省大连市金州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210281000000', '210200000000', '辽宁省瓦房店市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210282000000', '210200000000', '辽宁省普兰店市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210283000000', '210200000000', '辽宁省庄河市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210300000000', '210000000000', '辽宁省鞍山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210303000000', '210300000000', '辽宁省鞍山市铁西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210304000000', '210300000000', '辽宁省鞍山市立山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210311000000', '210300000000', '辽宁省鞍山市千山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210321000000', '210300000000', '辽宁省台安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210381000000', '210300000000', '辽宁省海城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210400000000', '210000000000', '辽宁省抚顺市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210401000000', '210400000000', '辽宁省抚顺市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210403000000', '210400000000', '辽宁省抚顺市东洲区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210404000000', '210400000000', '辽宁省抚顺市望花区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210421000000', '210400000000', '辽宁省抚顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210422000000', '210400000000', '辽宁省新宾满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210423000000', '210400000000', '辽宁省清原满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210500000000', '210000000000', '辽宁省本溪市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210501000000', '210500000000', '辽宁省本溪市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210504000000', '210500000000', '辽宁省本溪市明山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210505000000', '210500000000', '辽宁省本溪市南芬区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210521000000', '210500000000', '辽宁省本溪满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210522000000', '210500000000', '辽宁省桓仁满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210600000000', '210000000000', '辽宁省丹东市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210601000000', '210600000000', '辽宁省丹东市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210603000000', '210600000000', '辽宁省丹东市振兴区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210624000000', '210600000000', '辽宁省宽甸满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210681000000', '210600000000', '辽宁省东港市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210682000000', '210600000000', '辽宁省凤城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210702000000', '210700000000', '辽宁省锦州市古塔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210703000000', '210700000000', '辽宁省锦州市凌河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210711000000', '210700000000', '辽宁省锦州市太和区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210726000000', '210700000000', '辽宁省黑山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210782000000', '210700000000', '辽宁省北宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210800000000', '210000000000', '辽宁省营口市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210802000000', '210800000000', '辽宁省营口市站前区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210803000000', '210800000000', '辽宁省营口市西市区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210811000000', '210800000000', '辽宁省营口市老边区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210882000000', '210800000000', '辽宁省大石桥市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210900000000', '210000000000', '辽宁省阜新市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210902000000', '210900000000', '辽宁省阜新市海州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210904000000', '210900000000', '辽宁省阜新市太平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210905000000', '210900000000', '辽宁省阜新市清河门区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210911000000', '210900000000', '辽宁省阜新市细河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210922000000', '210900000000', '辽宁省彰武县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211002000000', '211000000000', '辽宁省辽阳市白塔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211003000000', '211000000000', '辽宁省辽阳市文圣区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211004000000', '211000000000', '辽宁省辽阳市宏伟区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211005000000', '211000000000', '辽宁省辽阳市弓长岭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211081000000', '211000000000', '辽宁省灯塔市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211100000000', '210000000000', '辽宁省盘锦市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211102000000', '211100000000', '辽宁省盘锦市双台子区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211103000000', '211100000000', '辽宁省盘锦市兴隆台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211201000000', '211200000000', '辽宁省铁岭市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211202000000', '211200000000', '辽宁省铁岭市银州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211204000000', '211200000000', '辽宁省铁岭市清河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211223000000', '211200000000', '辽宁省西丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211281000000', '211200000000', '辽宁省调兵山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211282000000', '211200000000', '辽宁省开原市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211300000000', '210000000000', '辽宁省朝阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211302000000', '211300000000', '辽宁省朝阳市双塔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211303000000', '211300000000', '辽宁省朝阳市龙城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211321000000', '211300000000', '辽宁省朝阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211324000000', '211300000000', '辽宁省喀喇沁左翼蒙古族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211382000000', '211300000000', '辽宁省凌源市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211400000000', '210000000000', '辽宁省葫芦岛市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211401000000', '211400000000', '辽宁省葫芦岛市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211402000000', '211400000000', '辽宁省葫芦岛市连山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420626000000', '420600000000', '湖北省保康县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420800000000', '420000000000', '湖北省荆门市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420902000000', '420900000000', '湖北省孝感市孝南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421002000000', '421000000000', '湖北省荆州市沙市区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421102000000', '421100000000', '湖北省黄冈市黄州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421182000000', '421100000000', '湖北省武穴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421300000000', '420000000000', '湖北省随州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422826000000', '422800000000', '湖北省咸丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430101000000', '430100000000', '湖南省长沙市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430200000000', '430000000000', '湖南省株洲市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430224000000', '430200000000', '湖南省茶陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430381000000', '430300000000', '湖南省湘乡市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430412000000', '430400000000', '湖南省衡阳市南岳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430502000000', '430500000000', '湖南省邵阳市双清区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430529000000', '430500000000', '湖南省城步苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430682000000', '430600000000', '湖南省临湘市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430726000000', '430700000000', '湖南省石门县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430921000000', '430900000000', '湖南省南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110000000000', null, '北京市', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420582000000', '420500000000', '湖北省当阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110100000000', '110000000000', '北京市市辖区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110101000000', '110100000000', '北京市东城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110103000000', '110100000000', '北京市崇文区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110104000000', '110100000000', '北京市宣武区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110105000000', '110100000000', '北京市朝阳区', '2', null);
commit;
prompt 1500 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110106000000', '110100000000', '北京市丰台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110108000000', '110100000000', '北京市海淀区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110109000000', '110100000000', '北京市门头沟区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110111000000', '110100000000', '北京市房山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110112000000', '110100000000', '北京市通州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110114000000', '110100000000', '北京市昌平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110115000000', '110100000000', '北京市大兴区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110116000000', '110100000000', '北京市怀柔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110117000000', '110100000000', '北京市平谷区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110200000000', '110000000000', '北京市县', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110229000000', '110200000000', '北京市延庆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120000000000', null, '天津市', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120100000000', '120000000000', '天津市市辖区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120101000000', '120100000000', '天津市和平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120102000000', '120100000000', '天津市河东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120103000000', '120100000000', '天津市河西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120105000000', '120100000000', '天津市河北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140824000000', '140800000000', '山西省稷山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140825000000', '140800000000', '山西省新绛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140828000000', '140800000000', '山西省夏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140829000000', '140800000000', '山西省平陆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140881000000', '140800000000', '山西省永济市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140882000000', '140800000000', '山西省河津市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140900000000', '140000000000', '山西省忻州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140901000000', '140900000000', '山西省忻州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140922000000', '140900000000', '山西省五台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140923000000', '140900000000', '山西省代县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140924000000', '140900000000', '山西省繁峙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140925000000', '140900000000', '山西省宁武县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140927000000', '140900000000', '山西省神池县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140928000000', '140900000000', '山西省五寨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140929000000', '140900000000', '山西省岢岚县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140932000000', '140900000000', '山西省偏关县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140981000000', '140900000000', '山西省原平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141000000000', '140000000000', '山西省临汾市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141001000000', '141000000000', '山西省临汾市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141021000000', '141000000000', '山西省曲沃县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141022000000', '141000000000', '山西省翼城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141024000000', '141000000000', '山西省洪洞县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141025000000', '141000000000', '山西省古县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141027000000', '141000000000', '山西省浮山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141028000000', '141000000000', '山西省吉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141029000000', '141000000000', '山西省乡宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141033000000', '141000000000', '山西省蒲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141034000000', '141000000000', '山西省汾西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141081000000', '141000000000', '山西省侯马市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141100000000', '140000000000', '山西省吕梁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141102000000', '141100000000', '山西省吕梁市离石区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141121000000', '141100000000', '山西省文水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141124000000', '141100000000', '山西省临县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141125000000', '141100000000', '山西省柳林县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141126000000', '141100000000', '山西省石楼县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141129000000', '141100000000', '山西省中阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141130000000', '141100000000', '山西省交口县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141181000000', '141100000000', '山西省孝义市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150000000000', null, '内蒙古自治区', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150103000000', '150100000000', '内蒙古呼和浩特市回民区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150104000000', '150100000000', '内蒙古呼和浩特市玉泉区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150121000000', '150100000000', '内蒙古土默特左旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150122000000', '150100000000', '内蒙古托克托县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150123000000', '150100000000', '内蒙古和林格尔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150124000000', '150100000000', '内蒙古清水河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150200000000', '150000000000', '内蒙古包头市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150203000000', '150200000000', '内蒙古包头市昆都仑区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150204000000', '150200000000', '内蒙古包头市青山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370827000000', '370800000000', '山东省鱼台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120106000000', '120100000000', '天津市红桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120107000000', '120100000000', '天津市塘沽区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120109000000', '120100000000', '天津市大港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120110000000', '120100000000', '天津市东丽区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120111000000', '120100000000', '天津市西青区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120112000000', '120100000000', '天津市津南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120114000000', '120100000000', '天津市武清区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120115000000', '120100000000', '天津市宝坻区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120221000000', '120200000000', '天津市宁河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120223000000', '120200000000', '天津市静海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130000000000', null, '河北省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130100000000', '130000000000', '河北省石家庄市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130101000000', '130100000000', '河北省石家庄市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130102000000', '130100000000', '河北省石家庄市长安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130103000000', '130100000000', '河北省石家庄市桥东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130104000000', '130100000000', '河北省石家庄市桥西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130107000000', '130100000000', '河北省石家庄市井陉矿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130108000000', '130100000000', '河北省石家庄市裕华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130121000000', '130100000000', '河北省井陉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130123000000', '130100000000', '河北省正定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130124000000', '130100000000', '河北省栾城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130126000000', '130100000000', '河北省灵寿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130127000000', '130100000000', '河北省高邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130128000000', '130100000000', '河北省深泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130129000000', '130100000000', '河北省赞皇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130131000000', '130100000000', '河北省平山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130132000000', '130100000000', '河北省元氏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130133000000', '130100000000', '河北省赵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130182000000', '130100000000', '河北省藁城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130183000000', '130100000000', '河北省晋州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130184000000', '130100000000', '河北省新乐市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130185000000', '130100000000', '河北省鹿泉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130200000000', '130000000000', '河北省唐山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130202000000', '130200000000', '河北省唐山市路南区', '2', null);
commit;
prompt 1600 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130203000000', '130200000000', '河北省唐山市路北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130204000000', '130200000000', '河北省唐山市古冶区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130205000000', '130200000000', '河北省唐山市开平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623025000000', '623000000000', '甘肃省玛曲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623026000000', '623000000000', '甘肃省碌曲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623027000000', '623000000000', '甘肃省夏河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630000000000', null, '青海省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630101000000', '630100000000', '青海省西宁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630103000000', '630100000000', '青海省西宁市城中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630104000000', '630100000000', '青海省西宁市城西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630105000000', '630100000000', '青海省西宁市城北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630121000000', '630100000000', '青海省大通回族土族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630123000000', '630100000000', '青海省湟源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632121000000', '632100000000', '青海省平安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632122000000', '632100000000', '青海省民和回族土族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632123000000', '632100000000', '青海省乐都县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632127000000', '632100000000', '青海省化隆回族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632128000000', '632100000000', '青海省循化撒拉族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632200000000', '630000000000', '青海省海北藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632222000000', '632200000000', '青海省祁连县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632223000000', '632200000000', '青海省海晏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632321000000', '632300000000', '青海省同仁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632322000000', '632300000000', '青海省尖扎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632323000000', '632300000000', '青海省泽库县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632324000000', '632300000000', '青海省河南蒙古族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632500000000', '630000000000', '青海省海南藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632524000000', '632500000000', '青海省兴海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632525000000', '632500000000', '青海省贵南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632621000000', '632600000000', '青海省玛沁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632624000000', '632600000000', '青海省达日县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632625000000', '632600000000', '青海省久治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632626000000', '632600000000', '青海省玛多县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632722000000', '632700000000', '青海省杂多县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632723000000', '632700000000', '青海省称多县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632724000000', '632700000000', '青海省治多县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632725000000', '632700000000', '青海省囊谦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632726000000', '632700000000', '青海省曲麻莱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632800000000', '630000000000', '青海省海西蒙古族藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632802000000', '632800000000', '青海省德令哈市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632822000000', '632800000000', '青海省都兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632823000000', '632800000000', '青海省天峻县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640000000000', null, '宁夏回族自治区', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640100000000', '640000000000', '宁夏银川市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640104000000', '640100000000', '宁夏银川市兴庆区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640105000000', '640100000000', '宁夏银川市西夏区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640106000000', '640100000000', '宁夏银川市金凤区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640122000000', '640100000000', '宁夏贺兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640200000000', '640000000000', '宁夏石嘴山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640201000000', '640200000000', '宁夏石嘴山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640202000000', '640200000000', '宁夏石嘴山市大武口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640205000000', '640200000000', '宁夏石嘴山市惠农区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640300000000', '640000000000', '宁夏吴忠市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640302000000', '640300000000', '宁夏吴忠市利通区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640323000000', '640300000000', '宁夏盐池县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640324000000', '640300000000', '宁夏同心县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640400000000', '640000000000', '宁夏固原市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640401000000', '640400000000', '宁夏固原市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640402000000', '640400000000', '宁夏固原市原州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640424000000', '640400000000', '宁夏泾源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640425000000', '640400000000', '宁夏彭阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640500000000', '640000000000', '宁夏中卫市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640501000000', '640500000000', '宁夏中卫市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640502000000', '640500000000', '宁夏中卫市沙坡头区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640522000000', '640500000000', '宁夏海原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650000000000', null, '新疆维吾尔自治区', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650101000000', '650100000000', '新疆乌鲁木齐市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650102000000', '650100000000', '新疆乌鲁木齐市天山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650104000000', '650100000000', '新疆乌鲁木齐市新市区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650105000000', '650100000000', '新疆乌鲁木齐市水磨沟区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650106000000', '650100000000', '新疆乌鲁木齐市头屯河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650107000000', '650100000000', '新疆乌鲁木齐市达坂城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650121000000', '650100000000', '新疆乌鲁木齐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650200000000', '650000000000', '新疆克拉玛依市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650202000000', '650200000000', '新疆克拉玛依市独山子区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650203000000', '650200000000', '新疆克拉玛依市克拉玛依区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650204000000', '650200000000', '新疆克拉玛依市白碱滩区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650205000000', '650200000000', '新疆克拉玛依市乌尔禾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652100000000', '650000000000', '新疆克拉玛依市吐鲁番地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652123000000', '652100000000', '新疆托克逊县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652200000000', '650000000000', '新疆哈密地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652201000000', '652200000000', '新疆哈密市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652222000000', '652200000000', '新疆巴里坤哈萨克自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652223000000', '652200000000', '新疆伊吾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652300000000', '650000000000', '新疆昌吉回族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652303000000', '652300000000', '新疆米泉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652323000000', '652300000000', '新疆呼图壁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652325000000', '652300000000', '新疆奇台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652327000000', '652300000000', '新疆吉木萨尔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652328000000', '652300000000', '新疆木垒哈萨克自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652701000000', '652700000000', '新疆博乐市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652723000000', '652700000000', '新疆温泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652800000000', '650000000000', '新疆巴音郭楞蒙古自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652801000000', '652800000000', '新疆库尔勒市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652822000000', '652800000000', '新疆轮台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652823000000', '652800000000', '新疆尉犁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652825000000', '652800000000', '新疆且末县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652826000000', '652800000000', '新疆焉耆回族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652900000000', '650000000000', '新疆阿克苏地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652901000000', '652900000000', '新疆阿克苏市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652922000000', '652900000000', '新疆温宿县', '2', null);
commit;
prompt 1700 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652923000000', '652900000000', '新疆库车县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652926000000', '652900000000', '新疆拜城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652929000000', '652900000000', '新疆柯坪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653000000000', '650000000000', '新疆克孜勒苏柯尔克孜自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653001000000', '653000000000', '新疆阿图什市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653023000000', '653000000000', '新疆阿合奇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653100000000', '650000000000', '新疆喀什地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653101000000', '653100000000', '新疆喀什市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653122000000', '653100000000', '新疆疏勒县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653125000000', '653100000000', '新疆莎车县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653126000000', '653100000000', '新疆叶城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653127000000', '653100000000', '新疆麦盖提县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653129000000', '653100000000', '新疆伽师县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653200000000', '650000000000', '新疆和田地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653201000000', '653200000000', '新疆和田市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653222000000', '653200000000', '新疆墨玉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653223000000', '653200000000', '新疆皮山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653224000000', '653200000000', '新疆洛浦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653226000000', '653200000000', '新疆于田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654002000000', '654000000000', '新疆伊宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654003000000', '654000000000', '新疆奎屯市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654022000000', '654000000000', '新疆察布查尔锡伯自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654023000000', '654000000000', '新疆霍城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654024000000', '654000000000', '新疆巩留县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654027000000', '654000000000', '新疆特克斯县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654028000000', '654000000000', '新疆尼勒克县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654200000000', '650000000000', '新疆塔城地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654221000000', '654200000000', '新疆额敏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654223000000', '654200000000', '新疆沙湾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654224000000', '654200000000', '新疆托里县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654226000000', '654200000000', '新疆和布克赛尔蒙古自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654300000000', '650000000000', '新疆阿勒泰地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654321000000', '654300000000', '新疆布尔津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654322000000', '654300000000', '新疆富蕴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654324000000', '654300000000', '新疆哈巴河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654325000000', '654300000000', '新疆青河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654326000000', '654300000000', '新疆吉木乃县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '659000000000', '650000000000', '新疆省直辖行政单位', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '659003000000', '659000000000', '新疆图木舒克市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '659004000000', '659000000000', '新疆五家渠市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '710000000000', null, '台湾省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '810000000000', null, '香港特别行政区', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '820000000000', null, '澳门特别行政区', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130925000000', '130900000000', '河北省盐山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131003000000', '131000000000', '河北省廊坊市广阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131081000000', '131000000000', '河北省霸州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131123000000', '131100000000', '河北省武强县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330700000000', '330000000000', '浙江省金华市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330727000000', '330700000000', '浙江省磐安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330801000000', '330800000000', '浙江省衢州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150625000000', '150600000000', '内蒙古杭锦旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150702000000', '150700000000', '内蒙古呼伦贝尔市海拉尔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220322000000', '220300000000', '吉林省梨树县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310110000000', '310100000000', '上海市杨浦区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530501000000', '530500000000', '云南省保山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530601000000', '530600000000', '云南省昭通市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530627000000', '530600000000', '云南省镇雄县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350425000000', '350400000000', '福建省大田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350430000000', '350400000000', '福建省建宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350504000000', '350500000000', '福建省泉州市洛江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370403000000', '370400000000', '山东省枣庄市薛城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370502000000', '370500000000', '山东省东营市东营区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410725000000', '410700000000', '河南省原阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410800000000', '410000000000', '河南省焦作市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410882000000', '410800000000', '河南省沁阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422802000000', '422800000000', '湖北省利川市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430000000000', null, '湖南省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430103000000', '430100000000', '湖南省长沙市天心区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440701000000', '440700000000', '广东省江门市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440785000000', '440700000000', '广东省恩平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440811000000', '440800000000', '广东省湛江市麻章区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451226000000', '451200000000', '广西环江毛南族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451321000000', '451300000000', '广西忻城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451423000000', '451400000000', '广西龙州县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460101000000', '460100000000', '海南省海口市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511681000000', '511600000000', '四川省华莹市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511722000000', '511700000000', '四川省宣汉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511801000000', '511800000000', '四川省雅安市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511826000000', '511800000000', '四川省芦山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610403000000', '610400000000', '陕西省咸阳市杨凌区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610427000000', '610400000000', '陕西省彬县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610481000000', '610400000000', '陕西省兴平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632300000000', '630000000000', '青海省黄南藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632523000000', '632500000000', '青海省贵德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632721000000', '632700000000', '青海省玉树县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120200000000', '120000000000', '天津市县', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130400000000', '130000000000', '河北省邯郸市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130900000000', '130000000000', '河北省沧州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320300000000', '320000000000', '江苏省徐州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320700000000', '320000000000', '江苏省连云港市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330400000000', '330000000000', '浙江省嘉兴市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140200000000', '140000000000', '山西省大同市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140700000000', '140000000000', '山西省晋中市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150100000000', '150000000000', '内蒙古呼和浩特市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150700000000', '150000000000', '内蒙古呼伦贝尔市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150900000000', '150000000000', '内蒙古乌兰察布市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210700000000', '210000000000', '辽宁省锦州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211200000000', '210000000000', '辽宁省铁岭市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220300000000', '220000000000', '吉林省四平市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220700000000', '220000000000', '吉林省松原市', '1', null);
commit;
prompt 1800 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230300000000', '230000000000', '黑龙江省鸡西市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230800000000', '230000000000', '黑龙江省佳木斯市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513300000000', '510000000000', '四川省甘孜藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522200000000', '520000000000', '贵州省铜仁地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530300000000', '530000000000', '云南省曲靖市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530700000000', '530000000000', '云南省丽江市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340200000000', '340000000000', '安徽省芜湖市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340700000000', '340000000000', '安徽省铜陵市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341800000000', '340000000000', '安徽省宣城市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350400000000', '350000000000', '福建省三明市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350800000000', '350000000000', '福建省龙岩市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360400000000', '360000000000', '江西省九江市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360900000000', '360000000000', '江西省宜春市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370700000000', '370000000000', '山东省潍坊市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371200000000', '370000000000', '山东省莱芜市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371700000000', '370000000000', '山东省荷泽市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410500000000', '410000000000', '河南省安阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411300000000', '410000000000', '河南省南阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420100000000', '420000000000', '湖北省武汉市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421200000000', '420000000000', '湖北省咸宁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430300000000', '430000000000', '湖南省湘潭市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430800000000', '430000000000', '湖南省张家界市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431300000000', '430000000000', '湖南省娄底市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440400000000', '440000000000', '广东省珠海市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440800000000', '440000000000', '广东省湛江市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441600000000', '440000000000', '广东省河源市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445100000000', '440000000000', '广东省潮州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450300000000', '450000000000', '广西桂林市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450700000000', '450000000000', '广西钦州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451200000000', '450000000000', '广西河池市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500100000000', '500000000000', '重庆市市辖区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510900000000', '510000000000', '四川省遂宁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511500000000', '510000000000', '四川省宜宾市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530800000000', '530000000000', '云南省思茅市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532800000000', '530000000000', '云南省西双版纳傣族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542200000000', '540000000000', '西藏山南地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542600000000', '540000000000', '西藏林芝地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610900000000', '610000000000', '陕西省安康市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620300000000', '620000000000', '甘肃省金昌市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620800000000', '620000000000', '甘肃省平凉市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622900000000', '620000000000', '甘肃省临夏回族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632600000000', '630000000000', '青海省果洛藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110107000000', '110100000000', '北京市石景山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110228000000', '110200000000', '北京市密云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120104000000', '120100000000', '天津市南开区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120113000000', '120100000000', '天津市北辰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120225000000', '120200000000', '天津市蓟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130105000000', '130100000000', '河北省石家庄市新华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130125000000', '130100000000', '河北省行唐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130201000000', '130200000000', '河北省唐山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130208000000', '130200000000', '河北唐山市省丰润区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130230000000', '130200000000', '河北省唐海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130303000000', '130300000000', '河北省秦皇岛市山海关区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130401000000', '130400000000', '河北省邯郸市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130428000000', '130400000000', '河北省肥乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130501000000', '130500000000', '河北省邢台市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430523000000', '430500000000', '湖南省邵阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430524000000', '430500000000', '湖南省隆回县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430527000000', '430500000000', '湖南省绥宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430528000000', '430500000000', '湖南省新宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430581000000', '430500000000', '湖南省武冈市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430602000000', '430600000000', '湖南省岳阳市岳阳楼区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430603000000', '430600000000', '湖南省岳阳市云溪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430611000000', '430600000000', '湖南省岳阳市君山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430621000000', '430600000000', '湖南省岳阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430623000000', '430600000000', '湖南省华容县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430681000000', '430600000000', '湖南省汨罗市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430700000000', '430000000000', '湖南省常德市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430701000000', '430700000000', '湖南省常德市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430703000000', '430700000000', '湖南省常德市鼎城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430722000000', '430700000000', '湖南省汉寿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430723000000', '430700000000', '湖南省澧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430725000000', '430700000000', '湖南省桃源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430801000000', '430800000000', '湖南省张家界市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430811000000', '430800000000', '湖南省张家界市武陵源区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430821000000', '430800000000', '湖南省慈利县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430822000000', '430800000000', '湖南省桑植县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430900000000', '430000000000', '湖南省益阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430902000000', '430900000000', '湖南省益阳市资阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430922000000', '430900000000', '湖南省桃江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430923000000', '430900000000', '湖南省安化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430981000000', '430900000000', '湖南省沅江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431000000000', '430000000000', '湖南省郴州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621100000000', '620000000000', '甘肃省定西市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542331000000', '542300000000', '西藏康马县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431001000000', '431000000000', '湖南省郴州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431003000000', '431000000000', '湖南省郴州市苏仙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431021000000', '431000000000', '湖南省桂阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431023000000', '431000000000', '湖南省永兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431024000000', '431000000000', '湖南省嘉禾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431026000000', '431000000000', '湖南省汝城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431027000000', '431000000000', '湖南省桂东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431028000000', '431000000000', '湖南省安仁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431081000000', '431000000000', '湖南省资兴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431102000000', '431100000000', '湖南省永州市芝山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431103000000', '431100000000', '湖南省永州市冷水滩区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431121000000', '431100000000', '湖南省祁阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431122000000', '431100000000', '湖南省东安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431123000000', '431100000000', '湖南省双牌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431125000000', '431100000000', '湖南省江永县', '2', null);
commit;
prompt 1900 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431127000000', '431100000000', '湖南省蓝山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431129000000', '431100000000', '湖南省江华瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431200000000', '430000000000', '湖南省怀化市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431201000000', '431200000000', '湖南省怀化市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431202000000', '431200000000', '湖南省怀化市鹤城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431223000000', '431200000000', '湖南省辰溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431224000000', '431200000000', '湖南省溆浦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431225000000', '431200000000', '湖南省会同县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431226000000', '431200000000', '湖南省麻阳苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431228000000', '431200000000', '湖南省芷江侗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431229000000', '431200000000', '湖南省靖州苗族侗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431281000000', '431200000000', '湖南省洪江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431301000000', '431300000000', '湖南省娄底市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431321000000', '431300000000', '湖南省双峰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431322000000', '431300000000', '湖南省新化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431381000000', '431300000000', '湖南省冷水江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431382000000', '431300000000', '湖南省涟源市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433100000000', '430000000000', '湖南省湘西土家族苗族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433123000000', '433100000000', '湖南省凤凰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433124000000', '433100000000', '湖南省花垣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433125000000', '433100000000', '湖南省保靖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433126000000', '433100000000', '湖南省古丈县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433130000000', '433100000000', '湖南省龙山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440000000000', null, '广东省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440100000000', '440000000000', '广东省广州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440102000000', '440100000000', '广东省广州市东山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440103000000', '440100000000', '广东省广州市荔湾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440105000000', '440100000000', '广东省广州市海珠区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440106000000', '440100000000', '广东省广州市天河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440107000000', '440100000000', '广东省广州市芳村区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440111000000', '440100000000', '广东省广州市白云区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440113000000', '440100000000', '广东省广州市番禺区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440183000000', '440100000000', '广东省增城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440184000000', '440100000000', '广东省从化市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440200000000', '440000000000', '广东省韶关市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440201000000', '440200000000', '广东省韶关市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440203000000', '440200000000', '广东省韶关市武江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440204000000', '440200000000', '广东省韶关市浈江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440221000000', '440200000000', '广东省曲江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440224000000', '440200000000', '广东省仁化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440232000000', '440200000000', '广东省乳源瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440233000000', '440200000000', '广东省新丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440281000000', '440200000000', '广东省乐昌市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440282000000', '440200000000', '广东省南雄市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440300000000', '440000000000', '广东省深圳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440304000000', '440300000000', '广东省深圳市福田区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440305000000', '440300000000', '广东省深圳市南山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440306000000', '440300000000', '广东省深圳市宝安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440307000000', '440300000000', '广东省深圳市龙岗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440401000000', '440400000000', '广东省珠海市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440402000000', '440400000000', '广东省珠海市香洲区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440403000000', '440400000000', '广东省珠海市斗门区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440500000000', '440000000000', '广东省汕头市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440501000000', '440500000000', '广东省汕头市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440511000000', '440500000000', '广东省汕头市金平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440512000000', '440500000000', '广东省汕头市濠江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440513000000', '440500000000', '广东省汕头市潮阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440514000000', '440500000000', '广东省汕头市潮南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440600000000', '440000000000', '广东省佛山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440601000000', '440600000000', '广东省佛山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440604000000', '440600000000', '广东省佛山市禅城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440605000000', '440600000000', '广东省佛山市南海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440606000000', '440600000000', '广东省佛山市顺德区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440608000000', '440600000000', '广东省佛山市高明区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440703000000', '440700000000', '广东省江门市蓬江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440704000000', '440700000000', '广东省江门市江海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440705000000', '440700000000', '广东省江门市新会区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440781000000', '440700000000', '广东省台山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440784000000', '440700000000', '广东省鹤山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440801000000', '440800000000', '广东省湛江市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440803000000', '440800000000', '广东省湛江市霞山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440823000000', '440800000000', '广东省遂溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440825000000', '440800000000', '广东省徐闻县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440881000000', '440800000000', '广东省廉江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440882000000', '440800000000', '广东省雷州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440883000000', '440800000000', '广东省吴川市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610104000000', '610100000000', '陕西省西安市莲湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610116000000', '610100000000', '陕西省西安市长安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610202000000', '610200000000', '陕西省铜川市王益区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610302000000', '610300000000', '陕西省宝鸡市渭滨区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610326000000', '610300000000', '陕西省眉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610425000000', '610400000000', '陕西省礼泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610430000000', '610400000000', '陕西省淳化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610522000000', '610500000000', '陕西省潼关县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610523000000', '610500000000', '陕西省大荔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610602000000', '610600000000', '陕西省延安市宝塔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610626000000', '610600000000', '陕西省吴旗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610631000000', '610600000000', '陕西省黄龙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610727000000', '610700000000', '陕西省略阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610801000000', '610800000000', '陕西省榆林市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610825000000', '610800000000', '陕西省定边县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610830000000', '610800000000', '陕西省清涧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610922000000', '610900000000', '陕西省石泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610927000000', '610900000000', '陕西省镇坪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611025000000', '611000000000', '陕西省镇安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620104000000', '620100000000', '甘肃省兰州市西固区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620201000000', '620200000000', '甘肃省嘉峪关市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620403000000', '620400000000', '甘肃省白银市平川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620503000000', '620500000000', '甘肃省天水市北道区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620702000000', '620700000000', '甘肃省张掖市甘州区', '2', null);
commit;
prompt 2000 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620801000000', '620800000000', '甘肃省平凉市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620824000000', '620800000000', '甘肃省华亭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620921000000', '620900000000', '甘肃省金塔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620982000000', '620900000000', '甘肃省敦煌市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621023000000', '621000000000', '甘肃省华池县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621101000000', '621100000000', '甘肃省定西市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621221000000', '621200000000', '甘肃省成县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621226000000', '621200000000', '甘肃省礼县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622921000000', '622900000000', '甘肃省临夏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622926000000', '622900000000', '甘肃省东乡族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623024000000', '623000000000', '甘肃省迭部县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630102000000', '630100000000', '青海省西宁市城东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632126000000', '632100000000', '青海省互助土族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632224000000', '632200000000', '青海省刚察县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632521000000', '632500000000', '青海省共和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632622000000', '632600000000', '青海省班玛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632801000000', '632800000000', '青海省格尔木市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640101000000', '640100000000', '宁夏银川市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640221000000', '640200000000', '宁夏平罗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640381000000', '640300000000', '宁夏青铜峡市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640423000000', '640400000000', '宁夏隆德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640521000000', '640500000000', '宁夏中宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650103000000', '650100000000', '新疆乌鲁木齐市沙依巴克区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652122000000', '652100000000', '新疆鄯善县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420201000000', '420200000000', '湖北省黄石市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652301000000', '652300000000', '新疆昌吉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652324000000', '652300000000', '新疆玛纳斯县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652722000000', '652700000000', '新疆精河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652824000000', '652800000000', '新疆若羌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652828000000', '652800000000', '新疆和硕县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652924000000', '652900000000', '新疆沙雅县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653024000000', '653000000000', '新疆乌恰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653124000000', '653100000000', '新疆泽普县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653128000000', '653100000000', '新疆岳普湖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653221000000', '653200000000', '新疆和田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653225000000', '653200000000', '新疆策勒县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654021000000', '654000000000', '新疆伊宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654202000000', '654200000000', '新疆乌苏市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654225000000', '654200000000', '新疆裕民县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654323000000', '654300000000', '新疆福海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '659001000000', '659000000000', '新疆石河子市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130930000000', '130900000000', '河北省孟村回族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150782000000', '150700000000', '内蒙古牙克石市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410821000000', '410800000000', '河南省修武县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652829000000', '652800000000', '新疆博湖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652925000000', '652900000000', '新疆新和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653022000000', '653000000000', '新疆阿克陶县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653123000000', '653100000000', '新疆英吉沙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653131000000', '653100000000', '新疆塔什库尔干塔吉克自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110102000000', '110100000000', '北京市西城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '120108000000', '120100000000', '天津市汉沽区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130181000000', '130100000000', '河北省辛集市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130423000000', '130400000000', '河北省临漳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130534000000', '130500000000', '河北省清河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130684000000', '130600000000', '河北省高碑店市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130902000000', '130900000000', '河北省沧州市新华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441581000000', '441500000000', '广东省陆丰市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441624000000', '441600000000', '广东省和平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441781000000', '441700000000', '广东省阳春市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445122000000', '445100000000', '广东省饶平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445281000000', '445200000000', '广东省普宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500105000000', '500100000000', '重庆市江北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500112000000', '500100000000', '重庆市渝北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500225000000', '500200000000', '重庆市大足县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500231000000', '500200000000', '重庆市垫江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500240000000', '500200000000', '重庆市石柱土家族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510000000000', null, '四川省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510105000000', '510100000000', '四川省成都市青羊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340822000000', '340800000000', '安徽省怀宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341722000000', '341700000000', '安徽省石台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350302000000', '350300000000', '福建省莆田市城厢区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350627000000', '350600000000', '福建省南靖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350922000000', '350900000000', '福建省古田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542124000000', '542100000000', '西藏类乌齐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542221000000', '542200000000', '西藏乃东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542227000000', '542200000000', '西藏措美县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542322000000', '542300000000', '西藏南木林县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542329000000', '542300000000', '西藏白朗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542336000000', '542300000000', '西藏聂拉木县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542424000000', '542400000000', '西藏聂荣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620521000000', '620500000000', '甘肃省清水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620602000000', '620600000000', '甘肃省武威市凉州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620722000000', '620700000000', '甘肃省民乐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620821000000', '620800000000', '甘肃省泾川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620901000000', '620900000000', '甘肃省酒泉市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621001000000', '621000000000', '甘肃省庆阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621027000000', '621000000000', '甘肃省镇原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231123000000', '231100000000', '黑龙江省逊克县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511902000000', '511900000000', '四川省巴中市巴州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513338000000', '513300000000', '四川省得荣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520203000000', '520200000000', '贵州省六枝特区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522322000000', '522300000000', '贵州省兴仁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451101000000', '451100000000', '广西贺州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460201000000', '460200000000', '海南省三亚市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500223000000', '500200000000', '重庆市潼南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510106000000', '510100000000', '四川省成都市金牛区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510603000000', '510600000000', '四川省德阳市旌阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511111000000', '511100000000', '四川省乐山市沙湾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451024000000', '451000000000', '广西德保县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451026000000', '451000000000', '广西那坡县', '2', null);
commit;
prompt 2100 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451028000000', '451000000000', '广西乐业县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451029000000', '451000000000', '广西田林县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451030000000', '451000000000', '广西西林县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451031000000', '451000000000', '广西隆林各族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130524000000', '130500000000', '河北省柏乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130529000000', '130500000000', '河北省巨鹿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130602000000', '130600000000', '河北省保定市新市区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130623000000', '130600000000', '河北省涞水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130633000000', '130600000000', '河北省易县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130638000000', '130600000000', '河北省雄县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130706000000', '130700000000', '河北省张家口市下花园区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130727000000', '130700000000', '河北省阳原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130732000000', '130700000000', '河北省赤城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130803000000', '130800000000', '河北省承德市双滦区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130926000000', '130900000000', '河北省肃宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130982000000', '130900000000', '河北省任丘市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420202000000', '420200000000', '湖北省黄石市黄石港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420203000000', '420200000000', '湖北省黄石市西塞山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420204000000', '420200000000', '湖北省黄石市下陆区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420281000000', '420200000000', '湖北省大冶市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420300000000', '420000000000', '湖北省十堰市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420301000000', '420300000000', '湖北省十堰市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420302000000', '420300000000', '湖北省十堰市茅箭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420303000000', '420300000000', '湖北省十堰市张湾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420322000000', '420300000000', '湖北省郧西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420324000000', '420300000000', '湖北省竹溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420381000000', '420300000000', '湖北省丹江口市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420500000000', '420000000000', '湖北省宜昌市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420501000000', '420500000000', '湖北省宜昌市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420502000000', '420500000000', '湖北省宜昌市西陵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420503000000', '420500000000', '湖北省宜昌市伍家岗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420506000000', '420500000000', '湖北省宜昌市夷陵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420525000000', '420500000000', '湖北省远安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420526000000', '420500000000', '湖北省兴山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420528000000', '420500000000', '湖北省长阳土家族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420529000000', '420500000000', '湖北省五峰土家族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420581000000', '420500000000', '湖北省宜都市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420600000000', '420000000000', '湖北省襄樊市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420601000000', '420600000000', '湖北省襄樊市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420602000000', '420600000000', '湖北省襄樊市襄城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420606000000', '420600000000', '湖北省襄樊市樊城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420607000000', '420600000000', '湖北省襄樊市襄阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420625000000', '420600000000', '湖北省谷城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420682000000', '420600000000', '湖北省老河口市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420683000000', '420600000000', '湖北省枣阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420701000000', '420700000000', '湖北省鄂州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420702000000', '420700000000', '湖北省鄂州市梁子湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420703000000', '420700000000', '湖北省鄂州市华容区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420704000000', '420700000000', '湖北省鄂州市鄂城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420802000000', '420800000000', '湖北省荆门市东宝区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420804000000', '420800000000', '湖北省荆门市掇刀区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420821000000', '420800000000', '湖北省京山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420822000000', '420800000000', '湖北省沙洋县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420881000000', '420800000000', '湖北省钟祥市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420900000000', '420000000000', '湖北省孝感市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420921000000', '420900000000', '湖北省孝昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420922000000', '420900000000', '湖北省大悟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420923000000', '420900000000', '湖北省云梦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420982000000', '420900000000', '湖北省安陆市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420984000000', '420900000000', '湖北省汉川市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421000000000', '420000000000', '湖北省荆州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421001000000', '421000000000', '湖北省荆州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421022000000', '421000000000', '湖北省公安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421023000000', '421000000000', '湖北省监利县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421024000000', '421000000000', '湖北省江陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421081000000', '421000000000', '湖北省石首市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421083000000', '421000000000', '湖北省洪湖市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421100000000', '420000000000', '湖北省黄冈市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421101000000', '421100000000', '湖北省黄冈市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421121000000', '421100000000', '湖北省团风县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421122000000', '421100000000', '湖北省红安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421124000000', '421100000000', '湖北省英山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421125000000', '421100000000', '湖北省浠水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421126000000', '421100000000', '湖北省蕲春县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421127000000', '421100000000', '湖北省黄梅县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421201000000', '421200000000', '湖北省咸宁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421202000000', '421200000000', '湖北省咸宁市咸安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421221000000', '421200000000', '湖北省嘉鱼县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421223000000', '421200000000', '湖北省崇阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421224000000', '421200000000', '湖北省通山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421281000000', '421200000000', '湖北省赤壁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421302000000', '421300000000', '湖北省随州市曾都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421381000000', '421300000000', '湖北省广水市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422800000000', '420000000000', '湖北省恩施土家族苗族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422801000000', '422800000000', '湖北省恩施市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422822000000', '422800000000', '湖北省建始县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422823000000', '422800000000', '湖北省巴东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422827000000', '422800000000', '湖北省来凤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '429000000000', '420000000000', '湖北省省直辖行政单位', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '429004000000', '429000000000', '湖北省仙桃市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '429005000000', '429000000000', '湖北省潜江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '429021000000', '429000000000', '湖北省神农架林区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430100000000', '430000000000', '湖南省长沙市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430102000000', '430100000000', '湖南省长沙市芙蓉区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430104000000', '430100000000', '湖南省长沙市岳麓区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430111000000', '430100000000', '湖南省长沙市雨花区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430121000000', '430100000000', '湖南省长沙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430122000000', '430100000000', '湖南省望城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430124000000', '430100000000', '湖南省宁乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430181000000', '430100000000', '湖南省浏阳市', '2', null);
commit;
prompt 2200 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430201000000', '430200000000', '湖南省株洲市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430202000000', '430200000000', '湖南省株洲市荷塘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430203000000', '430200000000', '湖南省株洲市芦淞区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430204000000', '430200000000', '湖南省株洲市石峰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430221000000', '430200000000', '湖南省株洲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430223000000', '430200000000', '湖南省攸县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430225000000', '430200000000', '湖南省炎陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430281000000', '430200000000', '湖南省醴陵市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430302000000', '430300000000', '湖南省湘潭市雨湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430304000000', '430300000000', '湖南省湘潭市岳塘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430321000000', '430300000000', '湖南省湘潭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430382000000', '430300000000', '湖南省韶山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430400000000', '430000000000', '湖南省衡阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430405000000', '430400000000', '湖南省衡阳市珠晖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430406000000', '430400000000', '湖南省衡阳市雁峰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430407000000', '430400000000', '湖南省衡阳市石鼓区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430408000000', '430400000000', '湖南省衡阳市蒸湘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430422000000', '430400000000', '湖南省衡南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430423000000', '430400000000', '湖南省衡山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430424000000', '430400000000', '湖南省衡东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430481000000', '430400000000', '湖南省耒阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430482000000', '430400000000', '湖南省常宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430500000000', '430000000000', '湖南省邵阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430501000000', '430500000000', '湖南省邵阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430511000000', '430500000000', '湖南省邵阳市北塔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430521000000', '430500000000', '湖南省邵东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430522000000', '430500000000', '湖南省新邵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410324000000', '410300000000', '河南省栾川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410325000000', '410300000000', '河南省嵩县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410326000000', '410300000000', '河南省汝阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410329000000', '410300000000', '河南省伊川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410381000000', '410300000000', '河南省偃师市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410400000000', '410000000000', '河南省平顶山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410402000000', '410400000000', '河南省平顶山市新华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410403000000', '410400000000', '河南省平顶山市卫东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410404000000', '410400000000', '河南省平顶山市石龙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410421000000', '410400000000', '河南省宝丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410422000000', '410400000000', '河南省叶县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410425000000', '410400000000', '河南省郏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410481000000', '410400000000', '河南省舞钢市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410482000000', '410400000000', '河南省汝州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410502000000', '410500000000', '河南省安阳市文峰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410503000000', '410500000000', '河南省安阳市北关区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410506000000', '410500000000', '河南省安阳市龙安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410522000000', '410500000000', '河南省安阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410526000000', '410500000000', '河南省滑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410527000000', '410500000000', '河南省内黄县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410581000000', '410500000000', '河南省林州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410600000000', '410000000000', '河南省鹤壁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410601000000', '410600000000', '河南省鹤壁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410611000000', '410600000000', '河南省鹤壁市淇滨区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410621000000', '410600000000', '河南省浚县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410622000000', '410600000000', '河南省淇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410700000000', '410000000000', '河南省新乡市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410701000000', '410700000000', '河南省新乡市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410703000000', '410700000000', '河南省新乡市卫滨区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410704000000', '410700000000', '河南省新乡市凤泉区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410721000000', '410700000000', '河南省新乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410724000000', '410700000000', '河南省获嘉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410727000000', '410700000000', '河南省封丘县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410728000000', '410700000000', '河南省长垣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410781000000', '410700000000', '河南省卫辉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410782000000', '410700000000', '河南省辉县市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410802000000', '410800000000', '河南省焦作市解放区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410804000000', '410800000000', '河南省焦作市马村区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440902000000', '440900000000', '广东省茂名市茂南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440923000000', '440900000000', '广东省电白县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440981000000', '440900000000', '广东省高州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440982000000', '440900000000', '广东省化州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441200000000', '440000000000', '广东省肇庆市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441201000000', '441200000000', '广东省肇庆市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441202000000', '441200000000', '广东省肇庆市端州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441203000000', '441200000000', '广东省肇庆市鼎湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441225000000', '441200000000', '广东省封开县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441226000000', '441200000000', '广东省德庆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441283000000', '441200000000', '广东省高要市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441284000000', '441200000000', '广东省四会市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441300000000', '440000000000', '广东省惠州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441302000000', '441300000000', '广东省惠州市惠城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441322000000', '441300000000', '广东省博罗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441323000000', '441300000000', '广东省惠东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441324000000', '441300000000', '广东省龙门县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441400000000', '440000000000', '广东省梅州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441402000000', '441400000000', '广东省梅州市梅江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441421000000', '441400000000', '广东省梅县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441423000000', '441400000000', '广东省丰顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441424000000', '441400000000', '广东省五华县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441427000000', '441400000000', '广东省蕉岭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441481000000', '441400000000', '广东省兴宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441500000000', '440000000000', '广东省汕尾市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441501000000', '441500000000', '广东省汕尾市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441523000000', '441500000000', '广东省陆河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441601000000', '441600000000', '广东省河源市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441602000000', '441600000000', '广东省河源市源城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441622000000', '441600000000', '广东省龙川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441623000000', '441600000000', '广东省连平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441625000000', '441600000000', '广东省东源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441702000000', '441700000000', '广东省阳江市江城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441721000000', '441700000000', '广东省阳西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441723000000', '441700000000', '广东省阳东县', '2', null);
commit;
prompt 2300 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441800000000', '440000000000', '广东省清远市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441801000000', '441800000000', '广东省清远市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441821000000', '441800000000', '广东省佛冈县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441825000000', '441800000000', '广东省连山壮族瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441881000000', '441800000000', '广东省英德市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441882000000', '441800000000', '广东省连州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441900000000', '440000000000', '广东省东莞市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '442000000000', '440000000000', '广东省中山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445101000000', '445100000000', '广东省潮州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445200000000', '440000000000', '广东省揭阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445201000000', '445200000000', '广东省揭阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445202000000', '445200000000', '广东省揭阳市榕城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445221000000', '445200000000', '广东省揭东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445224000000', '445200000000', '广东省惠来县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445300000000', '440000000000', '广东省云浮市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445301000000', '445300000000', '广东省云浮市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445302000000', '445300000000', '广东省云浮市云城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445322000000', '445300000000', '广东省郁南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445323000000', '445300000000', '广东省云安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450000000000', null, '广西壮族自治区', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450100000000', '450000000000', '广西南宁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450101000000', '450100000000', '广西南宁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450103000000', '450100000000', '广西南宁市新城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450104000000', '450100000000', '广西南宁市城北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450105000000', '450100000000', '广西南宁市江南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450106000000', '450100000000', '广西南宁市永新区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450123000000', '450100000000', '广西隆安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450124000000', '450100000000', '广西马山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450125000000', '450100000000', '广西上林县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450127000000', '450100000000', '广西横县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450200000000', '450000000000', '广西柳州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450201000000', '450200000000', '广西柳州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450204000000', '450200000000', '广西柳州市柳南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450205000000', '450200000000', '广西柳州市柳北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450221000000', '450200000000', '广西柳江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450222000000', '450200000000', '广西柳城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450223000000', '450200000000', '广西鹿寨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450225000000', '450200000000', '广西融水苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450301000000', '450300000000', '广西桂林市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450303000000', '450300000000', '广西桂林市叠彩区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450304000000', '450300000000', '广西桂林市象山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450305000000', '450300000000', '广西桂林市七星区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450311000000', '450300000000', '广西桂林市雁山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450321000000', '450300000000', '广西阳朔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450323000000', '450300000000', '广西灵川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450325000000', '450300000000', '广西兴安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450327000000', '450300000000', '广西灌阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450328000000', '450300000000', '广西龙胜各族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450329000000', '450300000000', '广西资源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450330000000', '450300000000', '广西平乐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450332000000', '450300000000', '广西恭城瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450401000000', '450400000000', '广西梧州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450403000000', '450400000000', '广西梧州市万秀区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450405000000', '450400000000', '广西梧州市长洲区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450421000000', '450400000000', '广西苍梧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450422000000', '450400000000', '广西藤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450481000000', '450400000000', '广西岑溪市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450500000000', '450000000000', '广西北海市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450502000000', '450500000000', '广西北海市海城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450503000000', '450500000000', '广西北海市银海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450512000000', '450500000000', '广西北海市铁山港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450521000000', '450500000000', '广西合浦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450602000000', '450600000000', '广西防城港港口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450603000000', '450600000000', '广西防城港防城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450621000000', '450600000000', '广西上思县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450681000000', '450600000000', '广西东兴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450701000000', '450700000000', '广西钦州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450721000000', '450700000000', '广西灵山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450722000000', '450700000000', '广西浦北县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450800000000', '450000000000', '广西贵港市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450801000000', '450800000000', '广西贵港市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450803000000', '450800000000', '广西贵港市港南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450804000000', '450800000000', '广西贵港市覃塘区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450821000000', '450800000000', '广西平南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450900000000', '450000000000', '广西玉林市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450901000000', '450900000000', '广西玉林市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450921000000', '450900000000', '广西容县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450922000000', '450900000000', '广西陆川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450923000000', '450900000000', '广西博白县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451000000000', '450000000000', '广西百色市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451001000000', '451000000000', '广西百色市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451002000000', '451000000000', '广西百色市右江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451021000000', '451000000000', '广西田阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451022000000', '451000000000', '广西田东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410811000000', '410800000000', '河南省焦作市山阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410823000000', '410800000000', '河南省武陟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410825000000', '410800000000', '河南省温县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410881000000', '410800000000', '河南省济源市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410883000000', '410800000000', '河南省孟州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410922000000', '410900000000', '河南省清丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410923000000', '410900000000', '河南省南乐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410926000000', '410900000000', '河南省范县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410927000000', '410900000000', '河南省台前县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411000000000', '410000000000', '河南省许昌市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411001000000', '411000000000', '河南省许昌市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411023000000', '411000000000', '河南省许昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411024000000', '411000000000', '河南省鄢陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411081000000', '411000000000', '河南省禹州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411082000000', '411000000000', '河南省长葛市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411100000000', '410000000000', '河南省漯河市', '1', null);
commit;
prompt 2400 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411101000000', '411100000000', '河南省漯河市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411102000000', '411100000000', '河南省漯河市源汇区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411123000000', '411100000000', '河南省郾城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411200000000', '410000000000', '河南省三门峡市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411201000000', '411200000000', '河南省三门峡市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411202000000', '411200000000', '河南省三门峡市湖滨区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411222000000', '411200000000', '河南省陕县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411224000000', '411200000000', '河南省卢氏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411282000000', '411200000000', '河南省灵宝市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411302000000', '411300000000', '河南省南阳市宛城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411303000000', '411300000000', '河南省南阳市卧龙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411321000000', '411300000000', '河南省南召县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411322000000', '411300000000', '河南省方城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411323000000', '411300000000', '河南省西峡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411326000000', '411300000000', '河南省淅川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411327000000', '411300000000', '河南省社旗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411329000000', '411300000000', '河南省新野县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411330000000', '411300000000', '河南省桐柏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411381000000', '411300000000', '河南省邓州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411400000000', '410000000000', '河南省商丘市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411403000000', '411400000000', '河南省商丘市睢阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411421000000', '411400000000', '河南省民权县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411422000000', '411400000000', '河南省睢县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411423000000', '411400000000', '河南省宁陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411424000000', '411400000000', '河南省柘城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411426000000', '411400000000', '河南省夏邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411500000000', '410000000000', '河南省信阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411501000000', '411500000000', '河南省信阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411502000000', '411500000000', '河南省信阳市师河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411521000000', '411500000000', '河南省罗山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411522000000', '411500000000', '河南省光山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411523000000', '411500000000', '河南省新县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411525000000', '411500000000', '河南省固始县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411528000000', '411500000000', '河南省息县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411600000000', '410000000000', '河南省周口市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411601000000', '411600000000', '河南省周口市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411602000000', '411600000000', '河南省周口市川汇区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411623000000', '411600000000', '河南省商水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411626000000', '411600000000', '河南省淮阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411627000000', '411600000000', '河南省太康县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411628000000', '411600000000', '河南省鹿邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411700000000', '410000000000', '河南省驻马店市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411702000000', '411700000000', '河南省驻马店市驿城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411721000000', '411700000000', '河南省西平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411723000000', '411700000000', '河南省平舆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411726000000', '411700000000', '河南省泌阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411727000000', '411700000000', '河南省汝南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411728000000', '411700000000', '河南省遂平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411729000000', '411700000000', '河南省新蔡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420000000000', null, '湖北省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420103000000', '420100000000', '湖北省武汉市江汉区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420105000000', '420100000000', '湖北省武汉市汉阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420106000000', '420100000000', '湖北省武汉市武昌区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420111000000', '420100000000', '湖北省武汉市洪山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420112000000', '420100000000', '湖北省武汉市东西湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420115000000', '420100000000', '湖北省武汉市江夏区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420117000000', '420100000000', '湖北省武汉市新洲区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420200000000', '420000000000', '湖北省黄石市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621121000000', '621100000000', '甘肃省通渭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621122000000', '621100000000', '甘肃省陇西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621123000000', '621100000000', '甘肃省渭源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621124000000', '621100000000', '甘肃省临洮县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621126000000', '621100000000', '甘肃省岷县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621200000000', '620000000000', '甘肃省陇南市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621201000000', '621200000000', '甘肃省陇南市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621222000000', '621200000000', '甘肃省文县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621223000000', '621200000000', '甘肃省宕昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621224000000', '621200000000', '甘肃省康县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621225000000', '621200000000', '甘肃省西和县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621227000000', '621200000000', '甘肃省徽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621228000000', '621200000000', '甘肃省两当县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622901000000', '622900000000', '甘肃省临夏市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622923000000', '622900000000', '甘肃省永靖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622924000000', '622900000000', '甘肃省广河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622925000000', '622900000000', '甘肃省和政县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622927000000', '622900000000', '甘肃省积石山保安族东乡族撒拉族', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623000000000', '620000000000', '甘肃省甘南藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623021000000', '623000000000', '甘肃省临潭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623022000000', '623000000000', '甘肃省卓尼县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623023000000', '623000000000', '甘肃省舟曲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511024000000', '511000000000', '四川省威远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511028000000', '511000000000', '四川省隆昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511100000000', '510000000000', '四川省乐山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511101000000', '511100000000', '四川省乐山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511102000000', '511100000000', '四川省乐山市市中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511112000000', '511100000000', '四川省乐山市五通桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511113000000', '511100000000', '四川省乐山市金口河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511124000000', '511100000000', '四川省井研县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511126000000', '511100000000', '四川省夹江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511132000000', '511100000000', '四川省峨边彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511133000000', '511100000000', '四川省马边彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511181000000', '511100000000', '四川省峨眉山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511300000000', '510000000000', '四川省南充市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511303000000', '511300000000', '四川省南充市高坪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511304000000', '511300000000', '四川省南充市嘉陵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511321000000', '511300000000', '四川省南部县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511322000000', '511300000000', '四川省营山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511324000000', '511300000000', '四川省仪陇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511325000000', '511300000000', '四川省西充县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511381000000', '511300000000', '四川省阆中市', '2', null);
commit;
prompt 2500 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511401000000', '511400000000', '四川省眉山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511421000000', '511400000000', '四川省仁寿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511422000000', '511400000000', '四川省彭山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511423000000', '511400000000', '四川省洪雅县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511424000000', '511400000000', '四川省丹棱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511425000000', '511400000000', '四川省青神县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511521000000', '511500000000', '四川省宜宾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511522000000', '511500000000', '四川省南溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511523000000', '511500000000', '四川省江安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511524000000', '511500000000', '四川省长宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511526000000', '511500000000', '四川省珙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511527000000', '511500000000', '四川省筠连县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511600000000', '510000000000', '四川省广安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511601000000', '511600000000', '四川省广安市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511602000000', '511600000000', '四川省广安市广安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511621000000', '511600000000', '四川省岳池县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511622000000', '511600000000', '四川省武胜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511700000000', '510000000000', '四川省达州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511702000000', '511700000000', '四川省达州市通川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511721000000', '511700000000', '四川省达县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511723000000', '511700000000', '四川省开江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511725000000', '511700000000', '四川省渠县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511781000000', '511700000000', '四川省万源市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511800000000', '510000000000', '四川省雅安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511802000000', '511800000000', '四川省雅安市雨城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511823000000', '511800000000', '四川省汉源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511824000000', '511800000000', '四川省石棉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511825000000', '511800000000', '四川省天全县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511827000000', '511800000000', '四川省宝兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511900000000', '510000000000', '四川省巴中市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530402000000', '530400000000', '云南省玉溪市红塔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530523000000', '530500000000', '云南省龙陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530623000000', '530600000000', '云南省盐津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530629000000', '530600000000', '云南省威信县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330822000000', '330800000000', '浙江省常山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330922000000', '330900000000', '浙江省嵊泗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331021000000', '331000000000', '浙江省玉环县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331082000000', '331000000000', '浙江省临海市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331127000000', '331100000000', '浙江省景宁畲族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340121000000', '340100000000', '安徽省长丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340202000000', '340200000000', '安徽省芜湖市镜湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340223000000', '340200000000', '安徽省南陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340311000000', '340300000000', '安徽省蚌埠市淮上区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340403000000', '340400000000', '安徽省淮南市田家庵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340604000000', '340600000000', '安徽省淮北市烈山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340711000000', '340700000000', '安徽省铜陵市郊区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340827000000', '340800000000', '安徽省望江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341003000000', '341000000000', '安徽省黄山市黄山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341024000000', '341000000000', '安徽省祁门县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341124000000', '341100000000', '安徽省全椒县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341201000000', '341200000000', '安徽省阜阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341402000000', '341400000000', '安徽省巢湖市居巢区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341501000000', '341500000000', '安徽省六安市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341524000000', '341500000000', '安徽省金寨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341622000000', '341600000000', '安徽省蒙城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341822000000', '341800000000', '安徽省广德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350101000000', '350100000000', '福建省福州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350128000000', '350100000000', '福建省平潭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350205000000', '350200000000', '福建省厦门市海沧区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350402000000', '350400000000', '福建省三明市梅列区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350427000000', '350400000000', '福建省沙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350501000000', '350500000000', '福建省泉州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350505000000', '350500000000', '福建省泉州市泉港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350582000000', '350500000000', '福建省晋江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350702000000', '350700000000', '福建省南平市延平区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350781000000', '350700000000', '福建省邵武市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350801000000', '350800000000', '福建省龙岩市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350825000000', '350800000000', '福建省连城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350981000000', '350900000000', '福建省福安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360104000000', '360100000000', '江西省南昌市青云谱区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360281000000', '360200000000', '江西省乐平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360322000000', '360300000000', '江西省上栗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360403000000', '360400000000', '江西省九江市浔阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360427000000', '360400000000', '江西省星子县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360501000000', '360500000000', '江西省新余市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360681000000', '360600000000', '江西省贵溪市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360728000000', '360700000000', '江西省定南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360732000000', '360700000000', '江西省兴国县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360782000000', '360700000000', '江西省南康市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360822000000', '360800000000', '江西省吉水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360827000000', '360800000000', '江西省遂川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360901000000', '360900000000', '江西省宜春市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360983000000', '360900000000', '江西省高安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361023000000', '361000000000', '江西省南丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361028000000', '361000000000', '江西省资溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361121000000', '361100000000', '江西省上饶县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361126000000', '361100000000', '江西省弋阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '361181000000', '361100000000', '江西省德兴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370126000000', '370100000000', '山东省商河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370205000000', '370200000000', '山东省青岛市四方区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370282000000', '370200000000', '山东省即墨市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370302000000', '370300000000', '山东省淄博市淄川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370323000000', '370300000000', '山东省沂源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370405000000', '370400000000', '山东省枣庄市台儿庄区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370523000000', '370500000000', '山东省广饶县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370685000000', '370600000000', '山东省招远市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370703000000', '370700000000', '山东省潍坊市寒亭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370782000000', '370700000000', '山东省诸城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370801000000', '370800000000', '山东省济宁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370829000000', '370800000000', '山东省嘉祥县', '2', null);
commit;
prompt 2600 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370881000000', '370800000000', '山东省曲阜市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370903000000', '370900000000', '山东省泰安市岱岳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371121000000', '371100000000', '山东省五莲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371301000000', '371300000000', '山东省临沂市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371323000000', '371300000000', '山东省沂水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532326000000', '532300000000', '云南省大姚县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532501000000', '532500000000', '云南省个旧市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532524000000', '532500000000', '云南省建水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532622000000', '532600000000', '云南省砚山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532627000000', '532600000000', '云南省广南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532901000000', '532900000000', '云南省大理市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532926000000', '532900000000', '云南省南涧彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532932000000', '532900000000', '云南省鹤庆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533124000000', '533100000000', '云南省陇川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540123000000', '540100000000', '西藏尼木县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540127000000', '540100000000', '西藏墨竹工卡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542125000000', '542100000000', '西藏丁青县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542132000000', '542100000000', '西藏洛隆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542223000000', '542200000000', '西藏贡嘎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542228000000', '542200000000', '西藏洛扎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542233000000', '542200000000', '西藏浪卡子县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542325000000', '542300000000', '西藏萨迦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542334000000', '542300000000', '西藏亚东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542421000000', '542400000000', '西藏那曲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542425000000', '542400000000', '西藏安多县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542430000000', '542400000000', '西藏尼玛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542524000000', '542500000000', '西藏日土县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542622000000', '542600000000', '西藏工布江达县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621102000000', '621100000000', '甘肃省定西市安定区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621202000000', '621200000000', '甘肃省陇南市武都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '622922000000', '622900000000', '甘肃省康乐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '623001000000', '623000000000', '甘肃省合作市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630100000000', '630000000000', '青海省西宁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632100000000', '630000000000', '青海省海东地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632221000000', '632200000000', '青海省门源回族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632522000000', '632500000000', '青海省同德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632700000000', '630000000000', '青海省玉树藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632821000000', '632800000000', '青海省乌兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640121000000', '640100000000', '宁夏永宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640301000000', '640300000000', '宁夏吴忠市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640422000000', '640400000000', '宁夏西吉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650100000000', '650000000000', '新疆乌鲁木齐市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650108000000', '650100000000', '新疆乌鲁木齐市东山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652101000000', '652100000000', '新疆吐鲁番市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652302000000', '652300000000', '新疆阜康市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652700000000', '650000000000', '新疆博尔塔拉蒙古自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652827000000', '652800000000', '新疆和静县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652927000000', '652900000000', '新疆乌什县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653121000000', '653100000000', '新疆疏附县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653130000000', '653100000000', '新疆巴楚县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '653227000000', '653200000000', '新疆民丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654201000000', '654200000000', '新疆塔城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654301000000', '654300000000', '新疆阿勒泰市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '659002000000', '659000000000', '新疆阿拉尔市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330621000000', '330600000000', '浙江省绍兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220402000000', '220400000000', '吉林省辽源市龙山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370306000000', '370300000000', '山东省淄博市周村区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422828000000', '422800000000', '湖北省鹤峰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451400000000', '450000000000', '广西崇左市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610330000000', '610300000000', '陕西省凤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '632623000000', '632600000000', '青海省甘德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321300000000', '320000000000', '江苏省宿迁市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210200000000', '210000000000', '辽宁省大连市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310100000000', '310000000000', '上海市市辖区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341300000000', '340000000000', '安徽省宿州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370300000000', '370000000000', '山东省淄博市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420700000000', '420000000000', '湖北省鄂州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440900000000', '440000000000', '广东省茂名市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510400000000', '510000000000', '四川省攀枝花市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610500000000', '610000000000', '陕西省渭南市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '110113000000', '110100000000', '北京市顺义区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130130000000', '130100000000', '河北省无极县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130432000000', '130400000000', '河北省广平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130628000000', '130600000000', '河北省高阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '130825000000', '130800000000', '河北省隆化县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431022000000', '431000000000', '湖南省宜章县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431100000000', '430000000000', '湖南省永州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431126000000', '431100000000', '湖南省宁远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431221000000', '431200000000', '湖南省中方县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431230000000', '431200000000', '湖南省通道侗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433101000000', '433100000000', '湖南省吉首市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440101000000', '440100000000', '广东省广州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440114000000', '440100000000', '广东省广州市花都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440222000000', '440200000000', '广东省始兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440303000000', '440300000000', '广东省深圳市罗湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440404000000', '440400000000', '广东省珠海市金湾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440523000000', '440500000000', '广东省南澳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440700000000', '440000000000', '广东省江门市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440802000000', '440800000000', '广东省湛江市赤坎区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440903000000', '440900000000', '广东省茂名市茂港区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441223000000', '441200000000', '广东省广宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441303000000', '441300000000', '广东省惠州市惠阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441422000000', '441400000000', '广东省大埔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441521000000', '441500000000', '广东省海丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441700000000', '440000000000', '广东省阳江市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441823000000', '441800000000', '广东省阳山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445102000000', '445100000000', '广东省潮州市湘桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445381000000', '445300000000', '广东省罗定市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450122000000', '450100000000', '广西武鸣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450202000000', '450200000000', '广西柳州市城中区', '2', null);
commit;
prompt 2700 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450226000000', '450200000000', '广西三江侗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450324000000', '450300000000', '广西全州县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450400000000', '450000000000', '广西梧州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450423000000', '450400000000', '广西蒙山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450600000000', '450000000000', '广西防城港市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450703000000', '450700000000', '广西钦州市钦北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450881000000', '450800000000', '广西桂平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450924000000', '450900000000', '广西兴业县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451025000000', '451000000000', '广西靖西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451100000000', '450000000000', '广西贺州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451222000000', '451200000000', '广西天峨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451281000000', '451200000000', '广西宜州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451402000000', '451400000000', '广西崇左市江洲区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460106000000', '460100000000', '海南省海口市龙华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469006000000', '469000000000', '海南省万宁市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469034000000', '469000000000', '海南省陵水黎族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500106000000', '500100000000', '重庆市沙坪坝区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500200000000', '500000000000', '重庆市县', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500232000000', '500200000000', '重庆市武隆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500242000000', '500200000000', '重庆市酉阳土家族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510108000000', '510100000000', '四川省成都市成华区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510122000000', '510100000000', '四川省双流县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510300000000', '510000000000', '四川省自贡市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510401000000', '510400000000', '四川省攀枝花市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510503000000', '510500000000', '四川省泸州市纳溪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510626000000', '510600000000', '四川省罗江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510722000000', '510700000000', '四川省三台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510801000000', '510800000000', '四川省广元市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510903000000', '510900000000', '四川省遂宁市船山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511025000000', '511000000000', '四川省资中县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511123000000', '511100000000', '四川省犍为县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511301000000', '511300000000', '四川省南充市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511400000000', '510000000000', '四川省眉山市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511502000000', '511500000000', '四川省宜宾市翠屏区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511528000000', '511500000000', '四川省兴文县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511701000000', '511700000000', '四川省达州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511821000000', '511800000000', '四川省名山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530426000000', '530400000000', '云南省峨山彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '331123000000', '331100000000', '浙江省遂昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '340502000000', '340500000000', '安徽省马鞍山市金家庄区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341321000000', '341300000000', '安徽省砀山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350111000000', '350100000000', '福建省福州市晋安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '350622000000', '350600000000', '福建省云霄县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360124000000', '360100000000', '江西省进贤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360723000000', '360700000000', '江西省大余县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '360925000000', '360900000000', '江西省靖安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370104000000', '370100000000', '山东省济南市槐荫区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '370613000000', '370600000000', '山东省烟台市莱山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371002000000', '371000000000', '山东省威海市环翠区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371501000000', '371500000000', '山东省聊城市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530822000000', '530800000000', '云南省墨江哈尼族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530902000000', '530900000000', '云南省临沧市临翔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532322000000', '532300000000', '云南省双柏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532329000000', '532300000000', '云南省武定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532526000000', '532500000000', '云南省弥勒县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532621000000', '532600000000', '云南省文山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532822000000', '532800000000', '云南省勐海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532927000000', '532900000000', '云南省巍山彝族回族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533123000000', '533100000000', '云南省盈江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533421000000', '533400000000', '云南省香格里拉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540124000000', '540100000000', '西藏曲水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542123000000', '542100000000', '西藏贡觉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542224000000', '542200000000', '西藏桑日县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542300000000', '540000000000', '西藏日喀则地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542332000000', '542300000000', '西藏定结县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542422000000', '542400000000', '西藏嘉黎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542525000000', '542500000000', '西藏革吉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542625000000', '542600000000', '西藏波密县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610112000000', '610100000000', '陕西省西安市未央区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610200000000', '610000000000', '陕西省铜川市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610301000000', '610300000000', '陕西省宝鸡市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610329000000', '610300000000', '陕西省麟游县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610424000000', '610400000000', '陕西省乾县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610521000000', '610500000000', '陕西省华县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610581000000', '610500000000', '陕西省韩城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610624000000', '610600000000', '陕西省安塞县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610700000000', '610000000000', '陕西省汉中市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610726000000', '610700000000', '陕西省宁强县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610821000000', '610800000000', '陕西省神木县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610829000000', '610800000000', '陕西省吴堡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610925000000', '610900000000', '陕西省岚皋县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611022000000', '611000000000', '陕西省丹凤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620103000000', '620100000000', '甘肃省兰州市七里河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620302000000', '620300000000', '甘肃省金昌市金川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620500000000', '620000000000', '甘肃省天水市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620600000000', '620000000000', '甘肃省武威市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620721000000', '620700000000', '甘肃省肃南裕固族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620900000000', '620000000000', '甘肃省酒泉市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621002000000', '621000000000', '甘肃省庆阳市西峰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131121000000', '131100000000', '河北省枣强县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320305000000', '320300000000', '江苏省徐州市贾汪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320703000000', '320700000000', '江苏省连云港市连云区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321302000000', '321300000000', '江苏省宿迁市宿城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330328000000', '330300000000', '浙江省文成县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131124000000', '131100000000', '河北省饶阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140425000000', '140400000000', '山西省平顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140802000000', '140800000000', '山西省运城市盐湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141031000000', '141000000000', '山西省隰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150201000000', '150200000000', '内蒙古包头市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150722000000', '150700000000', '内蒙古莫力达瓦达斡尔族自治旗', '2', null);
commit;
prompt 2800 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210105000000', '210100000000', '辽宁省沈阳市皇姑区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210503000000', '210500000000', '辽宁省本溪市溪湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211122000000', '211100000000', '辽宁省盘山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220203000000', '220200000000', '吉林省吉林市龙潭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222401000000', '222400000000', '吉林省延吉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230230000000', '230200000000', '黑龙江省克东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230624000000', '230600000000', '黑龙江省杜尔伯特蒙古族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231226000000', '231200000000', '黑龙江省绥棱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513328000000', '513300000000', '四川省甘孜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520121000000', '520100000000', '贵州省开阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522423000000', '522400000000', '贵州省黔西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522728000000', '522700000000', '贵州省罗甸县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371728000000', '371700000000', '山东省东明县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410327000000', '410300000000', '河南省宜阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410702000000', '410700000000', '河南省新乡市红旗区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411121000000', '411100000000', '河南省舞阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411503000000', '411500000000', '河南省信阳市平桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420116000000', '420100000000', '湖北省武汉市黄陂区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420684000000', '420600000000', '湖北省宜城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421181000000', '421100000000', '湖北省麻城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430211000000', '430200000000', '湖南省株洲市天元区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430624000000', '430600000000', '湖南省湘阴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431101000000', '431100000000', '湖南省永州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440104000000', '440100000000', '广东省广州市越秀区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440607000000', '440600000000', '广东省佛山市三水区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441426000000', '441400000000', '广东省平远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445121000000', '445100000000', '广东省潮安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450224000000', '450200000000', '广西融安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450601000000', '450600000000', '广西防城港市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451201000000', '451200000000', '广西河池市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469037000000', '469000000000', '海南省西沙群岛', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500243000000', '500200000000', '重庆市彭水苗族土家族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510802000000', '510800000000', '四川省广元市市中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532529000000', '532500000000', '云南省红河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533325000000', '533300000000', '云南省兰坪白族普米族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542330000000', '542300000000', '西藏仁布县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542627000000', '542600000000', '西藏朗县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610401000000', '610400000000', '陕西省咸阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610722000000', '610700000000', '陕西省城固县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611021000000', '611000000000', '陕西省洛南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620601000000', '620600000000', '甘肃省武威市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621125000000', '621100000000', '甘肃省漳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '630122000000', '630100000000', '青海省湟中县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '640181000000', '640100000000', '宁夏灵武市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '650201000000', '650200000000', '新疆克拉玛依市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '652928000000', '652900000000', '新疆阿瓦提县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654025000000', '654000000000', '新疆新源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530701000000', '530700000000', '云南省丽江市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654000000000', '650000000000', '新疆伊犁哈萨克自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441826000000', '441800000000', '广东省连南瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '341225000000', '341200000000', '安徽省阜南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542333000000', '542300000000', '西藏仲巴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542335000000', '542300000000', '西藏吉隆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542337000000', '542300000000', '西藏萨嘎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542338000000', '542300000000', '西藏岗巴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620623000000', '620600000000', '甘肃省天祝藏族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620700000000', '620000000000', '甘肃省张掖市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620701000000', '620700000000', '甘肃省张掖市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620723000000', '620700000000', '甘肃省临泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620724000000', '620700000000', '甘肃省高台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620725000000', '620700000000', '甘肃省山丹县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620802000000', '620800000000', '甘肃省平凉市崆峒区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620822000000', '620800000000', '甘肃省灵台县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620823000000', '620800000000', '甘肃省崇信县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620825000000', '620800000000', '甘肃省庄浪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620826000000', '620800000000', '甘肃省静宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620902000000', '620900000000', '甘肃省酒泉市肃州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620922000000', '620900000000', '甘肃省安西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620923000000', '620900000000', '甘肃省肃北蒙古族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620924000000', '620900000000', '甘肃省阿克塞哈萨克族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620981000000', '620900000000', '甘肃省玉门市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621000000000', '620000000000', '甘肃省庆阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621021000000', '621000000000', '甘肃省庆城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621022000000', '621000000000', '甘肃省环县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621024000000', '621000000000', '甘肃省合水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621025000000', '621000000000', '甘肃省正宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '621026000000', '621000000000', '甘肃省宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131022000000', '131000000000', '河北省固安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '131026000000', '131000000000', '河北省文安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310115000000', '310100000000', '上海市浦东新区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310230000000', '310200000000', '上海市崇明县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320105000000', '320100000000', '江苏省南京市建邺区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320115000000', '320100000000', '江苏省南京市江宁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320203000000', '320200000000', '江苏省无锡市南长区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320282000000', '320200000000', '江苏省宜兴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320324000000', '320300000000', '江苏省睢宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320404000000', '320400000000', '江苏省常州市钟楼区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320501000000', '320500000000', '江苏省苏州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320507000000', '320500000000', '江苏省苏州市相城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320601000000', '320600000000', '江苏省南通市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320682000000', '320600000000', '江苏省如皋市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320801000000', '320800000000', '江苏省淮安市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320826000000', '320800000000', '江苏省涟水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320902000000', '320900000000', '江苏省盐城市亭湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '320925000000', '320900000000', '江苏省建湖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321003000000', '321000000000', '江苏省扬州市邗江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321101000000', '321100000000', '江苏省镇江市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321183000000', '321100000000', '江苏省句容市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '321281000000', '321200000000', '江苏省兴化市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330102000000', '330100000000', '浙江省杭州市上城区', '2', null);
commit;
prompt 2900 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330109000000', '330100000000', '浙江省杭州市萧山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330185000000', '330100000000', '浙江省临安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330206000000', '330200000000', '浙江省宁波市北仑区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330281000000', '330200000000', '浙江省余姚市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330303000000', '330300000000', '浙江省温州市龙湾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330402000000', '330400000000', '浙江省嘉兴市秀城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330483000000', '330400000000', '浙江省桐乡市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330522000000', '330500000000', '浙江省长兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330624000000', '330600000000', '浙江省新昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330702000000', '330700000000', '浙江省金华市婺城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '330783000000', '330700000000', '浙江省东阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140106000000', '140100000000', '山西省太原市迎泽区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140122000000', '140100000000', '山西省阳曲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140203000000', '140200000000', '山西省大同市矿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140223000000', '140200000000', '山西省广灵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140301000000', '140300000000', '山西省阳泉市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140401000000', '140400000000', '山西省长治市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140429000000', '140400000000', '山西省武乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140502000000', '140500000000', '山西省晋城市城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140601000000', '140600000000', '山西省朔州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140624000000', '140600000000', '山西省怀仁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140722000000', '140700000000', '山西省左权县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140727000000', '140700000000', '山西省祁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140826000000', '140800000000', '山西省绛县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140830000000', '140800000000', '山西省芮城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140921000000', '140900000000', '山西省定襄县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140926000000', '140900000000', '山西省静乐县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '140931000000', '140900000000', '山西省保德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141002000000', '141000000000', '山西省临汾市尧都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141026000000', '141000000000', '山西省安泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141082000000', '141000000000', '山西省霍州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141122000000', '141100000000', '山西省交城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141127000000', '141100000000', '山西省岚县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '141182000000', '141100000000', '山西省汾阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150105000000', '150100000000', '内蒙古呼和浩特市赛罕区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150207000000', '150200000000', '内蒙古包头市九原区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150303000000', '150300000000', '内蒙古乌海市海南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150421000000', '150400000000', '内蒙古阿鲁科尔沁旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150426000000', '150400000000', '内蒙古翁牛特旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150521000000', '150500000000', '内蒙古科尔沁左翼中旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150581000000', '150500000000', '内蒙古霍林郭勒市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150624000000', '150600000000', '内蒙古鄂托克旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150784000000', '150700000000', '内蒙古额尔古纳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150801000000', '150800000000', '内蒙古巴彦淖尔市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150901000000', '150900000000', '内蒙古乌兰察布市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150925000000', '150900000000', '内蒙古凉城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '150981000000', '150900000000', '内蒙古丰镇市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152223000000', '152200000000', '内蒙古扎赉特旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152523000000', '152500000000', '内蒙古苏尼特左旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152529000000', '152500000000', '内蒙古正镶白旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '152923000000', '152900000000', '内蒙古额济纳旗', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210122000000', '210100000000', '辽宁省辽中县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210202000000', '210200000000', '辽宁省大连市中山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210224000000', '210200000000', '辽宁省长海县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210301000000', '210300000000', '辽宁省鞍山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210323000000', '210300000000', '辽宁省岫岩满族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210411000000', '210400000000', '辽宁省抚顺市顺城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210602000000', '210600000000', '辽宁省丹东市元宝区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210701000000', '210700000000', '辽宁省锦州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210781000000', '210700000000', '辽宁省凌海市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210804000000', '210800000000', '辽宁省营口市鲅鱼圈区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '210903000000', '210900000000', '辽宁省阜新市新邱区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211001000000', '211000000000', '辽宁省辽阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211011000000', '211000000000', '辽宁省辽阳市太子河区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211221000000', '211200000000', '辽宁省铁岭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211301000000', '211300000000', '辽宁省朝阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211381000000', '211300000000', '辽宁省北票市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '211404000000', '211400000000', '辽宁省葫芦岛市南票区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220103000000', '220100000000', '吉林省长春市宽城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220181000000', '220100000000', '吉林省九台市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220283000000', '220200000000', '吉林省舒兰市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220303000000', '220300000000', '吉林省四平市铁东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220421000000', '220400000000', '吉林省东丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220502000000', '220500000000', '吉林省通化市东昌区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220621000000', '220600000000', '吉林省抚松县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220701000000', '220700000000', '吉林省松原市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '220801000000', '220800000000', '吉林省白城市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '222406000000', '222400000000', '吉林省和龙市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230102000000', '230100000000', '黑龙江省哈尔滨市道里区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230111000000', '230100000000', '黑龙江省哈尔滨市呼兰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230128000000', '230100000000', '黑龙江省通河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230201000000', '230200000000', '黑龙江省齐齐哈尔市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230207000000', '230200000000', '黑龙江省齐齐哈尔市碾子山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230303000000', '230300000000', '黑龙江省鸡西市恒山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230381000000', '230300000000', '黑龙江省虎林市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230404000000', '230400000000', '黑龙江省鹤岗市南山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230501000000', '230500000000', '黑龙江省双鸭山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230523000000', '230500000000', '黑龙江省宝清县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230604000000', '230600000000', '黑龙江省大庆市让胡路区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230708000000', '230700000000', '黑龙江省伊春市美溪区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230714000000', '230700000000', '黑龙江省伊春市乌伊岭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230803000000', '230800000000', '黑龙江省佳木斯市向阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230828000000', '230800000000', '黑龙江省汤原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '230902000000', '230900000000', '黑龙江省七台河市新兴区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231004000000', '231000000000', '黑龙江省牡丹江市爱民区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231084000000', '231000000000', '黑龙江省宁安市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '231221000000', '231200000000', '黑龙江省望奎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '232722000000', '232700000000', '黑龙江省塔河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310105000000', '310100000000', '上海市长宁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '310112000000', '310100000000', '上海市闵行区', '2', null);
commit;
prompt 3000 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513222000000', '513200000000', '四川省理县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513227000000', '513200000000', '四川省小金县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513231000000', '513200000000', '四川省阿坝县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513323000000', '513300000000', '四川省丹巴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513333000000', '513300000000', '四川省色达县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513425000000', '513400000000', '四川省会理县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513429000000', '513400000000', '四川省布拖县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '513434000000', '513400000000', '四川省越西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520102000000', '520100000000', '贵州省贵阳市南明区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520303000000', '520300000000', '贵州省遵义市汇川区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520326000000', '520300000000', '贵州省务川仡佬族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520401000000', '520400000000', '贵州省安顺市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '520425000000', '520400000000', '贵州省紫云苗族布依族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522227000000', '522200000000', '贵州省德江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522327000000', '522300000000', '贵州省册亨县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522428000000', '522400000000', '贵州省赫章县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522625000000', '522600000000', '贵州省镇远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522630000000', '522600000000', '贵州省台江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522635000000', '522600000000', '贵州省麻江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '522723000000', '522700000000', '贵州省贵定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530101000000', '530100000000', '云南省昆明市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530121000000', '530100000000', '云南省呈贡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530127000000', '530100000000', '云南省嵩明县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530302000000', '530300000000', '云南省曲靖市麒麟区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530326000000', '530300000000', '云南省会泽县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371723000000', '371700000000', '山东省成武县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410105000000', '410100000000', '河南省郑州市金水区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410182000000', '410100000000', '河南省荥阳市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410202000000', '410200000000', '河南省开封市龙亭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410222000000', '410200000000', '河南省通许县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410302000000', '410300000000', '河南省洛阳市老城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410322000000', '410300000000', '河南省孟津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410401000000', '410400000000', '河南省平顶山市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410423000000', '410400000000', '河南省鲁山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410501000000', '410500000000', '河南省安阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410523000000', '410500000000', '河南省汤阴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410602000000', '410600000000', '河南省鹤壁市鹤山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410726000000', '410700000000', '河南省延津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410801000000', '410800000000', '河南省焦作市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410822000000', '410800000000', '河南省博爱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410901000000', '410900000000', '河南省濮阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410902000000', '410900000000', '河南省濮阳市华龙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '410928000000', '410900000000', '河南省濮阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411025000000', '411000000000', '河南省襄城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411221000000', '411200000000', '河南省渑池县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411301000000', '411300000000', '河南省南阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411324000000', '411300000000', '河南省镇平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411328000000', '411300000000', '河南省唐河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411402000000', '411400000000', '河南省商丘市梁园区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411425000000', '411400000000', '河南省虞城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411526000000', '411500000000', '河南省潢川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411621000000', '411600000000', '河南省扶沟县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411625000000', '411600000000', '河南省郸城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411701000000', '411700000000', '河南省驻马店市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '411725000000', '411700000000', '河南省确山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420101000000', '420100000000', '湖北省武汉市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420107000000', '420100000000', '湖北省武汉市青山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420205000000', '420200000000', '湖北省黄石市铁山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420321000000', '420300000000', '湖北省郧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420325000000', '420300000000', '湖北省房县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420504000000', '420500000000', '湖北省宜昌市点军区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420527000000', '420500000000', '湖北省秭归县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420583000000', '420500000000', '湖北省枝江市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420624000000', '420600000000', '湖北省南漳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420801000000', '420800000000', '湖北省荆门市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420901000000', '420900000000', '湖北省孝感市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '420981000000', '420900000000', '湖北省应城市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421003000000', '421000000000', '湖北省荆州市荆州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421087000000', '421000000000', '湖北省松滋市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421123000000', '421100000000', '湖北省罗田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421222000000', '421200000000', '湖北省通城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '421301000000', '421300000000', '湖北省随州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '422825000000', '422800000000', '湖北省宣恩县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '429006000000', '429000000000', '湖北省天门市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430105000000', '430100000000', '湖南省长沙市开福区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430301000000', '430300000000', '湖南省湘潭市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430401000000', '430400000000', '湖南省衡阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430421000000', '430400000000', '湖南省衡阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430426000000', '430400000000', '湖南省祁东县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430503000000', '430500000000', '湖南省邵阳市大祥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430525000000', '430500000000', '湖南省洞口县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430601000000', '430600000000', '湖南省岳阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430702000000', '430700000000', '湖南省常德市武陵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430724000000', '430700000000', '湖南省临澧县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430802000000', '430800000000', '湖南省张家界市永定区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '430903000000', '430900000000', '湖南省益阳市赫山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431002000000', '431000000000', '湖南省郴州市北湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431025000000', '431000000000', '湖南省临武县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431124000000', '431100000000', '湖南省道县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431128000000', '431100000000', '湖南省新田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431222000000', '431200000000', '湖南省沅陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431227000000', '431200000000', '湖南省新晃侗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '431302000000', '431300000000', '湖南省娄底市娄星区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433122000000', '433100000000', '湖南省泸溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '433127000000', '433100000000', '湖南省永顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440112000000', '440100000000', '广东省广州市黄埔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542400000000', '540000000000', '西藏那曲地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542423000000', '542400000000', '西藏比如县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542426000000', '542400000000', '西藏申扎县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542427000000', '542400000000', '西藏索县', '2', null);
commit;
prompt 3100 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542428000000', '542400000000', '西藏班戈县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542429000000', '542400000000', '西藏巴青县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542500000000', '540000000000', '西藏阿里地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542521000000', '542500000000', '西藏普兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542522000000', '542500000000', '西藏札达县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542523000000', '542500000000', '西藏噶尔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542526000000', '542500000000', '西藏改则县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542527000000', '542500000000', '西藏措勤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542621000000', '542600000000', '西藏林芝县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542623000000', '542600000000', '西藏米林县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542624000000', '542600000000', '西藏墨脱县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542626000000', '542600000000', '西藏察隅县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610000000000', null, '陕西省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610100000000', '610000000000', '陕西省西安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610101000000', '610100000000', '陕西省西安市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610102000000', '610100000000', '陕西省西安市新城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610103000000', '610100000000', '陕西省西安市碑林区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610111000000', '610100000000', '陕西省西安市灞桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610113000000', '610100000000', '陕西省西安市雁塔区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610114000000', '610100000000', '陕西省西安市阎良区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610115000000', '610100000000', '陕西省西安市临潼区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610122000000', '610100000000', '陕西省蓝田县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610124000000', '610100000000', '陕西省周至县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610125000000', '610100000000', '陕西省户县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610126000000', '610100000000', '陕西省高陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610201000000', '610200000000', '陕西省铜川市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610203000000', '610200000000', '陕西省铜川市印台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610204000000', '610200000000', '陕西省铜川市耀州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610222000000', '610200000000', '陕西省宜君县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610300000000', '610000000000', '陕西省宝鸡市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610303000000', '610300000000', '陕西省宝鸡市金台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610304000000', '610300000000', '陕西省宝鸡市陈仓区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610322000000', '610300000000', '陕西省凤翔县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610323000000', '610300000000', '陕西省岐山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610324000000', '610300000000', '陕西省扶风县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610327000000', '610300000000', '陕西省陇县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610328000000', '610300000000', '陕西省千阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610331000000', '610300000000', '陕西省太白县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610400000000', '610000000000', '陕西省咸阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610402000000', '610400000000', '陕西省咸阳市秦都区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610404000000', '610400000000', '陕西省咸阳市渭城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610422000000', '610400000000', '陕西省三原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610423000000', '610400000000', '陕西省泾阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610426000000', '610400000000', '陕西省永寿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610428000000', '610400000000', '陕西省长武县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610429000000', '610400000000', '陕西省旬邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610431000000', '610400000000', '陕西省武功县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610501000000', '610500000000', '陕西省渭南市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610502000000', '610500000000', '陕西省渭南市临渭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610524000000', '610500000000', '陕西省合阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610525000000', '610500000000', '陕西省澄城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610526000000', '610500000000', '陕西省蒲城县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610527000000', '610500000000', '陕西省白水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610528000000', '610500000000', '陕西省富平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610582000000', '610500000000', '陕西省华阴市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610600000000', '610000000000', '陕西省延安市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610601000000', '610600000000', '陕西省延安市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610621000000', '610600000000', '陕西省延长县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610622000000', '610600000000', '陕西省延川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610623000000', '610600000000', '陕西省子长县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610625000000', '610600000000', '陕西省志丹县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610627000000', '610600000000', '陕西省甘泉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610628000000', '610600000000', '陕西省富县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610629000000', '610600000000', '陕西省洛川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610630000000', '610600000000', '陕西省宜川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610632000000', '610600000000', '陕西省黄陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610701000000', '610700000000', '陕西省汉中市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610702000000', '610700000000', '陕西省汉中市汉台区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610721000000', '610700000000', '陕西省南郑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610723000000', '610700000000', '陕西省洋县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610724000000', '610700000000', '陕西省西乡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610725000000', '610700000000', '陕西省勉县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610728000000', '610700000000', '陕西省镇巴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610729000000', '610700000000', '陕西省留坝县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610730000000', '610700000000', '陕西省佛坪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610800000000', '610000000000', '陕西省榆林市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610802000000', '610800000000', '陕西省榆林市榆阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610822000000', '610800000000', '陕西省府谷县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610823000000', '610800000000', '陕西省横山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610824000000', '610800000000', '陕西省靖边县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610826000000', '610800000000', '陕西省绥德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610827000000', '610800000000', '陕西省米脂县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610828000000', '610800000000', '陕西省佳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610831000000', '610800000000', '陕西省子洲县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610901000000', '610900000000', '陕西省安康市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610902000000', '610900000000', '陕西省安康市汉滨区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610921000000', '610900000000', '陕西省汉阴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610923000000', '610900000000', '陕西省宁陕县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610924000000', '610900000000', '陕西省紫阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610926000000', '610900000000', '陕西省平利县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610928000000', '610900000000', '陕西省旬阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '610929000000', '610900000000', '陕西省白河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611000000000', '610000000000', '陕西省商洛市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611001000000', '611000000000', '陕西省商洛市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611002000000', '611000000000', '陕西省商洛市商州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611023000000', '611000000000', '陕西省商南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611024000000', '611000000000', '陕西省山阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '611026000000', '611000000000', '陕西省柞水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620000000000', null, '甘肃省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620100000000', '620000000000', '甘肃省兰州市', '1', null);
commit;
prompt 3200 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620101000000', '620100000000', '甘肃省兰州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620102000000', '620100000000', '甘肃省兰州市城关区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620105000000', '620100000000', '甘肃省兰州市安宁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620111000000', '620100000000', '甘肃省兰州市红古区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620121000000', '620100000000', '甘肃省永登县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620122000000', '620100000000', '甘肃省皋兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620123000000', '620100000000', '甘肃省榆中县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620200000000', '620000000000', '甘肃省嘉峪关市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620301000000', '620300000000', '甘肃省金昌市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620321000000', '620300000000', '甘肃省永昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620400000000', '620000000000', '甘肃省白银市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620401000000', '620400000000', '甘肃省白银市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620402000000', '620400000000', '甘肃省白银市白银区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620421000000', '620400000000', '甘肃省靖远县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620422000000', '620400000000', '甘肃省会宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620423000000', '620400000000', '甘肃省景泰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620501000000', '620500000000', '甘肃省天水市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620502000000', '620500000000', '甘肃省天水市秦城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620522000000', '620500000000', '甘肃省秦安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620523000000', '620500000000', '甘肃省甘谷县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620524000000', '620500000000', '甘肃省武山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620525000000', '620500000000', '甘肃省张家川回族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620621000000', '620600000000', '甘肃省民勤县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '620622000000', '620600000000', '甘肃省古浪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371327000000', '371300000000', '山东省莒南县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371421000000', '371400000000', '山东省陵县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371426000000', '371400000000', '山东省平原县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371524000000', '371500000000', '山东省东阿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371602000000', '371600000000', '山东省滨州市滨城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '371626000000', '371600000000', '山东省邹平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530724000000', '530700000000', '云南省宁蒗彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530801000000', '530800000000', '云南省思茅市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530802000000', '530800000000', '云南省思茅市翠云区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530821000000', '530800000000', '云南省普洱哈尼族彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530823000000', '530800000000', '云南省景东彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530824000000', '530800000000', '云南省景谷傣族彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530825000000', '530800000000', '云南省镇沅彝族哈尼族拉祜族自治', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530827000000', '530800000000', '云南省孟连傣族拉祜族佤族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530828000000', '530800000000', '云南省澜沧拉祜族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530829000000', '530800000000', '云南省西盟佤族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530900000000', '530000000000', '云南省临沧市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530901000000', '530900000000', '云南省临沧市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530921000000', '530900000000', '云南省凤庆县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530923000000', '530900000000', '云南省永德县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530924000000', '530900000000', '云南省镇康县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530925000000', '530900000000', '云南省双江拉祜族佤族布朗族傣族', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530926000000', '530900000000', '云南省耿马傣族佤族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532300000000', '530000000000', '云南省楚雄彝族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532301000000', '532300000000', '云南省楚雄市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532323000000', '532300000000', '云南省牟定县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532324000000', '532300000000', '云南省南华县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532325000000', '532300000000', '云南省姚安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532327000000', '532300000000', '云南省永仁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532328000000', '532300000000', '云南省元谋县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532331000000', '532300000000', '云南省禄丰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532500000000', '530000000000', '云南省红河哈尼族彝族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532502000000', '532500000000', '云南省开远市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532522000000', '532500000000', '云南省蒙自县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532523000000', '532500000000', '云南省屏边苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532525000000', '532500000000', '云南省石屏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532527000000', '532500000000', '云南省泸西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532528000000', '532500000000', '云南省元阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532530000000', '532500000000', '云南省金平苗族瑶族傣族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532531000000', '532500000000', '云南省绿春县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532532000000', '532500000000', '云南省河口瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532600000000', '530000000000', '云南省文山壮族苗族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532623000000', '532600000000', '云南省西畴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532624000000', '532600000000', '云南省麻栗坡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532625000000', '532600000000', '云南省马关县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532626000000', '532600000000', '云南省丘北县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532628000000', '532600000000', '云南省富宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532801000000', '532800000000', '云南省景洪市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532823000000', '532800000000', '云南省勐腊县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532900000000', '530000000000', '云南省大理白族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532922000000', '532900000000', '云南省漾濞彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532923000000', '532900000000', '云南省祥云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532924000000', '532900000000', '云南省宾川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532925000000', '532900000000', '云南省弥渡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532928000000', '532900000000', '云南省永平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532929000000', '532900000000', '云南省云龙县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532930000000', '532900000000', '云南省洱源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '532931000000', '532900000000', '云南省剑川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533100000000', '530000000000', '云南省德宏傣族景颇族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533102000000', '533100000000', '云南省瑞丽市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533103000000', '533100000000', '云南省潞西市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533122000000', '533100000000', '云南省梁河县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533300000000', '530000000000', '云南省怒江傈僳族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533321000000', '533300000000', '云南省泸水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533323000000', '533300000000', '云南省福贡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533324000000', '533300000000', '云南省贡山独龙族怒族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533400000000', '530000000000', '云南省迪庆藏族自治州', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533422000000', '533400000000', '云南省德钦县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '533423000000', '533400000000', '云南省维西傈僳族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540000000000', null, '西藏自治区', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540100000000', '540000000000', '西藏拉萨市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540101000000', '540100000000', '西藏拉萨市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540102000000', '540100000000', '西藏拉萨市城关区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540121000000', '540100000000', '西藏林周县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540122000000', '540100000000', '西藏当雄县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540125000000', '540100000000', '西藏堆龙德庆县', '2', null);
commit;
prompt 3300 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '540126000000', '540100000000', '西藏达孜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542100000000', '540000000000', '西藏昌都地区', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542121000000', '542100000000', '西藏昌都县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542122000000', '542100000000', '西藏江达县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542126000000', '542100000000', '西藏察雅县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542127000000', '542100000000', '西藏八宿县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542128000000', '542100000000', '西藏左贡县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542129000000', '542100000000', '西藏芒康县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542133000000', '542100000000', '西藏边坝县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542222000000', '542200000000', '西藏扎囊县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542225000000', '542200000000', '西藏琼结县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542226000000', '542200000000', '西藏曲松县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542229000000', '542200000000', '西藏加查县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542231000000', '542200000000', '西藏隆子县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542232000000', '542200000000', '西藏错那县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542301000000', '542300000000', '西藏日喀则市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542323000000', '542300000000', '西藏江孜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542324000000', '542300000000', '西藏定日县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542326000000', '542300000000', '西藏拉孜县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542327000000', '542300000000', '西藏昂仁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '542328000000', '542300000000', '西藏谢通门县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '654026000000', '654000000000', '新疆昭苏县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510131000000', '510100000000', '四川省蒲江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510184000000', '510100000000', '四川省崇州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510311000000', '510300000000', '四川省自贡市沿滩区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510411000000', '510400000000', '四川省攀枝花市仁和区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510504000000', '510500000000', '四川省泸州市龙马潭区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510701000000', '510700000000', '四川省绵阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510725000000', '510700000000', '四川省梓潼县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510823000000', '510800000000', '四川省剑阁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510921000000', '510900000000', '四川省蓬溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511011000000', '511000000000', '四川省内江市东兴区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511129000000', '511100000000', '四川省沐川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511302000000', '511300000000', '四川省南充市顺庆区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511323000000', '511300000000', '四川省蓬安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511402000000', '511400000000', '四川省眉山市东坡区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511501000000', '511500000000', '四川省宜宾市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511525000000', '511500000000', '四川省高县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511529000000', '511500000000', '四川省屏山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511623000000', '511600000000', '四川省邻水县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511724000000', '511700000000', '四川省大竹县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511822000000', '511800000000', '四川省荥经县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511901000000', '511900000000', '四川省巴中市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530723000000', '530700000000', '云南省华坪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530826000000', '530800000000', '云南省江城哈尼族彝族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530922000000', '530900000000', '云南省云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '530927000000', '530900000000', '云南省沧源佤族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451102000000', '451100000000', '广西贺州市八步区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451121000000', '451100000000', '广西昭平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451122000000', '451100000000', '广西钟山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451123000000', '451100000000', '广西富川瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451202000000', '451200000000', '广西河池市金城江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451221000000', '451200000000', '广西南丹县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451223000000', '451200000000', '广西凤山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451224000000', '451200000000', '广西东兰县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451227000000', '451200000000', '广西巴马瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451228000000', '451200000000', '广西都安瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451229000000', '451200000000', '广西大化瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451300000000', '450000000000', '广西来宾市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451301000000', '451300000000', '广西来宾市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451322000000', '451300000000', '广西象州县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451323000000', '451300000000', '广西武宣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451324000000', '451300000000', '广西金秀瑶族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451381000000', '451300000000', '广西合山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451421000000', '451400000000', '广西扶绥县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451422000000', '451400000000', '广西宁明县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451424000000', '451400000000', '广西大新县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451425000000', '451400000000', '广西天等县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460000000000', null, '海南省', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460100000000', '460000000000', '海南省海口市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460105000000', '460100000000', '海南省海口市秀英区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460107000000', '460100000000', '海南省海口市琼山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460200000000', '460000000000', '海南省三亚市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469000000000', '460000000000', '海南省省直辖县级行政单位', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469001000000', '469000000000', '海南省五指山市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469002000000', '469000000000', '海南省琼海市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469003000000', '469000000000', '海南省儋州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469005000000', '469000000000', '海南省文昌市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469025000000', '469000000000', '海南省定安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469026000000', '469000000000', '海南省屯昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469027000000', '469000000000', '海南省澄迈县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469028000000', '469000000000', '海南省临高县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469031000000', '469000000000', '海南省昌江黎族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469033000000', '469000000000', '海南省乐东黎族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469035000000', '469000000000', '海南省保亭黎族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469036000000', '469000000000', '海南省琼中黎族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469038000000', '469000000000', '海南省南沙群岛', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469039000000', '469000000000', '海南省中沙群岛的岛礁及其海域', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500000000000', null, '重庆市', '0', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500101000000', '500100000000', '重庆市万州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500102000000', '500100000000', '重庆市涪陵区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500104000000', '500100000000', '重庆市大渡口区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500107000000', '500100000000', '重庆市九龙坡区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500109000000', '500100000000', '重庆市北碚区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500110000000', '500100000000', '重庆市万盛区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500111000000', '500100000000', '重庆市双桥区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500114000000', '500100000000', '重庆市黔江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500115000000', '500100000000', '重庆市长寿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500222000000', '500200000000', '重庆市綦江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500224000000', '500200000000', '重庆市铜梁县', '2', null);
commit;
prompt 3400 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500226000000', '500200000000', '重庆市荣昌县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500227000000', '500200000000', '重庆市璧山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500229000000', '500200000000', '重庆市城口县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500230000000', '500200000000', '重庆市丰都县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500234000000', '500200000000', '重庆市开县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500235000000', '500200000000', '重庆市云阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500236000000', '500200000000', '重庆市奉节县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500237000000', '500200000000', '重庆市巫山县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500241000000', '500200000000', '重庆市秀山土家族苗族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500300000000', '500000000000', '重庆市市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500381000000', '500300000000', '重庆市江津市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500382000000', '500300000000', '重庆市合川市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500383000000', '500300000000', '重庆市永川市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500384000000', '500300000000', '重庆市南川市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510100000000', '510000000000', '四川省成都市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510101000000', '510100000000', '四川省成都市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510104000000', '510100000000', '四川省成都市锦江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510107000000', '510100000000', '四川省成都市武侯区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510112000000', '510100000000', '四川省成都市龙泉驿区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510113000000', '510100000000', '四川省成都市青白江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510115000000', '510100000000', '四川省成都市温江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510121000000', '510100000000', '四川省金堂县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510124000000', '510100000000', '四川省郫县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510129000000', '510100000000', '四川省大邑县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510132000000', '510100000000', '四川省新津县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510181000000', '510100000000', '四川省都江堰市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510182000000', '510100000000', '四川省彭州市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510183000000', '510100000000', '四川省邛崃市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510301000000', '510300000000', '四川省自贡市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510302000000', '510300000000', '四川省自贡市自流井区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510303000000', '510300000000', '四川省自贡市贡井区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510304000000', '510300000000', '四川省自贡市大安区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510321000000', '510300000000', '四川省荣县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510322000000', '510300000000', '四川省富顺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510402000000', '510400000000', '四川省攀枝花市东区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510403000000', '510400000000', '四川省攀枝花市西区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510421000000', '510400000000', '四川省米易县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510422000000', '510400000000', '四川省盐边县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510500000000', '510000000000', '四川省泸州市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510501000000', '510500000000', '四川省泸州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510502000000', '510500000000', '四川省泸州市江阳区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510521000000', '510500000000', '四川省泸县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510522000000', '510500000000', '四川省合江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510524000000', '510500000000', '四川省叙永县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510525000000', '510500000000', '四川省古蔺县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510600000000', '510000000000', '四川省德阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510601000000', '510600000000', '四川省德阳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510623000000', '510600000000', '四川省中江县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510681000000', '510600000000', '四川省广汉市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510682000000', '510600000000', '四川省什邡市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510683000000', '510600000000', '四川省绵竹市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510700000000', '510000000000', '四川省绵阳市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510703000000', '510700000000', '四川省绵阳市涪城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510704000000', '510700000000', '四川省绵阳市游仙区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510723000000', '510700000000', '四川省盐亭县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510724000000', '510700000000', '四川省安县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510726000000', '510700000000', '四川省北川羌族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510727000000', '510700000000', '四川省平武县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510781000000', '510700000000', '四川省江油市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510800000000', '510000000000', '四川省广元市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510811000000', '510800000000', '四川省广元市元坝区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510812000000', '510800000000', '四川省广元市朝天区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510821000000', '510800000000', '四川省旺苍县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510822000000', '510800000000', '四川省青川县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510824000000', '510800000000', '四川省苍溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510901000000', '510900000000', '四川省遂宁市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510904000000', '510900000000', '四川省遂宁市安居区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510922000000', '510900000000', '四川省射洪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510923000000', '510900000000', '四川省大英县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511000000000', '510000000000', '四川省内江市', '1', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511001000000', '511000000000', '四川省内江市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '511002000000', '511000000000', '四川省内江市市中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440202000000', '440200000000', '广东省韶关市北江区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440229000000', '440200000000', '广东省翁源县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440301000000', '440300000000', '广东省深圳市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440308000000', '440300000000', '广东省深圳市盐田区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440507000000', '440500000000', '广东省汕头市龙湖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440515000000', '440500000000', '广东省汕头市澄海区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440783000000', '440700000000', '广东省开平市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440804000000', '440800000000', '广东省湛江市坡头区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440901000000', '440900000000', '广东省茂名市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '440983000000', '440900000000', '广东省信宜市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441224000000', '441200000000', '广东省怀集县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441301000000', '441300000000', '广东省惠州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441401000000', '441400000000', '广东省梅州市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441502000000', '441500000000', '广东省汕尾市城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441621000000', '441600000000', '广东省紫金县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441701000000', '441700000000', '广东省阳江市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441802000000', '441800000000', '广东省清远市清城区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '441827000000', '441800000000', '广东省清新县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445222000000', '445200000000', '广东省揭西县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '445321000000', '445300000000', '广东省新兴县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450102000000', '450100000000', '广西南宁市兴宁区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450121000000', '450100000000', '广西邕宁县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450126000000', '450100000000', '广西宾阳县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450203000000', '450200000000', '广西柳州市鱼峰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450302000000', '450300000000', '广西桂林市秀峰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450322000000', '450300000000', '广西临桂县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450326000000', '450300000000', '广西永福县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450331000000', '450300000000', '广西荔蒲县', '2', null);
commit;
prompt 3500 records committed...
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450404000000', '450400000000', '广西梧州市蝶山区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450501000000', '450500000000', '广西北海市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450702000000', '450700000000', '广西钦州市钦南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450802000000', '450800000000', '广西贵港市港北区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450902000000', '450900000000', '广西玉林市玉州区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '450981000000', '450900000000', '广西北流市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451023000000', '451000000000', '广西平果县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451027000000', '451000000000', '广西凌云县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451225000000', '451200000000', '广西罗城仫佬族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451302000000', '451300000000', '广西来宾市兴宾区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451401000000', '451400000000', '广西崇左市市辖区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '451481000000', '451400000000', '广西凭祥市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '460108000000', '460100000000', '海南省海口市美兰区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469007000000', '469000000000', '海南省东方市', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '469030000000', '469000000000', '海南省白沙黎族自治县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500103000000', '500100000000', '重庆市渝中区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500108000000', '500100000000', '重庆市南岸区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500113000000', '500100000000', '重庆市巴南区', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500228000000', '500200000000', '重庆市梁平县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500233000000', '500200000000', '重庆市忠县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '500238000000', '500200000000', '重庆市巫溪县', '2', null);
insert into T_LOC (id, region_code, upper_code, location, member, memo)
values (2, '510114000000', '510100000000', '四川省成都市新都区', '2', null);
commit;
prompt 3522 records loaded
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
set feedback on
set define on
prompt Done.
