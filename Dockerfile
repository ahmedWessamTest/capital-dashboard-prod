FROM node:20.12-alpine

WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy built dist folder
COPY dist ./dist


# Start the application
CMD ["node", "dist/browser/index.html"] 
