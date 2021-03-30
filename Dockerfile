ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2021.1-stable
FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

USER root

COPY ece227.yml /tmp

RUN conda env create --file /tmp/ece227.yml

RUN conda run -n ece227 /bin/bash -c "ipython kernel install --name=ece227"

# can't remove base see https://github.com/jupyterhub/jupyterhub/issues/2759
#RUN jupyter kernelspec uninstall base 

RUN jupyter kernelspec uninstall python3_clean

RUN apt-get update && apt-get -qq install -y \
	libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev build-essential pkg-config \
	&& apt-get clean


RUN pip install pycairo

USER $NB_UID
