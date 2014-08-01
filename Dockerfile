FROM ubuntu:14.04
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Download and install wkhtmltopdf
RUN apt-get install -y build-essential xorg libssl-dev libxrender-dev wget
RUN wget http://wkhtmltopdf.googlecode.com/files/wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
RUN tar xvjf wkhtmltopdf-0.11.0_rc1-static-amd64.tar.bz2
RUN install wkhtmltopdf-amd64 /usr/bin/wkhtmltopdf

ENTRYPOINT ["/usr/bin/wkhtmltopdf"]

# Show the extended help
CMD ["-h"]
