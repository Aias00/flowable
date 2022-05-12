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
