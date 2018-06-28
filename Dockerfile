FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="1.0"
LABEL version="0.2"
LABEL software="isodyn"

ENV REVISION="af558454a1c3b56c6e7595dab5ef828ea93c1665"

RUN apt-get update && apt-get install -y --no-install-recommends gfortran make g++ gnuplot git unzip ca-certificates && \
    git clone --single-branch --branch develop https://github.com/seliv55/isodyn.git && \
    git -C isodyn checkout $REVISION && \
    make --directory=isodyn clean && make --directory=isodyn && make --directory=isodyn install && \
    apt-get purge -y git gfortran make g++ ca-certificates && \
    apt-get install -y --no-install-recommends libgfortran3 && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -rf isodyn

COPY runTest1.sh /usr/local/bin/runTest1.sh
COPY dokiso.sh /usr/local/bin/dokiso.sh
RUN chmod a+x /usr/local/bin/runTest1.sh 
RUN chmod a+x /usr/local/bin/dokiso.sh 

ENTRYPOINT ["isodyn"]
