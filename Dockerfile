FROM python:3.10.14-bookworm

WORKDIR /app

RUN pip install --upgrade pip setuptools wheel
RUN pip install spacy
RUN python -m spacy download en_core_web_md
RUN pip install h5py==3.10.0
RUN pip install rasa

VOLUME [ "/app/parameters", "/app/models" ]

EXPOSE 5005

ENTRYPOINT [ "/bin/bash", "./parameters/run.sh" ]
