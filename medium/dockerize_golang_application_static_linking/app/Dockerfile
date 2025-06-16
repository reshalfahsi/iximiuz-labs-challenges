# Build stage
FROM golang:1.23 AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

# Runtime stage
FROM gcr.io/distroless/static-debian12:nonroot
WORKDIR /app
COPY --from=builder /app/app .
COPY --from=builder /app/templates ./templates
COPY --from=builder /app/static ./static
EXPOSE 3000
USER nonroot
ENTRYPOINT ["./app"]