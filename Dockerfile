FROM continuumio/miniconda3

RUN apt-get update --yes && apt-get install --yes tmux vim less build-essential plantuml tree

COPY environment.yml .
RUN conda env create --file environment.yml
