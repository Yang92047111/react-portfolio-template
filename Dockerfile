# Image
FROM node:18

# Initialize
ENV TZ=Asia/Taipei

RUN apt-get update

WORKDIR /home/react-portfolio
COPY . .

RUN yarn install
RUN yarn build