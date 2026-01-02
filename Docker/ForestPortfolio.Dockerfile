# Build stage
FROM node:20-alpine as build
WORKDIR /app/test_forest_portfolio_3js
COPY package*.json ./
RUN pnpm ci
COPY . .
RUN pnpm run build