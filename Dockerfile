FROM i386/ubuntu:latest as builder

ARG version=0.3.9.3
ENV nanopbVersion=nanopb-${version}-linux-x86
ENV nanopbFile=${nanopbVersion}.tar.gz

WORKDIR /usr/src/app
RUN apt-get update && apt-get install -y python curl nano bash
RUN curl -O https://jpa.kapsi.fi/nanopb/download/${nanopbFile} && tar -xzf ${nanopbFile}
RUN mkdir generator && cp -a ${nanopbVersion}/. generator

FROM i386/ubuntu:latest as generator

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/generator .

ENTRYPOINT [ "generator-bin/protoc" ]