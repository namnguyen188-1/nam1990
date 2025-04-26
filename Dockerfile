FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    gcc make wget && \
    wget https://github.com/z3APA3A/3proxy/archive/0.9.4.tar.gz && \
    tar xzf 0.9.4.tar.gz && \
    cd 3proxy-0.9.4 && \
    make -f Makefile.Linux && \
    mkdir -p /usr/local/3proxy/bin && \
    cp src/3proxy /usr/local/3proxy/bin/ && \
    cd .. && \
    rm -rf 3proxy-0.9.4 0.9.4.tar.gz

COPY 3proxy.cfg /usr/local/3proxy/bin/3proxy.cfg

EXPOSE 2001-2005

CMD ["/usr/local/3proxy/bin/3proxy", "/usr/local/3proxy/bin/3proxy.cfg"]
