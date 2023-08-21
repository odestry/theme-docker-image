FROM ruby:3.2-alpine

ARG SHOPIFY_FLAG_STORE
ARG SHOPIFY_CLI_THEME_TOKEN

ENV SHOPIFY_FLAG_STORE=$SHOPIFY_FLAG_STORE
ENV SHOPIFY_CLI_THEME_TOKEN=$SHOPIFY_CLI_THEME_TOKEN

EXPOSE 9292

RUN apk update && apk add nodejs git npm bash curl gcc g++ make

RUN npm install -g @shopify/cli @shopify/theme

WORKDIR /theme

COPY . .

CMD ["shopify", "theme", "dev", "--host", "0.0.0.0", "--poll"]