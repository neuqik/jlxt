--------------------------------------------
-- Export file for user JLXT              --
-- Created by kuqi on 2013/5/19, 16:58:07 --
--------------------------------------------

spool user_objects_jxlt.log

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
  is 'Ա����Ϣ';
comment on column HRD_EMP.emp_id
  is 'Ա�����';
comment on column HRD_EMP.emp_name
  is '����';
comment on column HRD_EMP.nation
  is '����';
comment on column HRD_EMP.birth
  is '��������';
comment on column HRD_EMP.age
  is '����';
comment on column HRD_EMP.education
  is '�Ļ��̶�';
comment on column HRD_EMP.marriage
  is '����״��';
comment on column HRD_EMP.gender
  is '�Ա�';
comment on column HRD_EMP.politic
  is '������ò';
comment on column HRD_EMP.idcard
  is '���֤����';
comment on column HRD_EMP.native
  is '����';
comment on column HRD_EMP.workdate
  is '�μӹ�������';
comment on column HRD_EMP.workage
  is '����(derive)';
comment on column HRD_EMP.emptype
  is 'Ա������';
comment on column HRD_EMP.joindate
  is '���뱾��λʱ��';
comment on column HRD_EMP.joinage
  is '����λ����(derive)';
comment on column HRD_EMP.dept_id
  is '���ű��';
comment on column HRD_EMP.rolename
  is '��λ';
comment on column HRD_EMP.title_id
  is 'ְ��';
comment on column HRD_EMP.titlename
  is 'ְ��רҵ';
comment on column HRD_EMP.titlework
  is '����רҵ';
comment on column HRD_EMP.insustatus
  is '����״̬';
comment on column HRD_EMP.tel
  is '��ϵ�绰';
comment on column HRD_EMP.telehome
  is '��ͥ�绰';
comment on column HRD_EMP.emergency
  is '����/������ϵ�˵绰';
comment on column HRD_EMP.graduate
  is '��ҵԺУ';
comment on column HRD_EMP.master
  is '����רҵ';
comment on column HRD_EMP.graddate
  is '��ҵʱ��';
comment on column HRD_EMP.location1
  is '��ס��ַ(ʡ)';
comment on column HRD_EMP.reglocation
  is '�������ڵ�';
comment on column HRD_EMP.winterloc
  is '�������ڵ�';
comment on column HRD_EMP.picture
  is '��Ƭ·��';
comment on column HRD_EMP.memo
  is '��ע';
comment on column HRD_EMP.valid
  is '��Ч��ǣ�1��Ч0��Ч';
comment on column HRD_EMP.location2
  is '��ס��ַ(��)';
comment on column HRD_EMP.location3
  is '��ס��ַ(��/��)';
comment on column HRD_EMP.location4
  is '��ס��ַ(�ֵ�)';
comment on column HRD_EMP.archivekeep
  is '�������ܻ���';
comment on column HRD_EMP.pension_no
  is '���ϱ��ձ��';
comment on column HRD_EMP.medica_no
  is 'ҽ�Ʊ��ձ��';

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
  is 'Ա������֤����Ϣ';
comment on column HRD_EMP_CERT.emp_id
  is 'Ա�����';
comment on column HRD_EMP_CERT.cert
  is '֤������';
comment on column HRD_EMP_CERT.certno
  is '֤����';
comment on column HRD_EMP_CERT.obtdate
  is '֤��ȡ������';
comment on column HRD_EMP_CERT.closedate
  is '֤���������';
comment on column HRD_EMP_CERT.certdept
  is '��֤����';
comment on column HRD_EMP_CERT.memo
  is '��ע';
comment on column HRD_EMP_CERT.valid
  is '��Ч���1��Ч��0��Ч';

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
  is 'Ա����ͬ��Ϣ';
comment on column HRD_EMP_CONTRACT.emp_id
  is 'Ա�����';
comment on column HRD_EMP_CONTRACT.contract_id
  is '��ͬ���';
comment on column HRD_EMP_CONTRACT.contract_name
  is '��ͬ����';
comment on column HRD_EMP_CONTRACT.contracttype
  is '��ͬ����';
comment on column HRD_EMP_CONTRACT.contractprop
  is '��ͬ����';
comment on column HRD_EMP_CONTRACT.begindate
  is '��ʼ����';
comment on column HRD_EMP_CONTRACT.enddate
  is '��ֹ����';
comment on column HRD_EMP_CONTRACT.addition
  is '��������';
comment on column HRD_EMP_CONTRACT.memo
  is '��ע';
comment on column HRD_EMP_CONTRACT.valid
  is '��Ч��־';
comment on column HRD_EMP_CONTRACT.accident_start
  is '�����տ�ʼ����';
comment on column HRD_EMP_CONTRACT.accident_end
  is '��������ֹ����';
comment on column HRD_EMP_CONTRACT.insu
  is '�����ղμӱ�־';

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
  is 'Ա��������Ϣ';
comment on column HRD_EMP_DOC.emp_id
  is 'Ա�����';
comment on column HRD_EMP_DOC.doc_id
  is '�������';
comment on column HRD_EMP_DOC.document
  is '��������';
comment on column HRD_EMP_DOC.doc_date
  is '����ʱ��';
comment on column HRD_EMP_DOC.feestatus
  is '�ɷ����';
comment on column HRD_EMP_DOC.prevdoc
  is 'ԭ��������';
comment on column HRD_EMP_DOC.newdoc
  is '������������';
comment on column HRD_EMP_DOC.memo
  is '��ע';
comment on column HRD_EMP_DOC.valid
  is '��Ч��־';

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
  is 'Ա����ҵ֤��Ϣ';
comment on column HRD_EMP_EDU.emp_id
  is 'Ա�����';
comment on column HRD_EMP_EDU.graduation
  is '��ҵԺУ';
comment on column HRD_EMP_EDU.graduatedate
  is '��ҵʱ��';
comment on column HRD_EMP_EDU.major
  is '��ѧרҵ';
comment on column HRD_EMP_EDU.graduateno
  is '��ҵ֤��';
comment on column HRD_EMP_EDU.memo
  is '��ע';

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
  is 'Ա����ͥ��ϵ';
comment on column HRD_EMP_FAMILY.emp_id
  is 'Ա�����';
comment on column HRD_EMP_FAMILY.relation_name
  is '��ϵ������';
comment on column HRD_EMP_FAMILY.relation_type
  is '�뱾�˹�ϵ';
comment on column HRD_EMP_FAMILY.relation_tel
  is '��ϵ�绰';
comment on column HRD_EMP_FAMILY.workdept
  is '������λ';
comment on column HRD_EMP_FAMILY.workrole
  is 'ְ��';
comment on column HRD_EMP_FAMILY.memo
  is '��ע';
comment on column HRD_EMP_FAMILY.valid
  is '��Ч��ǣ�1��Ч0��Ч';

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
  is 'Ա��������Ϣ';
comment on column HRD_EMP_INSU.emp_id
  is 'Ա�����';
comment on column HRD_EMP_INSU.insutype
  is '��������(���ϱ���/ҽ�Ʊ��յ�)';
comment on column HRD_EMP_INSU.begindate
  is '��ʼʱ��';
comment on column HRD_EMP_INSU.enddate
  is '��ֹʱ��';
comment on column HRD_EMP_INSU.memo
  is '��ע';
comment on column HRD_EMP_INSU.valid
  is '��Ч��־';

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
  is 'Ա��������¼';
comment on column HRD_EMP_JOB.emp_id
  is 'Ա�����';
comment on column HRD_EMP_JOB.job_start
  is '�Ͷ���ͬ��ʼ����';
comment on column HRD_EMP_JOB.job_end
  is '�Ͷ���ͬ��ֹ����';
comment on column HRD_EMP_JOB.accident_start
  is '�����տ�ʼ����';
comment on column HRD_EMP_JOB.accident_end
  is '��������ֹ����';
comment on column HRD_EMP_JOB.memo
  is '��ע';
comment on column HRD_EMP_JOB.valid
  is '��Ч���';
comment on column HRD_EMP_JOB.pension
  is '���ϲμӱ�־';
comment on column HRD_EMP_JOB.medica
  is 'ҽ�Ʋμӱ�־';
comment on column HRD_EMP_JOB.bear
  is '�����μӱ�־';
comment on column HRD_EMP_JOB.unemp
  is 'ʧҵ�μӱ�־';
comment on column HRD_EMP_JOB.insu
  is '�����ղμӱ�־';

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
  is 'Ա����Ч����';
comment on column HRD_EMP_PERF.period
  is '�������ڣ����������д2012';
comment on column HRD_EMP_PERF.performance
  is '�ۺ�����';
comment on column HRD_EMP_PERF.prof_perf
  is 'רҵˮƽ����';
comment on column HRD_EMP_PERF.work_perf
  is '����̬������';
comment on column HRD_EMP_PERF.manage_perf
  is '������������';
comment on column HRD_EMP_PERF.memo
  is '��ע';
comment on column HRD_EMP_PERF.emp_id
  is 'Ա�����';
comment on column HRD_EMP_PERF.valid
  is '��Ч��־,1��Ч0��Ч';

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
  is 'Ա��ְ����Ϣ';
comment on column HRD_EMP_PROF.emp_id
  is 'Ա�����';
comment on column HRD_EMP_PROF.proftype
  is 'ְ�����';
comment on column HRD_EMP_PROF.obtaintype
  is '��÷�ʽ';
comment on column HRD_EMP_PROF.obtaindate
  is '�������';
comment on column HRD_EMP_PROF.obtaindept
  is '��֤����';
comment on column HRD_EMP_PROF.prof_num
  is 'ְ��֤����';
comment on column HRD_EMP_PROF.enddate
  is '��Ч��������';
comment on column HRD_EMP_PROF.memo
  is '��ע';
comment on column HRD_EMP_PROF.valid
  is '��Ч��־';

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
  is 'Ա��רҵ����ע����Ϣ';
comment on column HRD_EMP_REG.emp_id
  is 'Ա�����';
comment on column HRD_EMP_REG.regtype
  is 'ע�����';
comment on column HRD_EMP_REG.reglevel
  is 'ע�ἶ��';
comment on column HRD_EMP_REG.regmajor1
  is 'ע��רҵ1';
comment on column HRD_EMP_REG.regmajor2
  is 'ע��רҵ2';
comment on column HRD_EMP_REG.regmajor3
  is 'ע��רҵ3';
comment on column HRD_EMP_REG.regno
  is 'ע���';
comment on column HRD_EMP_REG.certificate
  is '֤����';
comment on column HRD_EMP_REG.validdate
  is '��Ч��';
comment on column HRD_EMP_REG.issuedate
  is '��֤����';
comment on column HRD_EMP_REG.certnumber
  is '�ʸ�֤��';
comment on column HRD_EMP_REG.certdate
  is '�ʸ�֤��֤����';
comment on column HRD_EMP_REG.certvaliddate
  is '�ʸ�֤��Ч��';
comment on column HRD_EMP_REG.memo
  is '��ע';
comment on column HRD_EMP_REG.valid
  is '��Ч��־';
comment on column HRD_EMP_REG.perf_study
  is '��ѧרҵ(ע��)';
comment on column HRD_EMP_REG.continue_edu
  is '��������רҵ';
comment on column HRD_EMP_REG.continue_no
  is '������ѵ֤���';
comment on column HRD_EMP_REG.continue_date
  is '��������ʱ��';

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
  is 'Ա��������Ϣ';
comment on column HRD_EMP_REWARD.emp_id
  is 'Ա�����';
comment on column HRD_EMP_REWARD.rewardtype
  is '����';
comment on column HRD_EMP_REWARD.rewarddate
  is '��������';
comment on column HRD_EMP_REWARD.rewarddept
  is '���͵�λ';
comment on column HRD_EMP_REWARD.reward
  is '��������';
comment on column HRD_EMP_REWARD.memo
  is '��ע';
comment on column HRD_EMP_REWARD.valid
  is '��Ч��־';
comment on column HRD_EMP_REWARD.reward_person
  is '���˻�֤��';

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
  is 'Ա����ѵ��Ϣ';
comment on column HRD_EMP_TRAIN.emp_id
  is 'Ա�����';
comment on column HRD_EMP_TRAIN.trainingdate
  is '��ѵʱ��';
comment on column HRD_EMP_TRAIN.training
  is '��ѵ����';
comment on column HRD_EMP_TRAIN.knowledge
  is '��ѵרҵ';
comment on column HRD_EMP_TRAIN.trainingdept
  is '��ѵ��λ';
comment on column HRD_EMP_TRAIN.fee
  is '��ѵ����';
comment on column HRD_EMP_TRAIN.intertraining
  is '�Ƿ��ڲ���ѵ';
comment on column HRD_EMP_TRAIN.result
  is '�ۺ�����';
comment on column HRD_EMP_TRAIN.work
  is '��������';
comment on column HRD_EMP_TRAIN.professional
  is 'רҵ����';
comment on column HRD_EMP_TRAIN.memo
  is '��ע';
comment on column HRD_EMP_TRAIN.valid
  is '��Ч��־ ';

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
  is 'Ա����ת��Ϣ';
comment on column HRD_EMP_TRANSFER.emp_id
  is 'Ա�����';
comment on column HRD_EMP_TRANSFER.transferdate
  is '��ת����';
comment on column HRD_EMP_TRANSFER.transfertype
  is '��ת����';
comment on column HRD_EMP_TRANSFER.transferreason
  is '��תԭ��';
comment on column HRD_EMP_TRANSFER.prevdept_id
  is 'ԭ����';
comment on column HRD_EMP_TRANSFER.newdept_id
  is '�ֲ��ţ��ڲ���ת��';
comment on column HRD_EMP_TRANSFER.memo
  is '��ע';
comment on column HRD_EMP_TRANSFER.valid
  is '��Ч��־';

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
  is 'Ա����������';
comment on column HRD_EMP_WORK.emp_id
  is 'Ա�����';
comment on column HRD_EMP_WORK.begin
  is '��ʼʱ��';
comment on column HRD_EMP_WORK.end
  is '��ֹʱ��';
comment on column HRD_EMP_WORK.unit
  is '������λ';
comment on column HRD_EMP_WORK.dept
  is '��������';
comment on column HRD_EMP_WORK.jobrole
  is '����ְ��';
comment on column HRD_EMP_WORK.memo
  is '��ע';
comment on column HRD_EMP_WORK.valid
  is '��Ч���1��Ч��0��Ч';

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
  is '��Ŀ������Ϣ';
comment on column PRJ_BUILDING.prj_id
  is '��ĿID';
comment on column PRJ_BUILDING.building_id
  is '������/¥��';
comment on column PRJ_BUILDING.underfloor
  is '���²���';
comment on column PRJ_BUILDING.abovefloor
  is '���ϲ���';
comment on column PRJ_BUILDING.height
  is '�����߶�';
comment on column PRJ_BUILDING.building_area
  is '�������';
comment on column PRJ_BUILDING.act_begin
  is 'ʵ�ʿ�������';
comment on column PRJ_BUILDING.act_end
  is 'ʵ�ʿ�������';
comment on column PRJ_BUILDING.act_time
  is 'ʵ�ʹ���';
comment on column PRJ_BUILDING.progress
  is '�������';
comment on column PRJ_BUILDING.image_progress
  is '�������';
comment on column PRJ_BUILDING.memo
  is '��ע';
comment on column PRJ_BUILDING.building_type
  is '���̷���';
comment on column PRJ_BUILDING.builder_license
  is 'ʩ�����֤';
comment on column PRJ_BUILDING.license_date
  is 'ʩ�����֤����';
comment on column PRJ_BUILDING.security_level
  is '��ȫ�ȼ�';
comment on column PRJ_BUILDING.construct_type
  is '�ṹ����';
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
  is '��Ŀ��ȫ�������';
comment on column PRJ_CHECK.prj_id
  is '��ĿID';
comment on column PRJ_CHECK.checkitem
  is '�����Ŀ';
comment on column PRJ_CHECK.detailitem
  is '����Ŀ����';
comment on column PRJ_CHECK.checkdate
  is '���ʱ��';
comment on column PRJ_CHECK.deserve_score
  is 'Ӧ�÷�';
comment on column PRJ_CHECK.act_score
  is 'ʵ�÷�';
comment on column PRJ_CHECK.act_pct
  is '�÷���';
comment on column PRJ_CHECK.standard
  is '���ֱ�׼';
comment on column PRJ_CHECK.deduction
  is '�۷�ԭ��';
comment on column PRJ_CHECK.check_emp_id
  is '���Ա�����';
comment on column PRJ_CHECK.problem
  is '��������';
comment on column PRJ_CHECK.resolved
  is '����ʱ��';
comment on column PRJ_CHECK.resolved_result
  is '���Ľ��';
comment on column PRJ_CHECK.memo
  is '��ע';
comment on column PRJ_CHECK.check_type
  is '�������,1-��ȫ,2-����';
comment on column PRJ_CHECK.building_id
  is '�������';
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
  is '��Ŀ������Ϣ';
comment on column PRJ_INFO.prjno
  is '��Ŀ���';
comment on column PRJ_INFO.contractno
  is '��ͬ���';
comment on column PRJ_INFO.prj_name
  is '��Ŀ����';
comment on column PRJ_INFO.prj_area
  is '��Ŀ���(ƽ����)';
comment on column PRJ_INFO.quality_target
  is '����Ŀ��';
comment on column PRJ_INFO.prj_starttime
  is '��Ŀ����ʱ��';
comment on column PRJ_INFO.prj_endtime
  is '��Ŀ����ʱ��';
comment on column PRJ_INFO.prj_time
  is '��Ŀ����';
comment on column PRJ_INFO.prj_pic
  is '��ĿͼƬ';
comment on column PRJ_INFO.prj_progress
  is '��Ŀ��չ���';
comment on column PRJ_INFO.memo
  is '��ע';
comment on column PRJ_INFO.location1
  is '��Ŀ��ַ(ʡ)';
comment on column PRJ_INFO.location2
  is '��Ŀ��ַ(��)';
comment on column PRJ_INFO.location3
  is '��Ŀ��ַ(��/��)';
comment on column PRJ_INFO.location4
  is '��Ŀ��ַ(�ֵ�)';
comment on column PRJ_INFO.buildingcount
  is '��������';
comment on column PRJ_INFO.contractarea
  is '��ͬ���';
comment on column PRJ_INFO.prj_level
  is '��Ŀ�ȼ�';
comment on column PRJ_INFO.prj_type
  is '��Ŀ���';
comment on column PRJ_INFO.prj_invest
  is '��Ŀ��Ͷ��';
comment on column PRJ_INFO.weekmeeting
  is '����������';
comment on column PRJ_INFO.prj_map
  is '��Ŀ��ͼ';
comment on column PRJ_INFO.prj_region
  is 'ʩ������';
comment on column PRJ_INFO.prj_archive
  is '�����鵵��־';
comment on column PRJ_INFO.weekmeetingtime
  is '������ʱ��';
comment on column PRJ_INFO.prj_archivetime
  is '�����鵵ʱ��';
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
  is '�ص�Σ���Խϴ󹤳̼��';
comment on column PRJ_MAJORCHECK.prj_id
  is '��ĿID';
comment on column PRJ_MAJORCHECK.building_id
  is '�������';
comment on column PRJ_MAJORCHECK.build_part
  is 'ʩ����λ';
comment on column PRJ_MAJORCHECK.checkdate
  is '���ʱ��';
comment on column PRJ_MAJORCHECK.begindate
  is '��ʼʱ��';
comment on column PRJ_MAJORCHECK.enddate
  is '����ʱ��';
comment on column PRJ_MAJORCHECK.discussion
  is 'ר����֤';
comment on column PRJ_MAJORCHECK.problem
  is '��������';
comment on column PRJ_MAJORCHECK.resolved
  is '����ʱ��';
comment on column PRJ_MAJORCHECK.resolved_result
  is '���Ľ��';
comment on column PRJ_MAJORCHECK.supervision
  is '����';
comment on column PRJ_MAJORCHECK.memo
  is '��ע';
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
  is '��Ŀ��֯��Ϣ';
comment on column PRJ_ORG.emp_id
  is 'Ա�����';
comment on column PRJ_ORG.prj_role
  is '��Ŀ�н�ɫ';
comment on column PRJ_ORG.prj_id
  is '��ĿID';
comment on column PRJ_ORG.entertime
  is '����ʱ��';
comment on column PRJ_ORG.leavetime
  is '�볡ʱ��';
comment on column PRJ_ORG.responsbility
  is '��Ŀ����';
comment on column PRJ_ORG.memo
  is '��ע';
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
  is '��Ŀ�ν���λ';
comment on column PRJ_UNIT.prj_id
  is '��ĿID';
comment on column PRJ_UNIT.unit_name
  is '�ν���λ����';
comment on column PRJ_UNIT.group_name
  is '�ν���������';
comment on column PRJ_UNIT.unit_type
  is '��Ŀ��ɫ';
comment on column PRJ_UNIT.quali_level
  is '���ʵȼ�';
comment on column PRJ_UNIT.unit_address
  is '��λ��ַ';
comment on column PRJ_UNIT.contractor
  is '��ϵ��';
comment on column PRJ_UNIT.title
  is 'ְ��';
comment on column PRJ_UNIT.contract_tel
  is '�绰';
comment on column PRJ_UNIT.memo
  is '��ע';
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
  is '��Ŀ�ͼ���λ��ϵ';
comment on column PRJ_UNIT_RELATE.prj_id
  is '��ĿID';
comment on column PRJ_UNIT_RELATE.dept_id
  is '����/�ֹ�˾';
comment on column PRJ_UNIT_RELATE.memo
  is '��ע';
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
  is '���ڵ������ݵ���ʱԱ����';

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
  is '�����б�';
comment on column T_CODELIST.id
  is 'ID';
comment on column T_CODELIST.code_type
  is '�������';
comment on column T_CODELIST.code_value
  is '����ֵ';
comment on column T_CODELIST.code_type_desc
  is '�����������';
comment on column T_CODELIST.code_desc
  is '��������';
comment on column T_CODELIST.valid
  is '��Ч��־';
comment on column T_CODELIST.memo
  is '��ע';
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
  is 'ȫ������������������';
comment on column T_LOC.id
  is '��¼���';
comment on column T_LOC.region_code
  is '��������������';
comment on column T_LOC.upper_code
  is '�ϼ����';
comment on column T_LOC.location
  is '����';
comment on column T_LOC.member
  is '������ϵ';
comment on column T_LOC.memo
  is '��ע';
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
start with 1181
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
CREATE OR REPLACE VIEW V_PRJ_INFO AS
select "ID","PRJNO","CONTRACTNO","PRJ_NAME",(SELECT NVL(SUM(BUILDING_AREA),0) FROM V_PRJ_BUILDING WHERE PRJ_ID = PRJ_INFO.ID) "PRJ_AREA","QUALITY_TARGET","PRJ_STARTTIME","PRJ_ENDTIME","PRJ_TIME","PRJ_PIC","PRJ_PROGRESS","MEMO","VALID","LOCATION1","LOCATION2","LOCATION3","LOCATION4",(SELECT COUNT (1) FROM V_PRJ_BUILDING WHERE PRJ_ID = PRJ_INFO.ID) "BUILDINGCOUNT","CONTRACTAREA","PRJ_LEVEL","PRJ_TYPE","PRJ_INVEST","WEEKMEETING","PRJ_MAP","PRJ_REGION","PRJ_ARCHIVE","WEEKMEETINGTIME","PRJ_ARCHIVETIME" from prj_info where valid='1';

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
  -- ��ѯ����
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
  -- ��ѯ����
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
  -- ��ѯ����
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
  -- ����Ա����Ϣ
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
      nation   := fun_getcodevalue('NATION', c.col8 || '��');
      birth    := fun_getbirth(c.col5);
      age      := fun_getage(c.col5);
      education:=c.col17;
    END LOOP;
  END;
END pkg_dataimp;
/


spool off
