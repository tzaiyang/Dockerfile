FROM swaggerapi/swagger-ui:v3.52.0 as swagger-ui
FROM node:10-alpine as swagger-cli
RUN npm install -g @apidevtools/swagger-cli
WORKDIR /api/
COPY api/ .
RUN swagger-cli bundle -o openapi.json openapi.yaml

# Reference from https://github.com/swagger-api/swagger-ui/blob/master/Dockerfile
# Looking for information on environment variables?
# We don't declare them here — take a look at our docs.
# https://github.com/swagger-api/swagger-ui/blob/master/docs/usage/configuration.md

FROM nginx:1.21.4-alpine

RUN apk update && apk add --no-cache "nodejs>=14.17.6-r0"

LABEL maintainer="mango"

ENV API_KEY "**None**"
ENV SWAGGER_JSON "/app/swagger.json"
ENV PORT 8080
ENV BASE_URL ""
ENV SWAGGER_JSON_URL ""

COPY ./docker/nginx.conf ./docker/cors.conf /etc/nginx/

COPY ./dist/* /usr/share/nginx/html/
COPY ./docker/run.sh /usr/share/nginx/
COPY ./docker/configurator /usr/share/nginx/configurator

RUN chmod +x /usr/share/nginx/run.sh && \
    chmod -R a+rw /usr/share/nginx && \
    chmod -R a+rw /etc/nginx && \
    chmod -R a+rw /var && \
    chmod -R a+rw /var/run

EXPOSE 8080

CMD ["sh", "/usr/share/nginx/run.sh"]

# copy swagger files to the `/js` folder
COPY --from=swagger-ui /usr/share/nginx/html/* /usr/share/nginx/html/
COPY --from=swagger-cli /api/openapi.json /usr/share/nginx/html/openapi.json
RUN sed -i 's/https:\/\/petstore.swagger.io\/v2\/swagger.json/openapi.json/g' swagger-ui/index.html \
 && sed -i '/^ *deepLinking: true,$/a\        validatorUrl: null,' swagger-ui/index.html
