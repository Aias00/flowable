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