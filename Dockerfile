# syntax=docker/dockerfile:1.2

FROM alpine/git as clone
WORKDIR /tmp
RUN apk add --no-cache openssh-client
RUN mkdir -p /root/.ssh

RUN --mount=type=secret,id=ssh,dst=/root/.ssh/id_ed25519

# RUN eval "$(ssh-agent -s)"
# RUN ssh-add ~/.ssh/id_ed25519

 RUN git clone git@github.com:BartoszSkowyra22/pawcho6.git

# Etap 1 - Budowanie obrazu opartego o scratch
FROM scratch as builder
WORKDIR /

COPY --from=clone /app/alpine-minirootfs-3.19.1-aarch64.tar /tmp/
RUN tar -xf /tmp/alpine-minirootfs-3.19.1-aarch64.tar

COPY --from=clone /app /app
RUN /bin/apk add --no-cache nodejs npm
RUN npm install

ARG VERSION
ENV APP_VERSION=${VERSION:-v2.0.0}

EXPOSE 8080

HEALTHCHECK --interval=10s --timeout=1s --start-period=3s CMD curl -f http://localhost:8080/ || exit 1

CMD [ "sh", "-c", "nginx & node /app/index.js"]


