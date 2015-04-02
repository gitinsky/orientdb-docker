#
# OrientDB Dockerfile
#
# based on:
#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM dockerfile/java:oracle-java8

ENV ODB_PKG_NAME orientdb-community-2.0.6

# Install Elasticsearch.
RUN \
  cd / && \
  wget "http://www.orientechnologies.com/download.php?email=unknown@unknown.com&file=${ODB_PKG_NAME}.tar.gz&os=linux" && \
  tar xvzf $ODB_PKG_NAME.tar.gz && \
  rm -f $ODB_PKG_NAME.tar.gz && \
  mv /$ODB_PKG_NAME /orientdb

ADD bin/orientdb-automem /orientdb/bin/orientdb-automem

CMD ["/orientdb/bin/orientdb-automem"]

EXPOSE 2424
EXPOSE 2480
EXPOSE 2434