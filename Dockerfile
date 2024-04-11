
FROM scratch as builder
ADD alpine-minirootfs-3.19.1-aarch64.tar /

RUN apk add --no-cache nodejs npm

WORKDIR /app

COPY ./index.js .

COPY package.json .
RUN npm install

#ETAP 2
FROM nginx:alpine
RUN apk add --update nodejs

ARG VERSION
ENV APP_VERSION=${VERSION:-v2.0.0}

COPY --from=builder /app /app

EXPOSE 80

HEALTHCHECK --interval=10s --timeout=1s --start-period=3s CMD curl -f http://localhost:8080/ || exit 1

CMD [ "sh", "-c", "nginx & node /app/index.js"] 
