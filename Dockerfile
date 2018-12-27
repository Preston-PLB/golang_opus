# Choose any golang image, just make sure it doesn't have -onbuild
FROM golang:1.11.4

RUN apt-get update && apt-get -y install apt-utils libopus-dev libopusfile-dev

# Everything below is copied manually from the official -onbuild image,
# with the ONBUILD keywords removed.

RUN mkdir -p /go/src/app
WORKDIR /go/src/app

CMD ["go-wrapper", "run"]
COPY . /go/src/app
RUN go-wrapper download
RUN go-wrapper install