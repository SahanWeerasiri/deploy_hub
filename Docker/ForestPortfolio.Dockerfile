# Build stage
FROM node:22-alpine AS build
WORKDIR /app/test_forest_portfolio_3js
COPY . .
# delete the package-lock.json if it exists
RUN rm -f package-lock.json
RUN npm i 
RUN npm run build