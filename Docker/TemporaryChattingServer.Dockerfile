FROM node:22-alpine
WORKDIR /app/temporary-chatting/server

# Copy package files
COPY package*.json ./

RUN npm ci

# Copy source code
COPY . .

# Create data directories
RUN mkdir -p src/data/chats

# Expose port
EXPOSE 5000

# Start server
CMD ["node", "server.js"]