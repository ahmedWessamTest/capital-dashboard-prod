FROM nginx:1.27-alpine

WORKDIR /usr/share/nginx/html
RUN rm -rf ./*

# 👇 انسخ الملفات الجاهزة مباشرة من المسار الحالي
COPY . .

# 👇 انسخ ملف إعدادات nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
