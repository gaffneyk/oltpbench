USE dibs;

DROP PROCEDURE IF EXISTS seats.DELETE_RESERVATION;
DROP PROCEDURE IF EXISTS seats.FIND_FLIGHTS;
DROP PROCEDURE IF EXISTS seats.FIND_OPEN_SEATS;
DROP PROCEDURE IF EXISTS seats.NEW_RESERVATION;
DROP PROCEDURE IF EXISTS seats.UPDATE_CUSTOMER;
DROP PROCEDURE IF EXISTS seats.UPDATE_RESERVATION;

DROP TABLE IF EXISTS seats.RESERVATION;
DROP TABLE IF EXISTS seats.FLIGHT;
DROP TABLE IF EXISTS seats.FREQUENT_FLYER;
DROP TABLE IF EXISTS seats.CUSTOMER;
DROP TABLE IF EXISTS seats.AIRLINE;
DROP TABLE IF EXISTS seats.AIRPORT_DISTANCE;
DROP TABLE IF EXISTS seats.AIRPORT;
DROP TABLE IF EXISTS seats.COUNTRY;

CREATE TABLE seats.COUNTRY (
    CO_ID        BIGINT NOT NULL,
    CO_NAME      VARCHAR(64) NOT NULL,
    CO_CODE_2    VARCHAR(2) NOT NULL,
    CO_CODE_3    VARCHAR(3) NOT NULL,
    PRIMARY KEY NONCLUSTERED (CO_ID)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

CREATE TABLE seats.AIRPORT (
    AP_ID          BIGINT NOT NULL,
    AP_CODE        VARCHAR(3) NOT NULL,
    AP_NAME        VARCHAR(128) NOT NULL,
    AP_CITY        VARCHAR(64) NOT NULL,
    AP_POSTAL_CODE VARCHAR(12),
    AP_CO_ID       BIGINT NOT NULL REFERENCES seats.COUNTRY (CO_ID),
    AP_LONGITUDE   FLOAT,
    AP_LATITUDE    FLOAT,
    AP_GMT_OFFSET  FLOAT,
    AP_WAC         BIGINT,
    AP_IATTR00     BIGINT,
    AP_IATTR01     BIGINT,
    AP_IATTR02     BIGINT,
    AP_IATTR03     BIGINT,
    AP_IATTR04     BIGINT,
    AP_IATTR05     BIGINT,
    AP_IATTR06     BIGINT,
    AP_IATTR07     BIGINT,
    AP_IATTR08     BIGINT,
    AP_IATTR09     BIGINT,
    AP_IATTR10     BIGINT,
    AP_IATTR11     BIGINT,
    AP_IATTR12     BIGINT,
    AP_IATTR13     BIGINT,
    AP_IATTR14     BIGINT,
    AP_IATTR15     BIGINT,
    PRIMARY KEY NONCLUSTERED (AP_ID)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

CREATE TABLE seats.AIRPORT_DISTANCE (
    D_AP_ID0       BIGINT NOT NULL REFERENCES seats.AIRPORT (AP_ID),
    D_AP_ID1       BIGINT NOT NULL REFERENCES seats.AIRPORT (AP_ID),
    D_DISTANCE     FLOAT NOT NULL,
    PRIMARY KEY (D_AP_ID0, D_AP_ID1)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

CREATE TABLE seats.AIRLINE (
    AL_ID          BIGINT NOT NULL,
    AL_IATA_CODE   VARCHAR(3),
    AL_ICAO_CODE   VARCHAR(3),
    AL_CALL_SIGN   VARCHAR(32),
    AL_NAME        VARCHAR(128) NOT NULL,
    AL_CO_ID       BIGINT NOT NULL REFERENCES seats.COUNTRY (CO_ID),
    AL_IATTR00     BIGINT,
    AL_IATTR01     BIGINT,
    AL_IATTR02     BIGINT,
    AL_IATTR03     BIGINT,
    AL_IATTR04     BIGINT,
    AL_IATTR05     BIGINT,
    AL_IATTR06     BIGINT,
    AL_IATTR07     BIGINT,
    AL_IATTR08     BIGINT,
    AL_IATTR09     BIGINT,
    AL_IATTR10     BIGINT,
    AL_IATTR11     BIGINT,
    AL_IATTR12     BIGINT,
    AL_IATTR13     BIGINT,
    AL_IATTR14     BIGINT,
    AL_IATTR15     BIGINT,
    PRIMARY KEY NONCLUSTERED (AL_ID)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

CREATE TABLE seats.CUSTOMER (
    C_ID           BIGINT NOT NULL,
    C_ID_STR       VARCHAR(64) UNIQUE NOT NULL,
    C_BASE_AP_ID   BIGINT REFERENCES seats.AIRPORT (AP_ID),
    C_BALANCE      FLOAT NOT NULL,
    C_SATTR00      VARCHAR(32),
    C_SATTR01      VARCHAR(8),
    C_SATTR02      VARCHAR(8),
    C_SATTR03      VARCHAR(8),
    C_SATTR04      VARCHAR(8),
    C_SATTR05      VARCHAR(8),
    C_SATTR06      VARCHAR(8),
    C_SATTR07      VARCHAR(8),
    C_SATTR08      VARCHAR(8),
    C_SATTR09      VARCHAR(8),
    C_SATTR10      VARCHAR(8),
    C_SATTR11      VARCHAR(8),
    C_SATTR12      VARCHAR(8),
    C_SATTR13      VARCHAR(8),
    C_SATTR14      VARCHAR(8),
    C_SATTR15      VARCHAR(8),
    C_SATTR16      VARCHAR(8),
    C_SATTR17      VARCHAR(8),
    C_SATTR18      VARCHAR(8),
    C_SATTR19      VARCHAR(8),
    C_IATTR00      BIGINT,
    C_IATTR01      BIGINT,
    C_IATTR02      BIGINT,
    C_IATTR03      BIGINT,
    C_IATTR04      BIGINT,
    C_IATTR05      BIGINT,
    C_IATTR06      BIGINT,
    C_IATTR07      BIGINT,
    C_IATTR08      BIGINT,
    C_IATTR09      BIGINT,
    C_IATTR10      BIGINT,
    C_IATTR11      BIGINT,
    C_IATTR12      BIGINT,
    C_IATTR13      BIGINT,
    C_IATTR14      BIGINT,
    C_IATTR15      BIGINT,
    C_IATTR16      BIGINT,
    C_IATTR17      BIGINT,
    C_IATTR18      BIGINT,
    C_IATTR19      BIGINT,
    PRIMARY KEY NONCLUSTERED (C_ID)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

CREATE TABLE seats.FREQUENT_FLYER (
    FF_C_ID        BIGINT NOT NULL REFERENCES seats.CUSTOMER (C_ID),
    FF_AL_ID       BIGINT NOT NULL REFERENCES seats.AIRLINE (AL_ID),
    FF_C_ID_STR    VARCHAR(64) NOT NULL,
    FF_SATTR00     VARCHAR(32),
    FF_SATTR01     VARCHAR(32),
    FF_SATTR02     VARCHAR(32),
    FF_SATTR03     VARCHAR(32),
    FF_IATTR00     BIGINT,
    FF_IATTR01     BIGINT,
    FF_IATTR02     BIGINT,
    FF_IATTR03     BIGINT,
    FF_IATTR04     BIGINT,
    FF_IATTR05     BIGINT,
    FF_IATTR06     BIGINT,
    FF_IATTR07     BIGINT,
    FF_IATTR08     BIGINT,
    FF_IATTR09     BIGINT,
    FF_IATTR10     BIGINT,
    FF_IATTR11     BIGINT,
    FF_IATTR12     BIGINT,
    FF_IATTR13     BIGINT,
    FF_IATTR14     BIGINT,
    FF_IATTR15     BIGINT,
   PRIMARY KEY NONCLUSTERED (FF_C_ID, FF_AL_ID)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

CREATE INDEX IDX_FF_CUSTOMER_ID ON FREQUENT_FLYER (FF_C_ID_STR);

CREATE TABLE seats.FLIGHT (
    F_ID            BIGINT NOT NULL,
    F_AL_ID         BIGINT NOT NULL REFERENCES seats.AIRLINE (AL_ID),
    F_DEPART_AP_ID  BIGINT NOT NULL REFERENCES seats.AIRPORT (AP_ID),
    F_DEPART_TIME   DATETIME NOT NULL,
    F_ARRIVE_AP_ID  BIGINT NOT NULL REFERENCES seats.AIRPORT (AP_ID),
    F_ARRIVE_TIME   DATETIME NOT NULL,
    F_STATUS        BIGINT NOT NULL,
    F_BASE_PRICE    FLOAT NOT NULL,
    F_SEATS_TOTAL   BIGINT NOT NULL,
    F_SEATS_LEFT    BIGINT NOT NULL,
    F_IATTR00       BIGINT,
    F_IATTR01       BIGINT,
    F_IATTR02       BIGINT,
    F_IATTR03       BIGINT,
    F_IATTR04       BIGINT,
    F_IATTR05       BIGINT,
    F_IATTR06       BIGINT,
    F_IATTR07       BIGINT,
    F_IATTR08       BIGINT,
    F_IATTR09       BIGINT,
    F_IATTR10       BIGINT,
    F_IATTR11       BIGINT,
    F_IATTR12       BIGINT,
    F_IATTR13       BIGINT,
    F_IATTR14       BIGINT,
    F_IATTR15       BIGINT,
    F_IATTR16       BIGINT,
    F_IATTR17       BIGINT,
    F_IATTR18       BIGINT,
    F_IATTR19       BIGINT,
    F_IATTR20       BIGINT,
    F_IATTR21       BIGINT,
    F_IATTR22       BIGINT,
    F_IATTR23       BIGINT,
    F_IATTR24       BIGINT,
    F_IATTR25       BIGINT,
    F_IATTR26       BIGINT,
    F_IATTR27       BIGINT,
    F_IATTR28       BIGINT,
    F_IATTR29       BIGINT,
    PRIMARY KEY NONCLUSTERED (F_ID)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);

CREATE INDEX F_DEPART_TIME_IDX ON FLIGHT (F_DEPART_TIME);

CREATE TABLE seats.RESERVATION (
    R_ID            BIGINT NOT NULL,
    R_C_ID          BIGINT NOT NULL REFERENCES seats.CUSTOMER (C_ID),
    R_F_ID          BIGINT NOT NULL REFERENCES seats.FLIGHT (F_ID),
    R_SEAT          BIGINT NOT NULL,
    R_PRICE         FLOAT NOT NULL,
    R_IATTR00       BIGINT,
    R_IATTR01       BIGINT,
    R_IATTR02       BIGINT,
    R_IATTR03       BIGINT,
    R_IATTR04       BIGINT,
    R_IATTR05       BIGINT,
    R_IATTR06       BIGINT,
    R_IATTR07       BIGINT,
    R_IATTR08       BIGINT,
    UNIQUE (R_F_ID, R_SEAT),
    PRIMARY KEY NONCLUSTERED (R_ID, R_C_ID, R_F_ID)
) WITH (MEMORY_OPTIMIZED = ON, DURABILITY = SCHEMA_ONLY);
