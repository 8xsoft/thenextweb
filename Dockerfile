FROM node:lts-alpine
WORKDIR /app

COPY  ./app/package.json .

ARG NODE_ENV

RUN if [ "$NODE_ENV" = "development" ]; \
  then yarn install; \
  else yarn install --production;\
  fi

COPY  ./app ./

EXPOSE 3000
CMD ["yarn", "start"]