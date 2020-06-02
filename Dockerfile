#Builder fase
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
#This is production, no need to map volumes
COPY . .
RUN npm run build

# /app/build  <------
# Run phase

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# The default CMD for nginx already starts the web server

