# Utiliser l'image officielle Nginx légère
FROM nginx:1-alpine-slim

# Mise à jour des paquets pour réduire les vulnérabilités
RUN apk update && apk upgrade --no-cache

# Copier les fichiers du site
COPY index.html /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
COPY images /usr/share/nginx/html/images
COPY LICENSE.txt /usr/share/nginx/html/
COPY README.txt /usr/share/nginx/html/

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx
CMD ["nginx", "-g", "daemon off;"]