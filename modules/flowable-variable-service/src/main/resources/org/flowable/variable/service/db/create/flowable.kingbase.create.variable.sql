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

-- create index ACT_IDX_RU_VAR_SCOPE_ID_TYPE on ACT_RU_VARIABLE(SCOPE_ID_, SCOPE_TYPE_);
-- create index ACT_IDX_RU_VAR_SUB_ID_TYPE on ACT_RU_VARIABLE(SUB_SCOPE_ID_, SCOPE_TYPE_);

create index ACT_IDX_VAR_BYTEARRAY on ACT_RU_VARIABLE(BYTEARRAY_ID_);
alter table ACT_RU_VARIABLE 
    add constraint ACT_FK_VAR_BYTEARRAY 
    foreign key (BYTEARRAY_ID_) 
    references ACT_GE_BYTEARRAY (ID_);

insert into ACT_GE_PROPERTY values ('variable.schema.version', '6.6.0.0', 1);
