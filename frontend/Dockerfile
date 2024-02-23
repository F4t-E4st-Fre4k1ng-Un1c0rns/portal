FROM node:hydrogen-slim as build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM caddy
COPY --from=build /app/dist /usr/share/caddy

