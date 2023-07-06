FROM node:16.20.1-bullseye as builder

WORKDIR /clientapp

COPY . .

RUN npm install -y

RUN npm run build

EXPOSE 4200

FROM nginx

COPY --from=builder /app/dist /usr/share/nginx/html
