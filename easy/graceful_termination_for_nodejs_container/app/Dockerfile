FROM node:lts-slim

WORKDIR /app

COPY package*.json ./
RUN npm install --production
COPY . .

EXPOSE 3000

# Change this:
# CMD ["npm", "start"]
# To this:
CMD ["node", "index.js"]