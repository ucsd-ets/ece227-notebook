ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2019.4.5
FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

USER root

RUN pip install networkx rpy2==3.1.0 python-igraph powerlaw numpy scipy python-louvain

USER $NB_UID
