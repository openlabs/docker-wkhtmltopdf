# Wkhtmltopdf Docker Container

This docker container lets you run wkhtmltopdf in a docker container.

## Building the image

`docker build .`

## Using the image

`docker run -v <host_dir>:<container_dir> http://www.google.com <container_dir>/output.pdf`

The mounted volume can be used to send local html files and to save
the output.
