ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2019.4.1
FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

USER root

RUN pip install networkx rpy2 igraph powerlaw numpy scipy

USER $NB_UID
