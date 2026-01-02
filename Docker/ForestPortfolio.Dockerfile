# Build stage
FROM node:22-alpine as build
WORKDIR /app/test_forest_portfolio_3js
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build