# Build stage
FROM node:20-alpine as build
WORKDIR /app/temporary-chatting/client
COPY package*.json ./
RUN pnpm ci
COPY . .
RUN pnpm run build

# Production stage (just static files, nginx handled by main proxy)
FROM alpine:latest
WORKDIR /app/build
COPY --from=build /app/temporary-chatting/client/build .