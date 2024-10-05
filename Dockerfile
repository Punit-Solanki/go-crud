FROM golang:1.20-alpine as builder
WORKDIR /app

COPY main.go .

RUN go build -o go-app main.go

FROM alpine:latest
WORKDIR /app

COPY --from=builder /app/go-app .

EXPOSE 6969

CMD ["./go-app"]
