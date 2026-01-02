# Build stage
FROM node:20-alpine as build
WORKDIR /app/temporary-chatting/client
COPY package*.json ./
RUN pnpm ci
COPY . .
RUN pnpm run build

# Production stage
# FROM nginx:alpine
# COPY --from=build /app/build /usr/share/nginx/html
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]