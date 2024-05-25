# Stage 1: Build the React app
FROM node:14-alpine as build

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Build the React app
RUN npm run build

# Stage 2: Create the final image with only the necessary files
FROM node:14-alpine

# Set working directory inside the container
WORKDIR /app

# Copy the built app from the build stage
COPY --from=build /app/build ./build
COPY --from=build /app/package*.json ./

# Install only production dependencies
RUN npm install --only=production

# Expose port 3000
EXPOSE 3000

# Command to run the application
CMD ["npm", "start"]


