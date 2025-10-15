# استخدم Nginx فقط لاستضافة الملفات
FROM nginx:1.27-alpine

# احذف ملفات Nginx الافتراضية
RUN rm -rf /usr/share/nginx/html/*

# انسخ ملفات الـ build الجاهزة من dist/browser
COPY dist/browser /usr/share/nginx/html

# انسخ إعدادات nginx المخصصة
COPY nginx.conf /etc/nginx/conf.d/default.conf

# افتح المنفذ 80
EXPOSE 80

# شغّل Nginx
CMD ["nginx", "-g", "daemon off;"]
