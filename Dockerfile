FROM ubuntu:16.04
MAINTAINER PhenoMeNal-H2020 Project ( phenomenal-h2020-users@googlegroups.com )

LABEL software.version="1.0"
LABEL version="0.1"
LABEL software="isodyn"

RUN apt-get update && apt-get install -y gfortran make g++ gnuplot git
RUN git clone --depth 1 --single-branch --branch master https://github.com/seliv55/isodyn.git
WORKDIR isodyn
RUN make clean && make
RUN chmod a+x isodyn.out
RUN mv isodyn.out /usr/bin/isodyn

ENTRYPOINT ["isodyn"]
