FROM golang:1.19-rc-alpine3.15 AS builder

WORKDIR /app

COPY *.go .

RUN go build -o main main.go


FROM scratch

WORKDIR /

COPY --from=builder /app/main /

ENTRYPOINT ["./main"]