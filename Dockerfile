FROM node:20-alpine AS builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install

FROM node:20-alpine AS runtime
WORKDIR /usr/src/app
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY package.json ./
COPY src ./src
ENV SQLITE_DB_LOCATION=/home/node/data/todo.db
RUN mkdir -p /home/node/data && chown -R node:node /home/node/data /usr/src/app
EXPOSE 3000
USER node
CMD ["node", "src/index.js"]
