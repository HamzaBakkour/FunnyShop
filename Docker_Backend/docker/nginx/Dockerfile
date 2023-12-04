# The first stage
# Build React static files
FROM mhart/alpine-node:latest AS build

WORKDIR /app/frontend/online_shop_frontend
COPY ./frontend/online_shop_frontend/package.json ./
COPY ./frontend/online_shop_frontend/package-lock.json ./

# RUN npm ci
RUN yarn install --ignore-engines
COPY ./frontend/online_shop_frontend/ ./
# RUN npm run build
RUN yarn run build


# The second stage
# Copy React static files and start nginx
FROM nginx:stable-alpine
COPY --from=build /app/frontend/online_shop_frontend/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
