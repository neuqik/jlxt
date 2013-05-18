--------------------------------------------
-- Export file for user JLXT              --
-- Created by kuqi on 2013/5/18, 16:51:06 --
--------------------------------------------

spool user_objects_jxlt_20130512.log

prompt
prompt Creating table HRD_EMP
prompt ======================
prompt
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

prompt
prompt Creating table HRD_EMP_CERT
prompt ===========================
prompt
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

prompt
prompt Creating table HRD_EMP_CONTRACT
prompt ===============================
prompt
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

prompt
prompt Creating table HRD_EMP_DOC
prompt ==========================
prompt
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

prompt
prompt Creating table HRD_EMP_EDU
prompt ==========================
prompt
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

prompt
prompt Creating table HRD_EMP_FAMILY
prompt =============================
prompt
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

prompt
prompt Creating table HRD_EMP_INSU
prompt ===========================
prompt
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

prompt
prompt Creating table HRD_EMP_JOB
prompt ==========================
prompt
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

prompt
prompt Creating table HRD_EMP_PERF
prompt ===========================
prompt
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

prompt
prompt Creating table HRD_EMP_PROF
prompt ===========================
prompt
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

prompt
prompt Creating table HRD_EMP_REG
prompt ==========================
prompt
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

prompt
prompt Creating table HRD_EMP_REWARD
prompt =============================
prompt
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

prompt
prompt Creating table HRD_EMP_TRAIN
prompt ============================
prompt
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

prompt
prompt Creating table HRD_EMP_TRANSFER
prompt ===============================
prompt
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

prompt
prompt Creating table HRD_EMP_WORK
prompt ===========================
prompt
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

prompt
prompt Creating table ORDERS
prompt =====================
prompt
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

prompt
prompt Creating table PRJ_BUILDING
prompt ===========================
prompt
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
create unique index IDX_PRJ_BUILDING on PRJ_BUILDING (PRJ_ID, BUILDING_ID);
alter table PRJ_BUILDING
  add constraint PK_PRJ_BUILDING primary key (ID);

prompt
prompt Creating table PRJ_CHECK
prompt ========================
prompt
create table PRJ_CHECK
(
  id              NUMBER(20) not null,
  prj_id          NUMBER(20) not null,
  checkitem       VARCHAR2(3),
  detailitem      VARCHAR2(3),
  checkdate       DATE,
  deserve_score   NUMBER(10,2),
  act_score       NUMBER(10,2),
  act_pct         NUMBER(5,2),
  standard        VARCHAR2(3),
  deduction       VARCHAR2(500),
  check_emp_id    VARCHAR2(20),
  problem         VARCHAR2(500),
  resolved        VARCHAR2(100),
  resolved_result VARCHAR2(500),
  memo            VARCHAR2(500),
  valid           VARCHAR2(3) not null,
  check_type      VARCHAR2(3) not null,
  building_id     VARCHAR2(20)
)
;
comment on table PRJ_CHECK
  is '项目安全质量检查';
comment on column PRJ_CHECK.prj_id
  is '项目ID';
comment on column PRJ_CHECK.checkitem
  is '检查项目';
comment on column PRJ_CHECK.detailitem
  is '子项目名称';
comment on column PRJ_CHECK.checkdate
  is '检查时间';
comment on column PRJ_CHECK.deserve_score
  is '应得分';
comment on column PRJ_CHECK.act_score
  is '实得分';
comment on column PRJ_CHECK.act_pct
  is '得分率';
comment on column PRJ_CHECK.standard
  is '评分标准';
comment on column PRJ_CHECK.deduction
  is '扣分原因';
comment on column PRJ_CHECK.check_emp_id
  is '检查员工编号';
comment on column PRJ_CHECK.problem
  is '存在问题';
comment on column PRJ_CHECK.resolved
  is '整改时间';
comment on column PRJ_CHECK.resolved_result
  is '整改结果';
comment on column PRJ_CHECK.memo
  is '备注';
comment on column PRJ_CHECK.check_type
  is '检查类型,1-安全,2-质量';
comment on column PRJ_CHECK.building_id
  is '建筑编号';
create unique index IDX_PRJ_CHECK on PRJ_CHECK (PRJ_ID, CHECKDATE, DETAILITEM, CHECK_TYPE);
alter table PRJ_CHECK
  add constraint PK_PRJ_CHECK primary key (ID);

prompt
prompt Creating table PRJ_INFO
prompt =======================
prompt
create table PRJ_INFO
(
  id              NUMBER(20) not null,
  prjno           VARCHAR2(20),
  contractno      VARCHAR2(20),
  prj_name        VARCHAR2(200),
  prj_area        VARCHAR2(20),
  quality_target  VARCHAR2(3),
  prj_starttime   DATE,
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

prompt
prompt Creating table PRJ_MAJORCHECK
prompt =============================
prompt
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

prompt
prompt Creating table PRJ_ORG
prompt ======================
prompt
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
alter table PRJ_ORG
  add constraint PK_PRJ_ORG primary key (ID);

prompt
prompt Creating table PRJ_UNIT
prompt =======================
prompt
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
alter table PRJ_UNIT
  add constraint PK_PRJ_UNIT primary key (ID);

prompt
prompt Creating table PRJ_UNIT_RELATE
prompt ==============================
prompt
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

prompt
prompt Creating table TMP_EMP_IMP
prompt ==========================
prompt
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

prompt
prompt Creating table T_CODELIST
prompt =========================
prompt
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

prompt
prompt Creating table T_LOC
prompt ====================
prompt
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

prompt
prompt Creating table T_TEST_PENGXF
prompt ============================
prompt
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

prompt
prompt Creating sequence SEQ_A_EMPID
prompt =============================
prompt
create sequence SEQ_A_EMPID
minvalue 10001
maxvalue 9999999999
start with 10031
increment by 1
cache 5;

prompt
prompt Creating sequence SEQ_A_PRJNO
prompt =============================
prompt
create sequence SEQ_A_PRJNO
minvalue 1001
maxvalue 9999999999
start with 1021
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_ID
prompt ========================
prompt
create sequence SEQ_ID
minvalue 1001
maxvalue 999999999999999999
start with 1176
increment by 1
cache 5;

prompt
prompt Creating view V_HRD_EMP
prompt =======================
prompt
create or replace view v_hrd_emp as
select "ID","EMP_ID","EMP_NAME","NATION","BIRTH",TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER(TO_CHAR(BIRTH,'YYYY')) "AGE","EDUCATION","MARRIAGE","GENDER","POLITIC","IDCARD","NATIVE","WORKDATE","WORKAGE","EMPTYPE","JOINDATE","JOINAGE","DEPT_ID","ROLENAME","TITLE_ID","TITLENAME","TITLEWORK","INSUSTATUS","TEL","TELEHOME","EMERGENCY","GRADUATE","MASTER","GRADDATE","LOCATION1","REGLOCATION","WINTERLOC","PICTURE","MEMO","VALID","LOCATION2","LOCATION3","LOCATION4","ARCHIVEKEEP","PENSION_NO","MEDICA_NO" from hrd_emp where valid='1';

prompt
prompt Creating view V_HRD_EMP_CERT
prompt ============================
prompt
create or replace view v_hrd_emp_cert as
select "ID","EMP_ID","CERT","CERTNO","OBTDATE","CLOSEDATE","CERTDEPT","MEMO","VALID"
    from hrd_emp_cert
   where valid='1';

prompt
prompt Creating view V_HRD_EMP_CONTRACT
prompt ================================
prompt
create or replace view v_hrd_emp_contract as
select "ID","EMP_ID","CONTRACT_ID","CONTRACT_NAME","CONTRACTTYPE","CONTRACTPROP","BEGINDATE","ENDDATE","ADDITION","MEMO","VALID","ACCIDENT_START","ACCIDENT_END","INSU"
    from HRD_EMP_CONTRACT
   where VALID='1';

prompt
prompt Creating view V_HRD_EMP_EDU
prompt ===========================
prompt
create or replace view v_hrd_emp_edu as
select "ID","EMP_ID","GRADUATION","GRADUATEDATE","MAJOR","GRADUATENO","MEMO","VALID"
    from HRD_EMP_EDU
   where valid='1';

prompt
prompt Creating view V_HRD_EMP_FAMILY
prompt ==============================
prompt
create or replace view v_hrd_emp_family as
select "ID","EMP_ID","RELATION_NAME","RELATION_TYPE","RELATION_TEL","WORKDEPT","WORKROLE","MEMO","VALID" from HRD_EMP_FAMILY where valid='1';

prompt
prompt Creating view V_HRD_EMP_JOB
prompt ===========================
prompt
create or replace view v_hrd_emp_job as
select "ID","EMP_ID","JOB_START","JOB_END","ACCIDENT_START","ACCIDENT_END","MEMO","VALID","PENSION","MEDICA","BEAR","UNEMP","INSU"
    from hrd_emp_job
   where valid='1';

prompt
prompt Creating view V_HRD_EMP_PERF
prompt ============================
prompt
create or replace view v_hrd_emp_perf as
select "ID","PERIOD","PERFORMANCE","PROF_PERF","WORK_PERF","MANAGE_PERF","MEMO","EMP_ID","VALID" from hrd_emp_PERF where valid='1';

prompt
prompt Creating view V_HRD_EMP_PROF
prompt ============================
prompt
create or replace view v_hrd_emp_prof as
select "ID","EMP_ID","PROFTYPE","OBTAINTYPE","OBTAINDATE","OBTAINDEPT","PROF_NUM","ENDDATE","MEMO","VALID"
    from hrd_emp_prof
   where valid='1';

prompt
prompt Creating view V_HRD_EMP_REG
prompt ===========================
prompt
create or replace view v_hrd_emp_reg as
select "ID","EMP_ID","REGTYPE","REGLEVEL","REGMAJOR1","REGMAJOR2","REGMAJOR3","REGNO","CERTIFICATE","VALIDDATE","ISSUEDATE","CERTNUMBER","CERTDATE","CERTVALIDDATE","MEMO","VALID","PERF_STUDY","CONTINUE_EDU","CONTINUE_NO","CONTINUE_DATE"
    from hrd_emp_reg
   where valid='1';

prompt
prompt Creating view V_HRD_EMP_REWARD
prompt ==============================
prompt
create or replace view v_hrd_emp_reward as
select "ID","EMP_ID","REWARDTYPE","REWARDDATE","REWARDDEPT","REWARD","MEMO","VALID","REWARD_PERSON"
    from hrd_emp_reward
   where valid='1';

prompt
prompt Creating view V_HRD_EMP_TRAIN
prompt =============================
prompt
create or replace view v_hrd_emp_train as
select "ID","EMP_ID","TRAININGDATE","TRAINING","KNOWLEDGE","TRAININGDEPT","FEE","INTERTRAINING","RESULT","WORK","PROFESSIONAL","MEMO","VALID" from hrd_emp_train where valid='1';

prompt
prompt Creating view V_HRD_EMP_TRANSFER
prompt ================================
prompt
create or replace view v_hrd_emp_transfer as
select "ID","EMP_ID","TRANSFERDATE","TRANSFERTYPE","TRANSFERREASON","PREVDEPT_ID","NEWDEPT_ID","MEMO","VALID"
    from hrd_emp_transfer
   where valid='1';

prompt
prompt Creating view V_HRD_EMP_WORK
prompt ============================
prompt
create or replace view v_hrd_emp_work as
select "ID","EMP_ID","BEGIN","END","UNIT","DEPT","JOBROLE","MEMO","VALID"
    from hrd_emp_work
   where valid='1';

prompt
prompt Creating view V_PRJ_BUILDING
prompt ============================
prompt
create or replace view v_prj_building as
select "ID","PRJ_ID","BUILDING_ID","UNDERFLOOR","ABOVEFLOOR","HEIGHT","BUILDING_AREA","ACT_BEGIN","ACT_END","ACT_TIME","PROGRESS","IMAGE_PROGRESS","MEMO","VALID","BUILDING_TYPE","BUILDER_LICENSE","LICENSE_DATE","SECURITY_LEVEL","CONSTRUCT_TYPE" from prj_building where valid='1';

prompt
prompt Creating view V_PRJ_INFO
prompt ========================
prompt
create or replace view v_prj_info as
select "ID","PRJNO","CONTRACTNO","PRJ_NAME","PRJ_AREA","QUALITY_TARGET","PRJ_STARTTIME","PRJ_ENDTIME","PRJ_TIME","PRJ_PIC","PRJ_PROGRESS","MEMO","VALID","LOCATION1","LOCATION2","LOCATION3","LOCATION4","BUILDINGCOUNT","CONTRACTAREA","PRJ_LEVEL","PRJ_TYPE","PRJ_INVEST","WEEKMEETING","PRJ_MAP","PRJ_REGION","PRJ_ARCHIVE","WEEKMEETINGTIME","PRJ_ARCHIVETIME" from prj_info where valid='1';

prompt
prompt Creating view V_PRJ_ORG
prompt =======================
prompt
create or replace view v_prj_org as
select "ID","EMP_ID","PRJ_ROLE","PRJ_ID","ENTERTIME","LEAVETIME","RESPONSBILITY","MEMO","VALID"
    from prj_org
   where valid='1';

prompt
prompt Creating view V_PRJ_UNIT
prompt ========================
prompt
create or replace view v_prj_unit as
select "ID","PRJ_ID","UNIT_NAME","GROUP_NAME","UNIT_TYPE","QUALI_LEVEL","UNIT_ADDRESS","CONTRACTOR","TITLE","CONTRACT_TEL","MEMO","VALID" from prj_unit where valid='1';

prompt
prompt Creating view V_PRJ_UNIT_RELATE
prompt ===============================
prompt
create or replace view v_prj_unit_relate as
select "ID","PRJ_ID","DEPT_ID","MEMO","VALID" from prj_unit_relate where valid='1';

prompt
prompt Creating package PKG_DATAIMP
prompt ============================
prompt
CREATE OR REPLACE PACKAGE pkg_dataimp IS

END pkg_dataimp;
/

prompt
prompt Creating function FUN_GETAGE
prompt ============================
prompt
CREATE OR REPLACE FUNCTION fun_getage(idcard  IN VARCHAR2)
  RETURN number IS
  RESULT number(3):=0;
BEGIN
  RETURN RESULT;
EXCEPTION
  WHEN no_data_found THEN
    RETURN 0;
  WHEN OTHERS THEN
    RETURN 0;
END fun_getage;
/

prompt
prompt Creating function FUN_GETBIRTH
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION fun_getbirth(idcard  IN VARCHAR2)
  RETURN date IS
  RESULT date:=null;
BEGIN
  RETURN RESULT;
EXCEPTION
  WHEN no_data_found THEN
    RETURN null;
  WHEN OTHERS THEN
    RETURN null;
END fun_getbirth;
/

prompt
prompt Creating function FUN_GETCODEDESC
prompt =================================
prompt
CREATE OR REPLACE FUNCTION fun_getcodedesc(codetype  IN VARCHAR2,
                                           codevalue IN VARCHAR2)
  RETURN VARCHAR2 IS
  RESULT VARCHAR2(2000);
BEGIN
  -- 查询中文
  SELECT tc.code_desc
    INTO RESULT
    FROM t_codelist tc
   WHERE tc.code_type = upper(codetype)
     AND tc.code_value = codevalue
     AND tc.valid = '1';

  RETURN RESULT;
EXCEPTION
  WHEN no_data_found THEN
    RETURN codevalue;
  WHEN OTHERS THEN
    RETURN codevalue;
END fun_getcodedesc;
/

prompt
prompt Creating function FUN_GETCODEVALUE
prompt ==================================
prompt
CREATE OR REPLACE FUNCTION fun_getcodevalue(codetype IN VARCHAR2,
                                            codedesc IN VARCHAR2)
  RETURN VARCHAR2 IS
  RESULT VARCHAR2(2000);
BEGIN
  -- 查询中文
  SELECT tc.code_value
    INTO RESULT
    FROM t_codelist tc
   WHERE tc.code_type = upper(codetype)
     AND tc.code_desc = codedesc
     AND tc.valid = '1';

  RETURN RESULT;
EXCEPTION
  WHEN no_data_found THEN
    RETURN codedesc;
  WHEN OTHERS THEN
    RETURN codedesc;
END fun_getcodevalue;
/

prompt
prompt Creating function FUN_GETLOC
prompt ============================
prompt
CREATE OR REPLACE FUNCTION fun_getloc(codevalue IN VARCHAR2)
  RETURN VARCHAR2 IS
  RESULT VARCHAR2(2000);
BEGIN
  -- 查询中文
  SELECT tc.location
    INTO RESULT
    FROM t_loc tc
   WHERE tc.region_code = codevalue;

  RETURN RESULT;
EXCEPTION
  WHEN no_data_found THEN
    RETURN codevalue;
  WHEN OTHERS THEN
    RETURN codevalue;
END fun_getloc;
/

prompt
prompt Creating package body PKG_DATAIMP
prompt =================================
prompt
CREATE OR REPLACE PACKAGE BODY pkg_dataimp IS
  -- 导入员工信息
  PROCEDURE prc_emp_imp IS
    prefix      VARCHAR2(3) := 'A1';
    id          NUMBER(20);
    emp_id      VARCHAR2(20);
    emp_name    VARCHAR2(20);
    nation      VARCHAR2(3);
    birth       DATE;
    age         NUMBER(3);
    education   VARCHAR2(20);
    marriage    VARCHAR2(3);
    gender      VARCHAR2(3);
    politic     VARCHAR2(3);
    idcard      VARCHAR2(18);
    native      VARCHAR2(200);
    workdate    DATE;
    workage     NUMBER(3);
    emptype     VARCHAR2(3);
    joindate    DATE;
    joinage     NUMBER(3);
    dept_id     VARCHAR2(20);
    rolename    VARCHAR2(3);
    title_id    VARCHAR2(3);
    titlename   VARCHAR2(200);
    titlework   VARCHAR2(200);
    insustatus  VARCHAR2(3);
    tel         VARCHAR2(20);
    telehome    VARCHAR2(20);
    emergency   VARCHAR2(20);
    graduate    VARCHAR2(100);
    master      VARCHAR2(100);
    graddate    DATE;
    location1   VARCHAR2(20);
    reglocation VARCHAR2(200);
    winterloc   VARCHAR2(200);
    picture     VARCHAR2(200);
    memo        VARCHAR2(500);
    valid       VARCHAR2(3);
    location2   VARCHAR2(200);
    location3   VARCHAR2(200);
    location4   VARCHAR2(2000);
    archivekeep VARCHAR2(3);
    pension_no  VARCHAR2(20);
    medica_no   VARCHAR2(20);
  BEGIN
    FOR c IN (SELECT * FROM tmp_emp_imp) LOOP
      id       := c.col1;
      emp_id   := prefix || lpad(c.col1, 4, '0');
      emp_name := c.col2;
      nation   := fun_getcodevalue('NATION', c.col8 || '族');
      birth    := fun_getbirth(c.col5);
      age      := fun_getage(c.col5);
      education:=c.col17;
    END LOOP;
  END;
END pkg_dataimp;
/


spool off
