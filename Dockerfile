# -----------------------------------------------------------------
# STAGE 1: BUILD (Compiles TypeScript and installs all dependencies)
# -----------------------------------------------------------------
# Use a Node base image with Alpine for a smaller footprint
FROM node:20-alpine AS builder

# Set the working directory for all subsequent commands
WORKDIR /app

# Copy the package files first to leverage Docker layer caching
COPY package*.json ./
# Install all dependencies, including devDependencies needed for 'npm run build'
RUN npm install

# Copy the rest of the application source code
COPY . .

# Execute the build script defined in package.json (tsc)
# This generates the compiled JavaScript files in the /app/dist directory
RUN npm run build


# -----------------------------------------------------------------
# STAGE 2: PRODUCTION (Only includes compiled code and production dependencies)
# -----------------------------------------------------------------
# Use the same base image for consistency, but start fresh
#FROM node:20-alpine AS production

# Set the working directory
#WORKDIR /app

# Copy only the package.json file needed to install production dependencies
#COPY package.json ./
# You should also explicitly copy the lock file here to guarantee the integrity of the install
#COPY package-lock.json ./
# Install only the production dependencies (omitting devDependencies)
#RUN npm install --omit=dev

# Copy the compiled output (the 'dist' folder) from the 'builder' stage
# NOTE: The stage name 'builder' must exactly match the name defined in the first FROM line.
#COPY --from=builder /app/dist ./dist

# The application runs on a specific port (e.g., 3000, as is common for Node apps)
EXPOSE 3000

# Command to run the application using the 'start' script
# This executes: node dist/index.js
CMD ["npm", "run", "dev"]