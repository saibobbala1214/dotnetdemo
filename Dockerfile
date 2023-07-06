FROM node:16.20.1-bullseye as builder

WORKDIR /clientapp

COPY . .

RUN npm install

RUN npm run build

EXPOSE 4200

FROM nginx

COPY --from=builder /clientapp/dist /usr/share/nginx/html
