# Stage 1: Build
FROM node:18 as builder

# Initialize
ENV TZ=Asia/Taipei

RUN apt-get update

WORKDIR /home/react-portfolio
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

# Stage 2: Create the production image
FROM nginx:1.27.3

COPY --from=builder /home/react-portfolio/dist /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]