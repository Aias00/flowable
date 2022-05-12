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
CREATE INDEX ACT_IDX_HI_PRO_INST_END ON ACT_HI_PROCINST (END_TIME_);
CREATE INDEX ACT_IDX_HI_PRO_I_BUSKEY ON ACT_HI_PROCINST (BUSINESS_KEY_);
CREATE UNIQUE INDEX PROC_INST_ID_ ON ACT_HI_PROCINST (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_END ON ACT_HI_ACTINST (END_TIME_);
CREATE INDEX ACT_IDX_HI_ACT_INST_EXEC ON ACT_HI_ACTINST (EXECUTION_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_PROCINST ON ACT_HI_ACTINST (PROC_INST_ID_,ACT_ID_);
CREATE INDEX ACT_IDX_HI_ACT_INST_START ON ACT_HI_ACTINST (START_TIME_);
CREATE INDEX ACT_IDX_HI_DETAIL_ACT_INST ON ACT_HI_DETAIL (ACT_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_NAME ON ACT_HI_DETAIL (NAME_);
CREATE INDEX ACT_IDX_HI_DETAIL_PROC_INST ON ACT_HI_DETAIL (PROC_INST_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TASK_ID ON ACT_HI_DETAIL (TASK_ID_);
CREATE INDEX ACT_IDX_HI_DETAIL_TIME ON ACT_HI_DETAIL (TIME_);

-- create index ACT_IDX_HI_PRO_INST_END on ACT_HI_PROCINST(END_TIME_);
-- create index ACT_IDX_HI_PRO_I_BUSKEY on ACT_HI_PROCINST(BUSINESS_KEY_);
-- create index ACT_IDX_HI_ACT_INST_START on ACT_HI_ACTINST(START_TIME_);
-- create index ACT_IDX_HI_ACT_INST_END on ACT_HI_ACTINST(END_TIME_);
-- create index ACT_IDX_HI_DETAIL_PROC_INST on ACT_HI_DETAIL(PROC_INST_ID_);
-- create index ACT_IDX_HI_DETAIL_ACT_INST on ACT_HI_DETAIL(ACT_INST_ID_);
-- create index ACT_IDX_HI_DETAIL_TIME on ACT_HI_DETAIL(TIME_);
-- create index ACT_IDX_HI_DETAIL_NAME on ACT_HI_DETAIL(NAME_);
-- create index ACT_IDX_HI_DETAIL_TASK_ID on ACT_HI_DETAIL(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_PROC_INST on ACT_HI_VARINST(PROC_INST_ID_);
create index ACT_IDX_HI_PROCVAR_TASK_ID on ACT_HI_VARINST(TASK_ID_);
create index ACT_IDX_HI_PROCVAR_EXE on ACT_HI_VARINST(EXECUTION_ID_);
-- create index ACT_IDX_HI_ACT_INST_PROCINST on ACT_HI_ACTINST(PROC_INST_ID_, ACT_ID_);
-- create index ACT_IDX_HI_ACT_INST_EXEC on ACT_HI_ACTINST(EXECUTION_ID_, ACT_ID_);
create index ACT_IDX_HI_IDENT_LNK_TASK on ACT_HI_IDENTITYLINK(TASK_ID_);
create index ACT_IDX_HI_IDENT_LNK_PROCINST on ACT_HI_IDENTITYLINK(PROC_INST_ID_);
create index ACT_IDX_HI_TASK_INST_PROCINST on ACT_HI_TASKINST(PROC_INST_ID_);
