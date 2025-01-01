# Use an official Node.js image for building the React app

FROM node:20.10.0 AS builder
 
# Set the working directory inside the container

WORKDIR /app
 
# Copy package.json and package-lock.json to the container

COPY package*.json ./
 
# Install dependencies

RUN npm install
 
# Copy the application source code to the container

COPY . .
 
# Build the React app

RUN npm run build
 
# Use Nginx for serving the production build

FROM nginx:stable-alpine
 
# Remove all existing content in /usr/share/nginx/html

RUN rm -rf /usr/share/nginx/html/*
 
# Copy all files from the dist directory to the Nginx HTML directory

COPY --from=builder /app/dist/ /usr/share/nginx/html/
 
# Expose port 80 to allow external access

EXPOSE 80
 
# Start Nginx server

CMD ["nginx", "-g", "daemon off;"]
 
