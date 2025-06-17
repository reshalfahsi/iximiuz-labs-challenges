# Build stage
FROM node:22-slim AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Runtime stage
FROM node:22-alpine
WORKDIR /app
# Create non-root user
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup
# Copy built files and static assets
COPY --from=builder /app/build ./build
COPY --from=builder /app/static ./static
# Install production dependencies only if needed
COPY package*.json ./
RUN npm ci --omit=dev && \
    npm cache clean --force
# Set ownership and permissions
RUN chown -R appuser:appgroup /app
USER appuser
# Expose port
EXPOSE 3000
# Set environment variables
ENV HOST=0.0.0.0
ENV PORT=3000
# Run the application directly without npm
CMD ["node", "build/index.js"]