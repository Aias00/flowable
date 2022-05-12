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
--
-- create index ACT_IDX_TIMER_JOB_EXCEPTION_STACK_ID on ACT_RU_TIMER_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_TIMER_JOB_CUSTOM_VALUES_ID on ACT_RU_TIMER_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_TIMER_JOB_CORRELATION_ID on ACT_RU_TIMER_JOB(CORRELATION_ID_);

-- create index ACT_IDX_SUSPENDED_JOB_EXCEPTION_STACK_ID on ACT_RU_SUSPENDED_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_SUSPENDED_JOB_CUSTOM_VALUES_ID on ACT_RU_SUSPENDED_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_SUSPENDED_JOB_CORRELATION_ID on ACT_RU_SUSPENDED_JOB(CORRELATION_ID_);
--
-- create index ACT_IDX_DEADLETTER_JOB_EXCEPTION_STACK_ID on ACT_RU_DEADLETTER_JOB(EXCEPTION_STACK_ID_);
-- create index ACT_IDX_DEADLETTER_JOB_CUSTOM_VALUES_ID on ACT_RU_DEADLETTER_JOB(CUSTOM_VALUES_ID_);
-- create index ACT_IDX_DEADLETTER_JOB_CORRELATION_ID on ACT_RU_DEADLETTER_JOB(CORRELATION_ID_);

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

-- create index ACT_IDX_JOB_SCOPE on ACT_RU_JOB(SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_JOB_SUB_SCOPE on ACT_RU_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_JOB_SCOPE_DEF on ACT_RU_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);
--
-- create index ACT_IDX_TJOB_SCOPE on ACT_RU_TIMER_JOB(SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_TJOB_SUB_SCOPE on ACT_RU_TIMER_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_TJOB_SCOPE_DEF on ACT_RU_TIMER_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);
--
-- create index ACT_IDX_SJOB_SCOPE on ACT_RU_SUSPENDED_JOB(SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_SJOB_SUB_SCOPE on ACT_RU_SUSPENDED_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_SJOB_SCOPE_DEF on ACT_RU_SUSPENDED_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);
--
-- create index ACT_IDX_DJOB_SCOPE on ACT_RU_DEADLETTER_JOB(SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_DJOB_SUB_SCOPE on ACT_RU_DEADLETTER_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_DJOB_SCOPE_DEF on ACT_RU_DEADLETTER_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);
--
-- create index ACT_IDX_EJOB_SCOPE on ACT_RU_EXTERNAL_JOB(SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_EJOB_SUB_SCOPE on ACT_RU_EXTERNAL_JOB(SUB_SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_EJOB_SCOPE_DEF on ACT_RU_EXTERNAL_JOB(SCOPE_DEFINITION_ID_, SCOPE_TYPE_);

insert into ACT_GE_PROPERTY values ('job.schema.version', '6.6.0.0', 1);
