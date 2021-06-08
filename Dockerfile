FROM alpine:3.10
WORKDIR /build

ADD packages.txt .
RUN apk add --no-cache $(cat packages.txt | xargs)

ADD build-packages.txt .
ADD requirements.txt .
RUN apk add --no-cache --virtual build-dependencies $(cat build-packages.txt | xargs) \
    && pip3 install -r requirements.txt \
    && apk del build-dependencies

ADD requirements.yml .
RUN ansible-galaxy collection install -r requirements.yml -p /usr/share/ansible/collections

RUN rm -rf /build
WORKDIR /root
