# We gebruiken Node.js 20 LTS als basisimage
# FROM node:20
FROM node:18-alpine

# Werkdirectory instellen binnen de container
WORKDIR /app

# Package.json en yarn.lock kopieren om gebruik te maken van caching
COPY package*.json yarn.lock ./

# Installeer dependencies
RUN yarn install --frozen-lockfile

# rest van de App code kopieren
COPY . .

# Poort 3000 open zetten
EXPOSE 3000

# Start de applicatie
CMD ["yarn", "start"]