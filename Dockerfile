# Build Phase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run Phase
FROM nginx
# Expose port for AWS Beanstalk
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
