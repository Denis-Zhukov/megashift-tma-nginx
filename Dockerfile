FROM nginx:stable-alpine

RUN apk add --no-cache bash gettext

COPY nginx.conf.template /etc/nginx/nginx.conf.template

EXPOSE 80

CMD envsubst '$MEGASHIFT_TMA_SERVER_INTERNAL $MEGASHIFT_TMA_SERVER_PORT $MEGASHIFT_TMA_UI_INTERNAL $MEGASHIFT_TMA_UI_PORT' \
    < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && \
    nginx -g 'daemon off;'