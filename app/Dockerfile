# Use minimal Node.js 18 Alpine image
FROM node:slim

# Set working directory
WORKDIR /app

# Copy package files first for better caching
COPY package*.json ./

# Install dependencies
RUN npm install 

# Copy application code
COPY . .

# Expose the application port
EXPOSE 3001

# Start command
CMD ["node", "app.js"]