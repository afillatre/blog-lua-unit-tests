FROM openresty/openresty:1.15.8.2-5-buster as prod
MAINTAINER Alexandre FILLATRE <afillatre@ippon.fr>

FROM prod as test
RUN apt-get update && \
    apt-get install -y luarocks openresty-resty && \
    luarocks install busted

WORKDIR /data
ENTRYPOINT ["busted"]
