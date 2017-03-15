FROM gcr.io/endpoints-release/endpoints-runtime:1

COPY nginx-auto.conf.template /etc/nginx/nginx-auto.conf.template
