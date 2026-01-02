# Build stage
FROM node:20-alpine as build
WORKDIR /app/test_forest_portfolio_3js
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build