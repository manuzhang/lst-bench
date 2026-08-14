#!/bin/bash -e
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 HUDI_VERSION"
    exit 1
fi

source env.sh
if [ -z "${SPARK_HOME}" ]; then
    echo "ERROR: SPARK_HOME is not defined."
    exit 1
fi

HUDI_VERSION=$1

wget -nv -N https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark3.5-bundle_2.12/$HUDI_VERSION/hudi-spark3.5-bundle_2.12-$HUDI_VERSION.jar

ln -sf $(pwd)/hudi-spark3.5-bundle_2.12-$HUDI_VERSION.jar $SPARK_HOME/jars/hudi-spark-bundle.jar
