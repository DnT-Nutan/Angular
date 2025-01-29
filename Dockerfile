# Use an official Node.js image for building the React app

FROM node:20.10.0 AS builder
 
# Set the working directory inside the container

WORKDIR /app
 
# Copy package.json and package-lock.json to install dependencies

COPY package*.json ./
 
# Install dependencies

RUN npm install
 
# Copy the rest of the application source code

COPY . .
 
# Build the React app

RUN npm run build
 
# Use Nginx for serving the production build

FROM nginx:stable-alpine
 
# Copy the build output to Nginx's default static directory

COPY --from=builder /app/dist/angular-conduit/browser /usr/share/nginx/html
 
# Expose port 80

EXPOSE 80
 
# Start Nginx server

CMD ["nginx", "-g", "daemon off;"]

