# ============================================================
# DOCKERFILE — House Publique Menu Digital
# Proyecto: Menú HTML estático multilingüe (FR/ES/AR/EN)
# Servidor: nginx Alpine (ultra-ligero, ~25MB imagen final)
# ============================================================

FROM nginx:1.27-alpine

# Eliminar config por defecto de nginx
RUN rm /etc/nginx/conf.d/default.conf

# Copiar nuestra configuración nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copiar el HTML principal como index (renombrar al copiar)
COPY men_digital_house_publique.html /usr/share/nginx/html/index.html

# Copiar la página del menú QR imprimible
COPY qr-menu.html /usr/share/nginx/html/qr-menu.html

# Copiar carpeta de assets (imágenes)
COPY assets/ /usr/share/nginx/html/assets/

# Exponer puerto 80 (Coolify lo mapea automáticamente)
EXPOSE 80

# nginx en foreground (requerido por Docker)
CMD ["nginx", "-g", "daemon off;"]
