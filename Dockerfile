FROM ubuntu:14.04
MAINTAINER Sharoon Thomas <sharoon.thomas@openlabs.co.in>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install dependencies for wkhtmltopdf
RUN apt-get install -y openssl build-essential xorg libssl-dev libxrender-dev wget xvfb git-core fontconfig

# Install dependencies of QT
RUN apt-get install -y libfontconfig1-dev libfreetype6-dev libx11-dev libxcursor-dev libxext-dev libxfixes-dev libxft-dev libxi-dev libxrandr-dev

# Install QT from git repository
RUN git clone git://gitorious.org/~antialize/qt/antializes-qt.git wkhtmltopdf-qt
WORKDIR /wkhtmltopdf-qt
RUN git checkout 4.8.4
RUN QTDIR=. ./bin/syncqt
RUN ./configure -nomake "tools examples demos docs translations" -opensource -confirm-license -prefix ../wkqt
RUN make -j3 && make install

# Remove clone of QT because it takes a lot of space
WORKDIR /
RUN rm /wkhtmltopdf-qt -rf

# Install wkhtmltopdf 0.12.1 stable
RUN wget http://citylan.dl.sourceforge.net/project/wkhtmltopdf/0.12.1/wkhtmltox-0.12.1_linux-trusty-amd64.deb
RUN dpkg -i wkhtmltox-0.12.1_linux-trusty-amd64.deb
ADD wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf.sh

ENTRYPOINT ["/usr/local/bin/wkhtmltopdf.sh"]

# Show the extended help
CMD ["-h"]
