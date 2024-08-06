# Start from Alpine Linux
FROM alpine:latest as builder

# Install Hugo
RUN apk add --no-cache hugo

# Set the working directory
WORKDIR /app

# Copy your Hugo project files
COPY . .

# Build the static site
RUN hugo

# Use Nginx to serve the Hugo site
FROM nginx:alpine
COPY --from=builder /app/public /usr/share/nginx/html
