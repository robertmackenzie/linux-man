FROM ubuntu
LABEL Description="This image is used to get the linux manual non-linux environments."

RUN apt-get update && apt-get install -y curl build-essential groff less
RUN curl https://www.kernel.org/pub/linux/utils/man/man-1.5p.tar.gz > /tmp/man-1.5p.tar.gz
RUN tar -C /tmp -xzf /tmp/man-1.5p.tar.gz
RUN cd /tmp/man-1.5p && ./configure -default && make && make install
RUN apt-get remove -y curl build-essential && apt autoremove -y && rm -rf /tmp/*

ENV PAGER=/usr/bin/less

ENTRYPOINT ["man"]
CMD ["man"]
