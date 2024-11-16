FROM node:20.11 AS builder

WORKDIR /app

# Install dependencies and build the app
COPY package*.json ./
RUN npm ci
COPY . .

COPY .env .env

RUN npm run build

FROM node:20.11-slim

WORKDIR /app

# Copy built files from the builder stage
COPY --from=builder /app/build /app/build

# Install a simple static file server like serve
RUN npm install -g serve

EXPOSE 3000

# Use serve to host the static files
CMD ["serve", "-s", "build", "-l", "3000"]
