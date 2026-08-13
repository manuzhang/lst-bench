#!/bin/bash -e
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 DELTA_VERSION"
    exit 1
fi

source env.sh
if [ -z "${SPARK_HOME}" ]; then
    echo "ERROR: SPARK_HOME is not defined."
    exit 1
fi

DELTA_VERSION=$1

wget -nv -N https://repo1.maven.org/maven2/io/delta/delta-spark_2.12/$DELTA_VERSION/delta-spark_2.12-$DELTA_VERSION.jar
wget -nv -N https://repo1.maven.org/maven2/io/delta/delta-storage/$DELTA_VERSION/delta-storage-$DELTA_VERSION.jar

ln -sf $(pwd)/delta-spark_2.12-$DELTA_VERSION.jar $SPARK_HOME/jars/delta-spark.jar
ln -sf $(pwd)/delta-storage-$DELTA_VERSION.jar $SPARK_HOME/jars/delta-storage.jar
