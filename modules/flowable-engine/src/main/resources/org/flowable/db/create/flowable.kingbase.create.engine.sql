CREATE TABLE ACT_RE_DEPLOYMENT (
                                   ID_ VARCHAR(64) NOT NULL,
                                   NAME_ VARCHAR(255),
                                   CATEGORY_ VARCHAR(255),
                                   KEY_ VARCHAR(255),
                                   TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING,
                                   DEPLOY_TIME_ TIMESTAMP,
                                   DERIVED_FROM_ VARCHAR(64),
                                   DERIVED_FROM_ROOT_ VARCHAR(64),
                                   PARENT_DEPLOYMENT_ID_ VARCHAR(255),
                                   ENGINE_VERSION_ VARCHAR(255)
);
CREATE TABLE ACT_RE_MODEL (
                              ID_ VARCHAR(64) NOT NULL,
                              REV_ INT4,
                              NAME_ VARCHAR(255),
                              KEY_ VARCHAR(255),
                              CATEGORY_ VARCHAR(255),
                              CREATE_TIME_ TIMESTAMP,
                              LAST_UPDATE_TIME_ TIMESTAMP,
                              VERSION_ INT4,
                              META_INFO_ VARCHAR(4000),
                              DEPLOYMENT_ID_ VARCHAR(64),
                              EDITOR_SOURCE_VALUE_ID_ VARCHAR(64),
                              EDITOR_SOURCE_EXTRA_VALUE_ID_ VARCHAR(64),
                              TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);


CREATE TABLE ACT_RU_EXECUTION (
                                  ID_ VARCHAR(64) NOT NULL,
                                  REV_ INT4,
                                  PROC_INST_ID_ VARCHAR(64),
                                  BUSINESS_KEY_ VARCHAR(255),
                                  PARENT_ID_ VARCHAR(64),
                                  PROC_DEF_ID_ VARCHAR(64),
                                  SUPER_EXEC_ VARCHAR(64),
                                  ROOT_PROC_INST_ID_ VARCHAR(64),
                                  ACT_ID_ VARCHAR(255),
                                  IS_ACTIVE_ TINYINT,
                                  IS_CONCURRENT_ TINYINT,
                                  IS_SCOPE_ TINYINT,
                                  IS_EVENT_SCOPE_ TINYINT,
                                  IS_MI_ROOT_ TINYINT,
                                  SUSPENSION_STATE_ INT4,
                                  CACHED_ENT_STATE_ INT4,
                                  TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING,
                                  NAME_ VARCHAR(255),
                                  START_ACT_ID_ VARCHAR(255),
                                  START_TIME_ TIMESTAMP,
                                  START_USER_ID_ VARCHAR(255),
                                  LOCK_TIME_ TIMESTAMP,
                                  LOCK_OWNER_ VARCHAR(255),
                                  IS_COUNT_ENABLED_ TINYINT,
                                  EVT_SUBSCR_COUNT_ INT4,
                                  TASK_COUNT_ INT4,
                                  JOB_COUNT_ INT4,
                                  TIMER_JOB_COUNT_ INT4,
                                  SUSP_JOB_COUNT_ INT4,
                                  DEADLETTER_JOB_COUNT_ INT4,
                                  EXTERNAL_WORKER_JOB_COUNT_ INT4,
                                  VAR_COUNT_ INT4,
                                  ID_LINK_COUNT_ INT4,
                                  CALLBACK_ID_ VARCHAR(255),
                                  CALLBACK_TYPE_ VARCHAR(255),
                                  REFERENCE_ID_ VARCHAR(255),
                                  REFERENCE_TYPE_ VARCHAR(255),
                                  PROPAGATED_STAGE_INST_ID_ VARCHAR(255)
);


CREATE TABLE ACT_RE_PROCDEF (
                                ID_ VARCHAR(64) NOT NULL,
                                REV_ INT4,
                                CATEGORY_ VARCHAR(255),
                                NAME_ VARCHAR(255),
                                KEY_ VARCHAR(255) NOT NULL,
                                VERSION_ INT4 NOT NULL,
                                DEPLOYMENT_ID_ VARCHAR(64),
                                RESOURCE_NAME_ VARCHAR(4000),
                                DGRM_RESOURCE_NAME_ VARCHAR(4000),
                                DESCRIPTION_ VARCHAR(4000),
                                HAS_START_FORM_KEY_ TINYINT,
                                HAS_GRAPHICAL_NOTATION_ TINYINT,
                                SUSPENSION_STATE_ INT4,
                                TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING,
                                ENGINE_VERSION_ VARCHAR(255),
                                DERIVED_FROM_ VARCHAR(64),
                                DERIVED_FROM_ROOT_ VARCHAR(64),
                                DERIVED_VERSION_ INT4 DEFAULT 0 NOT NULL
);

CREATE TABLE ACT_EVT_LOG (
                             LOG_NR_ BIGSERIAL DEFAULT NEXTVAL('ACT_EVT_LOG_LOG_NR__SEQ'::REGCLASS) NOT NULL,
                             TYPE_ VARCHAR(64),
                             PROC_DEF_ID_ VARCHAR(64),
                             PROC_INST_ID_ VARCHAR(64),
                             EXECUTION_ID_ VARCHAR(64),
                             TASK_ID_ VARCHAR(64),
                             TIME_STAMP_ TIMESTAMP NOT NULL,
                             USER_ID_ VARCHAR(255),
                             DATA_ BLOB,
                             LOCK_OWNER_ VARCHAR(255),
                             LOCK_TIME_ TIMESTAMP,
                             IS_PROCESSED_ TINYINT DEFAULT 0
);

CREATE TABLE ACT_PROCDEF_INFO (
                                  ID_ VARCHAR(64) NOT NULL,
                                  PROC_DEF_ID_ VARCHAR(64) NOT NULL,
                                  REV_ INT4,
                                  INFO_JSON_ID_ VARCHAR(64)
);


CREATE TABLE ACT_RU_ACTINST (
                                ID_ VARCHAR(64) NOT NULL,
                                REV_ INT4 DEFAULT 1,
                                PROC_DEF_ID_ VARCHAR(64) NOT NULL,
                                PROC_INST_ID_ VARCHAR(64) NOT NULL,
                                EXECUTION_ID_ VARCHAR(64) NOT NULL,
                                ACT_ID_ VARCHAR(255) NOT NULL,
                                TASK_ID_ VARCHAR(64),
                                CALL_PROC_INST_ID_ VARCHAR(64),
                                ACT_NAME_ VARCHAR(255),
                                ACT_TYPE_ VARCHAR(255) NOT NULL,
                                ASSIGNEE_ VARCHAR(255),
                                START_TIME_ TIMESTAMP NOT NULL,
                                END_TIME_ TIMESTAMP,
                                DURATION_ INT8,
                                TRANSACTION_ORDER_ INT4,
                                DELETE_REASON_ VARCHAR(4000),
                                TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);

CREATE INDEX ACT_FK_MODEL_DEPLOYMENT ON ACT_RE_MODEL (DEPLOYMENT_ID_);
CREATE INDEX ACT_FK_MODEL_SOURCE ON ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
CREATE INDEX ACT_FK_MODEL_SOURCE_EXTRA ON ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);

CREATE INDEX ACT_FK_EXE_PARENT ON ACT_RU_EXECUTION (PARENT_ID_);
CREATE INDEX ACT_FK_EXE_PROCDEF ON ACT_RU_EXECUTION (PROC_DEF_ID_);
CREATE INDEX ACT_FK_EXE_PROCINST ON ACT_RU_EXECUTION (PROC_INST_ID_);
CREATE INDEX ACT_FK_EXE_SUPER ON ACT_RU_EXECUTION (SUPER_EXEC_);
CREATE INDEX ACT_IDC_EXEC_ROOT ON ACT_RU_EXECUTION (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_EXEC_BUSKEY ON ACT_RU_EXECUTION (BUSINESS_KEY_);

CREATE UNIQUE INDEX ACT_UNIQ_PROCDEF ON ACT_RE_PROCDEF (KEY_,VERSION_,DERIVED_VERSION_,TENANT_ID_);


CREATE INDEX ACT_FK_INFO_JSON_BA ON ACT_PROCDEF_INFO (INFO_JSON_ID_);
CREATE INDEX ACT_IDX_INFO_PROCDEF ON ACT_PROCDEF_INFO (PROC_DEF_ID_);
CREATE UNIQUE INDEX ACT_UNIQ_INFO_PROCDEF ON ACT_PROCDEF_INFO (PROC_DEF_ID_);

CREATE INDEX ACT_IDX_RU_ACTI_END ON ACT_RU_ACTINST (END_TIME_);
CREATE INDEX ACT_IDX_RU_ACTI_EXEC ON ACT_RU_ACTINST (EXECUTION_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_EXEC_ACT ON ACT_RU_ACTINST (EXECUTION_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_PROC ON ACT_RU_ACTINST (PROC_INST_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_PROC_ACT ON ACT_RU_ACTINST (PROC_INST_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_START ON ACT_RU_ACTINST (START_TIME_);

/************************************************************************/
-- create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_EXE_ROOT on ACT_RU_EXECUTION(ROOT_PROC_INST_ID_);
create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);

create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY(DEPLOYMENT_ID_);

-- create index ACT_IDX_RU_ACTI_START on ACT_RU_ACTINST(START_TIME_);
-- create index ACT_IDX_RU_ACTI_END on ACT_RU_ACTINST(END_TIME_);
-- create index ACT_IDX_RU_ACTI_PROC on ACT_RU_ACTINST(PROC_INST_ID_);
-- create index ACT_IDX_RU_ACTI_PROC_ACT on ACT_RU_ACTINST(PROC_INST_ID_, ACT_ID_);
-- create index ACT_IDX_RU_ACTI_EXEC on ACT_RU_ACTINST(EXECUTION_ID_);
-- create index ACT_IDX_RU_ACTI_EXEC_ACT on ACT_RU_ACTINST(EXECUTION_ID_, ACT_ID_);


-- 外键语法应该可以使用
alter table ACT_GE_BYTEARRAY
    add constraint ACT_FK_BYTEARR_DEPL
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);

alter table ACT_RE_PROCDEF
    add constraint ACT_UNIQ_PROCDEF
    unique (KEY_,VERSION_, DERIVED_VERSION_, TENANT_ID_);
    
create index ACT_IDX_EXE_PROCINST on ACT_RU_EXECUTION(PROC_INST_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCINST 
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_EXE_PARENT on ACT_RU_EXECUTION(PARENT_ID_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PARENT
    foreign key (PARENT_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_EXE_SUPER on ACT_RU_EXECUTION(SUPER_EXEC_);
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_SUPER
    foreign key (SUPER_EXEC_) 
    references ACT_RU_EXECUTION (ID_);
    

create index ACT_IDX_EXE_PROCDEF on ACT_RU_EXECUTION(PROC_DEF_ID_); 
alter table ACT_RU_EXECUTION
    add constraint ACT_FK_EXE_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);    
    

create index ACT_IDX_TSKASS_TASK on ACT_RU_IDENTITYLINK(TASK_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_TSKASS_TASK
    foreign key (TASK_ID_) 
    references ACT_RU_TASK (ID_);
    
create index ACT_IDX_ATHRZ_PROCEDEF on ACT_RU_IDENTITYLINK(PROC_DEF_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_ATHRZ_PROCEDEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
create index ACT_IDX_IDL_PROCINST on ACT_RU_IDENTITYLINK(PROC_INST_ID_);
alter table ACT_RU_IDENTITYLINK
    add constraint ACT_FK_IDL_PROCINST
    foreign key (PROC_INST_ID_) 
    references ACT_RU_EXECUTION (ID_);    
    
create index ACT_IDX_TASK_EXEC on ACT_RU_TASK(EXECUTION_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_EXE
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCINST on ACT_RU_TASK(PROC_INST_ID_);
alter table ACT_RU_TASK
    add constraint ACT_FK_TASK_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_TASK_PROCDEF on ACT_RU_TASK(PROC_DEF_ID_);
alter table ACT_RU_TASK
  add constraint ACT_FK_TASK_PROCDEF
  foreign key (PROC_DEF_ID_)
  references ACT_RE_PROCDEF (ID_);
  
create index ACT_IDX_VAR_EXE on ACT_RU_VARIABLE(EXECUTION_ID_);
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_EXE
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_VAR_PROCINST on ACT_RU_VARIABLE(PROC_INST_ID_);
alter table ACT_RU_VARIABLE
    add constraint ACT_FK_VAR_PROCINST
    foreign key (PROC_INST_ID_)
    references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_JOB_EXECUTION_ID on ACT_RU_JOB(EXECUTION_ID_);
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_JOB_PROCESS_INSTANCE_ID on ACT_RU_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_JOB_PROC_DEF_ID on ACT_RU_JOB(PROC_DEF_ID_);
alter table ACT_RU_JOB 
    add constraint ACT_FK_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_TIMER_JOB_EXECUTION_ID on ACT_RU_TIMER_JOB(EXECUTION_ID_);
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TIMER_JOB_PROCESS_INSTANCE_ID on ACT_RU_TIMER_JOB(PROCESS_INSTANCE_ID_);
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_TIMER_JOB_PROC_DEF_ID on ACT_RU_TIMER_JOB(PROC_DEF_ID_);
alter table ACT_RU_TIMER_JOB 
    add constraint ACT_FK_TIMER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_SUSPENDED_JOB_EXECUTION_ID on ACT_RU_SUSPENDED_JOB(EXECUTION_ID_);    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_SUSPENDED_JOB_PROCESS_INSTANCE_ID on ACT_RU_SUSPENDED_JOB(PROCESS_INSTANCE_ID_);    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);

create index ACT_IDX_SUSPENDED_JOB_PROC_DEF_ID on ACT_RU_SUSPENDED_JOB(PROC_DEF_ID_);    
alter table ACT_RU_SUSPENDED_JOB 
    add constraint ACT_FK_SUSPENDED_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);

create index ACT_IDX_DEADLETTER_JOB_EXECUTION_ID on ACT_RU_DEADLETTER_JOB(EXECUTION_ID_);      
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_EXECUTION 
    foreign key (EXECUTION_ID_) 
    references ACT_RU_EXECUTION (ID_);
 
create index ACT_IDX_DEADLETTER_JOB_PROCESS_INSTANCE_ID on ACT_RU_DEADLETTER_JOB(PROCESS_INSTANCE_ID_);        
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE 
    foreign key (PROCESS_INSTANCE_ID_) 
    references ACT_RU_EXECUTION (ID_);
    
create index ACT_IDX_DEADLETTER_JOB_PROC_DEF_ID on ACT_RU_DEADLETTER_JOB(PROC_DEF_ID_);    
alter table ACT_RU_DEADLETTER_JOB 
    add constraint ACT_FK_DEADLETTER_JOB_PROC_DEF
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_RU_EVENT_SUBSCR
    add constraint ACT_FK_EVENT_EXEC
    foreign key (EXECUTION_ID_)
    references ACT_RU_EXECUTION(ID_);

create index ACT_IDX_MODEL_SOURCE on ACT_RE_MODEL(EDITOR_SOURCE_VALUE_ID_);
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE 
    foreign key (EDITOR_SOURCE_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_MODEL_SOURCE_EXTRA on ACT_RE_MODEL(EDITOR_SOURCE_EXTRA_VALUE_ID_);
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_SOURCE_EXTRA 
    foreign key (EDITOR_SOURCE_EXTRA_VALUE_ID_) 
    references ACT_GE_BYTEARRAY (ID_);
    
create index ACT_IDX_MODEL_DEPLOYMENT on ACT_RE_MODEL(DEPLOYMENT_ID_);    
alter table ACT_RE_MODEL 
    add constraint ACT_FK_MODEL_DEPLOYMENT 
    foreign key (DEPLOYMENT_ID_) 
    references ACT_RE_DEPLOYMENT (ID_);        

create index ACT_IDX_PROCDEF_INFO_JSON on ACT_PROCDEF_INFO(INFO_JSON_ID_);
alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_JSON_BA 
    foreign key (INFO_JSON_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_PROCDEF_INFO_PROC on ACT_PROCDEF_INFO(PROC_DEF_ID_);
alter table ACT_PROCDEF_INFO 
    add constraint ACT_FK_INFO_PROCDEF 
    foreign key (PROC_DEF_ID_) 
    references ACT_RE_PROCDEF (ID_);
    
alter table ACT_PROCDEF_INFO
    add constraint ACT_UNIQ_INFO_PROCDEF
    unique (PROC_DEF_ID_);

insert into ACT_GE_PROPERTY
values ('schema.version', '6.6.0.0', 1);

insert into ACT_GE_PROPERTY
values ('schema.history', 'create(6.6.0.0)', 1);