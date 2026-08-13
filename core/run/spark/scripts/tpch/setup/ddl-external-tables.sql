CREATE
    SCHEMA IF NOT EXISTS ${external_catalog}.${external_database};

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.customer;

CREATE
    TABLE
        ${external_catalog}.${external_database}.customer(
            c_custkey BIGINT,
            c_name STRING,
            c_address STRING,
            c_nationkey BIGINT,
            c_phone STRING,
            c_acctbal DECIMAL,
            c_comment STRING,
            c_mktsegment STRING
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}customer/" ${external_options_suffix}
        )
        PARTITIONED BY(c_mktsegment);

ALTER TABLE 
    ${external_catalog}.${external_database}.customer RECOVER PARTITIONS;

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.lineitem;

CREATE
    TABLE
        ${external_catalog}.${external_database}.lineitem(
            l_orderkey BIGINT,
            l_partkey BIGINT,
            l_suppkey BIGINT,
            l_linenumber INT,
            l_quantity DECIMAL,
            l_extendedprice DECIMAL,
            l_discount DECIMAL,
            l_tax DECIMAL,
            l_returnflag STRING,
            l_linestatus STRING,
            l_commitdate DATE,
            l_receiptdate DATE,
            l_shipinstruct STRING,
            l_shipmode STRING,
            l_comment STRING,
            l_shipdate DATE
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}lineitem/" ${external_options_suffix}
        )
        PARTITIONED BY(l_shipdate);

ALTER TABLE 
    ${external_catalog}.${external_database}.lineitem RECOVER PARTITIONS;

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.orders;

CREATE
    TABLE
        ${external_catalog}.${external_database}.orders(
            o_orderkey BIGINT,
            o_custkey BIGINT,
            o_orderstatus STRING,
            o_totalprice DECIMAL,
            o_orderpriority STRING,
            o_clerk STRING,
            o_shippriority INT,
            o_comment STRING,
            o_orderdate DATE
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}orders/" ${external_options_suffix}
        )
        PARTITIONED BY(o_orderdate);

ALTER TABLE 
    ${external_catalog}.${external_database}.orders RECOVER PARTITIONS;

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.nation;

CREATE
    TABLE
        ${external_catalog}.${external_database}.nation(
            n_nationkey BIGINT,
            n_name STRING,
            n_regionkey BIGINT,
            n_comment STRING
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}nation/" ${external_options_suffix}
        );

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.region;

CREATE
    TABLE
        ${external_catalog}.${external_database}.region(
            r_regionkey BIGINT,
            r_name STRING,
            r_comment STRING
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}region/" ${external_options_suffix}
        );

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.part;

CREATE
    TABLE
        ${external_catalog}.${external_database}.part(
            p_partkey BIGINT,
            p_name STRING,
            p_mfgr STRING,
            p_type STRING,
            p_size INT,
            p_container STRING,
            p_retailprice DECIMAL,
            p_comment STRING,
            p_brand STRING
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}part/" ${external_options_suffix}
        )
        PARTITIONED BY(p_brand);

ALTER TABLE 
    ${external_catalog}.${external_database}.part RECOVER PARTITIONS;

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.supplier;

CREATE
    TABLE
        ${external_catalog}.${external_database}.supplier(
            s_suppkey BIGINT,
            s_name STRING,
            s_address STRING,
            s_nationkey BIGINT,
            s_phone STRING,
            s_acctbal DECIMAL,
            s_comment STRING
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}supplier/" ${external_options_suffix}
        );

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.partsupp;

CREATE
    TABLE
        ${external_catalog}.${external_database}.partsupp(
            ps_partkey BIGINT,
            ps_suppkey BIGINT,
            ps_availqty INT,
            ps_supplycost DECIMAL,
            ps_comment STRING
        )
        USING ${external_table_format} OPTIONS(
            PATH = "${external_data_path}partsupp/" ${external_options_suffix}
        );
