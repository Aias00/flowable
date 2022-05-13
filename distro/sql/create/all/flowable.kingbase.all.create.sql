CREATE TABLE ACT_GE_PROPERTY (
                                 NAME_ VARCHAR(64) NOT NULL,
                                 VALUE_ VARCHAR(300),
                                 REV_ INT4
);

CREATE TABLE ACT_GE_BYTEARRAY (
                                  ID_ VARCHAR(64) NOT NULL,
                                  REV_ INT4,
                                  NAME_ VARCHAR(255),
                                  DEPLOYMENT_ID_ VARCHAR(64),
                                  BYTES_ BLOB,
                                  GENERATED_ TINYINT
);

insert into ACT_GE_PROPERTY
values ('common.schema.version', '6.6.0.0', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);


CREATE TABLE ACT_RU_ENTITYLINK (
                                   ID_ VARCHAR(64) NOT NULL,
                                   REV_ INT4,
                                   CREATE_TIME_ TIMESTAMP,
                                   LINK_TYPE_ VARCHAR(255),
                                   SCOPE_ID_ VARCHAR(255),
                                   SUB_SCOPE_ID_ VARCHAR(255),
                                   SCOPE_TYPE_ VARCHAR(255),
                                   SCOPE_DEFINITION_ID_ VARCHAR(255),
                                   PARENT_ELEMENT_ID_ VARCHAR(255),
                                   REF_SCOPE_ID_ VARCHAR(255),
                                   REF_SCOPE_TYPE_ VARCHAR(255),
                                   REF_SCOPE_DEFINITION_ID_ VARCHAR(255),
                                   ROOT_SCOPE_ID_ VARCHAR(255),
                                   ROOT_SCOPE_TYPE_ VARCHAR(255),
                                   HIERARCHY_TYPE_ VARCHAR(255)
);

CREATE INDEX ACT_IDX_ENT_LNK_ROOT_SCOPE ON ACT_RU_ENTITYLINK (ROOT_SCOPE_ID_,ROOT_SCOPE_TYPE_,LINK_TYPE_);
CREATE INDEX ACT_IDX_ENT_LNK_SCOPE ON ACT_RU_ENTITYLINK (SCOPE_ID_,SCOPE_TYPE_,LINK_TYPE_);
CREATE INDEX ACT_IDX_ENT_LNK_SCOPE_DEF ON ACT_RU_ENTITYLINK (SCOPE_DEFINITION_ID_,SCOPE_TYPE_,LINK_TYPE_);

insert into ACT_GE_PROPERTY values ('entitylink.schema.version', '6.6.0.0', 1);

CREATE TABLE ACT_HI_ENTITYLINK (
                                   ID_ VARCHAR(64) NOT NULL,
                                   LINK_TYPE_ VARCHAR(255),
                                   CREATE_TIME_ TIMESTAMP,
                                   SCOPE_ID_ VARCHAR(255),
                                   SUB_SCOPE_ID_ VARCHAR(255),
                                   SCOPE_TYPE_ VARCHAR(255),
                                   SCOPE_DEFINITION_ID_ VARCHAR(255),
                                   PARENT_ELEMENT_ID_ VARCHAR(255),
                                   REF_SCOPE_ID_ VARCHAR(255),
                                   REF_SCOPE_TYPE_ VARCHAR(255),
                                   REF_SCOPE_DEFINITION_ID_ VARCHAR(255),
                                   ROOT_SCOPE_ID_ VARCHAR(255),
                                   ROOT_SCOPE_TYPE_ VARCHAR(255),
                                   HIERARCHY_TYPE_ VARCHAR(255)
);
CREATE INDEX ACT_IDX_HI_ENT_LNK_ROOT_SCOPE ON ACT_HI_ENTITYLINK (ROOT_SCOPE_ID_,ROOT_SCOPE_TYPE_,LINK_TYPE_);
CREATE INDEX ACT_IDX_HI_ENT_LNK_SCOPE ON ACT_HI_ENTITYLINK (SCOPE_ID_,SCOPE_TYPE_,LINK_TYPE_);
CREATE INDEX ACT_IDX_HI_ENT_LNK_SCOPE_DEF ON ACT_HI_ENTITYLINK (SCOPE_DEFINITION_ID_,SCOPE_TYPE_,LINK_TYPE_);

CREATE TABLE ACT_RU_IDENTITYLINK (
                                     ID_ VARCHAR(64) NOT NULL,
                                     REV_ INT4,
                                     GROUP_ID_ VARCHAR(255),
                                     TYPE_ VARCHAR(255),
                                     USER_ID_ VARCHAR(255),
                                     TASK_ID_ VARCHAR(64),
                                     PROC_INST_ID_ VARCHAR(64),
                                     PROC_DEF_ID_ VARCHAR(64),
                                     SCOPE_ID_ VARCHAR(255),
                                     SUB_SCOPE_ID_ VARCHAR(255),
                                     SCOPE_TYPE_ VARCHAR(255),
                                     SCOPE_DEFINITION_ID_ VARCHAR(255)
);
CREATE INDEX ACT_FK_IDL_PROCINST ON ACT_RU_IDENTITYLINK (PROC_INST_ID_);
CREATE INDEX ACT_FK_TSKASS_TASK ON ACT_RU_IDENTITYLINK (TASK_ID_);
CREATE INDEX ACT_IDX_ATHRZ_PROCEDEF ON ACT_RU_IDENTITYLINK (PROC_DEF_ID_);
create index ACT_IDX_IDENT_LNK_USER on ACT_RU_IDENTITYLINK(USER_ID_);
create index ACT_IDX_IDENT_LNK_GROUP on ACT_RU_IDENTITYLINK(GROUP_ID_);
create index ACT_IDX_IDENT_LNK_SCOPE on ACT_RU_IDENTITYLINK(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_IDENT_LNK_SUB_SCOPE on ACT_RU_IDENTITYLINK(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_IDENT_LNK_SCOPE_DEF on ACT_RU_IDENTITYLINK(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

insert into ACT_GE_PROPERTY values ('identitylink.schema.version', '6.6.0.0', 1);

CREATE TABLE ACT_HI_IDENTITYLINK (
                                     ID_ VARCHAR(64) NOT NULL,
                                     GROUP_ID_ VARCHAR(255),
                                     TYPE_ VARCHAR(255),
                                     USER_ID_ VARCHAR(255),
                                     TASK_ID_ VARCHAR(64),
                                     CREATE_TIME_ TIMESTAMP,
                                     PROC_INST_ID_ VARCHAR(64),
                                     SCOPE_ID_ VARCHAR(255),
                                     SUB_SCOPE_ID_ VARCHAR(255),
                                     SCOPE_TYPE_ VARCHAR(255),
                                     SCOPE_DEFINITION_ID_ VARCHAR(255)
);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_PROCINST ON ACT_HI_IDENTITYLINK (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_SCOPE ON ACT_HI_IDENTITYLINK (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_SCOPE_DEF ON ACT_HI_IDENTITYLINK (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_SUB_SCOPE ON ACT_HI_IDENTITYLINK (SUB_SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_TASK ON ACT_HI_IDENTITYLINK (TASK_ID_);
CREATE INDEX ACT_IDX_HI_IDENT_LNK_USER ON ACT_HI_IDENTITYLINK (USER_ID_);


CREATE TABLE ACT_RU_JOB (
                            ID_ VARCHAR(64) NOT NULL,
                            REV_ INT4,
                            CATEGORY_ VARCHAR(255),
                            TYPE_ VARCHAR(255) NOT NULL,
                            LOCK_EXP_TIME_ TIMESTAMP,
                            LOCK_OWNER_ VARCHAR(255),
                            EXCLUSIVE_ BOOL,
                            EXECUTION_ID_ VARCHAR(64),
                            PROCESS_INSTANCE_ID_ VARCHAR(64),
                            PROC_DEF_ID_ VARCHAR(64),
                            ELEMENT_ID_ VARCHAR(255),
                            ELEMENT_NAME_ VARCHAR(255),
                            SCOPE_ID_ VARCHAR(255),
                            SUB_SCOPE_ID_ VARCHAR(255),
                            SCOPE_TYPE_ VARCHAR(255),
                            SCOPE_DEFINITION_ID_ VARCHAR(255),
                            CORRELATION_ID_ VARCHAR(255),
                            RETRIES_ INT4,
                            EXCEPTION_STACK_ID_ VARCHAR(64),
                            EXCEPTION_MSG_ VARCHAR(4000),
                            DUEDATE_ TIMESTAMP,
                            REPEAT_ VARCHAR(255),
                            HANDLER_TYPE_ VARCHAR(255),
                            HANDLER_CFG_ VARCHAR(4000),
                            CUSTOM_VALUES_ID_ VARCHAR(64),
                            CREATE_TIME_ TIMESTAMP,
                            TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);
CREATE INDEX ACT_FK_JOB_EXECUTION ON ACT_RU_JOB (EXECUTION_ID_);
CREATE INDEX ACT_FK_JOB_PROCESS_INSTANCE ON ACT_RU_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX ACT_FK_JOB_PROC_DEF ON ACT_RU_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_JOB_CORRELATION_ID ON ACT_RU_JOB (CORRELATION_ID_);
CREATE INDEX ACT_IDX_JOB_CUSTOM_VALUES_ID ON ACT_RU_JOB (CUSTOM_VALUES_ID_);
CREATE INDEX ACT_IDX_JOB_EXCEPTION_STACK_ID ON ACT_RU_JOB (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_JOB_SCOPE ON ACT_RU_JOB (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_JOB_SCOPE_DEF ON ACT_RU_JOB (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_JOB_SUB_SCOPE ON ACT_RU_JOB (SUB_SCOPE_ID_,SCOPE_TYPE_);

CREATE TABLE ACT_RU_TIMER_JOB (
                                  ID_ VARCHAR(64) NOT NULL,
                                  REV_ INT4,
                                  CATEGORY_ VARCHAR(255),
                                  TYPE_ VARCHAR(255) NOT NULL,
                                  LOCK_EXP_TIME_ TIMESTAMP,
                                  LOCK_OWNER_ VARCHAR(255),
                                  EXCLUSIVE_ BOOL,
                                  EXECUTION_ID_ VARCHAR(64),
                                  PROCESS_INSTANCE_ID_ VARCHAR(64),
                                  PROC_DEF_ID_ VARCHAR(64),
                                  ELEMENT_ID_ VARCHAR(255),
                                  ELEMENT_NAME_ VARCHAR(255),
                                  SCOPE_ID_ VARCHAR(255),
                                  SUB_SCOPE_ID_ VARCHAR(255),
                                  SCOPE_TYPE_ VARCHAR(255),
                                  SCOPE_DEFINITION_ID_ VARCHAR(255),
                                  CORRELATION_ID_ VARCHAR(255),
                                  RETRIES_ INT4,
                                  EXCEPTION_STACK_ID_ VARCHAR(64),
                                  EXCEPTION_MSG_ VARCHAR(4000),
                                  DUEDATE_ TIMESTAMP,
                                  REPEAT_ VARCHAR(255),
                                  HANDLER_TYPE_ VARCHAR(255),
                                  HANDLER_CFG_ VARCHAR(4000),
                                  CUSTOM_VALUES_ID_ VARCHAR(64),
                                  CREATE_TIME_ TIMESTAMP,
                                  TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);
CREATE INDEX ACT_FK_TIMER_JOB_EXECUTION ON ACT_RU_TIMER_JOB (EXECUTION_ID_);
CREATE INDEX ACT_FK_TIMER_JOB_PROCESS_INSTANCE ON ACT_RU_TIMER_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX ACT_FK_TIMER_JOB_PROC_DEF ON ACT_RU_TIMER_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_TIMER_JOB_CORRELATION_ID ON ACT_RU_TIMER_JOB (CORRELATION_ID_);
CREATE INDEX ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID ON ACT_RU_TIMER_JOB (CUSTOM_VALUES_ID_);
CREATE INDEX ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID ON ACT_RU_TIMER_JOB (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_TJOB_SCOPE ON ACT_RU_TIMER_JOB (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_TJOB_SCOPE_DEF ON ACT_RU_TIMER_JOB (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_TJOB_SUB_SCOPE ON ACT_RU_TIMER_JOB (SUB_SCOPE_ID_,SCOPE_TYPE_);

CREATE TABLE ACT_RU_SUSPENDED_JOB (
                                      ID_ VARCHAR(64) NOT NULL,
                                      REV_ INT4,
                                      CATEGORY_ VARCHAR(255),
                                      TYPE_ VARCHAR(255) NOT NULL,
                                      EXCLUSIVE_ BOOL,
                                      EXECUTION_ID_ VARCHAR(64),
                                      PROCESS_INSTANCE_ID_ VARCHAR(64),
                                      PROC_DEF_ID_ VARCHAR(64),
                                      ELEMENT_ID_ VARCHAR(255),
                                      ELEMENT_NAME_ VARCHAR(255),
                                      SCOPE_ID_ VARCHAR(255),
                                      SUB_SCOPE_ID_ VARCHAR(255),
                                      SCOPE_TYPE_ VARCHAR(255),
                                      SCOPE_DEFINITION_ID_ VARCHAR(255),
                                      CORRELATION_ID_ VARCHAR(255),
                                      RETRIES_ INT4,
                                      EXCEPTION_STACK_ID_ VARCHAR(64),
                                      EXCEPTION_MSG_ VARCHAR(4000),
                                      DUEDATE_ TIMESTAMP,
                                      REPEAT_ VARCHAR(255),
                                      HANDLER_TYPE_ VARCHAR(255),
                                      HANDLER_CFG_ VARCHAR(4000),
                                      CUSTOM_VALUES_ID_ VARCHAR(64),
                                      CREATE_TIME_ TIMESTAMP,
                                      TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);
CREATE INDEX ACT_FK_SUSPENDED_JOB_EXECUTION ON ACT_RU_SUSPENDED_JOB (EXECUTION_ID_);
CREATE INDEX ACT_FK_SUSPENDED_JOB_PROCESS_INSTANCE ON ACT_RU_SUSPENDED_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX ACT_FK_SUSPENDED_JOB_PROC_DEF ON ACT_RU_SUSPENDED_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_SJOB_SCOPE ON ACT_RU_SUSPENDED_JOB (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_SJOB_SCOPE_DEF ON ACT_RU_SUSPENDED_JOB (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_SJOB_SUB_SCOPE ON ACT_RU_SUSPENDED_JOB (SUB_SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_SUSPENDED_JOB_CORRELATION_ID ON ACT_RU_SUSPENDED_JOB (CORRELATION_ID_);
CREATE INDEX ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID ON ACT_RU_SUSPENDED_JOB (CUSTOM_VALUES_ID_);
CREATE INDEX ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID ON ACT_RU_SUSPENDED_JOB (EXCEPTION_STACK_ID_);

CREATE TABLE ACT_RU_DEADLETTER_JOB (
                                       ID_ VARCHAR(64) NOT NULL,
                                       REV_ INT4,
                                       CATEGORY_ VARCHAR(255),
                                       TYPE_ VARCHAR(255) NOT NULL,
                                       EXCLUSIVE_ BOOL,
                                       EXECUTION_ID_ VARCHAR(64),
                                       PROCESS_INSTANCE_ID_ VARCHAR(64),
                                       PROC_DEF_ID_ VARCHAR(64),
                                       ELEMENT_ID_ VARCHAR(255),
                                       ELEMENT_NAME_ VARCHAR(255),
                                       SCOPE_ID_ VARCHAR(255),
                                       SUB_SCOPE_ID_ VARCHAR(255),
                                       SCOPE_TYPE_ VARCHAR(255),
                                       SCOPE_DEFINITION_ID_ VARCHAR(255),
                                       CORRELATION_ID_ VARCHAR(255),
                                       EXCEPTION_STACK_ID_ VARCHAR(64),
                                       EXCEPTION_MSG_ VARCHAR(4000),
                                       DUEDATE_ TIMESTAMP,
                                       REPEAT_ VARCHAR(255),
                                       HANDLER_TYPE_ VARCHAR(255),
                                       HANDLER_CFG_ VARCHAR(4000),
                                       CUSTOM_VALUES_ID_ VARCHAR(64),
                                       CREATE_TIME_ TIMESTAMP,
                                       TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);
CREATE INDEX ACT_FK_DEADLETTER_JOB_EXECUTION ON ACT_RU_DEADLETTER_JOB (EXECUTION_ID_);
CREATE INDEX ACT_FK_DEADLETTER_JOB_PROCESS_INSTANCE ON ACT_RU_DEADLETTER_JOB (PROCESS_INSTANCE_ID_);
CREATE INDEX ACT_FK_DEADLETTER_JOB_PROC_DEF ON ACT_RU_DEADLETTER_JOB (PROC_DEF_ID_);
CREATE INDEX ACT_IDX_DEADLETTER_JOB_CORRELATION_ID ON ACT_RU_DEADLETTER_JOB (CORRELATION_ID_);
CREATE INDEX ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID ON ACT_RU_DEADLETTER_JOB (CUSTOM_VALUES_ID_);
CREATE INDEX ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID ON ACT_RU_DEADLETTER_JOB (EXCEPTION_STACK_ID_);
CREATE INDEX ACT_IDX_DJOB_SCOPE ON ACT_RU_DEADLETTER_JOB (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_DJOB_SCOPE_DEF ON ACT_RU_DEADLETTER_JOB (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_DJOB_SUB_SCOPE ON ACT_RU_DEADLETTER_JOB (SUB_SCOPE_ID_,SCOPE_TYPE_);

CREATE TABLE ACT_RU_HISTORY_JOB (
                                    ID_ VARCHAR(64) NOT NULL,
                                    REV_ INT4,
                                    LOCK_EXP_TIME_ TIMESTAMP,
                                    LOCK_OWNER_ VARCHAR(255),
                                    RETRIES_ INT4,
                                    EXCEPTION_STACK_ID_ VARCHAR(64),
                                    EXCEPTION_MSG_ VARCHAR(4000),
                                    HANDLER_TYPE_ VARCHAR(255),
                                    HANDLER_CFG_ VARCHAR(4000),
                                    CUSTOM_VALUES_ID_ VARCHAR(64),
                                    ADV_HANDLER_CFG_ID_ VARCHAR(64),
                                    CREATE_TIME_ TIMESTAMP,
                                    SCOPE_TYPE_ VARCHAR(255),
                                    TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);

CREATE TABLE ACT_RU_EXTERNAL_JOB (
                                     ID_ VARCHAR(64) NOT NULL,
                                     REV_ INT4,
                                     CATEGORY_ VARCHAR(255),
                                     TYPE_ VARCHAR(255) NOT NULL,
                                     LOCK_EXP_TIME_ TIMESTAMP,
                                     LOCK_OWNER_ VARCHAR(255),
                                     EXCLUSIVE_ BOOL,
                                     EXECUTION_ID_ VARCHAR(64),
                                     PROCESS_INSTANCE_ID_ VARCHAR(64),
                                     PROC_DEF_ID_ VARCHAR(64),
                                     ELEMENT_ID_ VARCHAR(255),
                                     ELEMENT_NAME_ VARCHAR(255),
                                     SCOPE_ID_ VARCHAR(255),
                                     SUB_SCOPE_ID_ VARCHAR(255),
                                     SCOPE_TYPE_ VARCHAR(255),
                                     SCOPE_DEFINITION_ID_ VARCHAR(255),
                                     CORRELATION_ID_ VARCHAR(255),
                                     RETRIES_ INT4,
                                     EXCEPTION_STACK_ID_ VARCHAR(64),
                                     EXCEPTION_MSG_ VARCHAR(4000),
                                     DUEDATE_ TIMESTAMP,
                                     REPEAT_ VARCHAR(255),
                                     HANDLER_TYPE_ VARCHAR(255),
                                     HANDLER_CFG_ VARCHAR(4000),
                                     CUSTOM_VALUES_ID_ VARCHAR(64),
                                     CREATE_TIME_ TIMESTAMP,
                                     TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);
CREATE INDEX ACT_IDX_EJOB_SCOPE ON ACT_RU_EXTERNAL_JOB (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_EJOB_SCOPE_DEF ON ACT_RU_EXTERNAL_JOB (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_EJOB_SUB_SCOPE ON ACT_RU_EXTERNAL_JOB (SUB_SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_EXTERNAL_JOB_CORRELATION_ID ON ACT_RU_EXTERNAL_JOB (CORRELATION_ID_);
CREATE INDEX ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID ON ACT_RU_EXTERNAL_JOB (CUSTOM_VALUES_ID_);
CREATE INDEX ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID ON ACT_RU_EXTERNAL_JOB (EXCEPTION_STACK_ID_);

-- create index ACT_IDX_JOB_EXCEPTION_STACK_ID on ACT_RU_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_JOB_CUSTOM_VALUES_ID on ACT_RU_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_JOB_CORRELATION_ID on ACT_RU_JOB(CORRELATION_ID_);

-- create index ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID on ACT_RU_TIMER_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID on ACT_RU_TIMER_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_TIMER_JOB_CORRELATION_ID on ACT_RU_TIMER_JOB(CORRELATION_ID_);
--
-- create index ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID on ACT_RU_SUSPENDED_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID on ACT_RU_SUSPENDED_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_SUSPENDED_JOB_CORRELATION_ID on ACT_RU_SUSPENDED_JOB(CORRELATION_ID_);

-- create index ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID on ACT_RU_DEADLETTER_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID on ACT_RU_DEADLETTER_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_DEADLETTER_JOB_CORRELATION_ID on ACT_RU_DEADLETTER_JOB(CORRELATION_ID_);
--
-- create index ACT_IDX_EXTERNAL_JOB_EXCEPTION_STACK_ID on ACT_RU_EXTERNAL_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_EXTERNAL_JOB_CUSTOM_VALUES_ID on ACT_RU_EXTERNAL_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_EXTERNAL_JOB_CORRELATION_ID on ACT_RU_EXTERNAL_JOB(CORRELATION_ID_);

alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_JOB
    add constraint ACT_FK_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TIMER_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_TIMER_JOB
    add constraint ACT_FK_TIMER_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SUSPENDED_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_SUSPENDED_JOB
    add constraint ACT_FK_SUSPENDED_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DEADLETTER_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_DEADLETTER_JOB
    add constraint ACT_FK_DEADLETTER_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_EXTERNAL_JOB
    add constraint ACT_FK_EXTERNAL_JOB_EXCEPTION
    foreign key (EXCEPTION_STACK_ID_)
    references ACT_GE_BYTEARRAY (ID_);

alter table ACT_RU_EXTERNAL_JOB
    add constraint ACT_FK_EXTERNAL_JOB_CUSTOM_VALUES
    foreign key (CUSTOM_VALUES_ID_)
    references ACT_GE_BYTEARRAY (ID_);

create index ACT_IDX_JOB_SCOPE on ACT_RU_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_JOB_SUB_SCOPE on ACT_RU_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_JOB_SCOPE_DEF on ACT_RU_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

create index ACT_IDX_TJOB_SCOPE on ACT_RU_TIMER_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TJOB_SUB_SCOPE on ACT_RU_TIMER_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_TJOB_SCOPE_DEF on ACT_RU_TIMER_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_); 

create index ACT_IDX_SJOB_SCOPE on ACT_RU_SUSPENDED_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_SJOB_SUB_SCOPE on ACT_RU_SUSPENDED_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_SJOB_SCOPE_DEF on ACT_RU_SUSPENDED_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);   

create index ACT_IDX_DJOB_SCOPE on ACT_RU_DEADLETTER_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_DJOB_SUB_SCOPE on ACT_RU_DEADLETTER_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_DJOB_SCOPE_DEF on ACT_RU_DEADLETTER_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

create index ACT_IDX_EJOB_SCOPE on ACT_RU_EXTERNAL_JOB(SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_EJOB_SUB_SCOPE on ACT_RU_EXTERNAL_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
create index ACT_IDX_EJOB_SCOPE_DEF on ACT_RU_EXTERNAL_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

insert into ACT_GE_PROPERTY values ('job.schema.version', '6.6.0.0', 1);

-- create table FLW_RU_BATCH (
--     ID_ varchar(64) not null,
--     REV_ integer,
--     TYPE_ varchar(64) not null,
--     SEARCH_KEY_ varchar(255),
--     SEARCH_KEY2_ varchar(255),
--     CREATE_TIME_ timestamp not null,
--     COMPLETE_TIME_ timestamp,
--     STATUS_ varchar(255),
--     BATCH_DOC_ID_ varchar(64),
--     TENANT_ID_ varchar(255) default '',
--     primary key (ID_)
-- );

-- create table FLW_RU_BATCH_PART (
--     ID_ varchar(64) not null,
--     REV_ integer,
--     BATCH_ID_ varchar(64),
--     TYPE_ varchar(64) not null,
--     SCOPE_ID_ varchar(64),
--     SUB_SCOPE_ID_ varchar(64),
--     SCOPE_TYPE_ varchar(64),
--     SEARCH_KEY_ varchar(255),
--     SEARCH_KEY2_ varchar(255),
--     CREATE_TIME_ timestamp not null,
--     COMPLETE_TIME_ timestamp,
--     STATUS_ varchar(255),
--     RESULT_DOC_ID_ varchar(64),
--     TENANT_ID_ varchar(255) default '',
--     primary key (ID_)
-- );

-- create index FLW_IDX_BATCH_PART on FLW_RU_BATCH_PART(BATCH_ID_);
--
-- alter table FLW_RU_BATCH_PART
--     add constraint FLW_FK_BATCH_PART_PARENT
--     foreign key (BATCH_ID_)
--     references FLW_RU_BATCH (ID_);

-- insert into ACT_GE_PROPERTY values ('batch.schema.version', '6.6.0.0', 1);


CREATE TABLE ACT_RU_TASK (
                             ID_ VARCHAR(64) NOT NULL,
                             REV_ INT4,
                             EXECUTION_ID_ VARCHAR(64),
                             PROC_INST_ID_ VARCHAR(64),
                             PROC_DEF_ID_ VARCHAR(64),
                             TASK_DEF_ID_ VARCHAR(64),
                             SCOPE_ID_ VARCHAR(255),
                             SUB_SCOPE_ID_ VARCHAR(255),
                             SCOPE_TYPE_ VARCHAR(255),
                             SCOPE_DEFINITION_ID_ VARCHAR(255),
                             PROPAGATED_STAGE_INST_ID_ VARCHAR(255),
                             NAME_ VARCHAR(255),
                             PARENT_TASK_ID_ VARCHAR(64),
                             DESCRIPTION_ VARCHAR(4000),
                             TASK_DEF_KEY_ VARCHAR(255),
                             OWNER_ VARCHAR(255),
                             ASSIGNEE_ VARCHAR(255),
                             DELEGATION_ VARCHAR(64),
                             PRIORITY_ INT4,
                             CREATE_TIME_ TIMESTAMP,
                             DUE_DATE_ TIMESTAMP,
                             CATEGORY_ VARCHAR(255),
                             SUSPENSION_STATE_ INT4,
                             TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING,
                             FORM_KEY_ VARCHAR(255),
                             CLAIM_TIME_ TIMESTAMP,
                             IS_COUNT_ENABLED_ TINYINT,
                             VAR_COUNT_ INT4,
                             ID_LINK_COUNT_ INT4,
                             SUB_TASK_COUNT_ INT4
);
CREATE INDEX ACT_FK_TASK_EXE ON ACT_RU_TASK (EXECUTION_ID_);
CREATE INDEX ACT_FK_TASK_PROCDEF ON ACT_RU_TASK (PROC_DEF_ID_);
CREATE INDEX ACT_FK_TASK_PROCINST ON ACT_RU_TASK (PROC_INST_ID_);
CREATE INDEX ACT_IDX_TASK_CREATE ON ACT_RU_TASK (CREATE_TIME_);
CREATE INDEX ACT_IDX_TASK_SCOPE ON ACT_RU_TASK (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_TASK_SCOPE_DEF ON ACT_RU_TASK (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_TASK_SUB_SCOPE ON ACT_RU_TASK (SUB_SCOPE_ID_,SCOPE_TYPE_);


insert into ACT_GE_PROPERTY values ('task.schema.version', '6.6.0.0', 1);

CREATE TABLE ACT_HI_TASKINST (
                                 ID_ VARCHAR(64) NOT NULL,
                                 REV_ INT4 DEFAULT 1,
                                 PROC_DEF_ID_ VARCHAR(64),
                                 TASK_DEF_ID_ VARCHAR(64),
                                 TASK_DEF_KEY_ VARCHAR(255),
                                 PROC_INST_ID_ VARCHAR(64),
                                 EXECUTION_ID_ VARCHAR(64),
                                 SCOPE_ID_ VARCHAR(255),
                                 SUB_SCOPE_ID_ VARCHAR(255),
                                 SCOPE_TYPE_ VARCHAR(255),
                                 SCOPE_DEFINITION_ID_ VARCHAR(255),
                                 PROPAGATED_STAGE_INST_ID_ VARCHAR(255),
                                 NAME_ VARCHAR(255),
                                 PARENT_TASK_ID_ VARCHAR(64),
                                 DESCRIPTION_ VARCHAR(4000),
                                 OWNER_ VARCHAR(255),
                                 ASSIGNEE_ VARCHAR(255),
                                 START_TIME_ TIMESTAMP NOT NULL,
                                 CLAIM_TIME_ TIMESTAMP,
                                 END_TIME_ TIMESTAMP,
                                 DURATION_ INT8,
                                 DELETE_REASON_ VARCHAR(4000),
                                 PRIORITY_ INT4,
                                 DUE_DATE_ TIMESTAMP,
                                 FORM_KEY_ VARCHAR(255),
                                 CATEGORY_ VARCHAR(255),
                                 TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING,
                                 LAST_UPDATED_TIME_ TIMESTAMP
);
CREATE INDEX ACT_IDX_HI_TASK_INST_PROCINST ON ACT_HI_TASKINST (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_TASK_SCOPE ON ACT_HI_TASKINST (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_HI_TASK_SCOPE_DEF ON ACT_HI_TASKINST (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_HI_TASK_SUB_SCOPE ON ACT_HI_TASKINST (SUB_SCOPE_ID_,SCOPE_TYPE_);

CREATE TABLE ACT_HI_TSK_LOG (
                                ID_ BIGSERIAL DEFAULT NEXTVAL('ACT_HI_TSK_LOG_ID__SEQ'::REGCLASS) NOT NULL,
                                TYPE_ VARCHAR(64),
                                TASK_ID_ VARCHAR(64) NOT NULL,
                                TIME_STAMP_ TIMESTAMP NOT NULL,
                                USER_ID_ VARCHAR(255),
                                DATA_ VARCHAR(4000),
                                EXECUTION_ID_ VARCHAR(64),
                                PROC_INST_ID_ VARCHAR(64),
                                PROC_DEF_ID_ VARCHAR(64),
                                SCOPE_ID_ VARCHAR(255),
                                SCOPE_DEFINITION_ID_ VARCHAR(255),
                                SUB_SCOPE_ID_ VARCHAR(255),
                                SCOPE_TYPE_ VARCHAR(255),
                                TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);

CREATE TABLE ACT_RU_VARIABLE (
                                 ID_ VARCHAR(64) NOT NULL,
                                 REV_ INT4,
                                 TYPE_ VARCHAR(255) NOT NULL,
                                 NAME_ VARCHAR(255) NOT NULL,
                                 EXECUTION_ID_ VARCHAR(64),
                                 PROC_INST_ID_ VARCHAR(64),
                                 TASK_ID_ VARCHAR(64),
                                 SCOPE_ID_ VARCHAR(255),
                                 SUB_SCOPE_ID_ VARCHAR(255),
                                 SCOPE_TYPE_ VARCHAR(255),
                                 BYTEARRAY_ID_ VARCHAR(64),
                                 DOUBLE_ FLOAT8,
                                 LONG_ INT8,
                                 TEXT_ VARCHAR(4000),
                                 TEXT2_ VARCHAR(4000)
);
CREATE INDEX ACT_FK_VAR_BYTEARRAY ON ACT_RU_VARIABLE (BYTEARRAY_ID_);
CREATE INDEX ACT_FK_VAR_EXE ON ACT_RU_VARIABLE (EXECUTION_ID_);
CREATE INDEX ACT_FK_VAR_PROCINST ON ACT_RU_VARIABLE (PROC_INST_ID_);
CREATE INDEX ACT_IDX_RU_VAR_SCOPE_ID_TYPE ON ACT_RU_VARIABLE (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_RU_VAR_SUB_ID_TYPE ON ACT_RU_VARIABLE (SUB_SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_VARIABLE_TASK_ID ON ACT_RU_VARIABLE (TASK_ID_);


create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE(BYTEARRAY_ID_);
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_BYTEARRAY 
    foreign key (BYTEARRAY_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

insert into ACT_GE_PROPERTY values ('variable.schema.version', '6.6.0.0', 1);


CREATE TABLE ACT_HI_VARINST (
                                ID_ VARCHAR(64) NOT NULL,
                                REV_ INT4 DEFAULT 1,
                                PROC_INST_ID_ VARCHAR(64),
                                EXECUTION_ID_ VARCHAR(64),
                                TASK_ID_ VARCHAR(64),
                                NAME_ VARCHAR(255) NOT NULL,
                                VAR_TYPE_ VARCHAR(100),
                                SCOPE_ID_ VARCHAR(255),
                                SUB_SCOPE_ID_ VARCHAR(255),
                                SCOPE_TYPE_ VARCHAR(255),
                                BYTEARRAY_ID_ VARCHAR(64),
                                DOUBLE_ FLOAT8,
                                LONG_ INT8,
                                TEXT_ VARCHAR(4000),
                                TEXT2_ VARCHAR(4000),
                                CREATE_TIME_ TIMESTAMP,
                                LAST_UPDATED_TIME_ TIMESTAMP
);
CREATE INDEX ACT_IDX_HI_PROCVAR_EXE ON ACT_HI_VARINST (EXECUTION_ID_);
CREATE INDEX ACT_IDX_HI_PROCVAR_NAME_TYPE ON ACT_HI_VARINST (NAME_,VAR_TYPE_);
CREATE INDEX ACT_IDX_HI_PROCVAR_PROC_INST ON ACT_HI_VARINST (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_PROCVAR_TASK_ID ON ACT_HI_VARINST (TASK_ID_);
CREATE INDEX ACT_IDX_HI_VAR_SCOPE_ID_TYPE ON ACT_HI_VARINST (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_HI_VAR_SUB_ID_TYPE ON ACT_HI_VARINST (SUB_SCOPE_ID_,SCOPE_TYPE_);


CREATE TABLE ACT_RU_EVENT_SUBSCR (
                                     ID_ VARCHAR(64) NOT NULL,
                                     REV_ INT4,
                                     EVENT_TYPE_ VARCHAR(255) NOT NULL,
                                     EVENT_NAME_ VARCHAR(255),
                                     EXECUTION_ID_ VARCHAR(64),
                                     PROC_INST_ID_ VARCHAR(64),
                                     ACTIVITY_ID_ VARCHAR(64),
                                     CONFIGURATION_ VARCHAR(255),
                                     CREATED_ TIMESTAMP DEFAULT ('NOW'::TEXT)::TIMESTAMP(3) with time zone NOT NULL,
                                     PROC_DEF_ID_ VARCHAR(64),
                                     SUB_SCOPE_ID_ VARCHAR(64),
                                     SCOPE_ID_ VARCHAR(64),
                                     SCOPE_DEFINITION_ID_ VARCHAR(64),
                                     SCOPE_TYPE_ VARCHAR(64),
                                     TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);
CREATE INDEX ACT_FK_EVENT_EXEC ON ACT_RU_EVENT_SUBSCR (EXECUTION_ID_);
CREATE INDEX ACT_IDX_EVENT_SUBSCR_CONFIG_ ON ACT_RU_EVENT_SUBSCR (CONFIGURATION_);

create index ACT_IDX_EVENT_SUBSCR on ACT_RU_EVENT_SUBSCR(EXECUTION_ID_);

insert into ACT_GE_PROPERTY values ('eventsubscription.schema.version', '6.6.0.0', 1);
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
CREATE INDEX ACT_FK_MODEL_DEPLOYMENT ON ACT_RE_MODEL (DEPLOYMENT_ID_);
CREATE INDEX ACT_FK_MODEL_SOURCE ON ACT_RE_MODEL (EDITOR_SOURCE_VALUE_ID_);
CREATE INDEX ACT_FK_MODEL_SOURCE_EXTRA ON ACT_RE_MODEL (EDITOR_SOURCE_EXTRA_VALUE_ID_);

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
CREATE INDEX ACT_FK_EXE_PARENT ON ACT_RU_EXECUTION (PARENT_ID_);
CREATE INDEX ACT_FK_EXE_PROCDEF ON ACT_RU_EXECUTION (PROC_DEF_ID_);
CREATE INDEX ACT_FK_EXE_PROCINST ON ACT_RU_EXECUTION (PROC_INST_ID_);
CREATE INDEX ACT_FK_EXE_SUPER ON ACT_RU_EXECUTION (SUPER_EXEC_);
CREATE INDEX ACT_IDC_EXEC_ROOT ON ACT_RU_EXECUTION (ROOT_PROC_INST_ID_);
CREATE INDEX ACT_IDX_EXEC_BUSKEY ON ACT_RU_EXECUTION (BUSINESS_KEY_);

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
CREATE UNIQUE INDEX ACT_UNIQ_PROCDEF ON ACT_RE_PROCDEF (KEY_,VERSION_,DERIVED_VERSION_,TENANT_ID_);

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
CREATE INDEX ACT_FK_INFO_JSON_BA ON ACT_PROCDEF_INFO (INFO_JSON_ID_);
CREATE INDEX ACT_IDX_INFO_PROCDEF ON ACT_PROCDEF_INFO (PROC_DEF_ID_);
CREATE UNIQUE INDEX ACT_UNIQ_INFO_PROCDEF ON ACT_PROCDEF_INFO (PROC_DEF_ID_);

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
CREATE INDEX ACT_IDX_RU_ACTI_END ON ACT_RU_ACTINST (END_TIME_);
CREATE INDEX ACT_IDX_RU_ACTI_EXEC ON ACT_RU_ACTINST (EXECUTION_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_EXEC_ACT ON ACT_RU_ACTINST (EXECUTION_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_PROC ON ACT_RU_ACTINST (PROC_INST_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_PROC_ACT ON ACT_RU_ACTINST (PROC_INST_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_RU_ACTI_START ON ACT_RU_ACTINST (START_TIME_);

-- create index ACT_IDX_EXEC_BUSKEY on ACT_RU_EXECUTION(BUSINESS_KEY_);
create index ACT_IDX_EXE_ROOT on ACT_RU_EXECUTION(ROOT_PROC_INST_ID_);
-- create index ACT_IDX_VARIABLE_TASK_ID on ACT_RU_VARIABLE(TASK_ID_);

create index ACT_IDX_BYTEAR_DEPL on ACT_GE_BYTEARRAY(DEPLOYMENT_ID_);

-- create index ACT_IDX_RU_ACTI_START on ACT_RU_ACTINST(START_TIME_);
-- create index ACT_IDX_RU_ACTI_END on ACT_RU_ACTINST(END_TIME_);
-- create index ACT_IDX_RU_ACTI_PROC on ACT_RU_ACTINST(PROC_INST_ID_);
-- create index ACT_IDX_RU_ACTI_PROC_ACT on ACT_RU_ACTINST(PROC_INST_ID_, ACT_ID_);
-- create index ACT_IDX_RU_ACTI_EXEC on ACT_RU_ACTINST(EXECUTION_ID_);
-- create index ACT_IDX_RU_ACTI_EXEC_ACT on ACT_RU_ACTINST(EXECUTION_ID_, ACT_ID_);

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


CREATE TABLE ACT_HI_PROCINST (
                                 ID_ VARCHAR(64) NOT NULL,
                                 REV_ INT4 DEFAULT 1,
                                 PROC_INST_ID_ VARCHAR(64) NOT NULL,
                                 BUSINESS_KEY_ VARCHAR(255),
                                 PROC_DEF_ID_ VARCHAR(64) NOT NULL,
                                 START_TIME_ TIMESTAMP NOT NULL,
                                 END_TIME_ TIMESTAMP,
                                 DURATION_ INT8,
                                 START_USER_ID_ VARCHAR(255),
                                 START_ACT_ID_ VARCHAR(255),
                                 END_ACT_ID_ VARCHAR(255),
                                 SUPER_PROCESS_INSTANCE_ID_ VARCHAR(64),
                                 DELETE_REASON_ VARCHAR(4000),
                                 TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING,
                                 NAME_ VARCHAR(255),
                                 CALLBACK_ID_ VARCHAR(255),
                                 CALLBACK_TYPE_ VARCHAR(255),
                                 REFERENCE_ID_ VARCHAR(255),
                                 REFERENCE_TYPE_ VARCHAR(255)
);
CREATE INDEX ACT_IDX_HI_PRO_INST_END ON ACT_HI_PROCINST (END_TIME_);
CREATE INDEX ACT_IDX_HI_PRO_I_BUSKEY ON ACT_HI_PROCINST (BUSINESS_KEY_);
CREATE UNIQUE INDEX PROC_INST_ID_ ON ACT_HI_PROCINST (PROC_INST_ID_);

CREATE TABLE ACT_HI_ACTINST (
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
                                TRANSACTION_ORDER_ INT4,
                                DURATION_ INT8,
                                DELETE_REASON_ VARCHAR(4000),
                                TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);
CREATE INDEX ACT_IDX_HI_ACT_INST_END ON ACT_HI_ACTINST (END_TIME_);
CREATE INDEX ACT_IDX_HI_ACT_INST_EXEC ON ACT_HI_ACTINST (EXECUTION_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_PROCINST ON ACT_HI_ACTINST (PROC_INST_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_START ON ACT_HI_ACTINST (START_TIME_);

CREATE TABLE ACT_HI_DETAIL (
                               ID_ VARCHAR(64) NOT NULL,
                               TYPE_ VARCHAR(255) NOT NULL,
                               PROC_INST_ID_ VARCHAR(64),
                               EXECUTION_ID_ VARCHAR(64),
                               TASK_ID_ VARCHAR(64),
                               ACT_INST_ID_ VARCHAR(64),
                               NAME_ VARCHAR(255) NOT NULL,
                               VAR_TYPE_ VARCHAR(255),
                               REV_ INT4,
                               TIME_ TIMESTAMP NOT NULL,
                               BYTEARRAY_ID_ VARCHAR(64),
                               DOUBLE_ FLOAT8,
                               LONG_ INT8,
                               TEXT_ VARCHAR(4000),
                               TEXT2_ VARCHAR(4000)
);
CREATE INDEX ACT_IDX_HI_DETAIL_ACT_INST ON ACT_HI_DETAIL (ACT_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_NAME ON ACT_HI_DETAIL (NAME_);
CREATE INDEX ACT_IDX_HI_DETAIL_PROC_INST ON ACT_HI_DETAIL (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TASK_ID ON ACT_HI_DETAIL (TASK_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TIME ON ACT_HI_DETAIL (TIME_);

CREATE TABLE ACT_HI_COMMENT (
                                ID_ VARCHAR(64) NOT NULL,
                                TYPE_ VARCHAR(255),
                                TIME_ TIMESTAMP NOT NULL,
                                USER_ID_ VARCHAR(255),
                                TASK_ID_ VARCHAR(64),
                                PROC_INST_ID_ VARCHAR(64),
                                ACTION_ VARCHAR(255),
                                MESSAGE_ VARCHAR(4000),
                                FULL_MSG_ BLOB
);

CREATE TABLE ACT_HI_ATTACHMENT (
                                   ID_ VARCHAR(64) NOT NULL,
                                   REV_ INT4,
                                   USER_ID_ VARCHAR(255),
                                   NAME_ VARCHAR(255),
                                   DESCRIPTION_ VARCHAR(4000),
                                   TYPE_ VARCHAR(255),
                                   TASK_ID_ VARCHAR(64),
                                   PROC_INST_ID_ VARCHAR(64),
                                   URL_ VARCHAR(4000),
                                   CONTENT_ID_ VARCHAR(64),
                                   TIME_ TIMESTAMP
);

-- create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
-- create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
-- create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
-- create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
-- create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
-- create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
-- create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
-- create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
-- create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
-- create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
-- create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
-- create index ACT_IDX_HI_PROCVAR_EXE on ACT_HI_VARINST(EXECUTION_ID_);
-- create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
-- create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);
-- create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
-- create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);
-- create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);
CREATE TABLE ACT_ID_PROPERTY (
                                 NAME_ VARCHAR(64) NOT NULL,
                                 VALUE_ VARCHAR(300),
                                 REV_ INT4
);

insert into ACT_ID_PROPERTY
values ('schema.version', '6.6.0.0', 1);

CREATE TABLE ACT_ID_BYTEARRAY (
                                  ID_ VARCHAR(64) NOT NULL,
                                  REV_ INT4,
                                  NAME_ VARCHAR(255),
                                  BYTES_ BLOB
);

CREATE TABLE ACT_ID_GROUP (
                              ID_ VARCHAR(64) NOT NULL,
                              REV_ INT4,
                              NAME_ VARCHAR(255),
                              TYPE_ VARCHAR(255)
);

CREATE TABLE ACT_ID_MEMBERSHIP (
                                   USER_ID_ VARCHAR(64) NOT NULL,
                                   GROUP_ID_ VARCHAR(64) NOT NULL
);
CREATE INDEX ACT_FK_MEMB_GROUP ON ACT_ID_MEMBERSHIP (GROUP_ID_);

CREATE TABLE ACT_ID_USER (
                             ID_ VARCHAR(64) NOT NULL,
                             REV_ INT4,
                             FIRST_ VARCHAR(255),
                             LAST_ VARCHAR(255),
                             DISPLAY_NAME_ VARCHAR(255),
                             EMAIL_ VARCHAR(255),
                             PWD_ VARCHAR(255),
                             PICTURE_ID_ VARCHAR(64),
                             TENANT_ID_ VARCHAR(255) DEFAULT ''::CHARACTER VARYING
);

CREATE TABLE ACT_ID_INFO (
                             ID_ VARCHAR(64) NOT NULL,
                             REV_ INT4,
                             USER_ID_ VARCHAR(64),
                             TYPE_ VARCHAR(64),
                             KEY_ VARCHAR(255),
                             VALUE_ VARCHAR(255),
                             PASSWORD_ BLOB,
                             PARENT_ID_ VARCHAR(255)
);

CREATE TABLE ACT_ID_TOKEN (
                              ID_ VARCHAR(64) NOT NULL,
                              REV_ INT4,
                              TOKEN_VALUE_ VARCHAR(255),
                              TOKEN_DATE_ TIMESTAMP,
                              IP_ADDRESS_ VARCHAR(255),
                              USER_AGENT_ VARCHAR(255),
                              USER_ID_ VARCHAR(255),
                              TOKEN_DATA_ VARCHAR(2000)
);

CREATE TABLE ACT_ID_PRIV (
                             ID_ VARCHAR(64) NOT NULL,
                             NAME_ VARCHAR(255) NOT NULL
);
CREATE UNIQUE INDEX ACT_UNIQ_PRIV_NAME ON ACT_ID_PRIV (NAME_);

CREATE TABLE ACT_ID_PRIV_MAPPING (
                                     ID_ VARCHAR(64) NOT NULL,
                                     PRIV_ID_ VARCHAR(64) NOT NULL,
                                     USER_ID_ VARCHAR(255),
                                     GROUP_ID_ VARCHAR(255)
);
CREATE INDEX ACT_FK_PRIV_MAPPING ON ACT_ID_PRIV_MAPPING (PRIV_ID_);
CREATE INDEX ACT_IDX_PRIV_GROUP ON ACT_ID_PRIV_MAPPING (GROUP_ID_);
CREATE INDEX ACT_IDX_PRIV_USER ON ACT_ID_PRIV_MAPPING (USER_ID_);

create index ACT_IDX_MEMB_GROUP on ACT_ID_MEMBERSHIP(GROUP_ID_);
alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_GROUP
    foreign key (GROUP_ID_)
    references ACT_ID_GROUP (ID_);

create index ACT_IDX_MEMB_USER on ACT_ID_MEMBERSHIP(USER_ID_);
alter table ACT_ID_MEMBERSHIP
    add constraint ACT_FK_MEMB_USER
    foreign key (USER_ID_)
    references ACT_ID_USER (ID_);

create index ACT_IDX_PRIV_MAPPING on ACT_ID_PRIV_MAPPING(PRIV_ID_);
alter table ACT_ID_PRIV_MAPPING
    add constraint ACT_FK_PRIV_MAPPING
    foreign key (PRIV_ID_)
    references ACT_ID_PRIV (ID_);

-- create index ACT_IDX_PRIV_USER on ACT_ID_PRIV_MAPPING(USER_ID_);
-- create index ACT_IDX_PRIV_GROUP on ACT_ID_PRIV_MAPPING(GROUP_ID_);

alter table ACT_ID_PRIV
    add constraint ACT_UNIQ_PRIV_NAME
    unique (NAME_);

CREATE TABLE ACT_APP_DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_ACT_APP_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM ACT_APP_DATABASECHANGELOGLOCK;

INSERT INTO ACT_APP_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2020-10-06 16:03:12.474' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE ACT_APP_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE ACT_APP_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, KEY_ VARCHAR(255) NULL, DEPLOY_TIME_ datetime NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_APP_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE ACT_APP_DEPLOYMENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_BYTES_ LONGBLOB NULL, CONSTRAINT PK_APP_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE ACT_APP_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_APP_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_APP_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_APP_RSRC_DPL ON ACT_APP_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE ACT_APP_APPDEF (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, NAME_ VARCHAR(255) NULL, KEY_ VARCHAR(255) NOT NULL, VERSION_ INT NOT NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_NAME_ VARCHAR(4000) NULL, DESCRIPTION_ VARCHAR(4000) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_APP_APPDEF PRIMARY KEY (ID_));

ALTER TABLE ACT_APP_APPDEF ADD CONSTRAINT ACT_FK_APP_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_APP_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_APP_DEF_DPLY ON ACT_APP_APPDEF(DEPLOYMENT_ID_);

INSERT INTO ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', NOW(), 1, '7:ec9776f6c57a3953c7d27499108df3d1', 'createTable tableName=ACT_APP_DEPLOYMENT; createTable tableName=ACT_APP_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_APP_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_APP_RSRC_DPL, referencedTableName=ACT_APP_DEPLOYMENT; createIndex...', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992562');

ALTER TABLE ACT_APP_DEPLOYMENT MODIFY DEPLOY_TIME_ datetime(3);

INSERT INTO ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', NOW(), 2, '7:f6ea483119569f0fe50aae8d64ba392d', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_APP_DEPLOYMENT', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992562');

CREATE UNIQUE INDEX ACT_IDX_APP_DEF_UNIQ ON ACT_APP_APPDEF(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_APP_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/app/db/liquibase/flowable-app-db-changelog.xml', NOW(), 3, '7:4ef4a0a9e9cfb636c22126d540cdd38e', 'createIndex indexName=ACT_IDX_APP_DEF_UNIQ, tableName=ACT_APP_APPDEF', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992562');

UPDATE ACT_APP_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


CREATE TABLE ACT_CMMN_DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_ACT_CMMN_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM ACT_CMMN_DATABASECHANGELOGLOCK;

INSERT INTO ACT_CMMN_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2020-10-06 16:03:12.871' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE ACT_CMMN_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE ACT_CMMN_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, KEY_ VARCHAR(255) NULL, DEPLOY_TIME_ datetime NULL, PARENT_DEPLOYMENT_ID_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_CMMN_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_DEPLOYMENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_BYTES_ LONGBLOB NULL, CONSTRAINT PK_CMMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_DEPLOYMENT_RESOURCE ADD CONSTRAINT ACT_FK_CMMN_RSRC_DPL FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CMMN_RSRC_DPL ON ACT_CMMN_DEPLOYMENT_RESOURCE(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_CASEDEF (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, NAME_ VARCHAR(255) NULL, KEY_ VARCHAR(255) NOT NULL, VERSION_ INT NOT NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_NAME_ VARCHAR(4000) NULL, DESCRIPTION_ VARCHAR(4000) NULL, HAS_GRAPHICAL_NOTATION_ BIT(1) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_CMMN_CASEDEF PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_CASEDEF ADD CONSTRAINT ACT_FK_CASE_DEF_DPLY FOREIGN KEY (DEPLOYMENT_ID_) REFERENCES ACT_CMMN_DEPLOYMENT (ID_);

CREATE INDEX ACT_IDX_CASE_DEF_DPLY ON ACT_CMMN_CASEDEF(DEPLOYMENT_ID_);

CREATE TABLE ACT_CMMN_RU_CASE_INST (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, BUSINESS_KEY_ VARCHAR(255) NULL, NAME_ VARCHAR(255) NULL, PARENT_ID_ VARCHAR(255) NULL, CASE_DEF_ID_ VARCHAR(255) NULL, STATE_ VARCHAR(255) NULL, START_TIME_ datetime NULL, START_USER_ID_ VARCHAR(255) NULL, CALLBACK_ID_ VARCHAR(255) NULL, CALLBACK_TYPE_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_CMMN_RU_CASE_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD CONSTRAINT ACT_FK_CASE_INST_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_CASE_INST_CASE_DEF ON ACT_CMMN_RU_CASE_INST(CASE_DEF_ID_);

CREATE INDEX ACT_IDX_CASE_INST_PARENT ON ACT_CMMN_RU_CASE_INST(PARENT_ID_);

CREATE TABLE ACT_CMMN_RU_PLAN_ITEM_INST (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, CASE_DEF_ID_ VARCHAR(255) NULL, CASE_INST_ID_ VARCHAR(255) NULL, STAGE_INST_ID_ VARCHAR(255) NULL, IS_STAGE_ BIT(1) NULL, ELEMENT_ID_ VARCHAR(255) NULL, NAME_ VARCHAR(255) NULL, STATE_ VARCHAR(255) NULL, START_TIME_ datetime NULL, START_USER_ID_ VARCHAR(255) NULL, REFERENCE_ID_ VARCHAR(255) NULL, REFERENCE_TYPE_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_CMMN_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_DEF ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD CONSTRAINT ACT_FK_PLAN_ITEM_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_PLAN_ITEM_CASE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_RU_SENTRY_PART_INST (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, CASE_DEF_ID_ VARCHAR(255) NULL, CASE_INST_ID_ VARCHAR(255) NULL, PLAN_ITEM_INST_ID_ VARCHAR(255) NULL, ON_PART_ID_ VARCHAR(255) NULL, IF_PART_ID_ VARCHAR(255) NULL, TIME_STAMP_ datetime NULL, CONSTRAINT PK_CMMN_SENTRY_PART_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_DEF ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_CASE_INST ON ACT_CMMN_RU_SENTRY_PART_INST(CASE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST ADD CONSTRAINT ACT_FK_SENTRY_PLAN_ITEM FOREIGN KEY (PLAN_ITEM_INST_ID_) REFERENCES ACT_CMMN_RU_PLAN_ITEM_INST (ID_);

CREATE INDEX ACT_IDX_SENTRY_PLAN_ITEM ON ACT_CMMN_RU_SENTRY_PART_INST(PLAN_ITEM_INST_ID_);

CREATE TABLE ACT_CMMN_RU_MIL_INST (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NOT NULL, TIME_STAMP_ datetime NOT NULL, CASE_INST_ID_ VARCHAR(255) NOT NULL, CASE_DEF_ID_ VARCHAR(255) NOT NULL, ELEMENT_ID_ VARCHAR(255) NOT NULL, CONSTRAINT PK_ACT_CMMN_RU_MIL_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_DEF FOREIGN KEY (CASE_DEF_ID_) REFERENCES ACT_CMMN_CASEDEF (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_DEF ON ACT_CMMN_RU_MIL_INST(CASE_DEF_ID_);

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD CONSTRAINT ACT_FK_MIL_CASE_INST FOREIGN KEY (CASE_INST_ID_) REFERENCES ACT_CMMN_RU_CASE_INST (ID_);

CREATE INDEX ACT_IDX_MIL_CASE_INST ON ACT_CMMN_RU_MIL_INST(CASE_INST_ID_);

CREATE TABLE ACT_CMMN_HI_CASE_INST (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, BUSINESS_KEY_ VARCHAR(255) NULL, NAME_ VARCHAR(255) NULL, PARENT_ID_ VARCHAR(255) NULL, CASE_DEF_ID_ VARCHAR(255) NULL, STATE_ VARCHAR(255) NULL, START_TIME_ datetime NULL, END_TIME_ datetime NULL, START_USER_ID_ VARCHAR(255) NULL, CALLBACK_ID_ VARCHAR(255) NULL, CALLBACK_TYPE_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_CMMN_HI_CASE_INST PRIMARY KEY (ID_));

CREATE TABLE ACT_CMMN_HI_MIL_INST (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, NAME_ VARCHAR(255) NOT NULL, TIME_STAMP_ datetime NOT NULL, CASE_INST_ID_ VARCHAR(255) NOT NULL, CASE_DEF_ID_ VARCHAR(255) NOT NULL, ELEMENT_ID_ VARCHAR(255) NOT NULL, CONSTRAINT PK_ACT_CMMN_HI_MIL_INST PRIMARY KEY (ID_));

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 1, '7:1ed01100eeb9bb6054c28320b6c5fb22', 'createTable tableName=ACT_CMMN_DEPLOYMENT; createTable tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addForeignKeyConstraint baseTableName=ACT_CMMN_DEPLOYMENT_RESOURCE, constraintName=ACT_FK_CMMN_RSRC_DPL, referencedTableName=ACT_CMMN_DEPLOYMENT; create...', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_CASEDEF ADD DGRM_RESOURCE_NAME_ VARCHAR(4000) NULL, ADD HAS_START_FORM_KEY_ BIT(1) NULL;

ALTER TABLE ACT_CMMN_DEPLOYMENT_RESOURCE ADD GENERATED_ BIT(1) NULL;

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LOCK_TIME_ datetime NULL;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD ITEM_DEFINITION_ID_ VARCHAR(255) NULL, ADD ITEM_DEFINITION_TYPE_ VARCHAR(255) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 2, '7:72a1f3f4767524ec0e22288a1621ebb9', 'addColumn tableName=ACT_CMMN_CASEDEF; addColumn tableName=ACT_CMMN_DEPLOYMENT_RESOURCE; addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COMPLETEABLE_ BIT(1) NULL;

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD IS_COMPLETEABLE_ BIT(1) NULL;

CREATE INDEX ACT_IDX_PLAN_ITEM_STAGE_INST ON ACT_CMMN_RU_PLAN_ITEM_INST(STAGE_INST_ID_);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD IS_COUNT_ENABLED_ BIT(1) NULL;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD VAR_COUNT_ INT NULL;

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD SENTRY_PART_INST_COUNT_ INT NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 3, '7:1c0c14847bb4a891aaf91668d14240c1', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_PLAN_ITEM_STAGE_INST, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableNam...', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

CREATE TABLE ACT_CMMN_HI_PLAN_ITEM_INST (ID_ VARCHAR(255) NOT NULL, REV_ INT NOT NULL, NAME_ VARCHAR(255) NULL, STATE_ VARCHAR(255) NULL, CASE_DEF_ID_ VARCHAR(255) NULL, CASE_INST_ID_ VARCHAR(255) NULL, STAGE_INST_ID_ VARCHAR(255) NULL, IS_STAGE_ BIT(1) NULL, ELEMENT_ID_ VARCHAR(255) NULL, ITEM_DEFINITION_ID_ VARCHAR(255) NULL, ITEM_DEFINITION_TYPE_ VARCHAR(255) NULL, CREATED_TIME_ datetime NULL, LAST_AVAILABLE_TIME_ datetime NULL, LAST_ENABLED_TIME_ datetime NULL, LAST_DISABLED_TIME_ datetime NULL, LAST_STARTED_TIME_ datetime NULL, LAST_SUSPENDED_TIME_ datetime NULL, COMPLETED_TIME_ datetime NULL, OCCURRED_TIME_ datetime NULL, TERMINATED_TIME_ datetime NULL, EXIT_TIME_ datetime NULL, ENDED_TIME_ datetime NULL, LAST_UPDATED_TIME_ datetime NULL, START_USER_ID_ VARCHAR(255) NULL, REFERENCE_ID_ VARCHAR(255) NULL, REFERENCE_TYPE_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) DEFAULT '' NULL, CONSTRAINT PK_ACT_CMMN_HI_PLAN_ITEM_INST PRIMARY KEY (ID_));

ALTER TABLE ACT_CMMN_RU_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '' NULL;

ALTER TABLE ACT_CMMN_HI_MIL_INST ADD TENANT_ID_ VARCHAR(255) DEFAULT '' NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 4, '7:894e6e444f72422bf34e4ade89dc8451', 'createTable tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_MIL_INST; addColumn tableName=ACT_CMMN_HI_MIL_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_DEPLOYMENT MODIFY DEPLOY_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_RU_CASE_INST MODIFY START_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST MODIFY START_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_RU_SENTRY_PART_INST MODIFY TIME_STAMP_ datetime(3);

ALTER TABLE ACT_CMMN_RU_MIL_INST MODIFY TIME_STAMP_ datetime(3);

ALTER TABLE ACT_CMMN_HI_CASE_INST MODIFY START_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_CASE_INST MODIFY END_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_MIL_INST MODIFY TIME_STAMP_ datetime(3);

ALTER TABLE ACT_CMMN_RU_CASE_INST MODIFY LOCK_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY CREATED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY LAST_AVAILABLE_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY LAST_ENABLED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY LAST_DISABLED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY LAST_STARTED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY LAST_SUSPENDED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY COMPLETED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY OCCURRED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY TERMINATED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY EXIT_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY ENDED_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST MODIFY LAST_UPDATED_TIME_ datetime(3);

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('5', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 5, '7:08d50990ca7c5669a8dfb6cdc0bbb7e0', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_CMMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_CASE_INST; modifyDataType columnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; modifyDataType columnName=T...', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

CREATE UNIQUE INDEX ACT_IDX_CASE_DEF_UNIQ ON ACT_CMMN_CASEDEF(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 6, '7:2b33c819a1ef81d793f7ef82bed8b1ac', 'createIndex indexName=ACT_IDX_CASE_DEF_UNIQ, tableName=ACT_CMMN_CASEDEF', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST CHANGE START_TIME_ CREATE_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST CHANGE CREATED_TIME_ CREATE_TIME_ datetime(3);

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_AVAILABLE_TIME_ datetime(3) NULL, ADD LAST_ENABLED_TIME_ datetime(3) NULL, ADD LAST_DISABLED_TIME_ datetime(3) NULL, ADD LAST_STARTED_TIME_ datetime(3) NULL, ADD LAST_SUSPENDED_TIME_ datetime(3) NULL, ADD COMPLETED_TIME_ datetime(3) NULL, ADD OCCURRED_TIME_ datetime(3) NULL, ADD TERMINATED_TIME_ datetime(3) NULL, ADD EXIT_TIME_ datetime(3) NULL, ADD ENDED_TIME_ datetime(3) NULL, ADD ENTRY_CRITERION_ID_ VARCHAR(255) NULL, ADD EXIT_CRITERION_ID_ VARCHAR(255) NULL;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD ENTRY_CRITERION_ID_ VARCHAR(255) NULL, ADD EXIT_CRITERION_ID_ VARCHAR(255) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('7', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 7, '7:ff6d918908599427d849c1f3b109cf1c', 'renameColumn newColumnName=CREATE_TIME_, oldColumnName=START_TIME_, tableName=ACT_CMMN_RU_PLAN_ITEM_INST; renameColumn newColumnName=CREATE_TIME_, oldColumnName=CREATED_TIME_, tableName=ACT_CMMN_HI_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_RU_P...', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD SHOW_IN_OVERVIEW_ BIT(1) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('8', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 8, '7:d168de628476556968549f4a355baacb', 'addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD EXTRA_VALUE_ VARCHAR(255) NULL;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD EXTRA_VALUE_ VARCHAR(255) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('9', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 9, '7:20048a5d52039eaabb32dbb30240fc08', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD REFERENCE_ID_ VARCHAR(255) NULL;

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD REFERENCE_TYPE_ VARCHAR(255) NULL;

CREATE INDEX ACT_IDX_CASE_INST_REF_ID_ ON ACT_CMMN_RU_CASE_INST(REFERENCE_ID_);

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD REFERENCE_ID_ VARCHAR(255) NULL;

ALTER TABLE ACT_CMMN_HI_CASE_INST ADD REFERENCE_TYPE_ VARCHAR(255) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('10', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 10, '7:e20ea59573dc2a33bbf72043ea09ea4d', 'addColumn tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_RU_CASE_INST; createIndex indexName=ACT_IDX_CASE_INST_REF_ID_, tableName=ACT_CMMN_RU_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE_INST; addColumn tableName=ACT_CMMN_HI_CASE...', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD DERIVED_CASE_DEF_ID_ VARCHAR(255) NULL;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD DERIVED_CASE_DEF_ID_ VARCHAR(255) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('11', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 11, '7:21c7a61ad7fb26abc675dff7ac54e43e', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_RU_CASE_INST ADD LOCK_OWNER_ VARCHAR(255) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('12', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 12, '7:e77f0eb21b221f823d6a0e198144cefc', 'addColumn tableName=ACT_CMMN_RU_CASE_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

ALTER TABLE ACT_CMMN_RU_PLAN_ITEM_INST ADD LAST_UNAVAILABLE_TIME_ datetime(3) NULL;

ALTER TABLE ACT_CMMN_HI_PLAN_ITEM_INST ADD LAST_UNAVAILABLE_TIME_ datetime(3) NULL;

INSERT INTO ACT_CMMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('13', 'flowable', 'org/flowable/cmmn/db/liquibase/flowable-cmmn-db-changelog.xml', NOW(), 13, '7:c5ddabeb0c9fb8db6371c249097d78a3', 'addColumn tableName=ACT_CMMN_RU_PLAN_ITEM_INST; addColumn tableName=ACT_CMMN_HI_PLAN_ITEM_INST', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992992920');

UPDATE ACT_CMMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


CREATE TABLE FLW_EV_DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED TINYINT NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_FLW_EV_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM FLW_EV_DATABASECHANGELOGLOCK;

INSERT INTO FLW_EV_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE FLW_EV_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2020-10-06 16:03:14.642' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE FLW_EV_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE FLW_EVENT_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOY_TIME_ datetime(3) NULL, TENANT_ID_ VARCHAR(255) NULL, PARENT_DEPLOYMENT_ID_ VARCHAR(255) NULL, CONSTRAINT PK_FLW_EVENT_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE FLW_EVENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_BYTES_ LONGBLOB NULL, CONSTRAINT PK_FLW_EVENT_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE FLW_EVENT_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, VERSION_ INT NULL, KEY_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) NULL, RESOURCE_NAME_ VARCHAR(255) NULL, DESCRIPTION_ VARCHAR(255) NULL, CONSTRAINT PK_FLW_EVENT_DEFINITION PRIMARY KEY (ID_));

CREATE UNIQUE INDEX ACT_IDX_EVENT_DEF_UNIQ ON FLW_EVENT_DEFINITION(KEY_, VERSION_, TENANT_ID_);

CREATE TABLE FLW_CHANNEL_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, VERSION_ INT NULL, KEY_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, CREATE_TIME_ datetime(3) NULL, TENANT_ID_ VARCHAR(255) NULL, RESOURCE_NAME_ VARCHAR(255) NULL, DESCRIPTION_ VARCHAR(255) NULL, CONSTRAINT PK_FLW_CHANNEL_DEFINITION PRIMARY KEY (ID_));

CREATE UNIQUE INDEX ACT_IDX_CHANNEL_DEF_UNIQ ON FLW_CHANNEL_DEFINITION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO FLW_EV_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'flowable', 'org/flowable/eventregistry/db/liquibase/flowable-eventregistry-db-changelog.xml', NOW(), 1, '7:0aaa7b01343f4cdaf1019cd2de3f98f3', 'createTable tableName=FLW_EVENT_DEPLOYMENT; createTable tableName=FLW_EVENT_RESOURCE; createTable tableName=FLW_EVENT_DEFINITION; createIndex indexName=ACT_IDX_EVENT_DEF_UNIQ, tableName=FLW_EVENT_DEFINITION; createTable tableName=FLW_CHANNEL_DEFIN...', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994659');

UPDATE FLW_EV_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


CREATE TABLE ACT_DMN_DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_ACT_DMN_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM ACT_DMN_DATABASECHANGELOGLOCK;

INSERT INTO ACT_DMN_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2020-10-06 16:03:14.829' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE ACT_DMN_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE ACT_DMN_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOY_TIME_ datetime NULL, TENANT_ID_ VARCHAR(255) NULL, PARENT_DEPLOYMENT_ID_ VARCHAR(255) NULL, CONSTRAINT PK_ACT_DMN_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE ACT_DMN_DEPLOYMENT_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_BYTES_ LONGBLOB NULL, CONSTRAINT PK_ACT_DMN_DEPLOYMENT_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE ACT_DMN_DECISION_TABLE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, VERSION_ INT NULL, KEY_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, PARENT_DEPLOYMENT_ID_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) NULL, RESOURCE_NAME_ VARCHAR(255) NULL, DESCRIPTION_ VARCHAR(255) NULL, CONSTRAINT PK_ACT_DMN_DECISION_TABLE PRIMARY KEY (ID_));

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 1, '7:d878c2672ead57b5801578fd39c423af', 'createTable tableName=ACT_DMN_DEPLOYMENT; createTable tableName=ACT_DMN_DEPLOYMENT_RESOURCE; createTable tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

CREATE TABLE ACT_DMN_HI_DECISION_EXECUTION (ID_ VARCHAR(255) NOT NULL, DECISION_DEFINITION_ID_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, START_TIME_ datetime NULL, END_TIME_ datetime NULL, INSTANCE_ID_ VARCHAR(255) NULL, EXECUTION_ID_ VARCHAR(255) NULL, ACTIVITY_ID_ VARCHAR(255) NULL, FAILED_ BIT(1) DEFAULT 0 NULL, TENANT_ID_ VARCHAR(255) NULL, EXECUTION_JSON_ LONGTEXT NULL, CONSTRAINT PK_ACT_DMN_HI_DECISION_EXECUTION PRIMARY KEY (ID_));

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 2, '7:15a6bda1fce898a58e04fe6ac2d89f54', 'createTable tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

ALTER TABLE ACT_DMN_HI_DECISION_EXECUTION ADD SCOPE_TYPE_ VARCHAR(255) NULL;

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 3, '7:eed5dec2f94778b62d0b0b4beebc191d', 'addColumn tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

ALTER TABLE ACT_DMN_DECISION_TABLE DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 4, '7:b8d3d5a3efb71aef7578e1130a38fde2', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

ALTER TABLE ACT_DMN_DEPLOYMENT MODIFY DEPLOY_TIME_ datetime(3);

ALTER TABLE ACT_DMN_HI_DECISION_EXECUTION MODIFY START_TIME_ datetime(3);

ALTER TABLE ACT_DMN_HI_DECISION_EXECUTION MODIFY END_TIME_ datetime(3);

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('5', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 5, '7:ae890f8d7f13a83bebd35c0749fd0a58', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_DMN_DEPLOYMENT; modifyDataType columnName=START_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION; modifyDataType columnName=END_TIME_, tableName=ACT_DMN_HI_DECISION_EXECUTION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

CREATE UNIQUE INDEX ACT_IDX_DEC_TBL_UNIQ ON ACT_DMN_DECISION_TABLE(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('6', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 6, '7:c44cb06af8977c776a4e93aebe96c568', 'createIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

DROP INDEX ACT_IDX_DEC_TBL_UNIQ ON ACT_DMN_DECISION_TABLE;

ALTER TABLE ACT_DMN_DECISION_TABLE RENAME ACT_DMN_DECISION;

CREATE UNIQUE INDEX ACT_IDX_DMN_DEC_UNIQ ON ACT_DMN_DECISION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('7', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 7, '7:4b6469565b1b00b428ffca7eab1ef253', 'dropIndex indexName=ACT_IDX_DEC_TBL_UNIQ, tableName=ACT_DMN_DECISION_TABLE; renameTable newTableName=ACT_DMN_DECISION, oldTableName=ACT_DMN_DECISION_TABLE; createIndex indexName=ACT_IDX_DMN_DEC_UNIQ, tableName=ACT_DMN_DECISION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

ALTER TABLE ACT_DMN_DECISION ADD DECISION_TYPE_ VARCHAR(255) NULL;

INSERT INTO ACT_DMN_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('8', 'flowable', 'org/flowable/dmn/db/liquibase/flowable-dmn-db-changelog.xml', NOW(), 8, '7:f83b7b3228be2c4bbb554d6de45307d7', 'addColumn tableName=ACT_DMN_DECISION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992994858');

UPDATE ACT_DMN_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


CREATE TABLE ACT_FO_DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_ACT_FO_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM ACT_FO_DATABASECHANGELOGLOCK;

INSERT INTO ACT_FO_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2020-10-06 16:03:15.253' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE ACT_FO_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE ACT_FO_FORM_DEPLOYMENT (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOY_TIME_ datetime NULL, TENANT_ID_ VARCHAR(255) NULL, PARENT_DEPLOYMENT_ID_ VARCHAR(255) NULL, CONSTRAINT PK_ACT_FO_FORM_DEPLOYMENT PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_RESOURCE (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, RESOURCE_BYTES_ LONGBLOB NULL, CONSTRAINT PK_ACT_FO_FORM_RESOURCE PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_DEFINITION (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NULL, VERSION_ INT NULL, KEY_ VARCHAR(255) NULL, CATEGORY_ VARCHAR(255) NULL, DEPLOYMENT_ID_ VARCHAR(255) NULL, PARENT_DEPLOYMENT_ID_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) NULL, RESOURCE_NAME_ VARCHAR(255) NULL, DESCRIPTION_ VARCHAR(255) NULL, CONSTRAINT PK_ACT_FO_FORM_DEFINITION PRIMARY KEY (ID_));

CREATE TABLE ACT_FO_FORM_INSTANCE (ID_ VARCHAR(255) NOT NULL, FORM_DEFINITION_ID_ VARCHAR(255) NOT NULL, TASK_ID_ VARCHAR(255) NULL, PROC_INST_ID_ VARCHAR(255) NULL, PROC_DEF_ID_ VARCHAR(255) NULL, SUBMITTED_DATE_ datetime NULL, SUBMITTED_BY_ VARCHAR(255) NULL, FORM_VALUES_ID_ VARCHAR(255) NULL, TENANT_ID_ VARCHAR(255) NULL, CONSTRAINT PK_ACT_FO_FORM_INSTANCE PRIMARY KEY (ID_));

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 1, '7:252bd5cb28cf86685ed67eb15d910118', 'createTable tableName=ACT_FO_FORM_DEPLOYMENT; createTable tableName=ACT_FO_FORM_RESOURCE; createTable tableName=ACT_FO_FORM_DEFINITION; createTable tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992995273');

ALTER TABLE ACT_FO_FORM_INSTANCE ADD SCOPE_ID_ VARCHAR(255) NULL, ADD SCOPE_TYPE_ VARCHAR(255) NULL, ADD SCOPE_DEFINITION_ID_ VARCHAR(255) NULL;

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 2, '7:4850f9311e7503d7ea30a372e79b4ea2', 'addColumn tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992995273');

ALTER TABLE ACT_FO_FORM_DEFINITION DROP COLUMN PARENT_DEPLOYMENT_ID_;

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('3', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 3, '7:6d80a1fd28201ae354e73bd7c5cf8595', 'dropColumn columnName=PARENT_DEPLOYMENT_ID_, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992995273');

ALTER TABLE ACT_FO_FORM_DEPLOYMENT MODIFY DEPLOY_TIME_ datetime(3);

ALTER TABLE ACT_FO_FORM_INSTANCE MODIFY SUBMITTED_DATE_ datetime(3);

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('4', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 4, '7:fe396622b05965c516c1bedb14789be8', 'modifyDataType columnName=DEPLOY_TIME_, tableName=ACT_FO_FORM_DEPLOYMENT; modifyDataType columnName=SUBMITTED_DATE_, tableName=ACT_FO_FORM_INSTANCE', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992995273');

CREATE UNIQUE INDEX ACT_IDX_FORM_DEF_UNIQ ON ACT_FO_FORM_DEFINITION(KEY_, VERSION_, TENANT_ID_);

INSERT INTO ACT_FO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('5', 'flowable', 'org/flowable/form/db/liquibase/flowable-form-db-changelog.xml', NOW(), 5, '7:80b47424c1d564a692fc8923633f78e4', 'createIndex indexName=ACT_IDX_FORM_DEF_UNIQ, tableName=ACT_FO_FORM_DEFINITION', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992995273');

UPDATE ACT_FO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;


CREATE TABLE ACT_CO_DATABASECHANGELOGLOCK (ID INT NOT NULL, LOCKED BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_ACT_CO_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

DELETE FROM ACT_CO_DATABASECHANGELOGLOCK;

INSERT INTO ACT_CO_DATABASECHANGELOGLOCK (ID, LOCKED) VALUES (1, 0);

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 1, LOCKEDBY = '192.168.10.1 (192.168.10.1)', LOCKGRANTED = '2020-10-06 16:03:15.510' WHERE ID = 1 AND LOCKED = 0;

CREATE TABLE ACT_CO_DATABASECHANGELOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, DESCRIPTION VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

CREATE TABLE ACT_CO_CONTENT_ITEM (ID_ VARCHAR(255) NOT NULL, NAME_ VARCHAR(255) NOT NULL, MIME_TYPE_ VARCHAR(255) NULL, TASK_ID_ VARCHAR(255) NULL, PROC_INST_ID_ VARCHAR(255) NULL, CONTENT_STORE_ID_ VARCHAR(255) NULL, CONTENT_STORE_NAME_ VARCHAR(255) NULL, FIELD_ VARCHAR(400) NULL, CONTENT_AVAILABLE_ BIT(1) DEFAULT 0 NULL, CREATED_ timestamp(6) NULL, CREATED_BY_ VARCHAR(255) NULL, LAST_MODIFIED_ timestamp(6) NULL, LAST_MODIFIED_BY_ VARCHAR(255) NULL, CONTENT_SIZE_ BIGINT DEFAULT 0 NULL, TENANT_ID_ VARCHAR(255) NULL, CONSTRAINT PK_ACT_CO_CONTENT_ITEM PRIMARY KEY (ID_));

CREATE INDEX idx_contitem_taskid ON ACT_CO_CONTENT_ITEM(TASK_ID_);

CREATE INDEX idx_contitem_procid ON ACT_CO_CONTENT_ITEM(PROC_INST_ID_);

INSERT INTO ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1', 'activiti', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', NOW(), 1, '7:a17df43ed0c96adfef5271e1781aaed2', 'createTable tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_taskid, tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_procid, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992995524');

ALTER TABLE ACT_CO_CONTENT_ITEM ADD SCOPE_ID_ VARCHAR(255) NULL, ADD SCOPE_TYPE_ VARCHAR(255) NULL;

CREATE INDEX idx_contitem_scope ON ACT_CO_CONTENT_ITEM(SCOPE_ID_, SCOPE_TYPE_);

INSERT INTO ACT_CO_DATABASECHANGELOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('2', 'flowable', 'org/flowable/content/db/liquibase/flowable-content-db-changelog.xml', NOW(), 2, '7:5aa445d140a638ee432a00c23134dd98', 'addColumn tableName=ACT_CO_CONTENT_ITEM; createIndex indexName=idx_contitem_scope, tableName=ACT_CO_CONTENT_ITEM', '', 'EXECUTED', NULL, NULL, '3.5.3', '1992995524');

UPDATE ACT_CO_DATABASECHANGELOGLOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;
