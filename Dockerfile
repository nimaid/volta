FROM ufoym/deepo:all

WORKDIR /volta
COPY ./volta-files /volta

RUN luarocks install loadcaffe