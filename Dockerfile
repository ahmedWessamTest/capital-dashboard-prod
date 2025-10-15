# Stage 1: Build Angular app
FROM node:20-alpine AS build

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build --configuration production

# Stage 2: Serve with Nginx
FROM nginx:1.27-alpine

RUN rm -rf /usr/share/nginx/html/*

# ✅ Copy only the browser build output
COPY --from=build /app/dist/dashboard/browser /usr/share/nginx/html

# ✅ Custom Nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
