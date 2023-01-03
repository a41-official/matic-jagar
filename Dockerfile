FROM golang:1.15.15 as builder

RUN apt install git

WORKDIR /matic
RUN git clone https://github.com/a41ventures/matic-jagar.git .
RUN go build -o matic-jager

FROM gcr.io/distroless/static-debian11

COPY --from=builder /matic/matic-jager /bin/matic-jager

