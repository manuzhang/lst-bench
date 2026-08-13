CREATE
    SCHEMA IF NOT EXISTS ${external_catalog}.${external_database};

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.s_orders_${stream_num};

CREATE
    TABLE
        ${external_catalog}.${external_database}.s_orders_${stream_num}(
            orde_orderkey BIGINT,
            orde_custkey BIGINT,
            orde_orderstatus STRING,
            orde_totalprice DECIMAL,
            orde_orderdate DATE,
            orde_orderpriority STRING,
            orde_clerk STRING,
            orde_shippriority INT,
            orde_comment STRING
        )
        USING csv OPTIONS(
            PATH = "${external_data_path}${stream_num}/s_orders/",
            sep = "|",
            header = "false",
            emptyValue = "",
            charset = "iso-8859-1",
            dateFormat = "yyyy-MM-dd",
            timestampFormat = "yyyy-MM-dd HH:mm:ss[.SSS]",
            mode = "PERMISSIVE",
            multiLine = "false",
            locale = "en-US",
            lineSep = "\n"
        );

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.s_lineitem_${stream_num};

CREATE
    TABLE
        ${external_catalog}.${external_database}.s_lineitem_${stream_num}(
            liit_orderkey BIGINT,
            liit_partkey BIGINT,
            liit_suppkey BIGINT,
            liit_linenumber INT,
            liit_quantity DECIMAL,
            liit_extendedprice DECIMAL,
            liit_discount DECIMAL,
            liit_tax DECIMAL,
            liit_returnflag STRING,
            liit_linestatus STRING,
            liit_shipdate DATE,
            liit_commitdate DATE,
            liit_receiptdate DATE,
            liit_shipinstruct STRING,
            liit_shipmode STRING,
            liit_comment STRING
        )
        USING csv OPTIONS(
            PATH = "${external_data_path}${stream_num}/s_lineitem/",
            sep = "|",
            header = "false",
            emptyValue = "",
            charset = "iso-8859-1",
            dateFormat = "yyyy-MM-dd",
            timestampFormat = "yyyy-MM-dd HH:mm:ss[.SSS]",
            mode = "PERMISSIVE",
            multiLine = "false",
            locale = "en-US",
            lineSep = "\n"
        );

DROP
    TABLE
        IF EXISTS ${external_catalog}.${external_database}.s_delete_${stream_num};

CREATE
    TABLE
        ${external_catalog}.${external_database}.s_delete_${stream_num}(
            dele_key BIGINT
        )
        USING csv OPTIONS(
            PATH = "${external_data_path}${stream_num}/s_delete/",
            sep = "|",
            header = "false",
            emptyValue = "",
            charset = "iso-8859-1",
            dateFormat = "yyyy-MM-dd",
            timestampFormat = "yyyy-MM-dd HH:mm:ss[.SSS]",
            mode = "PERMISSIVE",
            multiLine = "false",
            locale = "en-US",
            lineSep = "\n"
        );
