
FROM node:24-slim AS builder

WORKDIR /app


COPY package.json package-lock.json ./


RUN npm install --only=production

COPY . .


FROM node:24-alpine

WORKDIR /app


COPY --from=builder /app/node_modules ./node_modules

COPY --from=builder /app ./

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser


EXPOSE 3000


CMD ["node", "app.js"]