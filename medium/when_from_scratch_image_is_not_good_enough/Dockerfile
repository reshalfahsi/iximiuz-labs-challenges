# Use a distroless image that provides just enough runtime
FROM gcr.io/distroless/static-debian12

# Copy the pre-compiled server binary from your build context
# Ensure the 'server' binary is in the same directory as this Dockerfile
COPY server /server

# Expose the port the application listens on
EXPOSE 8080

# Set the entrypoint to run the server binary
ENTRYPOINT ["/server"]