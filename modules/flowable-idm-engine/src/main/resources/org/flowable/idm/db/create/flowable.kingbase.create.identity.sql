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
-- CREATE INDEX ACT_FK_PRIV_MAPPING ON ACT_ID_PRIV_MAPPING (PRIV_ID_);
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

-- alter table ACT_ID_PRIV
--     add constraint ACT_UNIQ_PRIV_NAME
--     unique (NAME_);
