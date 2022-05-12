
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