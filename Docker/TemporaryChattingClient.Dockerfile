
# Build stage
FROM node:22-alpine as build
WORKDIR /app/temporary-chatting/client
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# Production stage (just static files, nginx handled by main proxy)
FROM alpine:latest
WORKDIR /app/build
COPY --from=build /app/temporary-chatting/client/build .