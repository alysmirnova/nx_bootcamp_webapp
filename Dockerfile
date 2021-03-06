FROM ubuntu:18.04 AS generator

WORKDIR .

RUN apt-get update && apt-get install -y wget
RUN wget -O hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_extended_0.83.1_Linux-64bit.deb && \
    apt install ./hugo.deb && \
    rm hugo.deb
    
COPY . .    
RUN hugo -D

FROM nginx:alpine
COPY --from=generator /public /usr/share/nginx/html
