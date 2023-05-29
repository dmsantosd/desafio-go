FROM golang:1.20-alpine3.18 as builder

WORKDIR /app

COPY . .

RUN go mod init main && \
  go build

FROM scratch as exec

WORKDIR /app

COPY --from=builder /app/main .

CMD ["/app/main"]