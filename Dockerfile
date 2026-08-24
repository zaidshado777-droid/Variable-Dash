FROM node:18-alpine
ENV NODE_ENV=production
ARG NPM_BUILD="pnpm install --prod"
EXPOSE 8080/tcp
LABEL maintainer="Mercury Workshop"
LABEL summary="Scramjet Demo Image"
LABEL description="Example application of Scramjet"
WORKDIR /app
RUN npm install -g pnpm
COPY ["package.json", "pnpm-lock.yaml", "./"]
RUN apk add --upgrade --no-cache python3 make g++
RUN $NPM_BUILD
COPY . .
ENTRYPOINT [ "node" ]
CMD ["src/index.js"]
