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
CREATE INDEX ACT_IDX_IDENT_LNK_GROUP ON ACT_RU_IDENTITYLINK (GROUP_ID_);
CREATE INDEX ACT_IDX_IDENT_LNK_SCOPE ON ACT_RU_IDENTITYLINK (SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_IDENT_LNK_SCOPE_DEF ON ACT_RU_IDENTITYLINK (SCOPE_DEFINITION_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_IDENT_LNK_SUB_SCOPE ON ACT_RU_IDENTITYLINK (SUB_SCOPE_ID_,SCOPE_TYPE_);
CREATE INDEX ACT_IDX_IDENT_LNK_USER ON ACT_RU_IDENTITYLINK (USER_ID_);

insert into ACT_GE_PROPERTY values ('identitylink.schema.version', '6.6.0.0', 1);