# docker_nanopb
Dockerized nanopb generator. 


This docker file provides the [nanopb generator](https://github.com/nanopb/nanopb)  in a docker image.
## Usage
The image exposes the `generator-bin/protoc` script to the entrypoint of the docker image. 
To generate the `.c` and `.h` file run in a shell:


```bash
docker pull christianmurschall/nanopbgenerator
docker run --rm \
 -v /path/to/protofiles:/usr/src/app/protofiles \
 -v /path/to/outFiles:/usr/src/app/outFiles \
 christianmurschall/nanopbgenerator \
 -I=Schemas --nanopb_out=outFiles protofiles/protofile.proto
```
where `protofiles` points to a volume with your protofile and `outFiles`  points to a volume where you want your generated code.

Since the nanopb developers where so smart to write their generator as a plugin, you can also generate other languages from your proto files with the syntax of the `protoc` compiler. 

## Build instruction
Set the `version` argument to the nanobp release version and build with:

```bash
docker build --build-arg version=0.3.9.3 -t christianmurschall/nanopbgenerator:3.9.3  -t christianmurschall/nanopbgenerator:latest .
```