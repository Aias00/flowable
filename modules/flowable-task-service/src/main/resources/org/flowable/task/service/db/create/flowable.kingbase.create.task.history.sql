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
