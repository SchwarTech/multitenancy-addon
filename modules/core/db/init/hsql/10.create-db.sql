-- begin CUBASDBMT_TENANT
create table CUBASDBMT_TENANT (
    ID varchar(36) not null,
    VERSION integer not null,
    CREATE_TS timestamp,
    CREATED_BY varchar(50),
    UPDATE_TS timestamp,
    UPDATED_BY varchar(50),
    DELETE_TS timestamp,
    DELETED_BY varchar(50),
    TENANT_ID varchar(255),
    --
    NAME varchar(255) not null,
    ACCESS_GROUP_ID varchar(36) not null,
    ADMIN_ID varchar(36) not null,
    --
    primary key (ID)
)^
-- end CUBASDBMT_TENANT
-- begin SEC_GROUP
alter table SEC_GROUP add column TENANT_ID varchar(255) ^
alter table SEC_GROUP add column DTYPE varchar(100) ^
update SEC_GROUP set DTYPE = 'cubasdbmt$TenantGroup' where DTYPE is null ^
-- end SEC_GROUP
-- begin SEC_USER
alter table SEC_USER add column TENANT_ID varchar(255) ^
alter table SEC_USER add column DTYPE varchar(100) ^
update SEC_USER set DTYPE = 'cubasdbmt$TenantUser' where DTYPE is null ^
-- end SEC_USER
-- begin SEC_ROLE
alter table SEC_ROLE add column TENANT_ID varchar(255) ^
alter table SEC_ROLE add column DTYPE varchar(100) ^
update SEC_ROLE set DTYPE = 'cubasdbmt$TenantRole' where DTYPE is null ^
-- end SEC_ROLE
