# Use a minimal Node.js base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependency files first (better layer caching)
COPY package*.json ./

# Install only production dependencies
RUN npm ci --omit=dev

# Copy the rest of the application
COPY . .

# Use non-root user for security
USER node

# Expose app port
EXPOSE 3000

# Run the app
CMD ["node", "index.js"]