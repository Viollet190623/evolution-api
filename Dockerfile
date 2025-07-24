# Dockerfile

# Base image
FROM node:18-slim

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    ffmpeg \
    libwebp-dev \
    && rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

# CORRECCIÓN APLICADA AQUÍ:
RUN npm install --legacy-peer-deps

# Bundle app source
COPY . .

# Expose port
EXPOSE 8080

# Start app
CMD [ "npm", "run", "start:prod" ]
