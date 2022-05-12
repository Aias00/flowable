CREATE TABLE ACT_GE_PROPERTY (
                                 NAME_ VARCHAR(64) NOT NULL,
                                 VALUE_ VARCHAR(300),
                                 REV_ INT4
);

CREATE TABLE ACT_GE_BYTEARRAY (
                                  ID_ VARCHAR(64) NOT NULL,
                                  REV_ INT4,
                                  NAME_ VARCHAR(255),
                                  DEPLOYMENT_ID_ VARCHAR(64),
                                  BYTES_ BLOB,
                                  GENERATED_ TINYINT
);

insert into ACT_GE_PROPERTY
values ('common.schema.version', '6.6.0.0', 1);

insert into ACT_GE_PROPERTY
values ('next.dbid', '1', 1);
