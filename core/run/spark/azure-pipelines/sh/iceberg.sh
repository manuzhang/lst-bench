#!/bin/bash -e
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 ICEBERG_VERSION"
    exit 1
fi

source env.sh
if [ -z "${SPARK_HOME}" ]; then
    echo "ERROR: SPARK_HOME is not defined."
    exit 1
fi

ICEBERG_VERSION=$1

wget -nv -N https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/$ICEBERG_VERSION/iceberg-spark-runtime-3.5_2.12-$ICEBERG_VERSION.jar

ln -sf $(pwd)/iceberg-spark-runtime-3.5_2.12-$ICEBERG_VERSION.jar $SPARK_HOME/jars/iceberg-spark-runtime.jar
