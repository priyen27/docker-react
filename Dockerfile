# build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
# i want a copy (build folder) from builder phase
COPY --from=builder /app/build /usr/share/nginx/html