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


insert into ACT_GE_PROPERTY values ('eventsubscription.schema.version', '6.6.0.0', 1);