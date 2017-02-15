FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="1.0"
LABEL version="0.2"
LABEL software="isodyn"

RUN apt-get update && apt-get install -y --no-install-recommends gfortran make g++ gnuplot git ca-certificates && \
    git clone --depth 1 --single-branch --branch master https://github.com/seliv55/isodyn.git && \
    make --directory=isodyn clean && make --directory=isodyn && \
    apt-get purge -y git gfortran make g++ ca-certificates && \
    apt-get install -y --no-install-recommends libgfortran3 && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    chmod a+x isodyn/isodyn.out && mv isodyn/isodyn.out /usr/bin/isodyn && rm -rf isodyn 

ENTRYPOINT ["isodyn"]
