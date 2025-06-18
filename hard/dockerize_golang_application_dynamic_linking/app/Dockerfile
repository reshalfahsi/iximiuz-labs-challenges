FROM golang:1.23.4 AS builder
WORKDIR /app

COPY --link go.mod go.sum ./
RUN --mount=type=cache,target=/go/pkg/mod \
    go mod download

COPY . .
RUN --mount=type=cache,target=/go/pkg/mod \
    --mount=type=cache,target=/root/.cache/go-build \
    CGO_ENABLED=1 go build -o server main.go

FROM gcr.io/distroless/base-debian12:nonroot
WORKDIR /app

COPY --from=builder /app/server .
COPY templates/ templates/
COPY static/ static/

EXPOSE 3000

CMD ["./server"]