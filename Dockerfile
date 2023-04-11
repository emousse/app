# Utiliser l'image officielle de Node.js avec la version 16 en tant qu'image de base
FROM node:16

# Définir le répertoire de travail
WORKDIR /app

# Copier package.json et package-lock.json
COPY package*.json ./

# Installer les dépendances
RUN npm ci

# Copier le reste des fichiers de l'application
COPY . .

# Compiler l'application pour la production
RUN npm run build

# Exposer le port pour l'application (par défaut 3000 pour Next.js)
EXPOSE 3000

# Lancer l'application en mode production
CMD ["npm", "start"]
