# Use Bun as base image
FROM oven/bun:latest

# Set working directory
WORKDIR /app

# Copy package files
COPY package.json bun.lockb* ./

# Install dependencies
RUN bun install --production

# Copy source code
COPY . .

# Create uploads directory
RUN mkdir -p public/uploads

# Expose port
EXPOSE 8080

# Create volume for persistent data
VOLUME ["/app/public/uploads", "/app/images.json", "/app/votes.json"]

# Start the app
CMD ["bun", "run", "prod"]
