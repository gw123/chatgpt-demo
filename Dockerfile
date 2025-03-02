FROM node:alpine
WORKDIR /usr/src
RUN npm install -g pnpm
RUN pnpm config set registry https://registry.npm.taobao.org
COPY package.json pnpm-lock.yaml ./
RUN pnpm install
COPY . .
RUN pnpm run build
ENV HOST=0.0.0.0 PORT=3000 NODE_ENV=production
EXPOSE $PORT
CMD ["node", "dist/server/entry.mjs"]
