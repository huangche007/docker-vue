FROM nginx:latest
WORKDIR /app
COPY . /app/
EXPOSE 80
RUN  npm install \
    && npm run build 
#把当前打包工程的html复制到虚拟地址
COPY dist/ /usr/share/nginx/html/
#使用自定义nginx.conf配置端口和监听
RUN rm /etc/nginx/conf.d/default.conf
ADD default.conf /etc/nginx/conf.d/

RUN /bin/bash -c 'echo init ok!!!'
CMD ["nginx","-g","daemon off;"]

