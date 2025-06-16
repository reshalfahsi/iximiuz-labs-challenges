# --- Build Stage ---
# Use a full Node.js image for building, using the active LTS version.
# Check https://hub.docker.com/_/node for the current LTS version (e.g., 22)
FROM node:22-slim AS builder

# Set the working directory for the build stage
WORKDIR /app

# Copy package.json and package-lock.json first to leverage Docker's build cache
COPY package.json package-lock.json ./

# Install production and dev dependencies
# Next.js build often needs dev dependencies for tools like TypeScript, Babel, etc.
RUN npm ci

# Copy the rest of the application source code
COPY . .

# Build the Next.js application for standalone output
# This command creates the .next/standalone and .next/static directories
RUN npm run build

# --- Production Stage ---
# Use a production-optimized Node.js base image (LTS version, slim for smaller size)
FROM node:22-slim AS runner

# Create a non-root user and group
# Define UID and GID for the non-root user for better control and consistency
# ARG UID=1000
# ARG GID=1000
# RUN addgroup --gid $GID nodejs && adduser --system --uid $UID --ingroup nodejs nodejs

# Set environment variables for Next.js production mode
ENV NODE_ENV production
ENV PORT 3000

# Copy the standalone build output from the builder stage
# The `standalone` directory contains everything needed to run the app
COPY --from=builder --chown=nodejs:nodejs /app/.next/standalone /app/.next/standalone
COPY --from=builder --chown=nodejs:nodejs /app/.next/static /app/.next/static
COPY --from=builder --chown=nodejs:nodejs /app/public /app/public

# Set the working directory for the runner stage
WORKDIR /app/.next/standalone

# Change ownership of the entire application directory to the non-root user
# RUN chown -R nodejs:nodejs /app

# Switch to the non-root user
# USER nodejs

# Expose the port the application will listen on
EXPOSE 3000

# Command to run the Next.js application
# The `index.js` is the entrypoint for standalone Next.js builds
ENTRYPOINT ["node", "pages/index.js"]

############# Original Dockerfile

# FROM node:22 AS base                                                             
# WORKDIR /app                                                                     
                                                                                  
# COPY . .                                                                         
# RUN npm ci                                                                       
# RUN npm run build                                                                
                                                                                 
# WORKDIR /app/.next/standalone                                                    
                                                                                 
# RUN mv /app/public .                                                             
# RUN mv /app/.next/static .next                                                   
                                                                                 
# ENV NODE_ENV=production                                                          
                                                                                 
# ENV HOSTNAME="0.0.0.0"                                                           
# ENV PORT=3000                                                                    
                                                                                 
# EXPOSE 3000                                                                      
                                                                                 
# CMD ["npm", "start"] 