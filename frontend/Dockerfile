FROM node:hydrogen-slim as build
WORKDIR /app
ARG VITE_EVENTS_BASE_API
ARG VITE_AUTH_BASE_API
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

