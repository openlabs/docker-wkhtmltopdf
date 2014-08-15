# Wkhtmltopdf Docker Container

This docker container lets you run wkhtmltopdf in a docker container.

## Building the image

```sh
docker build .
```

## Using the image

```sh
docker run -v <host_dir>:<container_dir> openlabs/docker-wkhtmltopdf http://www.google.com <container_dir>/output.pdf
```

The mounted volume can be used to send local html files and to save
the output.

## Using as a service

If you are planning on using wkhtmltopsd as a service you might also be interested in
a downstream container which implements a HTTP API service that can be used to convert
HTML to PDF.

See:

* [wkhtmltopdf as a service container](https://registry.hub.docker.com/u/openlabs/docker-wkhtmltopdf-aas/)
* [Github Repository](https://github.com/openlabs/docker-wkhtmltopdf-aas/)

## Bugs and questions

The development of the container takes place on 
[Github](https://github.com/openlabs/docker-wkhtmltopdf-aas). If you
have a question or a bug report to file, you can report as a github issue.


## Authors and Contributors

This image was built at [Openlabs](http://www.openlabs.co.in).

## Professional Support

This image is professionally supported by [Openlabs](http://www.openlabs.co.in).
If you are looking for on-site teaching or consulting support, contact our
[sales](mailto:sales@openlabs.co.in) and [support](mailto:support@openlabs.co.in) teams.
