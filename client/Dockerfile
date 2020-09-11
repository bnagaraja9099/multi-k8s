# Specify a base image for builder process
FROM node:alpine

WORKDIR '/app'

# Install some depenendencies
COPY package*.json ./
RUN npm install
COPY ./ ./
RUN npm run build


# second phase for run. 
FROM nginx
EXPOSE 3000
COPY --from=0 /app/build /usr/share/nginx/html
copy ./nginx/default.conf /etc/nginx/conf.d/default.conf


# nginx container will start automatically. NO start needed
