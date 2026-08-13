#!/bin/bash -e
source env.sh
if [ -z "${SPARK_HOME}" ]; then
    echo "ERROR: SPARK_HOME is not defined."
    exit 1
fi

wget -nv -N https://repo1.maven.org/maven2/io/delta/delta-spark_2.12/3.3.3/delta-spark_2.12-3.3.3.jar
wget -nv -N https://repo1.maven.org/maven2/io/delta/delta-storage/3.3.3/delta-storage-3.3.3.jar

ln -sf $(pwd)/delta-spark_2.12-3.3.3.jar $SPARK_HOME/jars/delta-spark.jar
ln -sf $(pwd)/delta-storage-3.3.3.jar $SPARK_HOME/jars/delta-storage.jar
