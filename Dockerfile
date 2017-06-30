FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="1.0"
LABEL version="0.2"
LABEL software="isodyn"

ENV REVISION="af06b346c83232ae6475e595384055b5631db2f7"

RUN apt-get update && apt-get install -y --no-install-recommends gfortran make g++ gnuplot git ca-certificates && \
    git clone --single-branch --branch master https://github.com/seliv55/isodyn.git && \
    git -C isodyn checkout $REVISION && \
    make --directory=isodyn clean && make --directory=isodyn && make --directory=isodyn install && \
    apt-get purge -y git gfortran make g++ ca-certificates && \
    apt-get install -y --no-install-recommends libgfortran3 && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf isodyn

COPY runTest1.sh /usr/local/bin/runTest1.sh
RUN chmod a+x /usr/local/bin/runTest1.sh 

ENTRYPOINT ["isodyn"]
