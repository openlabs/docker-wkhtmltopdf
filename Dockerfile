FROM ubuntu:14.04
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
                                   apt-get upgrade -y

# Download and install wkhtmltopdf
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install wget xz-utils libxrender1 libfontconfig1 libxext6
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN tar xf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN cp -R wkhtmltox/* /usr/local

# Cleanup
RUN rm -rf wkhtmltox wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
RUN DEBIAN_FRONTEND=noninteractive apt-get -y remove wget xz-utils && \
                                   apt-get -y autoremove && \
                                   apt-get -y clean

ENTRYPOINT ["wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
