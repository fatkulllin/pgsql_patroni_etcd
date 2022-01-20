FROM postgres:13

RUN apt-get update -y\ 
    && apt-get install python3 python3-pip nano -y\
    && pip3 install --upgrade setuptools\
    && pip3 install psycopg2-binary \
    && pip3 install patroni[etcd] \
    && mkdir /data/patroni -p \
    && chown postgres:postgres /data/ \
    && chown postgres:postgres /data/patroni \
    && chmod 700 /data/patroni 

COPY cfgDocker.yml /etc/patroni.yml
# USER postgres

# ENTRYPOINT ["patroni", "/etc/patroni.yml"]
ENTRYPOINT ["/bin/bash","-c", "sleep infinity"]