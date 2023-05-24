# Imagen base de Node.js
FROM node:lts-alpine

# Directorio de trabajo
WORKDIR /app

# Copiar package.json y package-lock.json al directorio de trabajo
COPY package*.json ./

# Instalar dependencias
RUN npm ci

# Copiar el resto de los archivos del proyecto al directorio de trabajo
COPY . .

# Construir el proyecto Angular
RUN npm run build

# Exponer el puerto en el que se ejecutará la aplicación
EXPOSE 8091

# Instalar el servidor HTTP de Angular
RUN npm install -g @angular/cli@15.0.3

# # Iniciar el servidor HTTP de Angular
# CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "8091", "--disable-host-check"]

