FROM docker:latest

WORKDIR /usr/src/app

COPY script.sh .

ENTRYPOINT ["/script.sh"]