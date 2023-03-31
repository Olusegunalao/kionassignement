FROM golang:latest
RUN mkdir /kionapp
ADD . /kionapp
WORKDIR /kionapp
RUN go build -o main .
CMD ["Home/kionapp/hello"]

EXPOSE 8080