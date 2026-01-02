FROM node:20-alpine
WORKDIR /app/temporary-chatting/server

# Copy package files
COPY package*.json ./

# Install pnpm and dependencies
RUN npm install -g pnpm
RUN pnpm ci

# Copy source code
COPY . .

# Create data directories
RUN mkdir -p src/data/chats

# Expose port
EXPOSE 5000

# Start server
CMD ["node", "server.js"]