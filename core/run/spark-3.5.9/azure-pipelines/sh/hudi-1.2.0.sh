#!/bin/bash -e
source env.sh
if [ -z "${SPARK_HOME}" ]; then
    echo "ERROR: SPARK_HOME is not defined."
    exit 1
fi

wget -nv -N https://repo1.maven.org/maven2/org/apache/hudi/hudi-spark3.5-bundle_2.12/1.2.0/hudi-spark3.5-bundle_2.12-1.2.0.jar

ln -sf $(pwd)/hudi-spark3.5-bundle_2.12-1.2.0.jar $SPARK_HOME/jars/hudi-spark-bundle.jar
